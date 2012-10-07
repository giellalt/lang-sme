# Skript for å teste analysen av testkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpuset:
cat ~/biggies/gt/sme/corp/testkorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/sme-dis.rle > $GTHOME/gt/sme/dev/testdis

# Fjerner semantiske tagger og #:
cat $GTHOME/gt/sme/dev/testdis | sed 's/Group //' |  sed 's/Time //' |  sed 's/Hum //' |  sed 's/Org N/N/' |  sed 's/Obj N/N/' | sed 's/Build //' | sed 's/Clth //' | sed 's/Wthr //' | sed 's/Food //' | sed 's/Body //' | sed 's/Event //' | sed 's/Org //' | sed 's/Obj //' | sed 's/Ani //' |  sed 's/Plc //' |  sed 's/Veh //' |  sed 's/Txt //' | sed 's/Route //' | sed 's/Plc N/N/' |  sed 's/v1 //' |  sed 's/v2 //' | sed 's/v3 //' |  sed 's/Plant //' | sed 's/Org N/N/' | sed 's/Allegro //' | tr -d "#" > $GTHOME/gt/sme/dev/cleantest

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantest | uniq > $GTHOME/gt/sme/dev/sortedtestdis

# Henter gullanalyse, fjerner Allegro-tag som foreløpig ikke fungerer som den skal:
cat ~/biggies/gt/sme/corp/correct/testkorpus.dis.corr.txt | sed 's/Allegro //' > $GTHOME/gt/sme/dev/cleantestkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantestkorpus.dis.corr.txt | uniq > $GTHOME/gt/sme/dev/sortedtestkorpus 

# Antall ulike linjer:
echo "Differansen mellom gullanalyse og ny analyse er"
diff $GTHOME/gt/sme/dev/sortedtestkorpus $GTHOME/gt/sme/dev/sortedtestdis | wc -l

# De ulike linjene:
diff $GTHOME/gt/sme/dev/sortedtestkorpus $GTHOME/gt/sme/dev/sortedtestdis > $GTHOME/gt/sme/dev/testCG_result.txt
see $GTHOME/gt/sme/dev/testCG_result.txt
