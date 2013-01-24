# Skript for å kjøre sum-cg.pl uten semtagger:

# Fjerner sem-tagger:
cat dev/1000_4jan | perl -pe 's/(Ani|Body|Build|Clth|Edu|Event|Fem|Food|Group|Hum|Mal|Measr|Obj|Org|Plant|Plc|Route|Sur|Time|Txt|Veh|Wpn|Wthr|Allegro|v1|v2|v3|v4) //g' > dev/test_clean

# Sorterer og unifiserer analysene i hver cohort:
perl ../script/sort-cg-cohort.pl dev/test_clean | uniq > dev/test_uniq

# Kjør sum-cg.pl
perl ../script/sum-cg.pl --grammar dev/test_uniq|see 