# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 | vislcg3 -g $GTHOME/gtcore/giella-shared/smi/src/syntax/functions.cg3 > $GTHOME/langs/sme/misc/syntestdis


# Fjerner semantiske tagger, # osv:

cat $GTHOME/langs/sme/misc/syntestdis | perl -pe 's/(Allegro|v1|v2|v3|v4|v5|v6|v7|v8|<vdic>) //g' | tr -d "#" > $GTHOME/langs/sme/misc/syncleantestdis

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/langs/sme/misc/syncleantestdis | uniq > $GTHOME/langs/sme/misc/synsortedtestdis

# Henter gullstandarder, fjerner semantiske tagger, # osv :
cat $GTBIG/correct/sme-goldcorpus.syn.corr.txt | perl -pe 's/(Allegro|v1|v2|v3|v4|v5|v6|v7|v8|<vdic>) //g' | tr -d "#" > $GTHOME/langs/sme/misc/syncleangullkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/langs/sme/misc/syncleangullkorpus.dis.corr.txt | uniq > $GTHOME/langs/sme/misc/synsortedgullkorpus 

diff -w $GTHOME/langs/sme/misc/synsortedgullkorpus $GTHOME/langs/sme/misc/synsortedtestdis > $GTHOME/langs/sme/misc/syntestCG_result.txt

# Antall ulike linjer:
echo "Antall syntagger i gullkorpuset:" > $GTHOME/langs/sme/misc/syntestCG.txt
cat $GTHOME/langs/sme/misc/synsortedgullkorpus | grep "@" | wc -l >> $GTHOME/langs/sme/misc/syntestCG.txt
echo " " >> $GTHOME/langs/sme/misc/syntestCG.txt
echo "Antall analysert annerledes enn gullstandard:" >> $GTHOME/langs/sme/misc/syntestCG.txt
cat $GTHOME/langs/sme/misc/syntestCG_result.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/misc/syntestCG.txt
echo " " >> $GTHOME/langs/sme/misc/syntestCG.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> $GTHOME/langs/sme/misc/syntestCG.txt
cat $GTHOME/langs/sme/misc/syntestCG_result.txt | sed 's/ $/¢/' | tr -d "\n" | sed 's/¢-/ /g' | tr "¢" "\n" | grep '\-\-' |sed 's/< / @/' | sed 's/$/ @/' | sed 's/-->/@ /' | cut -d "@" -f1,3,5 | sed 's/@$//' >> $GTHOME/langs/sme/misc/syntestCG.txt
see $GTHOME/langs/sme/misc/syntestCG.txt


