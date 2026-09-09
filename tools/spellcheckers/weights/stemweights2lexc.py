#!/usr/bin/env python3
"""Write stem-frequency weights into lexc stem entries. A pure filter.

This is the injection the stakeholder proposal names: "store the frequencies in
the stem lexicons". A lexc entry may carry a weight in its gloss
(`"... weight: N"`), which hfst-lexc puts on the entry's own arc *before* the
lexicon is determinised and minimised. Every path through that stem pays it
once, so the weight reaches every inflection of the stem -- seen or unseen --
at no structural cost.

The obvious non-invasive alternative -- composing a lemma-keyed weight
transducer onto the lexical side of the finished speller -- was built and
measured, and does not work on this lexicon. See
weights/00README.stem-weights.txt.

Reads lexc on stdin, writes lexc on stdout, so it never edits a source file:
the build applies it to the *generated* concatenated `.generated/lexicon.lexc`.

    cat *.lexc | stemweights2lexc.py inject -c stem-weights.json \\
                     -i stem.counts.tsv > lexicon.lexc

`report` does the same analysis but writes only the summary, so the effect of a
config can be checked without a build.

A line that gets no weight is copied through byte for byte, and a line that
does is edited in place -- the weight is spliced into the existing gloss, or a
gloss is inserted before the terminating `;`. Nothing is ever reconstructed
from a parse: the file also holds regex entries (`< ... "#" > Cont ;`) whose
quoted literals are part of the entry, and rebuilding those from tokens
silently turns a literal into a gloss.
"""

import json
import re
import sys
from argparse import ArgumentParser
from collections import Counter
from math import log10

MARK = "weight:"
MARK_RE = re.compile(r"\s*" + MARK + r"\s*-?[0-9.]+")


def scan(line):
    """(entry_end, gloss_span) -- index of the terminating `;`, and the span of
    the gloss immediately before it, honouring `%` escapes, quotes and the `!`
    comment. Returns (None, None) when the line is not a data line."""
    stripped = line.strip()
    if not stripped or stripped.startswith("!"):
        return None, None
    if stripped.startswith(("LEXICON", "Multichar_Symbols", "END", "Definitions")):
        return None, None
    inq, semi, i = False, None, 0
    quotes = []
    while i < len(line):
        c = line[i]
        if c == "%":
            i += 2
            continue
        if c == '"':
            quotes.append(i)
            inq = not inq
        elif not inq:
            if c == "!":
                break
            if c == ";":
                semi = i
                break
        i += 1
    if semi is None:
        return None, None
    # A gloss is a quoted run that closes in the whitespace before the `;`.
    gloss = None
    if len(quotes) >= 2:
        close = quotes[-1]
        if line[close + 1:semi].strip() == "":
            gloss = (quotes[-2], close)
    return semi, gloss


def split_escaped(text):
    """Split on whitespace, honouring lexc's `%` escape."""
    out, cur, i = [], [], 0
    while i < len(text):
        c = text[i]
        if c == "%" and i + 1 < len(text):
            cur.append(text[i:i + 2])
            i += 2
            continue
        if c.isspace():
            if cur:
                out.append("".join(cur))
                cur = []
        else:
            cur.append(c)
        i += 1
    if cur:
        out.append("".join(cur))
    return out


def lemma_of(data):
    """The upper side of a lexc entry up to its first unescaped tag.

    None when the entry is not a stem entry: no upper side (affix
    continuations start at a tag or at the colon), or no tag at all (a bare
    continuation-lexicon reference).
    """
    upper, i, tagged = [], 0, False
    while i < len(data):
        c = data[i]
        if c == "%" and i + 1 < len(data):
            upper.append(data[i + 1])
            i += 2
            continue
        if c == ":":
            break
        if c == "+":
            tagged = True
            break
        upper.append(c)
        i += 1
    if not tagged or not upper:
        return None
    text = "".join(upper)
    # Machinery, not a stem: entries that open with a flag diacritic
    # (`@R.SpellRlx.ON@+Err/Spellrelax:...`), and punctuation/digit entries
    # whose "lemma" has no letter in it. Pricing either would put a stem
    # frequency on a path that has no stem.
    if "@" in text or not any(c.isalpha() for c in text):
        return None
    return text


def read_counts(path):
    counts = {}
    for line in open(path, encoding="utf-8"):
        stem, count = line.rstrip("\n").split("\t")
        # Stems with no letter in them are corpus furniture -- the paragraph
        # mark, punctuation, bare numerals -- not lexc stem entries, and they
        # would set the frequency anchor.
        if not stem or not any(c.isalpha() for c in stem):
            continue
        counts[stem] = float(count)
    return counts


