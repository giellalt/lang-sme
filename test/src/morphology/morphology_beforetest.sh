# Skript for å teste den disambiguerte analysen av sme-goldcorpus.txt. Testen kjøres i to deler, før og etter endringer av analyser-disamb-gt-desc.xfst. Det må kjøres 'make' før morphology_aftertest.sh kjøres.
# sh test/src/morphology/morphology_beforetest.sh 
# sh test/src/morphology/morphology_aftertest.sh 

# Analyserer testkorpus:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=tools/preprocess/abbr.txt | $LOOKUP src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g src/syntax/disambiguation.cg3 | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Sub|v\d)//g' | perl -pe 's/ <[^>]+>//g' | tr -d "#" | perl ../../gt/script/sort-cg-cohort.pl | uniq > test/data/morphologytestbefore


