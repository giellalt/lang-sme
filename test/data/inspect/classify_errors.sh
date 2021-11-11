#!/bin/bash
# try to figure out what kind of modifications are needed to turn a typo into a correct word
# input: typos.txt file
# output: 3 column file: typo correct #modification_type(s)
#
# uses hfst transducers; be sure to compile them beforehand! 

# algorithm:
# (create the rows of a table: 1 row per 1 typo from the input file) 
# 1) from typos.txt, remove everything except: _typo_ <tab> _correct_
#    (plus turn @ into &atsign; because @ will be used in sed lines)
# 2.0) relax the orthography by conflating accented letters with non-accented ones
# 2) for any number of possible modification type, do 
#     2.1) use a specialised transducer to generate correction candidates
#     2.2) if one of the candidates was the _correct_ one, make a mark #_modification_type
#     2.3) save the #_modification_type in a file
# 3) combine all the files to arrive at 3 columns: typo correct #modification_type(s)

# extract the typo-correction pairs
cat ../typos.txt.old_error_types \
| sed 's/#.*$//' \
| grep '.' \
| sed 's/&amp;/\&/g' \
| sed 's/@/\&atsign;/g' \
> typos.txt.old

# create the column of typos
cat typos.txt.old \
| cut -f 1 \
> only_typos.txt

# create the column of known corrects
cat typos.txt.old \
| cut -f 2 \
> only_corrects.txt

# sanity check: find rows where typo = correct 
paste only_typos.txt only_corrects.txt \
| sed 's/\t/@ /' \
| sed 's/$/ /' \
| sed '/^\([^@]*\)@.* \1 /s/$/#_no_error/' \
| sed 's/^.*#/#/' \
| sed 's/^[^#]*$//' \
> success_no_error.txt

# prepare typos for subsequent processing:
# add a special symbol @ to separate candidates of one typo from those of the next one
cat only_typos.txt \
| sed 's/$/\n@/' \
> typos_tmp.txt

# start with tmp file for including all the errors (resulting in a table)
paste only_typos.txt only_corrects.txt \
| paste - success_no_error.txt \
> tmp_errors_marked

# mark errors of accents
# 1. a/á error
# 2. č/c đ/d š/s ŧ/t error 
# and lines with a space in it

cat tmp_errors_marked \
| sed 's/\t/@/g' \
| sed 's/á/a/g' \
| sed 's/Á/A/g' \
| sed '/#/!s/^\([^@]*\)@\1@/&#_a_error/' \
| sed 's/č/c/g' \
| sed 's/đ/d/g' \
| sed 's/š/s/g' \
| sed 's/ŧ/t/g' \
| sed 's/ž/z/g' \
| sed 's/ŋ/n/g' \
\
| sed 's/Č/C/g' \
| sed 's/Đ/D/g' \
| sed 's/Š/S/g' \
| sed 's/Ŧ/T/g' \
| sed 's/Ž/Z/g' \
| sed 's/Ŋ/N/g' \
| sed '/#/!s/^\([^@]*\)@\1@/&#_cdst_error/' \
| sed '/ /s/$/#_has_space/' \
> errors_marked1.txt

# make accent error column
# to be later combined with other error types
cat errors_marked1.txt \
| sed 's/^[^@]*@[^@]*@//' \
> error_types_accents.txt

# make "relaxed" typos and corrects column
cat errors_marked1.txt \
| sed 's/@/\t/g' \
| cut -f 1 \
> only_relaxed_typos.txt

cat errors_marked1.txt \
| sed 's/@/\t/g' \
| cut -f 2 \
> only_relaxed_corrects.txt

# work with the relaxed typos-corrects

# prepare typos for subsequent processing:
# add a special symbol @ to separate candidates of one typo from those of the next one
cat only_relaxed_typos.txt \
| sed 's/$/\n@/' \
> typos_relaxed_tmp.txt

# start with tmp file for including all the errors (resulting in a table)
paste only_typos.txt only_relaxed_corrects.txt \
| paste - success_no_error.txt \
> tmp_errors_marked

# for every kind of a typo (add_one, delete_one etc.), ... 

