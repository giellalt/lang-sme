# Kommando når man er i sme: sh test/src/morphology/testadvlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i adverbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingadverbLemmas.txt. 

# Hent ut lemmaer, bortsett fra Err/Lex (som blir filtrert bort fra normgenerator), og lemmaer som som krever Px. Lemmaene lagres som adverbs
grep ";" src/morphology/stems/adverbs.lexc | egrep -v "^(\!|\@|<|\()" | egrep -v '(\+Err\/Lex| Px|NOTLEMMA)' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > adverbs

# Generer adverbformen av lemmaene i adverbs
sed 's/$/+Adv/' adverbs | $LOOKUP src/generator-gt-norm.xfst | grep -v "\?" | cut -f2  | grep -v "^$" | sort -u > anadverbs 

# Sammenlikne lista med adverblemmaer med den genererte lista med adverber. Adverblemmaer som ikke er i den genererte lista, kopieres til missingadverbLemmas.txt. Formene generes med  +Adv for enklere debugging. 
comm -23 adverbs anadverbs | grep -v '^$' | sed 's/$/+Adv/' | $LOOKUP src/generator-gt-norm.xfst > test/data/missingadverbLemmas.txt

# Fjerne lister
rm *adverbs

# Åpne fila i see
see test/data/missingadverbLemmas.txt
