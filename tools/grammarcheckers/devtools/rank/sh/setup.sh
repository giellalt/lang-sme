#!/bin/bash
# Assemble the asset directory the rank harness runs against.
#
# The harness does not need a full `make` of tools/grammarcheckers. It needs
# the models the speller and the two CG stages consume, and it reads candidate
# order straight out of the CG stream instead of running divvun.suggest -- so
# generator-gramcheck-gt-norm.hfstol, the one asset that would drag in the whole
# src/fst chain, is not required.
#
# Everything here comes from one lang-sme checkout, so the analyser the speller
# uses and the grammars tested against it are the same vintage. Note the two
# dates that are NOT the same: the tokeniser and whitespace analyser are taken
# from a built tools/teaksta/assets if one is present, because building the
# 212 MB pmhfst takes longer than the rest of this script put together.
#
#   usage: setup.sh <lang-sme checkout> <asset dir>
set -euo pipefail

REPO="${1:?usage: setup.sh <lang-sme checkout> <asset dir>}"
W="${2:?usage: setup.sh <lang-sme checkout> <asset dir>}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GIELLA_CORE="${GIELLA_CORE:-$REPO/../giella-core}"

mkdir -p "$W"
cd "$W"

cp_fast() { /bin/cp -c "$1" "$2" 2>/dev/null || cp "$1" "$2"; }

echo "== speller models =="
cp_fast "$REPO/tools/spellcheckers/analyser-desktopspeller-gt-norm.hfst" .
cp_fast "$REPO/tools/spellcheckers/errmodel.default.hfst" .

# acceptor.default.hfst is NOT the acceptor inside se.zhfst. cgspell needs one
# that emits CG cohorts, so the speller analyser is composed with a filter that
# turns every "+Tag" into " Tag". The filter is derived from the analyser's own
# sigma, which is why it cannot simply be copied from giella-core/fst-filters.
echo "== CG-tag filter =="
hfst-summarize -v analyser-desktopspeller-gt-norm.hfst 2>/dev/null \
  | grep -A1 '^sigma set' | grep -v '^sigma set' \
  | sed 's/, /\\\\\\/g' | perl -pe 's/\\\\\\/\n/g' | grep -v '^$' \
  | grep -Ev '(@_EPSILON_SYMBOL_@|@_IDENTITY_SYMBOL_@|@_UNKNOWN_SYMBOL_@)' > sigma.txt
( grep -E '(^\+.|.\+$)' sigma.txt || echo '+NoTagsFound' ) > tags.txt
"$GIELLA_CORE/scripts/taglist2make_CG_tags_regex.sh" tags.txt > make-desktopspeller-CG-tags.regex
hfst-regexp2fst --format=openfst-tropical --xerox-composition=ON -S \
  make-desktopspeller-CG-tags.regex -o make-desktopspeller-CG-tags.hfst

echo "== acceptor =="
hfst-invert analyser-desktopspeller-gt-norm.hfst \
  | hfst-compose -F -1 make-desktopspeller-CG-tags.hfst \
  | hfst-invert \
  | hfst-push-weights --push=initial \
  | hfst-fst2fst -f olw -o acceptor.default.hfst

echo "== tokeniser and whitespace analysers =="
if [ -f "$REPO/tools/teaksta/assets/tokeniser-gramcheck-gt-desc.pmhfst" ]; then
    cp_fast "$REPO/tools/teaksta/assets/tokeniser-gramcheck-gt-desc.pmhfst" .
    cp_fast "$REPO/tools/teaksta/assets/analyser-gt-whitespace.hfst" .
elif [ -f "$REPO/tools/grammarcheckers/tokeniser-gramcheck-gt-desc.pmhfst" ]; then
    cp_fast "$REPO/tools/grammarcheckers/tokeniser-gramcheck-gt-desc.pmhfst" .
    cp_fast "$REPO/tools/grammarcheckers/analyser-gt-whitespace.hfst" .
else
    echo "no built tokeniser found; build tools/grammarcheckers first" >&2
    exit 1
fi
cp "$REPO/tools/grammarcheckers/analyser-gt-errorwhitespace.regex" .
hfst-regexp2fst --disjunct -i analyser-gt-errorwhitespace.regex \
  | hfst-fst2fst -O -o analyser-gt-errorwhitespace.hfst

echo "== grammars =="
cp "$REPO/src/cg3/valency.cg3" .
cp "$REPO/tools/tokenisers/mwe-dis.cg3" .
cp "$REPO/tools/grammarcheckers/grc-disambiguator.cg3" .
cp "$REPO/tools/grammarcheckers/spellchecker.cg3" .
# The same sed tools/grammarcheckers/Makefile.am applies: scope every
# SUBSTITUTE to <spelled> so suggestions get valency tags too.
sed -e 's/^# Error tags$/&\n\nLIST <spelled> = <spelled> ;/' \
    -e 's/^SUBSTITUTE \(.*\);/SUBSTITUTE \1 (0 <spelled>)  ;/' \
    < valency.cg3 > valency-postspell.cg3

echo "== pipeline =="
cp "$HERE/../pipeline.ts" .
cp "$HERE/../err-to-unknown.cg3" .
cp -R "$REPO/tools/grammarcheckers/.divvun-rt" .

echo
echo "asset dir ready: $W"
echo "next: python3 $HERE/../py/collect.py <rows.tsv> <rundir> --assets $W --pipeline prod"
