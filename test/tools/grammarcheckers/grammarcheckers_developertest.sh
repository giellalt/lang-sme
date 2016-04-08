# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpus:
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/valency.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/disambiguator.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/grammarchecker.cg3 | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Lex|Err\/Orth|v\d)//g' | perl -pe 's/ <[^>]+>//g' | tr -d "#" | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq > $GTHOME/langs/sme/test/data/grammarcheckertestoutput


# Henter gullstandard, fjerner semantiske tagger, # osv :
cat $GTBIG/correct/sme-gram-goldcorpus.gram.corr.txt | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Orth|v\d)//g' | perl -pe 's/ <[^>]+>//g' | perl $GTHOME/gt/script/sort-cg-cohort.pl > $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.corr.txt

# Diff
diff -w $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.corr.txt $GTHOME/langs/sme/test/data/grammarcheckertestoutput > $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.corr.txt |cut -d '@' -f1 | sed 's/ $//' > $GTHOME/langs/sme/test/data/sme-goldcorpus.onlygram.txt
cat $GTHOME/langs/sme/test/data/grammarcheckertestoutput |cut -d '@' -f1 | sed 's/ $//' > test/data/test.onlygram.txt
diff -w $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.onlygram.txt $GTHOME/langs/sme/test/data/test.onlygram.txt > $GTHOME/langs/sme/test/data/testonlygramresult.txt

# Rapport:
# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
grep '"<' $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.corr.txt | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Antall disambiguert annerledes enn gullstandard, bare morfologi:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testonlygramresult.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Antall disambiguert annerledes enn gullstandard, inkl. noen syntagger:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt | grep '^>' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
see $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
#cat test/data/testgrammarcheckerresult.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | rev | sort | rev | see


