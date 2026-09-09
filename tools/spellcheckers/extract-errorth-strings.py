#!/usr/bin/env python3
"""Derive stem-level alternation rules from the lexicon's +Err/Orth* entries.

The lexicon carries curated knowledge about known misspellings: an entry tagged
+Err/Orth* has the normative lemma and inflection on the analysis side and the
misspelled word form on the surface side.  The normative build throws all of it
away (filters/remove-error-strings), so it never reaches the speller.

Composing the descriptive analyser with the normative generator recovers that
knowledge as a misspelling -> correct-form relation, but using it directly as a
whole-word error model is a word list with an FST's clothes on: it is huge, it
freezes the lexicon at build time, and it cannot touch a dynamic compound whose
error-tagged stem was never enumerated.

This script reduces the relation to what actually differs.  For every recovered
pair it finds the places where the misspelling and the correct form disagree,
pads each with just enough surrounding context to be more than a letter
confusion, and aggregates the result into `{err} (->) {norm}::W ,` rules in the
same idiom as the hand-written strings.default.regex.  Those rules apply
anywhere in a word, so a stem alternation learnt from `bearpmehat` also fires
inside `sohkabearpmehat` -- a form no enumerated pair list would contain.

A pair may disagree in more than one place, and those pairs used to be dropped
whole: one span across both places is a memorised word fragment rather than an
alternation, and there was nothing else on offer.  There is, though -- the rules
ride in the strings component, and a component is wrapped in ?* and applied in
one pass, so several rules fire together within one edit-budget slot.  Each
region can therefore be its own rule and the pair is recovered by composition
rather than by memorisation.  That is what reaches the long loan compounds
(`bajimusingeniora` -> `bajimusinšenevrra` is `nge` -> `nše` plus `nio` ->
`nev`), and the wrong-side finals that ride along with them.

Three modes:

  wordshape     print the word-shape acceptor regex (letters only, no hyphen).
                Used on both sides of the recovered relation to drop the
                numeral, acronym and hyphenated-abbreviation sub-lexicons,
                whose digit/letter loops make the relation combinatorially
                unenumerable (3.4e12 paths before filtering).  Dropping the
                hyphen is not only about size: the productive `Name-is` ->
                `Nameis` pattern otherwise contributes the most frequent spans
                in the whole extraction, and strings.default.regex already
                deletes a stray hyphen anywhere for a cost of 1.

  filter        read an alphabet dump (hfst-dump-alphabets) on stdin, print the
                analysis-side filter regex: paths must carry an +Err/Orth* tag
                and must not carry a tag from a paradigm-multiplying family
                (+Cmp*, +Der*, +Px*, +Foc*, +Qst).  Restricting the paradigm is
                what makes enumeration finite; the alternation being extracted
                lives in the stem, so possessive and clitic forms would only
                re-derive spans the base paradigm already yields.

  extract       read a pair dump (hfst-fst2strings -X quote-special) on stdin,
                print the generated strings regex.

Python 3, standard library only.
"""

import argparse
import difflib
import sys
from collections import Counter, defaultdict

# Letters the error model already knows, from the alphabet of
# .generated/editdist.all.default.desktop.hfst.  Every symbol a generated rule
# introduces beyond this set is a symbol the Levenshtein model's ?-arcs have to
# expand against, so staying inside it is a hard constraint, not a preference.
LOWER = "aábcčdđefghijklmnŋoprsštŧuvwxyzžåæéöø"
ALLOWED = set(LOWER)

# The word-shape acceptor's alphabet may be wider than the error model's: it
# only has to describe what a word looks like, and anything it lets through
# that ALLOWED rejects is dropped later, per rule rather than per path.
SHAPE_LOWER = "aábcčdđefghijklmnŋoprsštŧuvzžæøåéwxy"
SHAPE_UPPER = "AÁBCČDĐEFGHIJKLMNŊOPRSŠTŦUVZŽÆØÅÉWXY"

