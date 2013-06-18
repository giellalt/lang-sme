# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/gt/sme/corp/testkorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/sme-dis.rle | vislcg3 -g $GTHOME/gt/sme/src/smi-syn.rle > $GTHOME/gt/sme/dev/syntestdis

# Fjerner semantiske tagger, # osv:

cat $GTHOME/gt/sme/dev/syntestdis | perl -pe 's/(Lang|Money|Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4|<vdic>|Date) //g' | sed 's/ Act / /' | tr -d "#" > $GTHOME/gt/sme/dev/syncleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/syncleantestdis | uniq > $GTHOME/gt/sme/dev/synsortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
cat $GTBIG/gt/sme/corp/correct/testkorpus.dis.corr.txt | perl -pe 's/(Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4|<vdic>|Date) //g' | sed 's/ Act / /'  > $GTHOME/gt/sme/dev/syncleangullkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/syncleangullkorpus.dis.corr.txt | uniq > $GTHOME/gt/sme/dev/synsortedgullkorpus 

diff -w $GTHOME/gt/sme/dev/synsortedgullkorpus $GTHOME/gt/sme/dev/synsortedtestdis > $GTHOME/gt/sme/dev/syntestCG_result.txt

# Antall ulike linjer:
echo "Antall disambiguert annerledes enn gullstandard:" > dev/syntestCG.txt
cat dev/syntestCG_result.txt | grep '^<' | wc -l >> dev/syntestCG.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> dev/syntestCG.txt
cat dev/syntestCG_result.txt | grep '^>' | wc -l >> dev/syntestCG.txt
echo " " >> dev/syntestCG.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> dev/syntestCG.txt
cat dev/syntestCG_result.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/syntestCG.txt
echo " " >> dev/syntestCG.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> dev/syntestCG.txt
cat dev/syntestCG_result.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/syntestCG.txt
see dev/syntestCG.txt
#cat dev/testCG_result.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | grep '@' | see


