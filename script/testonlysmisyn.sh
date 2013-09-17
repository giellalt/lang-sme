# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Legger til syntagger til gullkorpuset :
cat $GTBIG/gt/sme/corp/correct/testkorpus.N.corr.txt | vislcg3 -g $GTHOME/gt/sme/src/smi-syn.rle > $GTHOME/gt/sme/dev/syntestdis

# Fjerner semantiske tagger, # osv:

cat $GTHOME/gt/sme/dev/syntestdis | perl -pe 's/(Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Act|Allegro|v1|v2|v3|v4|<vdic>) //g' | tr -d "#" > $GTHOME/gt/sme/dev/syncleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/syncleantestdis | uniq > $GTHOME/gt/sme/dev/synsortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
cat $GTBIG/gt/sme/corp/correct/testkorpus.dis.corr.txt | perl -pe 's/(Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Act|Allegro|v1|v2|v3|v4|<vdic>) //g'  > $GTHOME/gt/sme/dev/syncleangullkorpus.dis.corr.txt

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