# Tag families whose members multiply the paradigm rather than describe a stem.
PARADIGM_TAG_PREFIXES = ("+Cmp", "+Der", "+Px", "+Foc", "+Qst")

ERROR_TAGS = ("+Err/Orth", "+Err/Orth-a-á", "+Err/Orth-nom-acc", "+Err/Orth-nom-gen")

VOWELS = set("aáeiouyåæøö")

# Confusion classes the Levenshtein model already crosses cheaply, transcribed
# from editdist.default-new.regex.  A span whose whole difference is one step
# inside one of these classes is reachable for 5-25 already, so emitting a rule
# for it only adds a second, more specific way to pay for the same correction.
CHEAP_CLASSES = [
    set("aáeiou"),
    {"i", "y"},
    {"f", "v"},
    {"i", "j"},
    {"n", "ŋ"},
    {"f", "ff"}, {"j", "jj"}, {"l", "ll"}, {"m", "mm"},
    {"n", "nn"}, {"ŋ", "ŋŋ"}, {"r", "rr"}, {"v", "vv"},
    {"s", "ss", "z", "zz", "š", "šš", "ž", "žž",
     "c", "cc", "hcc", "č", "čč", "hčč"},
    {"g", "gg", "k", "kk", "hk", "hkk"},
    {"b", "bb", "p", "pp", "hp", "hpp"},
    {"d", "dd", "h", "t", "tt", "ht", "htt", "đ", "đđ", "ŧ", "ŧŧ"},
    {"s", "ss", "ŧ", "ŧŧ"},
    {"hc", "z"}, {"hč", "ž"}, {"hk", "g"}, {"hp", "b"}, {"ht", "đ"},
    {"vt", "h", "k"}, {"vk", "h"}, {"vc", "h"},
    {"ášu", "atio"}, {"áššu", "atio"},
    # strings.default.regex deletes a stray hyphen anywhere for a cost of 1.
    {"-", ""},
]

QUOTED = (
    ("@_SPACE_@", " "),
    ("@_TAB_@", "\t"),
    ("@_COLON_@", ":"),
    ("@_EPSILON_SYMBOL_@", ""),
)


def unquote(s):
    for frm, to in QUOTED:
        s = s.replace(frm, to)
    return s


def emit_wordshape(out):
    low = "[ " + " | ".join('"%s"' % c for c in SHAPE_LOWER) + " ]"
    up = "[ " + " | ".join('"%s"' % c for c in SHAPE_UPPER) + " ]"
    out.write("[ (%s) %s+ ] ;\n" % (up, low))


def emit_filter(alphabet_lines, out):
    syms = sorted({l.rstrip("\n") for l in alphabet_lines if l.strip()})
    excluded = [s for s in syms if s.startswith(PARADIGM_TAG_PREFIXES)]
    if not excluded:
        sys.exit("no paradigm tags found in alphabet - wrong input?")
    present = [t for t in ERROR_TAGS if t in syms]
    if not present:
        sys.exit("no +Err/Orth* tags found in alphabet - wrong input?")
    out.write("[ ?* [ %s ] ?* ] & ~[ ?* [ %s ] ?* ] ;\n" % (
        " | ".join('"%s"' % s for s in present),
        " | ".join('"%s"' % s for s in excluded)))


def cheap(err, norm):
    """Is this span's difference one step the Levenshtein model already takes?"""
    for cls in CHEAP_CLASSES:
        if err in cls and norm in cls:
            return True
    # Vowel length and diphthong repair: the model has explicit add, delete,
    # substitute and swap rules for every short vowel sequence.
    if len(err) <= 2 and len(norm) <= 2:
        if all(c in VOWELS for c in err) and all(c in VOWELS for c in norm):
            return True
    return False


