# Kommando når man er i sme: sh test/src/morphology/testadposlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i adpositions.lexc kan genereres. De som ikke kan genereres, kopieres til missingadposLemmas.txt. 


# Hent ut lemmaer, bortsett fra Err/Lex (som blir filtrert bort fra normgenerator) . Lemmaene lagres som adpos
grep ";" src/morphology/stems/adpositions.lexc | egrep -v "^(\!|\+)" | egrep -v '\+Err\/Lex' |sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > adpos

# Generer lemmaer med +Po
cat adpos | sed 's/$/+Po/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "+Po" | grep -v "^$" > anadpos 

# Generer med +Pr for lemmaer som ikke lar seg genereres +Po
cat adpos | sed 's/$/+Po/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep '+Po' |sed 's/+Po/+Pr/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "+Pr" | grep -v "^$" >> anadpos 

# Sorter og unifiser
sort -u -o anadpos anadpos

# Sammenlikne lista med adposlemmaer med den genererte lista
comm -23 adpos anadpos > test/data/missingadposLemmas.txt 

# Fjerne filer
rm *adpos

# Åpne fila i see
see test/data/missingadposLemmas.txt
