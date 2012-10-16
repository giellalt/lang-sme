# Dette skriptet tester at nesten alle lemmaene i adj-sme-lex.txt kan genereres. De som ikke kan genereres, kopieres til missingadjLemmas.txt

grep ";" $GTHOME/gt/sme/src/adj-sme-lex.txt | grep -v "^\!" | egrep -v "(LEXICON|ATTR|FINJU|Der|Attr| At |BBO |MUS |BUOREMUSS|OVDDIT |STUORIBUS|BUStem | K | Rreal | R )" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > adjs
cat adjs | sed 's/$/+A+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u > analadjs 
grep ";" $GTHOME/gt/sme/src/adj-sme-lex.txt | grep -v "^\!" | grep -v "+Gen" | egrep "(ATTR|Attr)" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > attradjs
cat attradjs | sed 's/$/+A+Attr/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/gt/sme/src/adj-sme-lex.txt | grep -v "^\!" | grep "BUOREMUSS" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > superladjs
cat superladjs | sed 's/$/+A+Superl+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/gt/sme/src/adj-sme-lex.txt | grep -v "^\!" | grep "(OVDDIT|BBO |BU/MUS|STUORIBUS|BUStem)" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > compladjs
cat compladjs | sed 's/$/+A+Comp+Sg+Nom/' | $LOOKUP $GTHOME/gt/sme/bin/isme.fst | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
cat attradjs compladjs superladjs >> adjs
sort -u -o adjs adjs 
sort -u -o analadjs analadjs 
comm -23 adjs analadjs > missingadjLemmas.txt
#rm *adjs
open missingadjLemmas.txt
