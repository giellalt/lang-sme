# Kommando når man er i sme: sh test/src/morphology/testadposlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i adpositions.lexc kan genereres. De som ikke kan genereres, kopieres til missingadposLemmas.txt. 

grep ";" $GTHOME/langs/sme/src/morphology/stems/adpositions.lexc | egrep -v "^(\!|\+)" | egrep -v '(LexSub)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > adpos
cat adpos | sed 's/$/+Po/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "+Po" | grep -v "^$" > anadpos 
cat adpos | sed 's/$/+Po/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep '+Po' |sed 's/+Po/+Pr/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "+Pr" | grep -v "^$" >> anadpos 
sort -u -o anadpos anadpos
comm -23 adpos anadpos > $GTHOME/langs/sme/test/data/missingadposLemmas.txt
rm *adpos
see $GTHOME/langs/sme/test/data/missingadposLemmas.txt
