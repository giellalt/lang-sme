# Does dependency structure tell a speller which words are related?

A CG rule that wants "the word this misspelling modifies" has to write `(-1 N)`
or `(1 N)`. That is a test of adjacency, not of modification, and the previous
round of suggestion-filtering work stalled on exactly that: an agreement rule
gained 12 and lost 12 because "the evidence that identifies a real agreement
violation also fires on a noun that merely sits next to another noun without
modifying it".

This measures whether a dependency tree can name that word instead.

## Answer

Yes, but only because the speller's suggestions are in the cohort. Naming the
head of a misspelling:

| way of naming the head                    | fires | head right | head+label right |
|-------------------------------------------|-------|------------|------------------|
| the token at `-1`                          | 100%  | 18.8%      | –                |
| the token at `+1`                          | 100%  | 32.6%      | –                |
| dependency, misspelling left unknown       | 0.0%  | 0.0%       | 0.0%             |
| dependency, unknown + blind POS guesser    | 93.5% | 50.4%      | 16.3%            |
| dependency, cohort = speller top-10        | 98.3% | 75.3%      | 62.2%            |
| ... top-10 with the correction deleted     | 96.5% | 69.1%      | 52.0%            |
| ... top-3                                  | 98.9% | 86.0%      | 78.3%            |
| ... best suggestion only                   | 99.3% | 93.1%      | 89.6%            |

989 real misspellings in their real sentences. The dependency tree names one
word; `within N` names 2N.

The signal is not a proxy for the speller already being right. On the 217 rows
where the speller's rank-1 suggestion is wrong, relatedness F1 is 0.805 against
0.840 on the rows where it is right.

## Method

`typos-context.tsv` gives a misspelling, its correction and the sentence. The
correction is substituted back in and the result parsed by
`disambiguator | functions | dependency -D`; that parse is the target. It is
what the CG would say if the word were spelled right, which is the right target
for "can we recover the tree we would have had" — but it is not a treebank, and
no claim is made that it is linguistically correct.

Closeness to the target is UAS (head matches) and LAS (head and function label
match) over the tokens that are *not* the perturbed one. Punctuation is excluded:
it gets no function label and its attachment is a clean-up artefact.

"Structurally related to p" is head(p) + dependents(p) + siblings(p), scored as
precision/recall of a set of token positions, against `within N tokens`.

## What bounds the whole thing

Coverage of the target trees, over 15,514 content tokens in 1,000 sentences:

- 99.4% get a syntactic function label, but 4.4% of those are `@X`, the null label
- 88.4% get a head that is not the root
- **87.8% have both a real head and a real label** — the usable fraction
- 57.2% of sentences come out as a single tree; the rest have 2 or more roots
- 3.3% of tokens are unknown to the analyser even in the corrected sentence

## The three conditions, on synthetic perturbation

6,611 perturbations: every content position of 400 sentences, plus the real
error position of the rest. Each perturbation is one sentence with one word
replaced by the analysis an out-of-vocabulary word gets.

| condition                              | UAS   | LAS   | attaches | relatedness F1 |
|----------------------------------------|-------|-------|----------|----------------|
| stock CG, word unknown                 | 92.07 | 90.88 | 0.0%     | 0.025          |
| + blind POS guesser (before disamb)    | 83.60 | 80.65 | 89.4%    | 0.621          |
| + blind POS guesser (after disamb)     | 84.31 | 82.17 | 90.0%    | 0.618          |
| correct morphology, no lexical identity| 99.15 | 98.54 | 91.8%    | **0.953**      |
| `within 3 tokens` (best window)        | –     | –     | –        | 0.536          |

The last row of the first block is the ceiling: give the cohort the right
morphology and the dependency grammar recovers the tree and the relatedness
almost perfectly. **The dependency grammar is not the bottleneck.** What the
cohort carries is.

`unk-guess.cg3` and `unk-guess2.cg3` are the blind guesser, kept as a documented
negative. It buys attachment at the cost of 8 points of UAS, and the loss is
concentrated where it hurts: UAS at distance 1 from the unknown word falls to
62%. An ambiguous cohort offering N, V, A and Adv readings is a magnet for
`@>N TO (*1 N)` and its kin. Guessing after disambiguation instead of before
recovers 1.5 points of LAS and no more, so the damage is not the disambiguator
being confused — it is the guessed cohort being a candidate head.

Fewer suggestions in the cohort is strictly better (F1 0.951 at top-1, 0.903 at
top-3, 0.832 at top-10). A dependency-based context test wants the suggestion
list pruned before it parses, not after.

## Two things to know before reusing the harness

**Sentences must not share a CG stream.** Batching them changes 12.6% of heads
and 4.5% of labels against parsing each on its own, because a later sentence's
root gets re-attached to an earlier sentence's root. Every number here comes
from one process per sentence; that costs 134 ms and removes the doubt.

**The wordform leaks.** Blanking a cohort but keeping the correct wordform lets
lexical rules fire on it. Measured, the leak is 0.08 UAS — small, but the
corrupted-wordform variant is the one reported.

## Caveat on the data

The correction is in the speller's top-10 for 100% of these rows and at rank 1
for 78%. `typos-context.tsv` rows come from `typos.tsv`, which the speller is
tuned against, so this is a favourable sample. `e2x` (correction deleted) and
the rank-1-wrong split are the controls for that, and both hold up.

## Files

`prep.py` samples the rows; `make_pert*.py` and `make_oracle.py` build the
synthetic conditions; `align_err.py` and `build_e*.py` build the real-misspelling
conditions; `score*.py`, `analyse.py`, `head_cmp.py` and `coverage.py` score
them. `run-dir*.sh` drives a directory of one-sentence streams through the CG
chain in parallel. Paths are absolute to a scratch directory and will need
editing.
