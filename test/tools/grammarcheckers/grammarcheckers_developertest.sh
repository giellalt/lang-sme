# Skript for å teste analysen av sme-gram-goldcorpus.txt med grammarchecker.cg3 opp mot gullversjon som er basert på versjon r132198 av grammarchecker.cg3, versjon r131257 av disambiguator.cg3 og versjon r131758 av valency.cg3.
# sh $GTHOME/langs/sme/test/tools/grammarcheckers/grammarcheckers_developertest.sh

# Analyserer testkorpus:
# take away everything but lemma, form and error detection tags, and put several lines of a cohort onto one line
#cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/valency.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/disambiguator.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/grammarchecker.cg3 | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/" /"& /g' | cut -d"&" -f1,3 | perl -pe 's/"&/" &/g' | perl $GTHOME/gt/script/sort-cg-cohort.pl | uniq | sed 's/$/#/g' | perl -p -e 's/"</\n"</g' | perl -p -e 's/#\n/ /g' | perl -pe 's/  / /g'  > $GTHOME/langs/sme/test/data/grammarcheckertestoutput

# take away everything also lemma except for error annotated forms, and put several lines of a cohort onto one line,
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | preprocess --abbr=$GTHOME/langs/sme/tools/preprocess/abbr.txt | $LOOKUP $GTHOME/langs/sme/src/analyser-disamb-gt-desc.xfst | lookup2cg | vislcg3 -g $GTHOME/langs/sme/src/syntax/valency.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/disambiguator.cg3 | vislcg3 -g $GTHOME/langs/sme/tools/grammarcheckers/grammarchecker.cg3 | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/" /"& /g' | cut -d"&" -f1,3 | perl -pe 's/"&/" &/g' | grep -E "<|&" | uniq | sed 's/$/#/g' | perl -p -e 's/"</\n"</g' | perl -p -e 's/#\n/ /g' > $GTHOME/langs/sme/test/data/grammarcheckertestoutput


# Henter gullstandard, take away everything also lemma, except for error annotated forms, and put several lines of a cohort onto one line :
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.corr.txt | perl -pe 's/\#[0-9]*-\>[0-9]*//g' | perl -pe 's/" /"& /g' | cut -d"&" -f1,3 | perl -pe 's/"&/" &/g' | grep -E "<|&" | uniq | sed 's/$/#/g' | perl -p -e 's/"</\n"</g' | perl -p -e 's/#\n/ /g' > $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt


# Diff
diff -w $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt $GTHOME/langs/sme/test/data/grammarcheckertestoutput > $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt

cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt | sed 's/$/¢/' |sed 's/---¢/€/' | tr "\n" " " | sed 's/¢ €/€/g' | perl -pe 's/¢/\n/g' | grep € | rev | sort | rev > $GTHOME/langs/sme/test/data/testgrammarcheckerresult-oneline.txt

#cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt | cut -d '&' -f1 | sed 's/ $//' > $GTHOME/langs/sme/test/data/sme-goldcorpus.onlygram.txt
#
#cat $GTHOME/langs/sme/test/data/grammarcheckertestoutput | cut -d '&' -f1 | sed 's/ $//' > test/data/test.onlygram.txt
#
#diff -w $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.onlygram.txt $GTHOME/langs/sme/test/data/test.onlygram.txt > $GTHOME/langs/sme/test/data/testonlygramresult.txt

# Rapport:
# Antall ulike linjer:
echo "Antall ord i gullkorpuset:" > $GTHOME/langs/sme/test/data/grammarcheckerreport.txt

grep '"<' $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt

echo "Antall setninger i gullkorpuset:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt

cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.txt | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt


echo "Antall anna feilanalyse enn gullstandard:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt| grep "\-\-\-" | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #empty line


echo "Antall potentielle falske negativer (dvs. feilanalyse i gullstandard men ikkje i testanalysen):" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult-oneline.txt | grep '\&.*€' |  grep -v '€ > .* \&' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #empty line

echo "Antall potentielle falske positiver (dvs. ingen feilanalyse i gullstandard men i testanalysen):" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult-oneline.txt | grep -v '\&.*€' |  grep '€ > .* \&' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #empty line

echo "Antall forskjellige feiltagger i gullkorpus og i testanalysen:" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult-oneline.txt | grep  '\&.*€' |  grep '€ > .* \&' | wc -l >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #empty line

echo "Forskjellige feiltagger og antall (inkludert flere feiltagger per lemma etc.) :" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult-oneline.txt |  perl -p -e 's/ /\n/g' | grep '\&' | grep -v '&SUGGEST' | sort | uniq -c | sort -r >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #empty line

#cat $GTHOME/langs/sme/test/data/testgrammarcheckerresult.txt | grep '^>' | perl -pe 's/(TV|IV|G3|V\*|V\*\*) //' | cut -d '"' -f3 | rev | awk -F' ' '{print $1" "$2}' | rev | sort | uniq -c | sort -nr >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
#see $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
#--- which of each, statistics

echo "De 30 mest frekvente feiltagga :" >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
cat $GTHOME/langs/sme/test/data/sme-gram-goldcorpus.gram.only.corr.txt | grep '&[^ ]*' -o | sort | uniq -c | sort -nr | grep -v "&SUGGEST" | head -30 >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt
echo " " >> $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #empty line
see $GTHOME/langs/sme/test/data/grammarcheckerreport.txt #open output in see


# things that need to be fixed:
# i.e. order of tags shouldn't be of importance:
# 236c236
# < "<virggiin>" 	"viergi" &syn-case-congruence-loc-part2  	"virgi" &syn-case-congruence-loc-part2  	"viergi" &syn-case-congruence-loc-part2  	"virgi" &syn-case-congruence-loc-part2  	"viergi" &SUGGEST  	"virgi" &SUGGEST  	"viergi" &SUGGEST  	"virgi" &SUGGEST  
# ---
# > "<virggiin>" 	"virgi" &syn-case-congruence-loc-part2  	"viergi" &syn-case-congruence-loc-part2  	"virgi" &SUGGEST  	"viergi" &SUGGEST  
# 244c244
