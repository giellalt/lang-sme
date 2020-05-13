#!/bin/sh
# Shell script to run paradigm generation for a list of words
# It first cleans a bit, and then calls a perl script that does
# the processing of the word list and calls make.


XSLTSHEET=$GTHOME/words/dicts/scripts/restruct_paradigme_smxnob.xsl
GEN_TMP=Gen_tmp

if [ $1 == '-h' ]; then
    echo "Usage:"
    echo "$0"
    echo "	Will generate paradigms for all words in parawlist.txt"
    echo "$0 WORDLIST XSLTSHEET OUTPUTDIR PARATYPE"
    echo "	Will generate paradigms for all words in WORDLIST,"
    echo "	wrapping them in xml using XSLTSHEET, place the result in"
    echo "	OUTPUTDIR, and the paradigms will be of type PARATYPE."
    echo "	Recognised values for PARATYPE are: default, dict, oahpa."
    exit
fi

if [ $1 ]; then
    WORDLIST=$1
    XSLTSHEET=$2
    GEN_TMP=$3
    PARATYPE=$4
else
    WORDLIST=parawlist.txt
fi

#rm -rf  $GEN_TMP
perl gen-paradigms.pl $WORDLIST $XSLTSHEET $GEN_TMP $PARATYPE
