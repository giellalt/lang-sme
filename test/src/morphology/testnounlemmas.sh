# Kommando når man er i sme: sh test/src/morphology/testnounlemmas.sh
# Dette skriptet tester at nesten alle lemmaene i nouns.lexc kan genereres. De som ikke kan genereres, kopieres til missingnounLemmas.txt

# Hent ut lemmaer fra den nouns.lexc, bortsett fra utkommmenterte (^\!),  dem som krever sammensetning (CmpN/Only|ShCmp|RCmpnd| Rreal | R | Rnoun) ,  Err/Lex (som blir filtrert bort fra normgenerator). Lemmaene lagres som nouns
grep ";" src/morphology/stems/nouns.lexc | egrep -v "^(\!|\@|<)" | egrep -v '(CmpN/Only|ShCmp|RCmpnd| R|\+V\+|\+Err\/Lex|CmpSub|HyphSub|NOT-TO-LEMMATEST)' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > nouns

# Legg substantivet viessu til lemmaer som krever sammensetning, lagres i nouns
grep ";" src/morphology/stems/nouns.lexc | egrep -v "^(\!|\@|<)"  | egrep -v '(ShCmp|\+Err\/Lex|CmpSub|HyphSub|NOT-TO-LEMMATEST)' |  egrep "(Rreal | Rnoun)" | tr ":+" " " | cut -d " " -f1 | sed 's/$/viessu/' >> nouns

# Generer lemmaer i nouns med +N+Sg+Nom, lagre i analnouns
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analnouns 

# Generer plurale lemmaer i nouns med +N+Pl+Nom (som ikke lar seg generer med +N+Sg+Nom). Lagre i analnouns
cat nouns | sed 's/$/+N+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Pl+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "^$" >> analnouns 

# Hent ut lemmaer fra nouns.lexc som krever sammensetning (Rreal | R | Rnoun), legg til +N+Cmp#viessu+N+Sg+Nom og generer. Lagre i analnouns.
grep ";" src/morphology/stems/nouns.lexc | egrep -v "^(\!|\@|<)"  | egrep -v '(ShCmp|\+Err\/Lex|CmpSub|HyphSub|NOT-TO-LEMMATEST)' | egrep "(Rreal | Rnoun)" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp#viessu+N+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v '^$' >> analnouns

# Hent ut lemmaer fra nouns.lexc som krever sammensetning med bindestrek (RHyph), legg til +N+Cmp-#viessu+N+Sg+Nom og generer. Lagre i analnouns.
grep ";" src/morphology/stems/nouns.lexc | egrep -v "^(\!|\@|<)" | grep -v '(ShCmp|\+Err\/Lex|CmpSub|HyphSub|NOT-TO-LEMMATEST)' | grep "RHyph" | tr ":+" " " | cut -d " " -f1 | sed 's/$/+N+Cmp-#viessu+N+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep "\-" | cut -d "-" -f1 >> analnouns

# Sorter, unifiser
sort -u -o nouns nouns 
sort -u -o analnouns analnouns 

# Sammenlikne: Former som er i lemmalista med ikke i lista med genererte former, lagre i missingnounLemmas.txt. Formene generes med  +N+Sg+Nom for enklere debugging.
comm -23 nouns analnouns | grep -v '^$' | sed 's/$/+N+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst > test/data/missingnounLemmas.txt

# Fjerne lister
rm *nouns 

# Åpne fila i see
see test/data/missingnounLemmas.txt

