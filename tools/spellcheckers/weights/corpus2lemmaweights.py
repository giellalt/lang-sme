#!/usr/bin/env python3
"""Morphology-aware backoff weights for word forms the corpus never saw.

The corpus LM (corpus2unigramlm.py) gives every out-of-corpus word form the same
weight -- maxweight, by construction, since coeff is maxweight / -log10(unkprob)
and the OOV probability is exactly unkprob. An unseen inflection of `leat` and an
unseen derivation of a lemma nobody has written down are therefore priced
identically, although the lexicon knows which lemma each belongs to.

This script prices them apart. Word forms stay out of the corpus for two very
different reasons -- the lemma is rare, or the lemma is common but this
particular slot of its paradigm did not come up -- and only the second kind is
worth suggesting readily. The weight is

    weight(L) = maxweight - alpha * slope * log10(count(L) + 1)

where count(L) is the lemma's corpus frequency, obtained by running the corpus
vocabulary through the normative analyser. Anchoring at maxweight means a lemma
the corpus never saw keeps exactly the weight it has today, so no word form
comes out of this heavier than it went in; frequent lemmas get a discount.

`slope` is measured, not chosen: see 00README.txt for the held-out experiment
behind the value in lemma-backoff.json.
"""

import json
import re
import sys
from argparse import ArgumentParser
from collections import Counter, defaultdict
from math import log10

# Copied verbatim from giella-core/scripts/corpus2unigramlm.py: the two scripts
# have to agree on what a token is, or the lemma counts describe a different
# vocabulary than the weights they are meant to back off from.
SPLIT = re.compile(r"[0-9.?!*/\"“”’':,(){}¶]*\s+[0-9.(){}*\"’'/“”¶]*")


def cmd_types(opts):
    """Corpus -> `form TAB count`, the vocabulary to hand to the analyser."""
    freqs = Counter()
    with open(opts.input) as f:
        for line in f:
            freqs.update(filter(None, SPLIT.split(line)))
    with open(opts.output, "w") as out:
        for form, count in freqs.most_common():
            print(form, count, sep="\t", file=out)
    print(f"*** types: {len(freqs)} types, {freqs.total()} tokens")


def cmd_weights(opts):
    config = json.load(open(opts.config))
    alpha = config["alpha"]
    slope = config["slope"]
    base = config["base"]
    floor = config["floor"]
    min_count = config["min-count"]

    counts = {}
    with open(opts.types) as f:
        for line in f:
            form, count = line.rstrip("\n").split("\t")
            counts[form] = int(count)

    # form -> the distinct lemmas its analyses propose. Ambiguity is real and
    # unresolvable without context, so a form's tokens are split evenly over its
    # lemmas rather than credited to whichever analysis came out first.
    lemmas_of = defaultdict(set)
    with open(opts.analyses) as f:
        for line in f:
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 2 or "+?" in parts[1]:
                continue
            plus = parts[1].find("+")
            if plus > 0:
                lemmas_of[parts[0]].add(parts[1][:plus])

    lemma_counts = Counter()
    for form, lemmas in lemmas_of.items():
        count = counts.get(form, 0)
        if count:
            share = count / len(lemmas)
            for lemma in lemmas:
                lemma_counts[lemma] += share

    written = 0
    lowest = base
    with open(opts.output, "w") as out:
        for lemma, count in lemma_counts.most_common():
            if count < min_count or not lemma:
                continue
            weight = max(floor, base - alpha * slope * log10(count + 1.0))
            lowest = min(lowest, weight)
            # ':' separates the two sides of a string pair for strings2fst.
            print(lemma.replace(":", "\\:"), f"{weight:.6f}", sep="\t",
                  file=out)
            written += 1

    # The weight for a lemma the table does not price. The build reads it back
    # for the fallback branch, so the two can never drift apart.
    if opts.base_out:
        with open(opts.base_out, "w") as out:
            print(f"{base:.6f}", file=out)

    print(f"*** lemma backoff: {written} lemmas of {len(lemma_counts)}, "
          f"weights {lowest:.2f}..{base}, alpha={alpha} slope={slope}")


def cmd_tagclass(opts):
    """The tag alphabet, as a regex alternation.

    The lemma trie has to stop at the end of the lemma, or a lemma that is a
    prefix of a longer one lends it its weight -- `viessu` would price every
    form of `viessut`. Every analysis puts a tag directly after the lemma, so
    requiring one anchors the match.
    """
    tags = []
    with open(opts.alphabet) as f:
        for line in f:
            symbol = line.rstrip("\n")
            # Multichar tags only: a bare '+' is a literal character in the
            # lexicon, and would anchor the trie on the wrong thing.
            if len(symbol) > 1 and symbol.startswith("+") and '"' not in symbol:
                tags.append(symbol)
    with open(opts.output, "w") as out:
        print(" | ".join(f'"{t}"' for t in tags), ";", file=out)
    print(f"*** tag anchor: {len(tags)} tags")


def main():
    argp = ArgumentParser(description=__doc__)
    sub = argp.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("types", help="tokenise the corpus into type counts")
    p.add_argument("-i", "--input", required=True, metavar="FILE")
    p.add_argument("-o", "--output", required=True, metavar="FILE")
    p.set_defaults(func=cmd_types)

    p = sub.add_parser("weights", help="emit the lemma weight table")
    p.add_argument("-t", "--types", required=True, metavar="FILE")
    p.add_argument("-a", "--analyses", required=True, metavar="FILE",
                   help="hfst-lookup output over the type list")
    p.add_argument("-c", "--config", required=True, metavar="FILE")
    p.add_argument("-o", "--output", required=True, metavar="FILE")
    p.add_argument("--base-out", metavar="FILE",
                   help="write the unpriced-lemma weight here")
    p.set_defaults(func=cmd_weights)

    p = sub.add_parser("tagclass", help="emit the tag-anchor regex")
    p.add_argument("--alphabet", required=True, metavar="FILE",
                   help="hfst-dump-alphabets output for the speller lexicon")
    p.add_argument("-o", "--output", required=True, metavar="FILE")
    p.set_defaults(func=cmd_tagclass)

    opts = argp.parse_args()
    opts.func(opts)


if __name__ == "__main__":
    main()
