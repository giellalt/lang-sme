# Skript for å teste analysen av sme-gram-goldcorpus.txt med grammarchecker.cg3 opp mot gullversjon.
# sh test/tools/grammarcheckers/grammarcheckers_developertest.sh

# Analyserer testkorpus:

#cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/valency.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/disambiguator.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/grammarchecker.cg3 | perl -pe 's/ (Sem\/[^\s]+|Use\/[^\s]+|Allegro|Err\/Lex|Err\/Orth|v\d)//g' | perl -pe 's/ <[^>]+>//g' | perl -pe 's/\<[A-Z]*[a-z|-].*\>\d//g' | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/ \N{U+00A7}[A-Z][A-Z]* / /g' | perl -pe 's/[A-Z].* @[\<|\>|\+|\-|A-Z][A-Z|a-z|\-|\<]*[\<|\>|A-Z] / /g' | perl -pe 's/[A-Z][0-9]//g' | tr -d "#" | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq > $GTHOME/langs/sme/test/data/grammarcheckertestoutput

# take away everything but lemma, form and error detection tags, and put several lines of a cohort onto one line
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/valency.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/disambiguator.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/grammarchecker.cg3 | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/" /"& /g' | cut -d"&" -f1,3 | perl -pe 's/"&/" &/g' | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq | sed 's/$/#/g' | perl -p -i -e 's/"</\n"</g' | perl -p -i -e 's/#\n/ /g' | perl -pe 's/  / /g'  > $GTHOME/langs/sme/test/data/grammarcheckertestoutput

# take away everything also lemma except for error annotated forms, and put several lines of a cohort onto one line,
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/valency.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/disambiguator.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/grammarchecker.cg3 | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/" /"& /g' | cut -d"&" -f1,3 | perl -pe 's/"&/" &/g' | grep -E "<|&" | sed 's/$/#/g' | perl -p -i -e 's/"</\n"</g' | perl -p -i -e 's/#\n/ /g'   > $GTHOME/langs/sme/test/data/grammarcheckertestoutputwithoutlemma


# Henter gullstandard, take away everything but lemma, form and error detection tags, and put several lines of a cohort onto one line :
cat $GTHOME/langs/sme/test/data/correct/sme-gram-goldcorpus.gram.corr.txt | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/" /"& /g' | cut -d"&" -f1,3 | perl -pe 's/"&/" &/g' | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq | sed 's/$/#/g' | perl -p -i -e 's/"</\n"</g' | perl -p -i -e 's/#\n/ /g' | perl -pe 's/  / /g' > $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt


# Diff
diff -w $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt $GTHOME/langs/sme/test/data/grammarcheckertestoutput > $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.corr.txt | cut -d '&' -f1 | sed 's/ $//' > $GTHOME/langs/sme/test/data/sme-goldcorpus.onlygram.txt
cat $GTHOME/langs/sme/test/data/grammarcheckertestoutput | cut -d '&' -f1 | sed 's/ $//' > test/data/test.onlygram.txt
diff -w $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.onlygram.txt $GTHOME/langs/sme/test/data/test.onlygram.txt > $GTHOME/langs/sme/test/data/testonlygramresult.txt

# Rapport:
# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
grep '"<' $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Antall anna feilanalyse enn gullstandard, bare grammatikkontroll:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testonlygramresult.txt | grep '^<' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo "Antall anna feilanalyse enn gullstandard, inkl. noen syntagger:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
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


