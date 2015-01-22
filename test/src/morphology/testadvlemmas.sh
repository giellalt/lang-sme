# Kommando når man er i sme: sh test/src/morphology/testadvlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i adverbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingadverbLemmas.txt. 

# Hent ut lemmaer, bortsett fra LexSub (som blir filtrert bort fra normgenerator), og lemmaer som som krever Px eller kompareringstagg) . Lemmaene lagres som adverbs
grep ";" $GTHOME/langs/sme/src/morphology/stems/adverbs.lexc | grep -v "^\!" | egrep -v '(LexSub|-comp| LE|-sup |SUP| Px|^adv |^adv-plc)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > adverbs

# Hent ut lemmaer som kompareres (Comp) til adverb. Lagres som compadverbs
grep ";" $GTHOME/langs/sme/src/morphology/stems/adverbs.lexc | grep -v "^\!" | egrep -v '(LexSub| Px|^adv |^adv-plc)' | egrep '(-comp| LE)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" > compadverbs

# Hent ut lemmaer som kompareres (Superl) til adverb. Lagres som supadverbs
grep ";" $GTHOME/langs/sme/src/morphology/stems/adverbs.lexc | grep -v "^\!" | egrep -v '(LexSub| Px|^adv |^adv-plc)' | egrep '(-sup| SUP)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" > supadverbs

# Generer adverbformen av lemmaene i adverbs
cat adverbs | sed 's/$/+Adv/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "Adv+" | grep -v "^$" > anadverbs 

# Generer adverbformen av lemmaene i compadverbs
cat compadverbs | sed 's/$/+Adv+Comp/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "Adv+" | grep -v "^$" >> anadverbs 

# Generer adverbformen av lemmaene i supadverbs
cat supadverbs | sed 's/$/+Adv+Superl/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst | cut -f2 | grep -v "Adv+" | grep -v "^$" >> anadverbs 

# Sorter og unifiser
sort -u -o anadverbs anadverbs

# Alle adverblemmaer samles i ei fil
cat adverbs compadverbs supadverbs | sort -u > alladverbs

# Sammenlikne lista med adverblemmaer med den genererte lista med adverber. Adverblemmaer som ikke er i den genererte lista, kopieres til missingadverbLemmas.txt. Formene generes med  +Adv for enklere debugging. 
comm -23 alladverbs anadverbs | grep -v '^$' | sed 's/$/+Adv/' | $LOOKUP $GTHOME/langs/sme/src/generator-gt-norm.xfst > $GTHOME/langs/sme/test/data/missingadverbLemmas.txt

# Fjerne lister
rm *adverbs

# Åpne fila i see
see $GTHOME/langs/sme/test/data/missingadverbLemmas.txt
