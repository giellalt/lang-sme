# Dette skriptet tester at nesten alle lemmaene i verb-sme-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingverbLemmas.txt

grep ";" verb-sme-lex.txt | grep -v "^\!" | egrep -v '(STRAYFORMS|ENDLEX|+V)' | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > verbs
cat verbs | sed 's/$/+V+Inf/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "V+" | grep -v "^$" | sort -u > analverbs 
cat verbs | sed 's/$/+V+Inf/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "^$" >> analverbs 
sort -u -o analverbs analverbs 
comm -23 verbs analverbs > missingverbLemmas.txt
rm *verbs
open missingverbLemmas.txt