def span(err, norm):
    """Minimal contiguous differing span as (prefix_len, err_core, norm_core)."""
    limit = min(len(err), len(norm))
    p = 0
    while p < limit and err[p] == norm[p]:
        p += 1
    s = 0
    while s < limit - p and err[len(err) - 1 - s] == norm[len(norm) - 1 - s]:
        s += 1
    return p, err[p:len(err) - s], norm[p:len(norm) - s]


def regions(err, norm, gap):
    """The separated places this pair differs in, as (start, err, norm) triples.

    Trimming a shared prefix and suffix always yields one span, but when a word
    differs from its correction in two distant places that span swallows the
    identical material between them and a rule cut from it is a memorised word
    fragment, not an alternation.  Grouping difflib's non-equal opcodes tells
    the two cases apart; runs closer together than `gap` are one alternation
    written across a couple of characters (tnj -> kŋ), not two, so they are
    merged and the material between them is taken into the region.

    `start` indexes into `err`; the two cores are what that region replaces and
    what it replaces it with.  A single-region result describes the same
    difference `span` does, and a multi-region result is the list of rules the
    pair needs in order to be corrected in one pass.
    """
    ops = [op for op in difflib.SequenceMatcher(None, err, norm, autojunk=False)
           .get_opcodes() if op[0] != "equal"]
    if not ops:
        return []
    groups = [[ops[0]]]
    for prev, cur in zip(ops, ops[1:]):
        if cur[1] - prev[2] > gap:
            groups.append([cur])
        else:
            groups[-1].append(cur)
    return [(g[0][1], err[g[0][1]:g[-1][2]], norm[g[0][3]:g[-1][4]])
            for g in groups]


def contextualise(err, p, core_err, core_norm, want, lo=0, hi=None):
    """Pad the span with shared context until the rule is `want` chars long.

    Context is taken from the left first, then the right, alternating: a stem
    alternation is identified by what precedes it more often than by what
    follows, but a word-initial span has nothing on its left to take.

    The rules ride in the strings component, which is wrapped in ?* on both
    sides before it is used, so there is no way to anchor one to a word
    boundary there.  Context length is the only handle on overgeneration, which
    is why a span that cannot reach `want` characters is dropped rather than
    emitted bare.

    `lo` and `hi` bound the padding.  Context is only context if it is the same
    on both sides of the pair, and for one region of a multi-region pair that
    is true only up to its neighbours: padding past them would copy the other
    region's misspelt letters into the right-hand side and assert a correction
    that leaves them standing.  Bounding to the neighbours makes such a region
    run out of context and be dropped, which is the right answer for it.
    """
    if hi is None:
        hi = len(err)
    left, right = p, p + len(core_err)
    take_left = True
    while len(err[left:right]) < want:
        moved = False
        if take_left and left > lo:
            left -= 1
            moved = True
        elif not take_left and right < hi:
            right += 1
            moved = True
        elif left > lo:
            left -= 1
            moved = True
        elif right < hi:
            right += 1
            moved = True
        if not moved:
            break
        take_left = not take_left
    pre = err[left:p]
    post = err[p + len(core_err):right]
    return pre + core_err + post, pre + core_norm + post


def escape(s):
    out = []
    for c in s:
        if c in "%{}\"":
            out.append("%")
        out.append(c)
    return "".join(out)


def rule_for(err, p, core_err, core_norm, args, st, tag, lo=0, hi=None):
    """Turn one differing region into a rule, or None with the reason counted.

    The same chain guards both paths: a region wide enough to be a word
    fragment, one the Levenshtein model already crosses, one that cannot be
    told apart from its surroundings, and one that would introduce a symbol the
    error model's alphabet does not have are all refused here.  Sharing it is
    what makes "the same safety filters" true of the multi-region path rather
    than merely intended.
    """
    if len(core_err) > args.max_span or len(core_norm) > args.max_span:
        st[tag + "span_too_long"] += 1
        return None
    if cheap(core_err, core_norm):
        st[tag + "cheap_editdist"] += 1
        return None
    rule_err, rule_norm = contextualise(
        err, p, core_err, core_norm, args.min_context, lo, hi)
    if len(rule_err) < args.min_context:
        st[tag + "no_context"] += 1
        return None
    if len(rule_err) > args.max_rule or len(rule_norm) > args.max_rule:
        st[tag + "rule_too_long"] += 1
        return None
    if not rule_err:
        st[tag + "empty_lhs"] += 1
        return None
    if rule_err == rule_norm:
        st[tag + "identity_rule"] += 1
        return None
    if not set(rule_err) | set(rule_norm) <= ALLOWED:
        st[tag + "outside_alphabet"] += 1
        return None
    return rule_err, rule_norm