for typo in transpose transpose1 aab2abb repetition subst1_kb_next capitalize
do

  # 1) create all the possible modifications of this type

  cat typos_relaxed_tmp.txt \
  | hfst-lookup -s ${typo}.hfst \
  | sed '/^@/s/^@.*$/@/' \
  | sed 's/\t[^\t]*$//' \
  | sed 's/^[^\t]*\t//' \
  | tr '\n' ' ' \
  | sed 's/@ /@/g' \
  | tr -s '@' \
  | sed 's/@/\n/g' \
  > tmp1_relaxed.txt

  # 2) check if some of the suggested corrections was indeed the known correct one
  # ... and mark the file line accordingly, i.e. with the type of the correction
  # (add1, del1 etc)
  
  paste only_relaxed_corrects.txt tmp1_relaxed.txt \
  | sed 's/\t/@ /' \
  | sed 's/$/ /' \
  | sed "/^\([^@]*\)@.* \1 /s/$/#_${typo}/" \
  | sed 's/^.*#/#/' \
  | sed 's/^[^#]*$//' \
  > tmp2_relaxed.txt

  # collect all the classifications
  paste tmp_errors_marked tmp2_relaxed.txt \
  > tmp3_relaxed
  cp tmp3_relaxed tmp_errors_marked
done


# remove falsely marked errors
# they are here because the accented letters were conflated with the non-accented ones,
# sometimes resulting in typo being exactly the same as correct;
# but the transducers still tagged some errors
# in addition, remove the last line (which has sneaked in from previous buggy scripts...)

paste tmp_errors_marked error_types_accents.txt \
| sed 's/\t/@/g' \
| sed 's/^[^@]*@[^@]*@//' \
| sed '/#_no_error/s/^.*$//' \
| sed '/#_cdst_error/s/^.*$//' \
| sed '/#_a_error/s/^.*$//' \
| sed '/#_has_space/s/^.*$//' \
| tr -d '@' \
| sed '$d' \
> transducer_tagged_errors.txt

#-------------
# mark some more pairs with sed REs

cat errors_marked1.txt \
| sed '/#/!s/^\(.*h\)\([kptcKPTC]\)\(.*\)@\1\2\2\3@/&#_add1_get_double_h_kptc/' \
| sed '/#/!s/^\(.*h\)\([kptcKPTC]\)\2\(.*\)@\1\2\3@/&#_del1_from_double_h_kptc/' \
| sed '/#/!s/^\(.*\)\([iI]\)\(.*\)@\1\2\2\3@/&#_add1_get_double_i/' \
| sed '/#/!s/^\(.*\)\([iI]\)\2\(.*\)@\1\2\3@/&#_del1_from_double_i/' \
| sed '/#/!s/^\(.*\)\([aeouAEOU]\)\(.*\)@\1\2\2\3@/&#_add1_get_double_vowel/' \
| sed '/#/!s/^\(.*\)\([aeouAEOU]\)\2\(.*\)@\1\2\3@/&#_del1_from_double_vowel/' \
| sed '/#/!s/^\(.*\)\(.\)\(.*\)@\1\2\2\3@/&#_add1_get_double_cons/' \
| sed '/#/!s/^\(.*\)\(.\)\2\(.*\)@\1\2\3@/&#_del1_from_double_cons/' \
| sed '/#/!s/^\(.*\)\([aeiouAEIOU]\)\(.*\)@\1\2[aeiuoAEIOU]\3@/&#_add1_get_diphtong/' \
| sed '/#/!s/^\(.*\)\([aeiouAEIOU]\)\([aeiouAEIOU]\)\(.*\)@\1\2\4@/&#_del1_from_diphtong/' \
| sed '/#/!s/^\(.*\)\(.*\)@\1.\2@/&#_add1/' \
| sed '/#/!s/^\(.*\)\(.\)\(.*\)@\1\3@/&#_del1/' \
\
| sed '/#/!s/^\(.*\)\([kptc]\)\2\(.*\)@\1\([gbdz]\)\4\3@/&#_subst_both_kptc/' \
| sed '/#/!s/^\(.*\)\([gbdz]\)\2\(.*\)@\1\([kptc]\)\4\3@/&#_subst_both_gbdz/' \
\
| sed '/#/!s/^\(.*\)[aeiouAEIOU]\(.*\)@\1[aeiouAEIOU]\2@/&#_subst1_vowel/' \
| sed '/#/!s/^\(.*\)[kptKPT]\(.*\)@\1[gbdGBD]\2@/&#_subst1_kpt_get_gbd/' \
| sed '/#/!s/^\(.*\)[gbdGBD]\(.*\)@\1[kptKPT]\2@/&#_subst1_gbd_get_kpt/' \
| sed '/#/!s/^\(.*\).\(.*\)@\1.\2@/&#_subst1/' \
| sed '/#/!s/^\([^ ]*\)\([^ ]\)\([^ ]\)\([^ ]*\)@\1\3\2\4@/&#_trans1/' \
\
| sed '/#/!s/^\([^ ]*\)[^ ][^ ]\([^ ]*\)@\1[^ ][^ ]\2@/&#_subst2_adjacent/' \
| sed '/#/!s/^\([^ ]*\)[^ ]\([^ ][^ ]*\)[^ ]\([^ ]*\)@\1[^ ]\2[^ ]\3@/&#_subst2_nonadjacent/' \
| sed '/#/!s/^\([^ ]*\)[^ ]\([^ ][^ ]*\)[^ ]\([^ ][^ ]*\)[^ ]\([^ ]*\)@\1[^ ]\2[^ ]\3[^ ]\4@/&#_subst3_nonadjacent/' \
\
| sed '/#/!s/^\([^ ]*\)\([^ ]*\)@\1\([^ ][^ ]\)\2@/&#_add2_adjacent/' \
| sed '/#/!s/^\([^ ]*\)[^ ][^ ]\([^ ]*\)@\1\2@/&#_del2_adjacent/' \
| sed '/#/!s/^\([^ ]*\)[^ ]\([^ ]*\)@\1[^ ][^ ]\2@/&#_subst1to2/' \
| sed '/#/!s/^\([^ ]*\)[^ ][^ ]\([^ ]*\)@\1[^ ]\2@/&#_subst2to1/' \
> errors_marked2.txt

