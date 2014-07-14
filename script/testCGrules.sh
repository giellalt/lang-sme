# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/sme-dis.rle > $GTHOME/gt/sme/dev/testdis

# Fjerner semantiske tagger, # osv:
cat $GTHOME/gt/sme/dev/testdis | perl -pe 's/(Sem\/[^\s]+|Use\/[^\s]+|Allegro|v\d) //g' \
| perl -pe 's/ <[^>]+>//g' | tr -d "#" > $GTHOME/gt/sme/dev/cleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantestdis | uniq > $GTHOME/gt/sme/dev/sortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
cat $GTBIG/correct/sme-goldcorpus.dis.corr.txt | perl -pe 's/(Sem\/[^\s]+|Use\/[^\s]+|Allegro|v\d) //g' \
| perl -pe 's/ <[^>]+>//g' > $GTHOME/gt/sme/dev/cleangullkorpus.dis.corr.txt

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


