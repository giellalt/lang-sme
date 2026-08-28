# Measuring CG filtering of speller suggestions

Three scripts, used together to decide whether a CG rule earns its place.

- `run.py rows.jsonl out.jsonl A.drb B.drb` — scores two bundles over the same
  rows and records where the gold correction lands in each. Build the two so
  they differ in exactly one stage; anything else and the delta is not
  attributable.
- `collect.py rows.jsonl out.jsonl bundle.drb` — dumps each candidate's CG
  readings plus the whole sentence's cohorts, so a rule's conditions can be
  tested against real neighbouring context.
- `sim.py` — prices a candidate-level rule offline against that dump.

Rows come from `tools/spellcheckers/test/typos-context.tsv`.

## Two things the measurements established

**Price every rule against rows that are already right.** Run a mix: rows where
the gold is not first (what a rule might fix) and rows where it is (what a rule
might break). Rules here gain and lose in the same proportion, and a target-only
score would have read as a clear win. Suggested split is 2:1.

**Simulation is exact here, not predictive.** Removing candidates cannot
introduce one the speller did not already offer, so the re-ranked list is what
the pipeline would really produce. That is not true of cost repricing elsewhere
in this project, where a cheapened edit admits competitors the simulation cannot
see -- those realised about 40% of predictions and inverted outright three times.

## What is already ruled out

Running the full disambiguator over `<spelled>` readings: +25 at rank 1 on rows
where the gold was not first, -96 on rows where it already was, net -71 over 600
rows, with the gold destroyed in 348 of them. CG disambiguation assumes a
cohort's readings are competing analyses of one word; speller suggestions are
competing words, so `SELECT` deletes vocabulary rather than choosing.
`PROTECT (<spelled>)` in `grc-disambiguator.cg3` is load-bearing.

Three generalised families -- agreement with an unambiguous head, adposition
government, subject before a finite verb -- price at net 0, +2, 0 and 0. The
agreement one gains 12 and loses 12: the evidence that identifies a real
agreement violation also fires on a noun that merely sits next to another noun
without modifying it. Telling modification from adjacency is what would change
that answer, and it needs dependency relations the disambiguator is not
currently producing.

Rules must operate at candidate level: a form may only be dropped when every
reading carrying it is ruled out. Removing individual readings deletes a
suggestion outright when that was the last reading carrying its form.
