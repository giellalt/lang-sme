# North Sámi speller accuracy review — path to 95% top‑1 / 99% top‑5

**Date:** 2026‑08‑20 (outcomes addendum 2026‑08‑21; round‑3 addendum 2026‑08‑22)
**Scope:** `lang-sme` desktop speller (`se.zhfst`) suggestion quality
**Author:** Divvun tooling review (automated analysis + build-system survey)

## Round 3 (addendum, 2026‑08‑22): per-category analysis and cost recalibration

The per-category programme recommended below was executed. First finding: the round‑2 engine fixes (out-of-alphabet input handling, unknown-output enumeration) were worth far more than previously reported — re-measuring with the current engine put the true starting point at **83.33% top‑1 / 96.02% top‑5 / 98.50% offered-at-all** under the analysis config, and cut the never-offered pool from 494 to 160. All round‑2 reports had been produced with a stale binary; the numbers in the 2026‑08‑21 addendum understate what had already shipped.

Round‑3 changes, each validated by a full A/B run over the gold set:

1. **Edit-cost recalibration** (`editdist.default-new.regex`), driven by a re-ranking simulator over the per-word reports that predicts the net effect of any single-edit cost change before a rebuild. Landed: same-letter single↔double consonant (gradation slips, the canonical Sámi writing error) 15→10 for **all** consonants — previously only 8 letters had a dedicated class, priced the same as cross-consonant changes; `o↔u` and `e↔i` 15→8; word-final `s↔š` at 8; word-final `-ii`→`-iid` (illative vs genitive-plural) at 10; initial-uppercase 25→12. Net **+39 top‑1** in isolation. The delete direction of the `-iid` rule was tried and reverted — it promoted spurious short forms (net negative), and the simulator's per-lever attribution caught it in one iteration.
2. **19 new chunk rules** (`strings.default.regex`), mined from the 425 residual failures with per-rule collateral measurement: every rule's left side was checked against all 9,076 attested correct forms; chunks impossible in correct Sámi (`ä`, `járvv`, unaccented `aigge`…) ride at weight 1, chunks whose left side occurs in real words ride at 25 so they never undercut a letter edit. Net **+28 top‑1, +40 top‑5**. The Norwegian-definite family (`-hallenis`, `-festivalenis`) was evaluated and *rejected*: any covering rule fires on hundreds of correct locative/diminutive forms.
3. **divvunspell case-handling fixes** (benefit all Giella languages): all-caps detection is no longer defeated by a single stray lower-case character (`RÁðI` now yields `RÁĐI`; previously junk like `R6-I`), and corrections for irregular-cased inputs are re-capitalized (`EOvddidat` → `Ovddidat`, `ŦMuitalusat` → `Muitalusat`; previously emitted lower-case and never matched).
4. **Corpus hygiene:** 7 rows — 2 still expected the substandard `ollusat` (contradicting its `+Err/Orth` reclassification), 5 expected a casing that contradicted the input's case context.

| Metric (n‑best 100) | True round‑2 (re-measured) | **Round 3** |
|---|---|---|
| Top‑1 | 8,896 (83.33%) | **8,968 (84.02%)** |
| Top‑5 | 10,250 (96.02%) | **10,305 (96.53%)** |
| Correct offered at all | 10,515 (98.50%) | **10,543 (98.76%)** |
| Never offered | 160 | **132** |
| False accepts / false negatives | 2 / 0 | **0 / 0** |

**Ceiling analysis (the honest part).** With the current candidate generator, a *perfect* re-ranker — one that always picks the intended word whenever it sits within a given weight window of the current winner — reaches: 88.2% top‑1 (window +5), 90.9% (+10), 93.0% (+15), 94.4% (+20), 96.0% (+30). **95% top‑1 therefore demands near-flawless discrimination across a ±30-unit window** — two full edit operations — which isolated-word unigram frequency cannot deliver: the median winner-vs-intended gap is a single weight unit, and per-case attribution shows the edit model prefers the wrong winner in 56% of near-misses, lexicon frequency in 23%, with the rest mixed. The credible remaining levers, in order: a properly trained frequency model (the current LM compresses the whole corpus into ≤50 weight units; its estimates alone account for 312 measured near-miss losses), context-aware re-ranking (the grammar-checker pipeline is the natural home — a speller that sees only one word at a time cannot choose between `boahtte`/`bohte` when both are one cheap edit away), and continued chunk mining against fresh error corpora. 99% top‑5 likewise first requires pushing offered-at-all above 99%: of the 132 still-missing, ~50 are proper-noun rewrites (`Näkkeljoga`→`Neahčiljoga`) and ~65 are distance‑4+ one-offs no generalizable rule covers — the realistic route is more curated Err/Orth-style knowledge, not larger edit budgets.

