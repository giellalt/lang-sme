# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTHOME/langs/sme/test/data/inputCGtest.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 | vislcg3 -g $GTHOME/gtcore/gtdshared/smi/src/syntax/functions.cg3 > $GTHOME/langs/sme/test/data/functionstestoutput


# Fjerner semantiske tagger, # osv:

cat $GTHOME/langs/sme/test/data/functionstestoutput | perl -pe 's/(Allegro|<vdic>|v1|v2|v3|v4|v5|v6|v7|v8|v9) //g' | tr -d "#" > $GTHOME/langs/sme/test/data/cleanfunctionstestoutput
# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/langs/sme/test/data/cleanfunctionstestoutput | uniq > $GTHOME/langs/sme/test/data/sortedfunctionstestoutput


diff -w $GTHOME/langs/sme/test/data/functionCG.corr.txt $GTHOME/langs/sme/test/data/sortedfunctionstestoutput > $GTHOME/langs/sme/test/data/functionstestresult
see $GTHOME/langs/sme/test/data/functionstestresult


