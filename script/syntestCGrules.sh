# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/gt/sme/corp/testkorpus.txt $GTBIG/gt/sme/corp/divgullkorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/sme-dis.rle | vislcg3 -g $GTHOME/gt/sme/src/smi-syn.rle > $GTHOME/gt/sme/dev/syntestdis


# Fjerner semantiske tagger, # osv:

cat $GTHOME/gt/sme/dev/syntestdis | perl -pe 's/(Sem\/Build\-part|Sem\/Mat|Sem\/Emo|Sem\/Curr|Sem\/Clth\-jewl|Sem\/Obj\-el|Sem\/Obj\-clo|Sem\/Furn|Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Act|Sem\/AniProd|Allegro|v1|v2|v3|v4|v5|v6|v7|v8|<vdic>) //g' | tr -d "#" > $GTHOME/gt/sme/dev/syncleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/syncleantestdis | uniq > $GTHOME/gt/sme/dev/synsortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
cat $GTBIG/gt/sme/corp/correct/testkorpus.dis.corr.txt $GTBIG/gt/sme/corp/correct/divgullkorpus.dis.corr.txt | perl -pe 's/(Sem\/Build\-part|Sem\/Mat|Sem\/Emo|Sem\/Curr|Sem\/Clth\-jewl|Sem\/Obj\-el|Sem\/Obj\-clo|Sem\/Furn|Sem\/Lang|Sem\/Money|Sem\/Ani|Sem\/Body|Sem\/Build|Sem\/Clth|Sem\/Edu|Sem\/Event|Sem\/Fem|Sem\/Food|Sem\/Group|Sem\/Hum|Sem\/Mal|Sem\/Measr|Sem\/Obj|Sem\/Org|Sem\/Plant|Sem\/Plc|Sem\/Route|Sem\/Sur|Sem\/Time|Sem\/Txt|Sem\/Veh|Sem\/Wpn|Sem\/Wthr|Sem\/Mat|Sem\/Semcon|Sem\/Ctain|Sem\/Date|Sem\/Act|Sem\/AniProd|Allegro|v1|v2|v3|v4|v5|v6|v7|v8|<vdic>) //g' | tr -d "#" > $GTHOME/gt/sme/dev/syncleangullkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/syncleangullkorpus.dis.corr.txt | uniq > $GTHOME/gt/sme/dev/synsortedgullkorpus 

diff -w $GTHOME/gt/sme/dev/synsortedgullkorpus $GTHOME/gt/sme/dev/synsortedtestdis > $GTHOME/gt/sme/dev/syntestCG_result.txt

# Antall ulike linjer:
echo "Antall syntagger i gullkorpuset:" > dev/syntestCG.txt
cat $GTHOME/gt/sme/dev/synsortedgullkorpus | grep "@" | wc -l >> dev/syntestCG.txt
echo " " >> dev/syntestCG.txt
echo "Antall analysert annerledes enn gullstandard:" >> dev/syntestCG.txt
cat dev/syntestCG_result.txt | grep '^<' | wc -l >> dev/syntestCG.txt
echo " " >> dev/syntestCG.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> dev/syntestCG.txt
#cat dev/syntestCG_result.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/syntestCG.txt
#echo " " >> dev/syntestCG.txt
#echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> dev/testCG.txt
#cat dev/syntestCG_result.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/syntestCG.txt
cat dev/syntestCG_result.txt | sed 's/ $/¢/' | tr -d "\n" | sed 's/¢-/ /g' | tr "¢" "\n" | grep '\-\-' |sed 's/< / @/' | sed 's/$/ @/' | sed 's/-->/@ /' | cut -d "@" -f1,3,5 | sed 's/@$//' >> dev/syntestCG.txt
#echo "Antall med samme morfologisk analyse, men annen syntag enn gullstandard:" >> dev/syntestCG.txt
#cat dev/syntestCG_result.txt | sed 's/ $/¢/' | tr -d "\n" | sed 's/¢-/ /g' | tr "¢" "\n" | grep '\-\-' | sed 's/ -->//' | tr "\t" "\n" | cut -d "@" -f1 | sed 's/ $//' | uniq | tr "\n" " " | tr "<" "\n" | grep -v '".*".*".*"' | grep '"' | wc -l >> dev/syntestCG.txt
#echo "Antall uten syntag:" >> dev/syntestCG.txt
#cat dev/synsortedtestdis | sed 's/"</¢/' | tr "\n" " " | tr "¢" "\n" | egrep -v '(@|CLB)' | wc -l >> dev/syntestCG.txt
#echo " " >> dev/syntestCG.txt
#echo "Disse har samme morfologisk analyse, men ikke samme syntag" >> dev/syntestCG.txt
#cat dev/syntestCG_result.txt| cut -d "@" -f1 | sed 's/ $/¢/' | tr -d "\n" | sed 's/¢-/ /g' | tr "¢" "\n" |grep '\-\-' |sed 's/ -->//' | tr "\t" "\n" | uniq | sed 's/ $//' | uniq | sed 's/^/€/' | sed 's/€"/"/' | tr "\n" " " | tr "€" "\n" | grep -v '".*".*".*"' >> dev/syntestCG.txt
#echo " " >> dev/syntestCG.txt
#echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> dev/syntestCG.txt
#cat dev/syntestCG_result.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/syntestCG.txt
#echo " " >> dev/syntestCG.txt
#echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> dev/syntestCG.txt
#cat dev/syntestCG_result.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> dev/syntestCG.txt
see dev/syntestCG.txt
#cat dev/testCG_result.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | grep '@' | see