Sign‑off: `make check` green under the Divvun HFST toolchain (this round touches only error-model weights, chunk rules, and the test corpus — no analyser sources); zero false accepts and zero false negatives for the first time.

## Outcomes (addendum, 2026‑08‑21)

The programme below was executed over two days. Results on the corrected corpus (10,679 pairs; three wrong expected forms fixed, one real-word pair and one non-typo pair removed, five mojibake lines repaired):

| Metric (n‑best 100) | Before | After | Production config |
|---|---|---|---|
| Top‑1 | 80.98% | **83.3%** | 83.2% |
| Top‑5 | 93.94% | **96.0%** | 94.8% |
| Correct offered at all | 97.04% | **98.5%** | 95.3% |
| No suggestions | 18 | **0** | — |
| Typo accepted as correct | 11 | **0** | — |

Landed: the LM `maxweight` raise (10→50, recommendation A); the missing confusion pairs `ŋ↔n`, `i↔y`, `s↔ŧ` and chunk rewrites incl. the `nj↔ŋ` digraph family (B, C); lexicon curation of the false accepts and missing forms (E); the `+Cmp` penalty confirmed already optimal (G). In divvunspell (affects all Giella languages): the n‑best recall bug fixed, the search converted to best‑first with exact state deduplication — 29% faster mean, 7× better worst case, identical results. Recommendation F was implemented **not** as pair enumeration but as `extract-errorth-strings.py`: 5,238 stem-level alternation rules derived from the lexicon's `+Err/Orth*` entries into the strings component — beating the enumerated-pairs approach on every metric and correcting misspelled stems inside dynamic compounds no pair list could contain (`make errorth-regen` reproduces the rules byte-for-byte). Known cost: `se.zhfst` grows to ~131 MB (from 56 MB); reduction options (rule-support thresholds, non-determinised error models at a search-time cost) are understood if size matters downstream.

Sign‑off: full `make check` green under both the C++ 3.17.1 toolchain and the Divvun HFST (Rust) toolchain, identical test sets. Remaining distance to 95/99 is ranking-dominated; the per-category tracking recommended below is the tool for the next iteration.

## Summary

Measured against the full 10,682‑pair `tools/spellcheckers/test/typos.tsv` gold set, the current speller places the correct suggestion first for **80.98%** of typos and in the top five for **93.94%**. The two dominant, fixable causes are:

1. **Lexical frequency barely participates in ranking.** The corpus language model compresses the entire frequency spectrum of the language into 8 weight units, while a single edit in the error model costs 5–59. Rare wrong-lemma neighbours routinely outrank frequent correct words, and exact weight ties are broken *alphabetically*.
2. **The error model cannot reach 316 of the corrections at all**, 255 of which are ≥3 character edits away — beyond its 2‑edit budget. Most of these are single contiguous stem or compound alternations (e.g. `kultuvra‑` ↔ `kultur‑`) that targeted string patterns can cover without enlarging the edit budget.

With the recommended changes, **~90% top‑1 and ~97% top‑5 are high-confidence outcomes; 95% / 99% is reachable but requires the full programme**, including pattern mining for stem alternations and exploiting the lexicon's `+Err/Orth` knowledge. The corpus itself is clean (ceiling 99.94%), so the targets are not data-limited.

## Methodology

- `se.zhfst` built from the current `lang-sme` tree with the standard autotools pipeline (`--enable-spellers --with-backend-format=openfst-tropical`), using the Divvun HFST (Rust) toolchain. The artifact is content-equivalent to one built with upstream C++ HFST 3.17.1 (verified separately: identical accept/reject behaviour, equal-or-better on every accuracy aggregate, ~26% faster lookups).
- Evaluated with `divvunspell accuracy` (current development head) at `n‑best=100`, `max‑weight=10000`, standard reweights, recase on. The high n‑best matters: at the production `n‑best=10` the numbers are noisier because of an n‑best pruning issue in divvunspell (see finding D).
- Every number below comes from scripted analysis of the full per-word JSON report, not sampling.

## Current results

| Metric | Count | Rate |
|---|---|---|
| Correct suggestion first (top‑1) | 8,650 / 10,682 | 80.98% |
| Correct in top 5 | 10,035 | 93.94% |
| Correct anywhere in top 100 | 10,366 | 97.04% |
| Correct never offered | 316 | 2.96% |
| Typo accepted as correct (false negative) | 11 | 0.10% |
| Correct word rejected (false accept) | 0 | 0% |

