# Does a CG rule improve where the speller's correction lands?

A harness that scores a whole sentence through the grammar checker up to
`spell-sugg-filtering`, and asks where the known correction sits in the
suggestion list on either side of that stage.

## Answer

No, not from sentence context. Every context test measured is net-negative,
including the four the shipped `spellchecker.cg3` carries, and removing them is
worth more than any context rule added in their place.

`spellchecker.cg3` as shipped, on the rows the product pipeline actually sends
to the speller (1450 of 4247 `typos-context.tsv` rows):

| metric | before the stage | after | discordant | p |
|--------|------------------|-------|------------|---|
| top-1  | 63.10% | 62.55% | +2 / −10 | 0.039 |
| top-5  | 97.03% | 95.66% | +0 / −20 | 1.9e-6 |

It never once puts the correction into the top 5. It takes it out twenty times.
On the wider `spell` condition (3695 rows) the same shape is larger: top-1
+9/−30, top-5 +0/−47.

Per-rule, on the `spell` condition, each rule in isolation:

| line | rule | +1 | −1 | net-5 |
|------|------|----|----|-------|
| 1226 | `ADD:dyn-cmp` | 0 | 0 | 0 |
| 1248 | `SELECT Inf IF (-1 <aux>)` | 0 | 0 | 0 |
| 1251 | `SELECT (Prop Sem/Sur)` | 0 | −2 | −3 |
| 1271 | `SELECT PrfPrc` | 0 | 0 | 0 |
| 1281 | `SELECT Attr OR A IF (-1 GRADE-ADV)(1 N)` | 0 | 0 | 0 |
| 1285 | `SELECT Attr/Gen IF (1 N)` | +12 | −33 | −44 |
| 1292 | `REMOVE V IF (0 N)(-1 (Pron Attr))` | 0 | −1 | −1 |
| 1301 | `REMOVE Px` | +2 | −5 | −16 |

Four rules never fire on 3695 real misspellings. One, 1285, does nearly all the
damage, and it is the plainest statement of the problem: `(1 N)` is a test of
adjacency, not of modification, and `SELECT` on a cohort of speller suggestions
deletes vocabulary rather than choosing an analysis.

## What is worth having

Disabling 1251, 1285, 1292 and 1301 makes the stage a no-op — 0 gains, 0 losses,
two rows where a candidate is dropped — which recovers the whole loss above.

On top of that, one thing measures positive, and it is not a context test:

```
LIST RANK-W-GE-50 = (<W:>=50>) ;
SET  RANK-DUMMY-60 = RANK-SPELLED-DUMMY + RANK-W-GE-50 ;
SUBSTITUTE:rank-dummy-60 (<W:<60>) (<W:80>) TARGET RANK-DUMMY-60 IF (0 RANK-LOWERTOKEN) ;
```

...and twelve more bands like it. `divvun.suggest` orders suggestions by
`<W:...>` ascending and CG3 has no reorder operation, so rewriting that tag is
the only way a rule can *move* a suggestion instead of deleting it. Moving is
the whole point: a demotion cannot take the correction out of the list, which is
exactly what the `SELECT` rules did.

Two details are load-bearing. CG3 has no arithmetic on numeric tags, so "+20" is
spelled out as bands, run in descending order so a reading moved up cannot be
caught again. And the band must be part of the **target**, not a context test:
`(0 (<W:<50>))` asks whether the *cohort* holds a reading under 50, which is
true whenever any cheaper suggestion exists, and gates the rule on the wrong
reading. Writing it that way still measures positive, which is how easy it is to
ship the wrong rule with the right numbers attached.

Measured:

| condition | rows | top-1 before | after | discordant | p | top-5 | types |
|-----------|------|--------------|-------|------------|---|-------|-------|
| `prod`  | 1450 | 63.10% | 65.17% | +31 / −1  | 1.5e-08 | −4 | +13 / −1  |
| `spell` | 3695 | 71.56% | 73.40% | +84 / −16 | 2.6e-12 | −8 | +20 / −10 |

A +20 penalty is the optimum on both conditions and by both denominators;
+10 gives half the gain, +30 triples the losses. The grammar is also *cheaper*
than the one it replaces — 2.0 s against 5.2 s over 100k stream lines — because
four expensive `SELECT`s went away.