# combine error type tag from different sources
# and remove some redundant classifications
# hmm... if there was an error in accents + some other error, then only this other error is tagged...

cat errors_marked2.txt \
| sed 's/^[^@]*@[^@]*@//' \
| paste - transducer_tagged_errors.txt \
| tr -d '\t' \
| sed '/#_trans1/s/#_transpose1//' \
| sed '/#_trans1/s/#_transpose//' \
| sed 's/#_subst1#_/#_/' \
| sed 's/#_del2_adjacent#_repetition/#_repetition/' \
| sed 's/#_subst[^#]*#_transpose/#_transpose/' \
| sed 's/#_[^#]*#_repetition/#_repetition/' \
| sed 's/\(#_[^#]*\)#\(_subst1_kb_next\)/\1\/\2/' \
| sed 's/\(#_no_error\).*$/\1/' \
| sed '/#_has_space/s/^\([^#]*\)#.*$/\1#_has_space/' \
\
> error_types.txt

paste only_typos.txt only_corrects.txt \
| paste - error_types.txt \
> err_types.txt

# create a 3-column table with some type for every word
# (in case of multiple types, keep only the first one on the line)
cat err_types.txt \
| sed '/#/!s/$/\t#_unknown_type/' \
| sed 's/&atsign;/@/g' \
> err_types_all_words.txt

exit

algne:
# create a 3-column table with some type for every word
# (in case of multiple types, keep only the first one on the line)
cat err_types.txt \
| sed 's/^\t@#.*$//' | sed 's/#[^@]*@/@/' | sed 's/@$/@#_unknown_type/' | sed 's/@#_/# /g' \
| sed 's/#\([^#]*\) *#.*$/#\1/'\
| sed 's/&atsign;/@/g' \
> err_types_all_words.txt


# more detailed look at a type

# vowel into diphtong

cat errors_marked2.txt | grep 'add1$' | sed 's/#.*$//' | sed 's/@/ /g' | sed 's/ $//' \
| gawk '{max=length($1); i=0; j=0; for ( ; i <=max; ) {i++; j++; v11=substr($1, i, 1); v12=substr($1, i+1, 1); v21=substr($2, j, 1); v22=substr($2, j+1, 1); if (v11 != v21){j++; printf(":%s%s", v21, v22)} else {printf("%s", v11);} } printf("\n")}' \
| sed 's/\(.:.\)/ \1 /g' | tr ' ' '\n' | grep '[aeiou]:[aeiou]' | sed 's/\(.\):\(.\)/\1->\1\2/' | sort | uniq -c | sort -nr | less

    140 e->ea
     42 o->oa
     38 a->ai
     32 u->uo
     11 u->ui
     10 i->ie
      9 e->ei
      5 o->oi
      2 i->io
      2 a->au
      1 i->iu
      1 i->ia

# diphtong into vowel 

cat errors_marked2.txt | grep 'del1$' | sed 's/#.*$//' | sed 's/@/ /g' | sed 's/ $//' \
| gawk '{max=length($1); i=0; j=0; for ( ; i <=max; ) {i++; j++; v11=substr($1, i, 1); v12=substr($1, i+1, 1); v21=substr($2, j, 1); v22=substr($2, j+1, 1); if (v11 != v21){j--; printf(":%s", v11)} else {printf("%s", v11);} } printf("\n")}' \
| sed 's/\(.:.\)/ \1 /g' | tr ' ' '\n' | grep '[aeiou]:[aeiou]' | sed 's/\(.\):\(.\)/\1\2->\1/' | sort | uniq -c | sort -nr | less

    231 ea->e
     84 oa->o
     43 uo->u
     23 ie->i
     10 ai->a
      8 oi->o
      5 ui->u
      2 ua->u
      2 io->i
      2 ia->i
      1 oe->o
      1 eu->e
      1 au->a




