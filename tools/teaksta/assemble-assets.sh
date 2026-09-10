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
ZCHECK_DIR="${ZCHECK_DIR:-$LANG_SME/../files/se-zcheck}"

mkdir -p "$HERE/assets"
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
  "$LANG_SME/src/cg3" "$SHARED_SMI/src/cg3" \
  > "$HERE/assets/disambiguator.cg3"
flatten "$SHARED_SMI/src/cg3/konteaksta.cg3" \
  "$LANG_SME/src/cg3" "$SHARED_SMI/src/cg3" \
  > "$HERE/assets/konteaksta.cg3"

if grep -q '^# unresolved:' "$HERE/assets/"*.cg3; then
  echo "unresolved INCLUDEs remain" >&2
  exit 1
fi

echo "assets ready:"
ls -la "$HERE/assets"