Two honest qualifications:

**It is not a context rule.** `Sem/Dummytag` is the lexicon's "no semantic class
assigned", which in practice selects thin and marginal entries. Demoting them is
a lexical-reliability prior, and it belongs in the speller's weight model, where
it would cost no CG time at all and need no bands. Thirteen CG rules are a
workaround for not being able to reach the lexicon from a CG stage.

**Its type-level margin is thinner than its token-level margin.** Counting each
distinct (error, correction) pair once instead of each attestation gives the
`types` column above: still clearly positive, but the row-level gain is carried
by a few frequent errors (`obalaš`→`oppalaš`, `diehto`→`diehtu`,
`distaga`→`disdaga`). A corpus-weighted measure is the right one for predicting
what users see; the type-level one says this helps some common words a lot and
a smaller number of rare ones slightly.

## Why context cannot do better

Of the 3695 rows where the misspelling reached the speller, 71.6% already have
the correction first and 1.4% do not have it at all. The winnable rows are the
999 (27.0%) where it is in the list but not first. What separates the correction
from the form ranked 1 on those rows:

| what differs | rows | share |
|--------------|------|-------|
| part of speech | 435 | 43.5% |
| **nothing — the two are tag-identical** | 179 | 17.9% |
| case/number, same lemma | 139 | 13.9% |
| semantic class only | 69 | 6.9% |
| other (mostly `Dial/` variants) | 67 | 6.7% |
| case/number, different lemma | 59 | 5.9% |
| lemma only | 51 | 5.1% |

17.9% are a hard ceiling, not a difficulty: CG3 sees readings, and a rule can
prefer form A over form B only if some reading of A carries a tag no reading of B
carries. `Bodeadjus` against `Budejjus` offers a rule nothing to hold.

The other 82.1% are reachable in principle, and were measured. `py/probe.py`
prices a candidate-level test offline as a removal, a demotion, or a weight
penalty, against the same cached streams, so a family can be rejected without
writing CG:

| test | penalty+20 | demote | remove |
|------|-----------|--------|--------|
| V-only immediately before a N | −23 | −38 | −38 |
| no Attr/Gen/A/Num before a N | −33 | −67 | −67 |
| ConNeg-only | −2 | 0 | 0 |
| Imprt-only | −11 | −6 | −6 |
| Prop-only, lowercase token | **+5** | **+6** | **+6** |
| Sem/Dummytag-only, lowercase | **+37** | +30 | +30 |

(net rows at top-1, 3695 rows.) The two positional tests are the dependency
study's insight in its cheapest form, and both lose. That is the same wall the
previous round hit, and the dependency study explains it: naming a misspelling's
head by the token at ±1 is right 18.8%/32.6% of the time, so a rule conditioned
on it is wrong most of the time it fires. The dependency tree names the head
75–93% of the time, but the grammar checker's disambiguator does not produce
dependency relations, and adding a dependency stage before the speller is not
available here.

## Method

Two facts shape the design.

**Sentences must not share a CG stream.** The dependency study measured what
happens when they do: batching changed 12.6% of heads, because a later
sentence's root gets re-attached to an earlier one's. `collect.py` runs one OS
process per sentence. That costs about 0.3 s a row at 20-way parallelism.

**But the expensive part only has to be paid once.** `spell-sugg-filtering` is a
pure CG stage over the output of `disamb`, so `vislcg3 --grammar X < disamb.cg`
reproduces what the pipeline itself would produce for X. This was verified twice:
byte-identical output for the shipped grammar, and identical suggestion lists on
1050 of 1050 comparable rows for the patched grammar run through the real
pipeline end to end.
So `collect.py` caches `disamb` once and `score.py` prices any number of grammars
against it at 0.03 s a row — 19 s for the whole 4247-row set, and every variant
paired with the baseline by construction.

`py/cohort.py` reproduces the tail of the pipeline that the tap skips: the
suggestion list is the `"form"S` tag of every `<spelled>` reading, sorted by
`<W:...>` ascending and stably, deduped keeping the first occurrence, then recased
from the token as written. All three steps are copied from divvun-runtime's
`src/modules/divvun/suggest.rs`; get any of them wrong and the ranks are fiction.

