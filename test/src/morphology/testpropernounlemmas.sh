# Kommando når man er i sme: sh test/src/morphology/testpropernounlemmas.sh
# Dette skriptet tester at alle lemmaene i generated_files/smi-sme-propernouns.lexc kan genereres. De som ikke kan genereres, kopieres til missingProperLemmas.txt

grep ";" $GTHOME/langs/sme/src/morphology/generated_files/smi-sme-propernouns.lexc | grep -v "^\!" | egrep -v '(Attr|FirstTag|-atr|LexSub)' | sed 's/% /€/g' | sed 's/%:/¢/g' | sed 's/%!/!/g' | tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > props
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analprops 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "^$" >> analprops 
sort -u -o analprops analprops 
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "N+" |sed 's/+Pl/+Sg/' |$LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst > $GTHOME/langs/sme/test/data/missingProperLemmas.txt
comm -23 props analprops | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst >> $GTHOME/langs/sme/test/data/missingProperLemmas.txt
grep ";" $GTHOME/langs/sme/src/morphology/generated_files/smi-sme-propernouns.lexc | grep -v "^\!" | egrep '(Attr|-atr|FirstTag)' | grep -v 'LexSub' | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " |  sort -u > attrprops
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep "N+" >> $GTHOME/langs/sme/test/data/missingProperLemmas.txt
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 |  grep -v "N+" | grep -v "^$" | sort -u > analattrprops  
comm -23 attrprops analattrprops >> $GTHOME/langs/sme/test/data/missingProperLemmas.txt
rm *props
see $GTHOME/langs/sme/test/data/missingProperLemmas.txt
