# Skript for å teste analysen av testkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpuset:
cat $GTBIG/corp/500.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/Nsme-dis.rle > $GTHOME/gt/sme/dev/testdis

# Fjerner semantiske tagger og #:
cat $GTHOME/gt/sme/dev/testdis | perl -pe 's/(Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4) //g' | tr -d "#"  | cut -d "@" -f1 > $GTHOME/gt/sme/dev/cleantest

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantest | uniq > $GTHOME/gt/sme/dev/500sortedtestdis

#cat $GTBIG/gt/sme/corp/correct/testkorpus.dis.corr.txt | perl -pe 's/(Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4) //g' | cut -d "@" -f1 > $GTHOME/gt/sme/dev/cleantestkorpus.dis.corr.txt

# Henter gullstandard, fjerner Allegro-tag og sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTBIG/corp/correct/500.morph.corr.txt | uniq > $GTHOME/gt/sme/dev/sortedtestkorpus 

diff -w $GTHOME/gt/sme/dev/sortedtestkorpus $GTHOME/gt/sme/dev/500sortedtestdis > $GTHOME/gt/sme/dev/500testCG_result.txt

# Antall ulike linjer:
echo "Antall disambiguert annerledes enn gullstandard:" > dev/500testCG.txt
cat dev/500testCG_result.txt | grep '^<' | wc -l >> dev/500testCG.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> dev/500testCG.txt
cat dev/500testCG_result.txt | grep '^>' | wc -l >> dev/500testCG.txt
echo " " >> dev/500testCG.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> dev/500testCG.txt
cat dev/500testCG_result.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/500testCG.txt
echo " " >> dev/500testCG.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> dev/500testCG.txt
cat dev/500testCG_result.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/500testCG.txt
see dev/500testCG.txt