**Gap to targets:** 95% top‑1 needs **+1,498** promotions to first place; 99% top‑5 needs **+541** into the top five.

## Anatomy of the 2,032 top‑1 misses

| Bucket | Count | Diagnosis |
|---|---|---|
| Correct at position 1–4 | 1,385 | Ranking failure: a wrong one-edit neighbour outranks the right correction |
| — of which exact weight ties | 139 | Tie-break is alphabetical; the winner sorts before the expected word in **all 139** |
| — weight gap ≤ 5 units | 507 | Flippable with modest cost tuning |
| — weight gap > 10 units | 588 | Need category-level repricing or frequency separation |
| Correct at position 5–99 | 331 | 87% are overpriced by >20 units |
| Correct absent at n=100 | 316 | 310 are *accepted by the lexicon* but never generated; only 4 words are genuinely missing |
| — of the absent: edit distance ≥3 | 255 | Beyond the 2‑edit model. **180 are one contiguous ≤6‑char mid-word chunk** (stem/compound alternation) |

Confusion analysis across all misses (top pairs, input→expected): `a→á` 216, `á→a` 138, consonant gemination/degemination (the `del/ins t, k, l` mass, several hundred combined), `o→u` 79, `e→i` 73, `u→o` 67, `d→đ` 49, `s→š` 43, `j→ŋ` 43, `i→e` 48.

The wrong corrections that *win* are dominated by wrong-lemma `a↔á` flips (140), spurious vowel insertions/deletions, and `ii↔i` — i.e. the cheap edits applied to the wrong word.

## Root causes

### 1. The frequency model is crushed (ranking)

`tools/spellcheckers/weights/config.json` sets `maxweight: 10`. The resulting unigram LM (built by `giella-core/scripts/corpus2unigramlm.py` over `weights/spellercorpus.raw.txt`, 3.1M tokens / 166k types) maps the most frequent word in the language (`ja`, weight 1.98) and a hapax (9.54) into a spread of **8 units**, with out-of-corpus words at 10.0. Suggestion ranking is `frequency + tag penalties + error-model cost`, and error-model costs run 5–59 with `+Cmp` at 45 — so frequency is nearly irrelevant. Symptoms:

- `reat → leat` ("to be", the most common verb): correct answer ranked **81st**.
- 139 top‑1 losses are exact ties resolved by alphabetical order.
- Verified separately that divvunspell's client-side positional reweighting is already net-positive (removing it costs 119 top‑1); the problem is in the zhfst weights.

### 2. Edit costs contradict the observed error distribution (ranking)

`tools/spellcheckers/editdist.default-new.regex` (the hand-written model; it shadows the older generated path) prices:

- `a↔á` at **5** — the cheapest edit in the model;
- consonant gemination classes (`t↔tt`, `k↔kk`, `l↔ll`…) at **15**;
- `o↔u`, `e↔i`, `a↔e/i` — **no cheap pair at all**; they fall through to generic substitution at **59**;
- `ŋ↔n` / `nj↔ŋ` — no cheap pair (unlike all six other Sámi diacritics), despite `j→ŋ` being a top-ten confusion;
- generic insert/substitute/delete at 31/59/51.

The result: for a typo whose real fix is gemination or a vowel-pair substitution, some *other* word one cheap `á`-flip away wins. This is the single largest miss category.

### 3. The 2‑edit budget cannot reach 316 corrections (coverage)

Of the 316 never-offered corrections, 310 are in the lexicon. 255 are ≥3 raw edits from the typo — but **180 of those 255 differ by one contiguous mid-word chunk of ≤6 characters**: compound-form alternations (`kultuvradoalut → kulturdoalut`), stem alternations, colon-inflection forms (`Ab:a → Ab`). These are systematic morphology, not random noise, and are addressable as single weighted string-rewrite patterns. Raising `EDIT_DISTANCE` to 3 is **not** recommended: the error model is already 245 MB with 1.27 s worst-case lookups.

### 4. divvunspell n‑best pruning leaks recall (client)

For 9 of the 43 words that hit the n=100 suggestion cap, the correct word *does* surface at `-n 2000` — one at true post-reweight rank **12**. The n‑best cut is applied against pre-reweight raw weights, so genuinely good candidates are pruned before reordering. This also explains previously observed n‑best-sensitivity between equivalent archives.

