#!/bin/bash

# script to generate paradigms for generating word forms
# command, when you are in smn:
# sh devtools/der_verb_minip.sh 2SYLL_OD | less
# sh devtools/der_verb_minip.sh kihlođ 


LOOKUP=$(echo $LOOKUP)
GTLANGS=$(echo $GTLANGS)


PATTERN=$1
L_FILE="in.txt"
cut -d '!' -f1 src/fst/morphology/stems/verbs.lexc | egrep $PATTERN | grep -v Err | cut -d ':' -f1>$L_FILE

P_FILE="src/fst/morphology/test/testderverbpar.txt"

for lemma in $(cat $L_FILE);
do
 for form in $(cat $P_FILE);
 do
   echo "${lemma}${form}" | $LOOKUP $GTLANGS/lang-sme/src/fst/generator-gt-norm.xfst
 done
 rm -f $L_FILE
done

