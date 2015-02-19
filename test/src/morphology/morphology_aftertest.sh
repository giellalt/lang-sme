# Skript for å teste den morfologiske analysen av sme-goldcorpus.txt. Testen kjøres i to deler, før og etter endringer av analyser-gt-desc.xfst. Output kjøres via lookup2cg som rensker ut en del. Det må kjøres 'make' før morphology_aftertest.sh kjøres.
# sh test/src/morphology/morphology_beforetest.sh 
# sh test/src/morphology/morphology_aftertest.sh 

# Analyserer testkorpus:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=tools/preprocess/abbr.txt | $LOOKUP src/analyser-gt-desc.xfst | lookup2cg | perl ../../gt/script/sort-cg-cohort.pl | uniq > test/data/morphologytestafter

# Diff
diff -w test/data/morphologytestbefore test/data/morphologytestafter > test/data/morphologytest.txt
see test/data/morphologytest.txt


