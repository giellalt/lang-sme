# Dette skriptet tester at alle lemmaene i propernoun-sme-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingProperLemmas.txt

grep ";" propernoun-sme-lex.txt | grep -v "^\!" | egrep -v '(Attr|FirstTag|-atr)' | sed 's/% /€/g' | sed 's/%:/¢/g' | sed 's/%!/!/g' | tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " | tr "¢" ":" | sort -u > props
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analprops 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "^$" >> analprops 
sort -u -o analprops analprops 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "N+" > missingProperLemmas.txt
comm -23 props analprops >> missingProperLemmas.txt
grep ";" propernoun-sme-lex.txt | grep -v "^\!" | egrep '(Attr|-atr|FirstTag)' | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "#" | tr "€" " " |  sort -u > attrprops
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "N+" >> missingProperLemmas.txt
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 |  grep -v "N+" | grep -v "^$" | sort -u > analattrprops  
comm -23 attrprops analattrprops >> missingProperLemmas.txt
rm *props
open missingProperLemmas.txt
