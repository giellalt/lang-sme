# A testscript: does the pipeline from fst via disambiguation to functions.cg3 function as it should?

# Analyse the testcorpus:
cat $GTHOME/langs/sme/test/data/inputCGtest.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 | vislcg3 -g $GTHOME/gtcore/gtdshared/smi/src/syntax/korp.cg3 | perl -pe 's/(Allegro|<vdic>|v1|v2|v3|v4|v5|v6|v7|v8|v9|Err\/Sub) //g' | tr -d "#" | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq > $GTHOME/langs/sme/test/data/functionstestoutput

# There should be no difference
diff -w $GTHOME/langs/sme/test/data/functionsCG.corr.txt $GTHOME/langs/sme/test/data/functionstestoutput > $GTHOME/langs/sme/test/data/functionstestresult
see $GTHOME/langs/sme/test/data/functionstestresult


