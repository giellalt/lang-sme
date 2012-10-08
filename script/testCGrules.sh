# Skript for å teste analysen av testkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpuset:
cat $GTBIG/gt/sme/corp/testkorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg | vislcg3 -g $GTHOME/gt/sme/src/sme-dis.rle > $GTHOME/gt/sme/dev/testdis

# Fjerner semantiske tagger og #:
cat $GTHOME/gt/sme/dev/testdis | perl -pe 's/(Time|Ani|Hum|Org|Obj|Build|Clth|Wthr|Food|Body|Event|Plc|Veh|Txt|Route|Plant|Allegro|Group|v1|v2|v3|v4) //g' | tr -d "#" > $GTHOME/gt/sme/dev/cleantest

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantest | uniq > $GTHOME/gt/sme/dev/sortedtestdis

# Henter gullstandard, fjerner Allegro-tag som foreløpig ikke fungerer som den skal:
cat $GTBIG/gt/sme/corp/correct/testkorpus.dis.corr.txt | sed 's/Allegro //' > $GTHOME/gt/sme/dev/cleantestkorpus.dis.corr.txt

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/cleantestkorpus.dis.corr.txt | uniq > $GTHOME/gt/sme/dev/sortedtestkorpus 

# Antall ulike linjer:
echo "Differansen mellom gullstandard og ny analyse er"
diff -w $GTHOME/gt/sme/dev/sortedtestkorpus $GTHOME/gt/sme/dev/sortedtestdis | wc -l

# De ulike linjene:
diff -w $GTHOME/gt/sme/dev/sortedtestkorpus $GTHOME/gt/sme/dev/sortedtestdis > $GTHOME/gt/sme/dev/testCG_result.txt
see $GTHOME/gt/sme/dev/testCG_result.txt
