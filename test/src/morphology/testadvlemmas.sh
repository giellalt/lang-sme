# Kommando når man er i sme: sh test/src/morphology/testadvlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i adverbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingadverbLemmas.txt. 

grep ";" $GTHOME/langs/sme/src/morphology/stems/adverbs.lexc | grep -v "^\!" | egrep -v '(LexSub|-comp| LE|-sup |SUP| Px|^adv |^adv-plc)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > adverbs
grep ";" $GTHOME/langs/sme/src/morphology/stems/adverbs.lexc | grep -v "^\!" | egrep -v '(LexSub| Px|^adv |^adv-plc)' | egrep '(-comp| LE)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" > compadverbs
grep ";" $GTHOME/langs/sme/src/morphology/stems/adverbs.lexc | grep -v "^\!" | egrep -v '(LexSub| Px|^adv |^adv-plc)' | egrep '(-sup| SUP)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" > supadverbs
cat adverbs | sed 's/$/+Adv/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "Adv+" | grep -v "^$" > anadverbs 
cat compadverbs | sed 's/$/+Adv+Comp/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "Adv+" | grep -v "^$" >> anadverbs 
cat supadverbs | sed 's/$/+Adv+Superl/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "Adv+" | grep -v "^$" >> anadverbs 
sort -u -o anadverbs anadverbs
cat adverbs compadverbs supadverbs | sort -u > alladverbs
comm -23 alladverbs anadverbs > $GTHOME/langs/sme/test/data/missingadverbLemmas.txt
rm *adverbs
see $GTHOME/langs/sme/test/data/missingadverbLemmas.txt