def extract(lines, args, out, stats_out):
    st = Counter()
    rules = Counter()
    support = defaultdict(set)
    # A rule the single-region path found is priced at --weight even if the
    # multi-region path found it again: it stands on its own as a whole
    # correction, and repricing it would move rules that are already shipping.
    solo = set()
    for line in lines:
        st["pairs_read"] += 1
        line = line.rstrip("\n")
        if not line:
            continue
        parts = line.split(":")
        if len(parts) == 1:
            # hfst-fst2strings prints one string when both sides agree.
            st["drop_identity"] += 1
            continue
        if len(parts) != 2:
            st["drop_unparseable"] += 1
            continue
        err, norm = unquote(parts[0]), unquote(parts[1])
        if not err or not norm:
            st["drop_empty"] += 1
            continue
        # Proper nouns reach the analyser capitalised and the generator may
        # answer in either case.  Left as-is, a leading K/k mismatch defeats
        # the shared-prefix trim and the span swallows the whole word, so the
        # alternation is found on the case-folded forms and the rule is
        # emitted in lower case -- which is also the only case in which an
        # unanchored substring rule can be right.
        err, norm = err.lower(), norm.lower()
        if err == norm:
            st["drop_identity"] += 1
            continue
        st["spans_computed"] += 1
        regs = regions(err, norm, args.max_gap)
        if len(regs) > 1:
            # Every region gets its own rule, bounded by its neighbours so that
            # what it calls context really is shared.  Regions that fail the
            # filters are simply not emitted: a cheap one is a step the
            # Levenshtein model takes anyway, and the pair is still corrected
            # as long as its expensive regions are covered.
            st["multi_region_pairs"] += 1
            if len(regs) > args.max_regions:
                st["mr_drop_too_many_regions"] += 1
                continue
            for i, (rp, core_err, core_norm) in enumerate(regs):
                st["mr_regions_seen"] += 1
                lo = regs[i - 1][0] + len(regs[i - 1][1]) if i else 0
                hi = regs[i + 1][0] if i + 1 < len(regs) else len(err)
                rule = rule_for(err, rp, core_err, core_norm,
                                args, st, "mr_drop_", lo, hi)
                if rule is None:
                    continue
                st["mr_rules_before_aggregation"] += 1
                rules[rule] += 1
                support[rule].add(err[:rp])
            continue
        p, core_err, core_norm = span(err, norm)
        rule = rule_for(err, p, core_err, core_norm, args, st, "drop_")
        if rule is None:
            continue
        st["rules_before_aggregation"] += 1
        rules[rule] += 1
        support[rule].add(err[:p])
        solo.add(rule)

    st["rules_aggregated"] = len(rules)
    final = [(k, c) for k, c in rules.items()
             if c >= args.min_count and len(support[k]) >= args.min_support]
    st["drop_below_threshold"] = len(rules) - len(final)
    st["rules_emitted"] = len(final)
    st["rules_emitted_multi_region_only"] = sum(
        1 for k, _ in final if k not in solo)

    multi_weight = args.weight if args.multi_weight is None else args.multi_weight
    final.sort(key=lambda kc: (-kc[1], kc[0]))
    out.write("! Generated by extract-errorth-strings.py - do not edit.\n")
    out.write("! Stem alternations recovered from the lexicon's +Err/Orth* entries.\n")
    out.write("! %d rules, weight %s, min context %d.\n"
              % (len(final), fmt_weight(args.weight), args.min_context))
    out.write("! %d of them come only from pairs that differ in several places,"
              " at weight %s.\n"
              % (st["rules_emitted_multi_region_only"], fmt_weight(multi_weight)))
    out.write("\n[\n\n")
    for i, ((rule_err, rule_norm), count) in enumerate(final):
        rhs = "{%s}" % escape(rule_norm) if rule_norm else "0"
        weight = args.weight if (rule_err, rule_norm) in solo else multi_weight
        out.write("{%s} (->) %s::%s%s\t! %d forms, %d stems\n" % (
            escape(rule_err), rhs, fmt_weight(weight),
            " ," if i + 1 < len(final) else "", count, len(support[(rule_err, rule_norm)])))
    out.write("\n]\n;\n")

    for key in ("pairs_read", "drop_unparseable", "drop_empty", "drop_identity",
                "spans_computed", "drop_span_too_long",
                "drop_cheap_editdist", "drop_no_context", "drop_rule_too_long",
                "drop_empty_lhs", "drop_identity_rule", "drop_outside_alphabet",
                "rules_before_aggregation",
                "multi_region_pairs", "mr_drop_too_many_regions",
                "mr_regions_seen", "mr_drop_span_too_long",
                "mr_drop_cheap_editdist", "mr_drop_no_context",
                "mr_drop_rule_too_long", "mr_drop_empty_lhs",
                "mr_drop_identity_rule", "mr_drop_outside_alphabet",
                "mr_rules_before_aggregation", "rules_aggregated",
                "drop_below_threshold", "rules_emitted",
                "rules_emitted_multi_region_only"):
        stats_out.write("%-32s %d\n" % (key, st[key]))


