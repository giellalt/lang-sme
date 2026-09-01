#!/bin/bash
source /private/tmp/depstudy/sh/env.sh
set -e
INDIR="$1"
OUTDIR="$2"
PRE="${3:--}"
NP="${4:-8}"
DIS="$LSME/src/cg3/disambiguator.bin"
FUN="$LSME/src/cg3/functions.bin"
DEP="$LSME/src/cg3/dependency.bin"
mkdir -p "$OUTDIR"
rm -f "$OUTDIR"/*.dep 2>/dev/null || true
find "$INDIR" -name '*.cg' -print0 \
  | xargs -0 -P "$NP" -n 1 -I{} bash /private/tmp/depstudy/sh/worker2.sh {} "$OUTDIR" "$DIS" "$FUN" "$DEP" "$PRE"
echo "parsed: $(ls "$OUTDIR" | wc -l) files"
