#!/bin/bash

# script to generate paradigms for generating word forms
# command:
# sh generate_contlex_para.sh PATTERN
# example, when you are in sme:
# sh devtools/prop_minip.sh VUONA | dsmeNorm | less
# sh devtools/prop_minip.sh Hirškikkâ | dsmeNorm 

HLOOKUP=$(echo $HLOOKUP)
GTLANGS=$(echo $GTLANGS)


PATTERN=$1
L_FILE="in.txt"
cut -d '!' -f1 src/fst/morphology/generated_files/smi-sme-propernouns.lexc | grep $PATTERN | grep -v Err | tr '+' ':'| cut -d ':' -f1 | tr -d '%'>$L_FILE

P_FILE="test/data/testpropparadigm.txt"

for lemma in $(cat $L_FILE);
do
 for form in $(cat $P_FILE);
 do
   echo "${lemma}${form}" | $HLOOKUP $GTLANGS/lang-sme/src/fst/generator-gt-norm.hfstol
 done
 rm -f $L_FILE
done