### The two conditions, and why both are reported

`pipeline.ts` exports two dev pipelines.

- `prod` is the product grammar checker stage for stage. It is the honest
  baseline, and on it only **34.1%** of `typos-context.tsv` rows reach the
  speller at all: the tokeniser-analyser is descriptive and recognises most of
  these misspellings outright as `Err/Orth`, so they are corrected normatively
  by `grammarchecker.cg3` and `spellchecker.cg3` never sees them.
- `spell` adds `err-to-unknown.cg3`, which marks every Err-only cohort `+?` so
  cgspell handles it. 87.0% of rows reach the speller. It is no longer the
  shipped pipeline, and it buys sample size and a view of the speller proper.

Report which one a number came from. They agree on every sign here.

### Speller config

The speller settings in `pipeline.ts` are the grammar checker's, copied from
`tools/grammarcheckers/pipeline.ts`, not the standalone speller's. The difference
is not cosmetic: `beam` 80 puts ~250 readings in a misspelling's cohort and costs
17.8 s a sentence through the two CG stages; `beam` 38, which is what the product
uses, costs 0.6 s.

### Sample size

All 4247 rows of `tools/spellcheckers/test/typos-context.tsv`. The design is
paired, so the test is McNemar's on the discordant pairs, not two independent
proportions. At the discordance rates seen here (2–5% of rows move), 4247 rows
give a 95% interval of roughly ±0.5pp on the net change, which is what "detect a
1pp move" requires. An unpaired comparison at these levels would need about 30k
rows for the same resolution.

`typos-context.tsv` rows are corpus attestations, but their corrections come from
`typos.tsv`, which the speller is tuned against. This is a favourable sample. The
type-level counts in `py/probe.py` and the split-half in the numbers above are
the controls for it, and the split halves agree (`prod` +21 / +22).

## Running it

Everything needs the Rust toolchain first on `PATH`:

```sh
export PATH=/opt/homebrew/opt/make/libexec/gnubin:/opt/homebrew/opt/icu4c/bin:\
$HOME/git/necessary/hfst/target/release:$HOME/git/necessary/cg3/target/release:$PATH
export DIVVUN_RUNTIME=$HOME/git/divvun/divvun-runtime/target/release/divvun-runtime
```

Build the asset directory once (a few minutes; needs a built
`tools/spellcheckers` and a built tokeniser somewhere in the tree):

```sh
sh/setup.sh /path/to/lang-sme /tmp/gc-assets
```

Collect the streams once per condition (about 20 minutes for 4247 rows at
`--jobs 20`; it resumes, so a kill costs nothing):

```sh
cd /tmp/gc-assets
python3 py/collect.py typos-context.tsv /tmp/run-prod  --assets . --pipeline prod
python3 py/collect.py typos-context.tsv /tmp/run-spell --assets . --pipeline spell
```

Then price grammars against the cache, as often as you like:

```sh
python3 py/score.py  /tmp/run-prod out.jsonl --grammar spellchecker.cg3
python3 py/report.py out.jsonl
python3 py/perrule.py /tmp/run-prod spellchecker.cg3     # per-rule + and -
python3 py/diagnose.py out.jsonl --examples 5            # what could separate them
python3 py/probe.py   out.jsonl                          # price a test before writing CG
```

`score.py --grammar none` is the control: a no-op grammar must move nothing.
`diagnose.py` and `probe.py` need the `cohorts` field, so do not pass
`--no-cohorts` to `score.py` when you intend to use them.

## Files

`sh/setup.sh` builds the assets. `pipeline.ts` defines the two dev pipelines and
names the stages `--break-after` addresses; renaming a stage breaks the harness.
`py/collect.py` caches the `disamb` stream per sentence, `py/score.py` applies a
grammar and ranks the gold on either side, `py/report.py` prints the table and
the paired test, `py/perrule.py` does leave-one-out and one-rule-only accounting,
`py/diagnose.py` classifies what separates the gold from the form ranked 1, and
`py/probe.py` prices a candidate-level test offline under all three operations.
`py/cohort.py` is the shared reader.
