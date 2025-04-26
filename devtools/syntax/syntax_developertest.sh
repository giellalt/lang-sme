# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpus:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 | vislcg3 -g $GTHOME/shared-smi/src/syntax/functions.cg3 | perl -pe 's/ (Allegro|v\d|Err\/Sub)//g' | tr -d "#" | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq > $GTHOME/langs/sme/test/data/syntaxtestoutput

# Henter gullstandard, fjerner semantiske tagger, # osv :
cat $GTBIG/correct/sme-goldcorpus.syn.corr.txt | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|v\d|Err\/Sub)//g' | perl -pe 's/ <[^>]+>//g' > $GTHOME/langs/sme/test/data/sme-goldcorpus.syn.corr.txt

# Diff
diff -w $GTHOME/langs/sme/test/data/sme-goldcorpus.syn.corr.txt $GTHOME/langs/sme/test/data/syntaxtestoutput > $GTHOME/langs/sme/test/data/testsyntaxresult.txt

# Rapport:
# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > $GTHOME/langs/sme/test/data/syntaxreport.txt
grep '"<' $GTHOME/langs/sme/test/data/sme-goldcorpus.dis.corr.txt | wc -l >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo " " >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo "Antall disambiguert annerledes enn gullstandard:" >> $GTHOME/langs/sme/test/data/syntaxreport.txt
cat $GTHOME/langs/sme/test/data/testsyntaxresult.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> $GTHOME/langs/sme/test/data/syntaxreport.txt
cat $GTHOME/langs/sme/test/data/testsyntaxresult.txt | grep '^>' | wc -l >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo " " >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> $GTHOME/langs/sme/test/data/syntaxreport.txt
cat $GTHOME/langs/sme/test/data/testsyntaxresult.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo " " >> $GTHOME/langs/sme/test/data/syntaxreport.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> $GTHOME/langs/sme/test/data/syntaxreport.txt
cat $GTHOME/langs/sme/test/data/testsyntaxresult.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/syntaxreport.txt
see $GTHOME/langs/sme/test/data/syntaxreport.txt
#cat dev/testCG_result.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | grep '@' | see