def fmt_weight(w):
    return ("%g" % w)


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("mode", choices=("wordshape", "filter", "extract"))
    ap.add_argument("-o", "--output", default="-")
    ap.add_argument("-i", "--input", default="-")
    ap.add_argument("--weight", type=float, default=10.0,
                    help="cost of one rule application (default 10)")
    ap.add_argument("--multi-weight", type=float, default=None,
                    help="cost of a rule only a multi-region pair attests "
                         "(default: same as --weight)")
    ap.add_argument("--max-regions", type=int, default=4,
                    help="most differing places a pair may have and still be "
                         "used (default 4)")
    ap.add_argument("--min-context", type=int, default=3,
                    help="shortest left-hand side to emit (default 3)")
    ap.add_argument("--max-span", type=int, default=6,
                    help="longest differing span to keep (default 6)")
    ap.add_argument("--max-gap", type=int, default=1,
                    help="identical characters two edits may straddle and still "
                         "count as one alternation (default 1)")
    ap.add_argument("--max-rule", type=int, default=14,
                    help="longest left/right-hand side to emit (default 14)")
    ap.add_argument("--min-count", type=int, default=1,
                    help="least pairs a rule must come from (default 1)")
    ap.add_argument("--min-support", type=int, default=1,
                    help="least distinct left contexts a rule must have (default 1)")
    ap.add_argument("--stats", default="-",
                    help="where to write the extraction funnel (default stderr)")
    args = ap.parse_args()

    inp = sys.stdin if args.input == "-" else open(args.input, encoding="utf-8")
    out = sys.stdout if args.output == "-" else open(args.output, "w", encoding="utf-8")
    stats = sys.stderr if args.stats == "-" else open(args.stats, "w", encoding="utf-8")

    if args.mode == "wordshape":
        emit_wordshape(out)
    elif args.mode == "filter":
        emit_filter(inp, out)
    else:
        extract(inp, args, out, stats)
    out.flush()


if __name__ == "__main__":
    main()
