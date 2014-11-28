# Kommando når man er i sme: sh test/src/morphology/testverblemmas.sh
# Dette skriptet tester at nesten alle lemmaene i verbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingverbLemmas.txt. 

grep ";" ../../../src/morphology/stems/verbs.lexc | grep -v "^\!" | egrep -v '(STRAYFORMS|ENDLEX|LexSub)' | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > verbs
cat verbs | sed 's/$/+V+Inf/' | $LOOKUP ../../../src/generator-gt-norm.xfst | cut -f2 | grep -v "V+" | grep -v "^$" | sort -u > analverbs 
comm -23 verbs analverbs > ../../../test/data/missingverbLemmas.txt
rm *verbs
see ../../../test/data/missingverbLemmas.txt
