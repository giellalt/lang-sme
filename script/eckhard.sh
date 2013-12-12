# Skript for å teste analysen av testkorpus.txt med sme.fst og sme-dis.rle opp mot gullversjon.

# Analyserer testkorpusene:
cat $GTBIG/gt/sme/corp/testkorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg  > $GTHOME/gt/sme/dev/ECKH-testdisINTERMEDIATE

cat $GTBIG/gt/sme/corp/divgullkorpus.txt | preprocess --abbr=$GTHOME/gt/sme/bin/abbr.txt | $LOOKUP $GTHOME/gt/sme/bin/sme.fst | lookup2cg  >> $GTHOME/gt/sme/dev/ECKH-testdisINTERMEDIATE

# Fjerner semantiske tagger og #:

cat $GTHOME/gt/sme/dev/ECKH-testdisINTERMEDIATE | perl -pe 's/(Lang|Money|Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4|<vdic>|Date) //g' | tr -d "#" > $GTHOME/gt/sme/dev/ECKH-cleantestINTERMEDIATE

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/ECKH-cleantestINTERMEDIATE | uniq > $GTHOME/gt/sme/dev/ECKH-sortedALLCOHORTS

# Henter gullstandarder, fjerner Allegro-tag som foreløpig ikke fungerer som den skal:
cat $GTBIG/gt/sme/corp/correct/testkorpus.N.corr.txt | perl -pe 's/(Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4|<vdic>|Date) //g' > $GTHOME/gt/sme/dev/ECKH-cleantestkorpus.dis.corrINTERMEDIATE
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTBIG/gt/sme/corp/correct/divgullkorpus.N.corr.txt | perl -pe 's/(Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4|<vdic>|Date) //g' >> $GTHOME/gt/sme/dev/ECKH-cleantestkorpus.dis.corrINTERMEDIATE

# Sorterer alfabetisk inne i cohortene
perl $GTHOME/gt/script/sort-cg-cohort.pl $GTHOME/gt/sme/dev/ECKH-cleantestkorpus.dis.corrINTERMEDIATE | uniq > $GTHOME/gt/sme/dev/ECKH-sortedGOLDSTANDARD





