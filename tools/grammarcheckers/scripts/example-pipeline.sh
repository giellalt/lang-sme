#!/bin/sh

hfst-tokenise --gtd "$GTHOME"/langs/sme/tools/preprocess/tokeniser-gramcheck-gt-desc.pmhfst \
    | vislcg3 -g "$GTHOME"/langs/sme/tools/preprocess/mwe-dis.cg3 \
    | cg-mwesplit \
    | vislcg3 -g "$GTHOME"/langs/sme/src/syntax/valency.cg3 \
    | vislcg3 -g "$GTHOME"/langs/sme/tools/grammarcheckers/disambiguator.cg3 -t \
    | vislcg3 -g "$GTHOME"/langs/sme/tools/grammarcheckers/grammarchecker.cg3 -t \
    | divvun-suggest \
          -g "$GTHOME"/langs/sme/src/generator-gt-norm.hfstol \
          -m "$GTHOME"/langs/sme/tools/grammarcheckers/errors.xml
