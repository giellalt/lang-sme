#!/bin/bash
# !!! ---- NB! ---- !!! overwrites ../typos.txt
# !!! ---- NB! ---- !!! be sure this is what you want!

# do not transfer typos/corrections with a space to the new version

# input:  old version of typos.txt file
#         err_types_all_words.txt
# output: new version of typos.txt 
#

# count the tags
cat err_types_all_words.txt \
| grep -v '#_has_space' \
> err_types_all_words_no_space.txt

cat err_types_all_words_no_space.txt \
| grep '#' | sed 's/^[^#]*#/#/' | sed 's/#/\n#/g' | sed 's/ $//' \
| sort | uniq -c \
> err_types_counted.txt

# create a new typos.txt file
cp  ../typos.txt.new_error_types.header ../typos.txt

# turn the counted tags file into documentation
cat err_types_counted.txt | head -1 | sed 's/^/# corpus size:/' >> ../typos.txt
echo '# error types:' >> ../typos.txt
cat err_types_counted.txt | grep '#' | sed 's/^/#/' >> ../typos.txt

cat err_types_all_words_no_space.txt >> ../typos.txt

exit

# some example filters for 
# more detailed look at a type

# make a frequency list for the letters that get substituted
cat errors_marked2.txt | grep '#_subst1$' | sed 's/#.*$//' | sed 's/@/ /' | gawk '{max=length($1); for (i=1; i <=max; i++){v1=substr($1, i, 1); v2=substr($2, i, 1); printf("%s", v1); if (v1 != v2){printf(":%s", v2)} } printf("\n")}' | sed 's/\(.:.\)/ \1 /g' | tr ' ' '\n' | grep ':' | sort | uniq -c | sort -nr | less

# frequency list of letters that have been omitted (and thus they need to be added to arrive at the correct word)

cat errors_marked2.txt | grep '#_add1' | sed 's/#.*$//' | sed 's/@/ /g' | sed 's/ $//' | sed 's/^\(.*\)\(.*\) \1\(.\)\2$/\1\2 \1\n\3:\n\2/' | grep ':' | sort | uniq -c | sort -nr | less

# frequency list of letters of correct words
cat only_corrects.txt | sed 's/./\n&\n/g' | grep '.' | sort | uniq -c | sort -nr | less

# --> they are rather similar; 
# a and s top the list of omitted ones probably because they are typed with the small finger of the left hand...

# notes
strings.regex: linguistic errors:
otsusi otsuseid
kumba kumma
töötleda töödelda
gbd <-> kpt

?
ühekordne <-> topelt
töödata töötada # või transpos dat -> tad

kombinatsioonid:
täpitäht + trükkimisega seotu 
transpos + ühekordne <-> topelt
transpos + transpos

praegu välja jäetud:
haruldane asendus, nt. n:l hüdraunuline
                       v:s mõistuv mõistus


2-3 kõrvuti tähte lisatud
pikem korduvus
suurema kaugusega transposits 
---
...miset -> miste, mist, mised, mise, misest
----

---