### 5. Small lexicon issues

- 4 expected forms are missing from the lexicon entirely: `Fádnuid`, `kaféii`, `ollosat`, `ollosiid`.
- 11 typos are accepted as correct words; `kultuvra‑` compounds account for the largest group (the normative compound form is `kultur‑`), plus wrong-in-context derivations (`garrásit/garrasit`, `rahppá/ráhppá`).

## Recommended changes, ranked by expected yield

| # | Change | Where | Effort | Expected effect |
|---|---|---|---|---|
| A | Raise LM `maxweight` from 10 to ~30–50 (sweep empirically) | `tools/spellcheckers/weights/config.json` | 1 line + acceptor rebuild (~5 min) per trial | Largest single lever: restores frequency separation across all ranking buckets; fixes alphabetical ties as a side effect |
| B | Recalibrate edit costs against the confusion matrix: gemination classes cheaper; add `o↔u`, `e↔i`, `a↔e/i` (~10–15), `ŋ↔n`, `nj↔ŋ` (~5–10), `i↔y`; keep generic fallbacks as-is | `tools/spellcheckers/editdist.default-new.regex` | Iterative; errmodel-only rebuilds are minutes | Attacks the 507 near-miss ranking failures and much of the deep bucket |
| C | Add chunk-rewrite patterns for the systematic stem/compound alternations and colon-inflection paradigms | `strings.default.regex`, `final_strings.default.txt` | Pattern mining, iterative | The only viable route to 99% top‑5: covers the 255 distance‑3+ absents at one edit each |
| D | Fix n‑best pruning to cut on post-reweight weights | divvunspell | Client-side fix | Recovers up to ~43 absents, some at true rank ≤31; benefits all Giella languages |
| E | Lexicon curation: add the 4 missing forms; restrict `kultuvra‑` in compound-left position; review the 11 false accepts | `src/fst/` lexc sources | Small | Removes the false negatives; ~15 words |
| F | Compile the lexicon's `+Err/Orth*` pairs (incl. the dedicated `Err/Orth-a-á` class) into an error-model component instead of hard-deleting them via `remove-error-strings.regex` | build system + `src/fst/` | Medium project | Injects curated normative-error knowledge; closes part of the final gap |
| G | Tune `+Cmp +45` (per compound boundary) once A lands | `weights/tags.reweight` | 1 line per trial | Currently suppresses legitimate compound suggestions; must be re-balanced against the new LM range |

**Housekeeping found along the way:** `accents.default.regex` and its composition rule (`Makefile.mod-desktop-hfst.am:105‑122`) are dead code — the target is never consumed; `strings.default.txt`, `initial_letters.*`, `DEFAULT_WEIGHT`, `USE_SWAPS`, `CORPUS_SIZE` are all inert in the desktop configuration; `clean_weight_corpus.sh` output is built but never read (the LM tokenises the raw corpus itself). These should be deleted or deliberately revived to prevent future tuning-by-dead-knob.

**Explicit non-recommendation:** do not seed `words.default.txt` from `typos.tsv` pairs. That is training on the evaluation set; it would inflate the reported metric without improving real-world accuracy. Whole-word replacement entries should come from independent corpora (e.g. SIKOR error annotations).

## Feasibility

- **95% top‑1** requires converting essentially *all* 1,385 ranking failures plus ~113 promotions from deeper buckets. A + B are high-confidence for a large majority of the ranking pool; a realistic post-A/B landing zone is **89–92%**, with C, F and iteration closing toward 95%.
- **99% top‑5** is mathematically impossible without new reach: the pool addressable by ranking alone caps at ~97.6%. Achieving it requires C (chunk patterns) to cover most of the 255 distance‑3+ cases, plus D.
- Measurement discipline: `typos.tsv` carries a 39‑category error-type column (`#_a_error` 2,815, `#_cdst_error` 924, …) — per-category tracking should be used during tuning to catch regressions, evaluated under both the analysis config (n‑best 100) and the production config (`tools/spellcheckers/config.json`: n‑best 10, beam 29).

## Reproduction

```sh
# Build (Divvun HFST toolchain first in PATH):
./configure --without-forrest --disable-syntax --enable-spellers \
            --with-backend-format=openfst-tropical
make -j4

# Evaluate:
divvunspell accuracy -c cfg-n100.json -o report.json \
    tools/spellcheckers/test/typos.tsv tools/spellcheckers/se.zhfst
# cfg-n100.json = production config with "n-best": 100, "beam": null
```
