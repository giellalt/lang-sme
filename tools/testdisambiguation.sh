# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med analyser-dict-gt-desc.xfst og disambiguation.cg3 opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-dict-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 > $GTHOME/langs/sme/misc/testdis

# Fjerner semantiske tagger, # osv: 
#Ideelt: fjern alle Sem/... til neste whitespace + v1|v2|v3|v4|v5|v6|v7|v8|v9|<vdic>|<sme>| tr -d "#"

cat $GTHOME/gt/sme/dev/testdis | perl -pe 's/ (Sem\/Hum\-abstr|Sem\/DummyTag|Sem\/Year|Sem\/Tool\-catch|Sem\/Tool\-clean|Sem\/Tool\-measr|Sem\/Tool\-music|Sem\/Tool\-write|Sem\/AniProd|Sem\/Ctain-clth|Sem\/Plc\-abstr|Sem\/Plc\-line|Sem\/Plc\-water|Sem\/Plc\-elevate|Sem\/Feat\-psych|Sem\/Substnc|Sem\/Ctain\-abstr|Sem\/Tool|Sem\/Perc\-emo|Sem\/Perc\-phys|Sem\/Process|Sem\/Prod\-audio|Sem\/Prod\-cogn|Sem\/Prod|Sem\/Prod\-ling|Sem\/Prod\-vis|Sem\/Build\-part|Sem\/Mat|Sem\/Emo|Sem\/Curr|Sem\/Body\-abstr|Sem\/Feat\-phys|Sem\/Feat|Sem\/Part|Sem\/Clth\-part|Sem\/State|Sem\/State\-sick|Sem\/Symbol|Sem\/Clth\-jewl|Sem\/Obj\-el|Sem\/Obj\-clo|Sem\/Obj\-surfc|Sem\/Furn|Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Amount|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Food\-med|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plant\-part|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Dir|Sem\/Drink|Sem\/Domain|Sem\/Sign|Sem\/Game|Sem\/Ideol|Sem\/Geom|Sem\/Rule|Sem\/Act|Sem\/Sport|Allegro|v1|v2|v3|v4|v5|v6|v7|v8|v9|<vdic>|<sme>)//g' | tr -d "#" > $GTHOME/langs/sme/misc/cleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/langs/sme/misc/cleantestdis | uniq > $GTHOME/langs/sme/misc/sortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
#Ideelt: fjern alle Sem/... til neste whitespace + v1|v2|v3|v4|v5|v6|v7|v8|v9|<vdic>|<sme>| tr -d "#"
cat $GTBIG/correct/sme-goldcorpus.dis.corr.txt | perl -pe 's/ (Sem\/Hum\-abstr|Sem\/DummyTag|Sem\/Year|Sem\/Ctain-clth|Sem\/Plc\-abstr|Sem\/Plc\-line|Sem\/Plc\-water|Sem\/Plc\-elevate|Sem\/Substnc|Sem\/Tool|Sem\/Tool\-catch|Sem\/Tool\-clean|Sem\/Tool\-measr|Sem\/Tool\-music|Sem\/Tool\-write|Sem\/Feat\-psych|Sem\/Body\-abstr|Sem\/Ctain\-abstr|Sem\/Feat\-phys|Sem\/Feat|Sem\/Part|Sem\/Clth\-part|Sem\/State|Sem\/State\-sick|Sem\/Symbol|Sem\/Perc\-emo|Sem\/Perc\-phys|Sem\/Process|Sem\/Prod\-audio|Sem\/Prod\-cogn|Sem\/Prod|Sem\/Prod\-ling|Sem\/Prod\-vis|Sem\/Build\-part|Sem\/Mat|Sem\/Emo|Sem\/Curr|Sem\/Clth\-jewl|Sem\/Obj\-el|Sem\/Obj\-clo|Sem\/Obj\-surfc|Sem\/Furn|Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Amount|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Food\-med|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plant\-part|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Drink|Sem\/Drink|Sem\/Domain|Sem\/Sign|Sem\/Game|Sem\/Ideol|Sem\/Geom|Sem\/Rule|Sem\/Act|Sem\/Sport|Sem\/AniProd|Allegro|v1|v2|v3|v4|v5|v6|v7|v8|v9|<vdic>|<sme>)//g'  > $GTHOME/langs/sme/misc/cleangullkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/langs/sme/misc/cleangullkorpus.dis.corr.txt | uniq > $GTHOME/langs/sme/misc/sortedgullkorpus 

diff -w $GTHOME/langs/sme/misc/sortedgullkorpus $GTHOME/langs/sme/misc/sortedtestdis > $GTHOME/langs/sme/misc/testCG_result.txt

# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > $GTHOME/langs/sme/src/testCG.txt
grep '"<' $GTHOME/langs/sme/misc/sortedgullkorpus | wc -l >> $GTHOME/langs/sme/src/testCG.txt
echo " " >> $GTHOME/langs/sme/src/testCG.txt
echo "Antall disambiguert annerledes enn gullstandard:" >> $GTHOME/langs/sme/src/testCG.txt
cat $GTHOME/langs/sme/misc/testCG_result.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/src/testCG.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> $GTHOME/langs/sme/src/testCG.txt
cat $GTHOME/langs/sme/misc/testCG_result.txt | grep '^>' | wc -l >> $GTHOME/langs/sme/src/testCG.txt
echo " " >> $GTHOME/langs/sme/src/testCG.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> $GTHOME/langs/sme/src/testCG.txt
cat $GTHOME/langs/sme/src/testCG_result.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/src/testCG.txt
echo " " >> $GTHOME/langs/sme/src/testCG.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> $GTHOME/langs/sme/src/testCG.txt
cat dev/testCG_result.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/src/testCG.txt
see $GTHOME/langs/sme/src/testCG.txt

#Her er en annen nyttig sak:
#cat $GTHOME/langs/sme/misc/testCG_result.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | grep '@' | see


