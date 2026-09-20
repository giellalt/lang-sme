#!/usr/bin/env bash
# Collects the model assets the teaksta pipelines reference into ./assets,
# ready for `divvun-runtime bundle -a assets -p pipeline.ts`.
#
# Tokeniser + whitespace + mwe-dis currently come from an unpacked sme
# grammar-checker bundle (ZCHECK_DIR) because building the pmhfst needs the
# full hfst toolchain; the CG grammars are taken as raw sources straight
# from this repo and shared-smi (the runtime compiles them at load).
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
LANG_SME="$HERE/../.."
SHARED_SMI="${SHARED_SMI:-$LANG_SME/../shared-smi}"
GIELLA_CORE="${GIELLA_CORE:-$LANG_SME/../giella-core}"
ZCHECK_DIR="${ZCHECK_DIR:-$LANG_SME/../files/se-zcheck}"

mkdir -p "$HERE/assets"

# semsets.cg3 is generated, never tracked: the disambiguator INCLUDEs the
# semantic-tag sets extracted from the lexicon, and a fresh checkout has
# nothing at that name. Same rule as src/cg3/Makefile.am — plain python
# over a tracked source, no FST toolchain needed — run here so the flatten
# below never depends on a stale copy lying around a working tree.
GEN_DIR="$(mktemp -d)"
trap 'rm -rf "$GEN_DIR"' EXIT
python3 "$GIELLA_CORE/scripts/generate-semsets.py" \
  -i "$LANG_SME/src/fst/morphology/root.lexc" \
  -o "$GEN_DIR/semsets.cg3"
cp "$ZCHECK_DIR/tokeniser-gramcheck-gt-desc.pmhfst" "$HERE/assets/"
cp "$ZCHECK_DIR/analyser-gt-whitespace.hfst" "$HERE/assets/"
cp "$ZCHECK_DIR/mwe-dis.bin" "$HERE/assets/"

# CG INCLUDE directives resolve against the loader's working directory,
# which inside a .drb is not the asset store — so the grammars are
# flattened textually (INCLUDE is plain textual inclusion in CG-3).
flatten() { # flatten <grammar> <include-dir...>
  local src="$1"; shift
  awk -v dirs="$*" '
    /^INCLUDE[ \t]/ {
      split(dirs, d, " ")
      for (i in d) {
        f = d[i] "/" $2
        if ((getline probe < f) >= 0) { close(f)
          while ((getline line < f) > 0) print line
          close(f); next
        }
      }
      print "# unresolved: " $0; next
    }
    { print }
  ' "$src"
}

flatten "$LANG_SME/src/cg3/disambiguator.cg3" \
  "$GEN_DIR" "$LANG_SME/src/cg3" "$SHARED_SMI/src/cg3" \
  > "$HERE/assets/disambiguator.cg3"
flatten "$SHARED_SMI/src/cg3/konteaksta.cg3" \
  "$GEN_DIR" "$LANG_SME/src/cg3" "$SHARED_SMI/src/cg3" \
  > "$HERE/assets/konteaksta.cg3"

if grep -q '^# unresolved:' "$HERE/assets/"*.cg3; then
  echo "unresolved INCLUDEs remain" >&2
  exit 1
fi

echo "assets ready:"
ls -la "$HERE/assets"
