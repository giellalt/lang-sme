# Kommando når man er i sme: sh test/src/morphology/testpropernounlemmas.sh
# Dette skriptet tester at alle lemmaene i generated_files/smi-sme-propernouns.lexc kan genereres. De som ikke kan genereres, kopieres til missingProperLemmas.txt

# Hent ut lemmaer fra den genererte fila smi-sme-propernouns.lexc, bortsett fra utkommmenterte (^\!),  dem som krever +Attr tag og hardkoding for spesielle former (Attr|FirstTag|-atr|),  Err/Lex (som blir filtrert bort fra normgenerator). Lemmaene lagres som props
grep ";" src/morphology/generated_files/smi-sme-propernouns.lexc | grep -v "^\!" | egrep -v '(Attr|FirstTag|-atr|\+Err\/Lex)' | sed 's/% /€/g' | sed 's/%:/¢/g' | sed 's/%!/!/g' | tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " | tr "¢" ":" | sort -u > props

# Generer grunnformen av props, med +N+Prop+Sg+Nom, fjern dem som ikke lar seg generere (de har N+ i output), lagres som analprops
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "N+" | grep -v "^$" | sort -u > analprops 

# Generer grunnformen med +N+Prop+Pl+Nom, av props som ikke lar seg generere med +N+Prop+Sg+Nom, lagres i analprops
cat props | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep "N+" | cut -d "+" -f1 | sed 's/$/+N+Prop+Pl+Nom/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep -v "^$" >> analprops 

# Sorter, unifiser analprops
sort -u -o analprops analprops 

# Sammenlikne: Former som er i lemmalista med ikke i lista med genererte former, lagre i missingProperLemmas.txt. Formene generes med  +N+Prop+Sg+Nom for enklere debugging.
comm -23 props analprops | sed 's/$/+N+Prop+Sg+Nom/' | $LOOKUP src/generator-gt-norm.xfst > test/data/missingProperLemmas.txt


# Hent ut lemmaer som krever +Attr for å genereres. Lagres som attrprops
grep ";" src/morphology/generated_files/smi-sme-propernouns.lexc | grep -v "^\!" | egrep '(Attr|-atr|FirstTag)' | grep -v '\+Err\/Lex' | sed 's/% /€/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "%" | tr "€" " " |  sort -u > attrprops

# Generer attrprops med +N+Prop+Attr, lagre dem som ikke lar seg generere (de har N+ i output) i missingProperLemmas.txt
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 | grep "N+" >> test/data/missingProperLemmas.txt

# Generer attrprops med +N+Prop+Attr, lagre formene i analattrprops
cat attrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP src/generator-gt-norm.xfst | cut -f2 |  grep -v "N+" | grep -v "^$" | sort -u > analattrprops  

# Sammenlikne: Former som er i lemmalista med ikke i lista med genererte former, lagre i missingProperLemmas.txt. Formene generes med  +N+Prop+Attr for enklere debugging.
comm -23 attrprops analattrprops | sed 's/$/+N+Prop+Attr/' | $LOOKUP src/generator-gt-norm.xfst >> test/data/missingProperLemmas.txt

# Fjerne lister
rm *props

# Åpne fila i see
see test/data/missingProperLemmas.txt
