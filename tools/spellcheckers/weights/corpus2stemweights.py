#!/usr/bin/env python3
"""Stem-level lemma-frequency weights for the speller lexicon.

The corpus LM (corpus2unigramlm.py) prices a *word form* by that form's own
corpus frequency, and every form the corpus never saw by a single flat OOV
weight. Nothing in that model knows which lemma a form belongs to, so a rare
inflection of a very common verb is priced like a rare inflection of a lemma
nobody writes.

This script prices the *stem*. The corpus is run through the full analyser
pipeline -- tokenisation, morphological analysis, and Constraint Grammar
disambiguation -- so each token contributes to exactly one lemma (or is split
evenly over the lemmas CG could not tell apart). The resulting lemma counts
become a penalty that is *added* to whatever the surface model already says:

    w(L) = alpha * ( log10(Fref + 1) - log10(count(L) + 1) )

anchored so the most frequent lemma pays 0 and a lemma the corpus never saw
pays the full `alpha * log10(Fref + 1)`. Written as a penalty rather than a
discount so no path in the lexicon can go negative; a uniform offset over the
whole lexicon does not change any ranking.

`alpha` is the weight units charged per decade of lemma frequency. For scale:
the surface corpus LM spends its whole 0..50 band over about 5.3 decades of
*form* frequency, i.e. roughly 9.4 units per decade, and the tag weights spend
5 (+Prop) to 45 (+Cmp).

Note this is a *sum*, not a backoff. The earlier lemma-backoff experiment
(weights/00README.txt) applied the lemma weight only to the out-of-corpus
branch of the union, where the tropical minimum meant a lemma weight could only
ever undercut real corpus evidence, never add to it. Applying it after the
union means the corpus-seen forms of a frequent lemma get the discount too --
which is what "store the frequencies in the stem lexicons" asks for, since a
lexc stem weight is on the stem entry and every path through it pays.
"""

import json
import sys
from argparse import ArgumentParser
from math import log10


def cmd_weights(opts):
    config = json.load(open(opts.config))
    alpha = config["alpha"]
    min_count = config.get("min-count", 5)
    quantum = config.get("quantum", 0.25)

    counts = {}
    with open(opts.counts) as f:
        for line in f:
            stem, count = line.rstrip("\n").split("\t")
            # Stems with no letter in them are corpus furniture -- the
            # paragraph mark, punctuation, bare numerals. They are not lexc
            # stem entries and they would set the frequency anchor.
            if not stem or not any(c.isalpha() for c in stem):
                continue
            counts[stem] = float(count)

    if not counts:
        sys.exit("no stem counts")

    fref = max(counts.values())
    span = log10(fref + 1.0)
    base = alpha * span

    written = 0
    lowest = base
    with open(opts.output, "w") as out:
        for stem, count in sorted(counts.items(), key=lambda kv: -kv[1]):
            # A stem the corpus barely saw is not worth a branch in the weight
            # transducer: the fallback already prices it within
            # alpha*log10(min-count+1) of where the table would, and every
            # listed stem is another path through the composed lexicon.
            if count < min_count:
                continue
            weight = alpha * (span - log10(count + 1.0))
            # Quantising is what lets weighted minimisation share trie
            # suffixes: distinct weights keep otherwise identical tails apart.
            if quantum:
                weight = round(weight / quantum) * quantum
            weight = max(0.0, weight)
            lowest = min(lowest, weight)
            # ':' separates the two sides of a string pair for strings2fst.
            print(stem.replace(":", "\\:"), f"{weight:.6f}", sep="\t", file=out)
            written += 1

    if opts.base_out:
        with open(opts.base_out, "w") as out:
            print(f"{base:.6f}", file=out)

    print(f"*** stem weights: {written} stems of {len(counts)}, "
          f"weights {lowest:.2f}..{base:.2f}, alpha={alpha} "
          f"Fref={fref:.0f} span={span:.2f}", file=sys.stderr)


def cmd_tagclass(opts):
    """The tag alphabet, as a regex alternation.

    The stem trie has to stop at the end of the stem, or a stem that is a
    prefix of a longer one lends it its weight -- `viessu` would price every
    form of `viessut`. Every analysis puts a tag directly after the stem, so
    requiring one anchors the match.
    """
    tags = []
    with open(opts.alphabet) as f:
        for line in f:
            symbol = line.rstrip("\n")
            if len(symbol) > 1 and symbol.startswith("+") and '"' not in symbol:
                tags.append(symbol)
    with open(opts.output, "w") as out:
        print(" | ".join(f'"{t}"' for t in tags), ";", file=out)
    print(f"*** tag anchor: {len(tags)} tags", file=sys.stderr)


def main():
    argp = ArgumentParser(description=__doc__)
    sub = argp.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("weights", help="emit the stem weight table")
    p.add_argument("-i", "--counts", required=True, metavar="FILE",
                   help="stem TAB count, from the disambiguated corpus")
    p.add_argument("-c", "--config", required=True, metavar="FILE")
    p.add_argument("-o", "--output", required=True, metavar="FILE")
    p.add_argument("--base-out", metavar="FILE",
                   help="write the unlisted-stem weight here")
    p.set_defaults(func=cmd_weights)

    p = sub.add_parser("tagclass", help="emit the tag-anchor regex")
    p.add_argument("--alphabet", required=True, metavar="FILE")
    p.add_argument("-o", "--output", required=True, metavar="FILE")
    p.set_defaults(func=cmd_tagclass)

    opts = argp.parse_args()
    opts.func(opts)


if __name__ == "__main__":
    main()
