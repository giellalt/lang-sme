# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/sme-dis.rle > $GTHOME/gt/sme/dev/testdis

# Fjerner semantiske tagger, # osv:

cat $GTHOME/gt/sme/dev/testdis | perl -pe 's/ (Sem\/Hum\-abstr|Sem\/DummyTag|Sem\/Year|Sem\/Tool\-catch|Sem\/Tool\-clean|Sem\/Tool\-measr|Sem\/Tool\-music|Sem\/Tool\-write|Sem\/AniProd|Sem\/Ctain-clth|Sem\/Plc\-abstr|Sem\/Plc\-line|Sem\/Plc\-water|Sem\/Plc\-elevate|Sem\/Feat\-psych|Sem\/Substnc|Sem\/Ctain\-abstr|Sem\/Tool|Sem\/Perc\-emo|Sem\/Perc\-phys|Sem\/Process|Sem\/Prod\-audio|Sem\/Prod\-cogn|Sem\/Prod|Sem\/Prod\-ling|Sem\/Prod\-vis|Sem\/Build\-part|Sem\/Mat|Sem\/Emo|Sem\/Curr|Sem\/Body\-abstr|Sem\/Feat\-phys|Sem\/Feat|Sem\/Part|Sem\/Clth\-part|Sem\/State|Sem\/State\-sick|Sem\/Symbol|Sem\/Clth\-jewl|Sem\/Obj\-el|Sem\/Obj\-clo|Sem\/Obj\-surfc|Sem\/Furn|Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Amount|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Food\-med|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plant\-part|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Dir|Sem\/Drink|Sem\/Domain|Sem\/Sign|Sem\/Game|Sem\/Ideol|Sem\/Geom|Sem\/Rule|Sem\/Act|Sem\/Sport|Allegro|v1|v2|v3|v4|v5|v6|v7|v8|v9|<vdic>|<sme>)//g' | tr -d "#" > $GTHOME/gt/sme/dev/cleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantestdis | uniq > $GTHOME/gt/sme/dev/sortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
cat $GTBIG/correct/sme-goldcorpus.dis.corr.txt | perl -pe 's/ (Sem\/Hum\-abstr|Sem\/DummyTag|Sem\/Year|Sem\/Ctain-clth|Sem\/Plc\-abstr|Sem\/Plc\-line|Sem\/Plc\-water|Sem\/Plc\-elevate|Sem\/Substnc|Sem\/Tool|Sem\/Tool\-catch|Sem\/Tool\-clean|Sem\/Tool\-measr|Sem\/Tool\-music|Sem\/Tool\-write|Sem\/Feat\-psych|Sem\/Body\-abstr|Sem\/Ctain\-abstr|Sem\/Feat\-phys|Sem\/Feat|Sem\/Part|Sem\/Clth\-part|Sem\/State|Sem\/State\-sick|Sem\/Symbol|Sem\/Perc\-emo|Sem\/Perc\-phys|Sem\/Process|Sem\/Prod\-audio|Sem\/Prod\-cogn|Sem\/Prod|Sem\/Prod\-ling|Sem\/Prod\-vis|Sem\/Build\-part|Sem\/Mat|Sem\/Emo|Sem\/Curr|Sem\/Clth\-jewl|Sem\/Obj\-el|Sem\/Obj\-clo|Sem\/Obj\-surfc|Sem\/Furn|Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Amount|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Food\-med|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plant\-part|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Drink|Sem\/Drink|Sem\/Domain|Sem\/Sign|Sem\/Game|Sem\/Ideol|Sem\/Geom|Sem\/Rule|Sem\/Act|Sem\/Sport|Sem\/AniProd|Allegro|v1|v2|v3|v4|v5|v6|v7|v8|v9|<vdic>|<sme>)//g'  > $GTHOME/gt/sme/dev/cleangullkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleangullkorpus.dis.corr.txt | uniq > $GTHOME/gt/sme/dev/sortedgullkorpus 

diff -w $GTHOME/gt/sme/dev/sortedgullkorpus $GTHOME/gt/sme/dev/sortedtestdis > $GTHOME/gt/sme/dev/testCG_result.txt

# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > dev/testCG.txt
grep '"<' dev/sortedgullkorpus | wc -l >> dev/testCG.txt
echo " " >> dev/testCG.txt
echo "Antall disambiguert annerledes enn gullstandard:" >> dev/testCG.txt
cat dev/testCG_result.txt | grep '^<' | wc -l >> dev/testCG.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> dev/testCG.txt
cat dev/testCG_result.txt | grep '^>' | wc -l >> dev/testCG.txt
echo " " >> dev/testCG.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> dev/testCG.txt
cat dev/testCG_result.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/testCG.txt
echo " " >> dev/testCG.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> dev/testCG.txt
cat dev/testCG_result.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/testCG.txt
see dev/testCG.txt
#cat dev/testCG_result.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | grep '@' | see


