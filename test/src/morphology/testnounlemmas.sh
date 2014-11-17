# Dette skriptet tester at nesten alle lemmaene i noun-sme-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingnounLemmas.txt

grep ";" $GTHOME/langs/sme/src/morphology/stems/nouns.lexc | grep -v "^\!" | egrep -v '(CmpN/Only|ShCmp|RCmpnd| Rreal | R | Rnoun |\+V\+|LexSub)' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > nouns
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analnouns 
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "^$" >> analnouns 
grep ";" $GTHOME/langs/sme/src/morphology/stems/nouns.lexc | grep -v "^\!" | grep -v ShCmp | egrep "( R | Rreal | Rnoun)" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp#viessu+N+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "\-" | grep -v "\-.*\-" | cut -d "-" -f1 >> analnouns
grep ";" $GTHOME/langs/sme/src/morphology/stems/nouns.lexc | grep -v "^\!" | grep -v ShCmp | egrep "( R | Rreal | Rnoun)" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp#viessu+N+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "\-" | grep "\-.*\-" | cut -d "-" -f1,2 >> analnouns
grep ";" $GTHOME/langs/sme/src/morphology/stems/nouns.lexc | grep -v "^\!" | grep -v ShCmp | grep "RHyph" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp-#viessu+N+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "\-" | cut -d "-" -f1 >> analnouns
sort -u -o nouns nouns 
sort -u -o analnouns analnouns 
comm -23 nouns analnouns > $GTHOME/langs/sme/test/data/missingnounLemmas.txt
#rm *nouns 
see $GTHOME/langs/sme/test/data/missingnounLemmas.txt

