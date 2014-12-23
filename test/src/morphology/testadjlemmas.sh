# Kommando når man er i sme: sh test/src/morphology/testadjlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i adjectives.lexc kan genereres. De som ikke kan genereres, kopieres til missingadjLemmas.txt

#grep ";" $GTHOME/gt/sme/src/adj-sme-lex.txt | grep -v "^\!" | egrep -v "(LEXICON|ATTR|FINJU|Der|Attr| At |BBO |MUS |BUOREMUSS|OVDDIT |STUORIBUS|BUStem | K | Rreal | R )" | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > adjs
grep ";" $GTHOME/langs/sme/src/morphology/stems/adjectives.lexc | grep -v "^\!" | egrep -v "(LEXICON|ATTR|FINJU|Der|Attr| At |BBO |MUS |BUOREMUSS|OVDDIT |STUORIBUS|BUStem | K | Rreal | R |LexSub)" | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > adjs
cat adjs | sed 's/$/+A+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u > analadjs 
grep ";" $GTHOME/langs/sme/src/morphology/stems/adjectives.lexc | grep -v "^\!" | grep -v "+Gen" | grep -v LexSub | grep "_PL " | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > pluradjs
cat pluradjs | sed 's/$/+A+Pl+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/langs/sme/src/morphology/stems/adjectives.lexc | grep -v "^\!" | grep -v "+Gen" | grep -v LexSub | egrep "(ATTR|Attr)" | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > attradjs
cat attradjs | sed 's/$/+A+Attr/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/langs/sme/src/morphology/stems/adjectives.lexc | grep -v "^\!" | grep "BUOREMUSS" | grep -v LexSub | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > superladjs
cat superladjs | sed 's/$/+A+Superl+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/langs/sme/src/morphology/stems/adjectives.lexc | grep -v "^\!" | egrep "(OVDDIT|BBO |BU/MUS|EABBO/EAMOS|STUORIBUS|BUStem)" | grep -v LexSub | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > compladjs
cat compladjs | sed 's/$/+A+Comp+Sg+Nom/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
cat attradjs compladjs superladjs >> adjs
sort -u -o adjs adjs 
sort -u -o analadjs analadjs 
comm -23 adjs analadjs > $GTHOME/langs/sme/test/data/missingadjLemmas.txt
rm *adjs
see $GTHOME/langs/sme/test/data/missingadjLemmas.txt
