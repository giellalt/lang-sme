#!/bin/bash
source /private/tmp/depstudy/sh/env.sh
set -e
INDIR="$1"
OUTDIR="$2"
DIS="${3:-$LSME/src/cg3/disambiguator.bin}"
FUN="${4:-$LSME/src/cg3/functions.bin}"
DEP="${5:-$LSME/src/cg3/dependency.bin}"
PRE="${6:--}"
NP="${7:-8}"
mkdir -p "$OUTDIR"
rm -f "$OUTDIR"/*.dep 2>/dev/null || true
find "$INDIR" -name '*.cg' -print0 \
  | xargs -0 -P "$NP" -n 1 -I{} bash /private/tmp/depstudy/sh/worker.sh {} "$OUTDIR" "$DIS" "$FUN" "$DEP" "$PRE"
echo "parsed: $(ls "$OUTDIR" | wc -l) files"
