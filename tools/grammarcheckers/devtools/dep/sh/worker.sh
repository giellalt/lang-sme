#!/bin/bash
# Parse one CG stream in isolation.  Isolation is per-process because sharing a
# stream between sentences changes 12.6% of heads (measured).
source /private/tmp/depstudy/sh/env.sh
IN="$1"
OUTDIR="$2"
DIS="$3"
FUN="$4"
DEP="$5"
PRE="$6"
b=$(basename "$IN" .cg)
if [ -n "$PRE" ] && [ "$PRE" != "-" ]; then
  vislcg3 -g "$PRE" < "$IN" \
    | vislcg3 -g "$DIS" \
    | vislcg3 -g "$FUN" \
    | vislcg3 -g "$DEP" -D > "$OUTDIR/$b.dep"
else
  vislcg3 -g "$DIS" < "$IN" \
    | vislcg3 -g "$FUN" \
    | vislcg3 -g "$DEP" -D > "$OUTDIR/$b.dep"
fi
