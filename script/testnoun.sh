# Dette skriptet tester at nesten alle lemmaene i noun-sme-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingnounLemmas.txt

grep ";" $GTHOME/gt/sme/src/noun-sme-lex.txt | grep -v "^\!" | egrep -v '(CmpN/Only|ShCmp|RCmpnd|\+V\+)' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > nouns
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analnouns 
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "^$" >> analnouns 
grep ";" $GTHOME/gt/sme/src/noun-sme-lex.txt | grep -v "^\!" | grep -v ShCmp | egrep "( R | Rreal | Rnoun)" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp#viessu+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "\-" | grep -v "\-.*\-" | cut -d "-" -f1 >> analnouns
grep ";" $GTHOME/gt/sme/src/noun-sme-lex.txt | grep -v "^\!" | grep -v ShCmp | egrep "( R | Rreal | Rnoun)" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp#viessu+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "\-" | grep "\-.*\-" | cut -d "-" -f1,2 >> analnouns
grep ";" $GTHOME/gt/sme/src/noun-sme-lex.txt | grep -v "^\!" | grep -v ShCmp | grep "RHyph" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp-#viessu+N+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep "\-" | cut -d "-" -f1 >> analnouns
sort -u -o nouns nouns 
sort -u -o analnouns analnouns 
comm -23 nouns analnouns > $GTHOME/gt/sme/dev/missingnounLemmas.txt
rm *nouns
open $GTHOME/gt/sme/dev/missingnounLemmas.txt

