# Skript for å teste analysen av testkorpus.txt og divgullkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpus:
cat $GTBIG/sme-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/disambiguation.cg3 | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Lex|Err\/Orth|v\d)//g' | perl -pe 's/ <[^>]+>//g' | tr -d "#" | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq > $GTHOME/langs/sme/test/data/disambiguationtestoutput

# Henter gullstandard, fjerner semantiske tagger, # osv :
cat $GTBIG/correct/sme-goldcorpus.dis.corr.txt | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Orth|v\d)//g' | perl -pe 's/ <[^>]+>//g' | perl $GTHOME/gt/script/sort-cg-cohort.pl > $GTHOME/langs/sme/test/data/sme-goldcorpus.dis.corr.txt

# Diff
diff -w $GTHOME/langs/sme/test/data/sme-goldcorpus.dis.corr.txt $GTHOME/langs/sme/test/data/disambiguationtestoutput > $GTHOME/langs/sme/test/data/testdisambiguationresult.txt
cat $GTHOME/langs/sme/test/data/sme-goldcorpus.dis.corr.txt |cut -d '@' -f1 | sed 's/ $//' > $GTHOME/langs/sme/test/data/sme-goldcorpus.onlydis.txt
cat $GTHOME/langs/sme/test/data/disambiguationtestoutput |cut -d '@' -f1 | sed 's/ $//' > test/data/test.onlydis.txt
diff -w $GTHOME/langs/sme/test/data/sme-goldcorpus.onlydis.txt $GTHOME/langs/sme/test/data/test.onlydis.txt > $GTHOME/langs/sme/test/data/testonlydisresult.txt

# Rapport:
# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > $GTHOME/langs/sme/test/data/disambiguationreport.txt
grep '"<' $GTHOME/langs/sme/test/data/sme-goldcorpus.dis.corr.txt | wc -l >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo " " >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo "Antall disambiguert annerledes enn gullstandard, bare morfologi:" >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
cat $GTHOME/langs/sme/test/data/testonlydisresult.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo " " >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo "Antall disambiguert annerledes enn gullstandard, inkl. noen syntagger:" >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
cat $GTHOME/langs/sme/test/data/testdisambiguationresult.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo "Antall ikke disambiguert eller uriktig disambiguert:" >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
cat $GTHOME/langs/sme/test/data/testdisambiguationresult.txt | grep '^>' | wc -l >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo " " >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo "Gullstandarden inneholder analyser som ikke finnes i den nye analysen:" >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
cat $GTHOME/langs/sme/test/data/testdisambiguationresult.txt | grep '^<' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo " " >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
echo "Den nye analysen inneholder analyser som ikke finnes i gullstandarden:" >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
cat $GTHOME/langs/sme/test/data/testdisambiguationresult.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/disambiguationreport.txt
see $GTHOME/langs/sme/test/data/disambiguationreport.txt
#cat test/data/testdisambiguationresult.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' |tr "¢" "\n" | grep € | rev | sort | rev | see


