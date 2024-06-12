# Kommando når man er i sme: sh test/src/morphology/testverblemmas.sh
# Dette skriptet tester at nesten alle lemmaene i verbs.lexc kan genereres. De som ikke kan genereres, kopieres til missingverbLemmas.txt. 

# Hent ut lemmaer, bortsett fra utkommmenterte (^\!),  dem med hardkoding for spesielle former (STRAYFORMS|ENDLEX), eller negasjonsverbet (+Neg, som ikke har infinitivform), Err/Lex (som blir filtrert bort fra normgenerator). Lemmaene lagres som verbs
grep ";" src/morphology/stems/verbs.lexc | grep -v "^\!" | egrep -v '(STRAYFORMS|ENDLEX|\+Err\/Lex|\+Neg)' | tr ":+" " " | cut -d " " -f1 | tr -d "%" | sort -u > verbs

# Generer infitivsformen av verblemmaene, fjern dem som ikke gir analyse (de har V+ i output), lagres som analverbs
sed 's/$/+V+Inf/' verbs | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "V+" | grep -v "^$" | sort -u > analverbs 

# Sammenlikne lista med verblemmaer med den genererte lista med infinitivsformer. Formene som er i verblemmalista, men ikke i den genererte lista, kopieres til missingverbLemmas.txt. Formene generes med  +V+Inf for lettere debugging.
comm -23 verbs analverbs | grep -v '^$' | sed 's/$/+V+Inf/' | $LOOKUP src/generator-gt-norm.xfst > test/data/missingverbLemmas.txt

# Fjerne lister
rm *verbs

# Åpne fila i see
see test/data/missingverbLemmas.txt
