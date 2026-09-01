#!/bin/bash
# disamb -> (guess) -> disamb -> functions -> dependency
#
# Disambiguating before the guesses are inserted means the context is resolved
# from exactly the evidence the baseline had.  The second disambiguation pass
# then prunes the guesses against a context that is already unambiguous; it
# cannot damage that context, because CG3 will not remove a cohort's last
# reading.
source /private/tmp/depstudy/sh/env.sh
IN="$1"
OUTDIR="$2"
DIS="$3"
FUN="$4"
DEP="$5"
PRE="$6"
b=$(basename "$IN" .cg)
if [ -n "$PRE" ] && [ "$PRE" != "-" ]; then
  vislcg3 -g "$DIS" < "$IN" \
    | vislcg3 -g "$PRE" \
    | vislcg3 -g "$DIS" \
    | vislcg3 -g "$FUN" \
    | vislcg3 -g "$DEP" -D > "$OUTDIR/$b.dep"
else
  vislcg3 -g "$DIS" < "$IN" \
    | vislcg3 -g "$DIS" \
    | vislcg3 -g "$FUN" \
    | vislcg3 -g "$DEP" -D > "$OUTDIR/$b.dep"
fi
