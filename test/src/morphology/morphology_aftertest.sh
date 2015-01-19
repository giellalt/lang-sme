# Skript for å teste den disambiguerte analysen av sme-goldcorpus.txt. Testen kjøres i to deler, før og etter endringer av analyser-disamb-gt-desc.xfst. Den må kjøres 'make' før del to kjøres.
# sh test/src/morphology/morphology_beforetest.sh 
# sh test/src/morphology/morphology_aftertest.sh 

# Analyserer testkorpus:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Sub|v\d)//g' | perl -pe 's/ <[^>]+>//g' | tr -d "#" | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq > $GTHOME/langs/sme/test/data/morphologytestafter

# Diff
echo 'diff er' > $GTHOME/langs/sme/test/data/morphologytest.txt
diff -w $GTHOME/langs/sme/test/data/morphologytestbefore $GTHOME/langs/sme/test/data/morphologytestafter >> $GTHOME/langs/sme/test/data/morphologytestdiff.txt
see $GTHOME/langs/sme/test/data/morphologytestdiff.txt