def load_band(opts, config):
    """Banded lemma-frequency weights for the UNIT branch of the speller union.

    The unit branch is the whole lexicon flat-reweighted to one weight (50 in
    the shared rule). Every form the corpus never saw is therefore priced
    identically, and the analyser's knowledge of which lemma it inflects is
    thrown away. Banding replaces that flat weight with

        w(form) = floor + min(cap, slope * (span - log10(count(L) + 1)))

    where L is the form's lemma, span anchors the most frequent lemma at 0, and
    cap = band_top - floor bounds the rare tail.

    What this emits is the *delta* only. `floor` is applied downstream by the
    unit branch's own `hfst-reweight -e -a <floor>`, which pays it once per
    path at the end state -- exactly where the flat 50 was paid. Putting the
    whole band in the gloss instead would charge `floor` once per stem entry,
    so a two-part compound would pay it twice.

    The floor is chosen at or above the seen branch's ceiling (a form seen once
    prices at 47.69 against maxweight 50), so under the union's min() every
    seen form keeps its corpus weight and every seen form still outranks every
    unseen one. Only unseen-vs-unseen competition changes.

    A lemma with no mass -- below min-count, or absent from the table -- pays
    the cap, not lexc's default 0. Default 0 does not mean "no opinion", it
    means "as frequent as the most frequent lemma in the language", which is an
    inverted model; an earlier prototype shipped that by accident and it cost
    269 first positions.
    """
    floor = config.get("floor", 48.0)
    slope = config["slope"]
    band_top = config["band-top"]
    min_count = config.get("min-count", 1)
    quantum = config.get("quantum", 0.25)
    cap = band_top - floor
    if cap < 0:
        raise SystemExit(f"band-top {band_top} is below floor {floor}")

    counts = read_counts(opts.counts)
    span = log10(max(counts.values()) + 1.0)

    def quantise(w):
        w = min(cap, max(0.0, w))
        if quantum:
            w = round(w / quantum) * quantum
        return min(cap, max(0.0, w))

    weights = {}
    for stem, count in counts.items():
        if count < min_count:
            continue
        weights[stem] = quantise(slope * (span - log10(count + 1.0)))
    unlisted = quantise(cap)
    natural_max = slope * span
    print(f"*** band: floor={floor} top={band_top} cap={cap:.2f} slope={slope} "
          f"span={span:.4f} decades (natural max {natural_max:.2f}, "
          f"{'CLIPPED' if natural_max > cap else 'not clipped'}); "
          f"{len(weights)} of {len(counts)} lemmas priced "
          f"[{min(weights.values()):.2f}..{max(weights.values()):.2f}]; "
          f"unknown lemmas pay {unlisted:.2f} (= band top {floor + unlisted:.2f}); "
          f"min-count={min_count} quantum={quantum}", file=sys.stderr)
    return weights, unlisted


def load_weights(opts):
    config = json.load(open(opts.config))
    if config.get("mode") == "band":
        return load_band(opts, config)
    alpha = config["alpha"]
    min_count = config.get("min-count", 5)
    quantum = config.get("quantum", 0.25)
    counts = read_counts(opts.counts)
    span = log10(max(counts.values()) + 1.0)
    weights = {}
    for stem, count in counts.items():
        if count < min_count:
            continue
        # Written as a penalty rather than a discount so no arc goes negative:
        # the most frequent stem pays 0, and a stem the corpus never saw pays
        # the full `alpha * span`. A stem *below* min-count is not listed and
        # falls in with the never-seen ones; the gap that costs it is
        # alpha*log10(min-count+1), which is what min-count buys in table size.
        w = alpha * (span - log10(count + 1.0))
        if quantum:
            w = round(w / quantum) * quantum
        weights[stem] = max(0.0, w)
    unlisted = alpha * span
    if quantum:
        unlisted = round(unlisted / quantum) * quantum
    print(f"*** stem weights: {len(weights)} of {len(counts)} stems priced, "
          f"0.00..{unlisted:.2f}; unlisted stems pay {unlisted:.2f}; "
          f"alpha={alpha} min-count={min_count} quantum={quantum}",
          file=sys.stderr)
    return weights, unlisted


def main():
    argp = ArgumentParser(description=__doc__)
    argp.add_argument("cmd", choices=["inject", "report"])
    argp.add_argument("-c", "--config", required=True)
    argp.add_argument("-i", "--counts", required=True)
    opts = argp.parse_args()

    weights, unlisted = load_weights(opts)
    emit = opts.cmd == "inject"
    out = sys.stdout
    hist = Counter()
    entries = matched = 0
    for line in sys.stdin:
        semi, gloss = scan(line)
        weight = None
        if semi is not None:
            head = line[:gloss[0]] if gloss else line[:semi]
            tokens = split_escaped(head)
            if len(tokens) >= 2 and not tokens[0].startswith("<"):
                lemma = lemma_of(tokens[0])
                if lemma is not None:
                    entries += 1
                    weight = weights.get(lemma)
                    if weight is None:
                        weight = unlisted
                    else:
                        matched += 1
                    hist[round(weight, 2)] += 1
        if not emit:
            continue
        if not weight:
            out.write(line)
            continue
        text = f" {MARK} {weight:.4f}"
        if gloss:
            body = MARK_RE.sub("", line[gloss[0] + 1:gloss[1]]).rstrip()
            out.write(line[:gloss[0] + 1] + body + text + line[gloss[1]:])
        else:
            out.write(line[:semi] + f'"{text.strip()}" ' + line[semi:])
    priced = ", ".join(f"{w}:{n}" for w, n in sorted(hist.items())[:8])
    print(f"*** lexc: {entries} stem entries seen, {matched} priced "
          f"({100 * matched / max(entries, 1):.1f}%); by weight {priced} ...",
          file=sys.stderr)


if __name__ == "__main__":
    main()
