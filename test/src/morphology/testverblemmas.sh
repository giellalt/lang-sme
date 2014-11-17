# Dette skriptet tester at nesten alle lemmaene i verbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingverbLemmas.txt

grep ";" $GTHOME/langs/sme/src/morphology/stems/verbs.lexc | grep -v "^\!" | egrep -v '(STRAYFORMS|ENDLEX|\+V|LexSub)' | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > verbs
cat verbs | sed 's/$/+V+Inf/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "V+" | grep -v "^$" | sort -u > analverbs 
comm -23 verbs analverbs > $GTHOME/langs/sme/test/data/missingverbLemmas.txt
rm *verbs
open $GTHOME/langs/sme/test/data/missingverbLemmas.txt
