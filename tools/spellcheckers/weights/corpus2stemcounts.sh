#!/bin/bash
# Corpus -> per-stem token frequencies, through the full analyser pipeline.
#
#     corpus2stemcounts.sh <workdir> [jobs]
#
# The stakeholder proposal asks for frequencies computed with "the full
# analyser pipeline (with disambiguation and all)". That is this file:
#
#     preprocess          tokenise, using the language's abbreviation list
#     hfst-lookup         analyse, with the disambiguation-oriented analyser
#     lookup2cg           lookup output -> CG cohorts (compound rating included)
#     vislcg3             Constraint Grammar disambiguation
#     count               surviving readings -> per-stem token counts
#
# Two things make it affordable. The analyser is a function, so only the 177k
# *types* are looked up, not the 3.8M tokens; the cohorts are cached per type
# and the token stream is expanded from the cache. And CG is the slow step
# (about 30 kcohort/min per core), so the stream is split at paragraph marks --
# a CG delimiter -- and disambiguated in parallel.
#
# The stem key is the analysis prefix before its first tag, which is what the
# lexc stem entry carries. lookup2cg rewrites that prefix for compounds, so
# each analysis is passed through the converter with its own stem appended as a
# marker tag; stripping the marker recovers the canonical cohort line, which
# gives a reading -> stem map that the CG output is read back through. Nothing
# in the CG stream itself is marked, so the disambiguation is the stock one.
#
# A token whose surviving readings disagree about the stem contributes 1/k to
# each of the k stems; after CG that is 1.2% of tokens (it is 19.8% before).
set -euo pipefail

WORK="${1:?usage: corpus2stemcounts.sh <workdir> [jobs]}"
JOBS="${2:-$(sysctl -n hw.ncpu 2>/dev/null || nproc)}"
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$HERE/../../.." && pwd)"

CORPUS="$HERE/spellercorpus.raw.txt"
ABBR="$REPO/tools/tokenisers/abbr.txt"
ANALYSER="$REPO/src/fst/analyser-disamb-gt-desc.hfstol"
GRAMMAR="$REPO/src/cg3/disambiguator.cg3"
VISLCG3="${VISLCG3:-$HOME/git/necessary/cg3/target/release/vislcg3}"
CGCOMP="${CGCOMP:-$HOME/git/necessary/cg3/target/release/cg-comp}"

mkdir -p "$WORK/chunks" "$WORK/cgout"

echo "== tokenise"
preprocess --abbr="$ABBR" < "$CORPUS" > "$WORK/corpus.tokens.txt"

echo "== analyse types"
python3 "$HERE/stemcounts.py" types -i "$WORK/corpus.tokens.txt" \
    -o "$WORK/token.counts.tsv" --types-out "$WORK/types.txt"
hfst-lookup -q "$ANALYSER" < "$WORK/types.txt" > "$WORK/types.analyses.raw.txt"

echo "== cohorts"
# cut -f1,2: hfst-lookup emits a weight column that lookup2cg would otherwise
# glue onto the last tag, silently corrupting every reading it converts.
cut -f1,2 "$WORK/types.analyses.raw.txt" | lookup2cg > "$WORK/types.cohorts.txt"
python3 "$HERE/stemcounts.py" mark -i "$WORK/types.analyses.raw.txt" \
    -o "$WORK/types.analyses.marked.txt"
lookup2cg < "$WORK/types.analyses.marked.txt" > "$WORK/types.cohorts.marked.txt"

echo "== expand + split"
python3 "$HERE/stemcounts.py" expand -w "$WORK" -j "$JOBS"

echo "== disambiguate ($JOBS ways)"
# The grammar has `INCLUDE semsets.cg3`, which is generated from root.lexc and
# resolved relative to the working directory, so compile from src/cg3.
( cd "$(dirname "$GRAMMAR")" \
    && make semsets.cg3 >/dev/null \
    && "$CGCOMP" "$(basename "$GRAMMAR")" "$WORK/disambiguator.bin" >/dev/null )
for f in "$WORK"/chunks/c*.cg; do
    b=$(basename "$f" .cg)
    "$VISLCG3" -g "$WORK/disambiguator.bin" < "$f" > "$WORK/cgout/$b.out" 2>/dev/null &
done
wait

echo "== count"
python3 "$HERE/stemcounts.py" count -w "$WORK" -o "$HERE/stem.counts.tsv"
python3 "$HERE/stemcounts.py" count-undisambiguated -w "$WORK" \
    -o "$WORK/stem.counts.undisamb.tsv"
echo "== done: $HERE/stem.counts.tsv"
