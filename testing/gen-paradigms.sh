#!/bin/sh
# Shell script to run paradigm generation for a list of words
# It first cleans a bit, and then calls a perl script that does
# the processing of the word list and calls make.


XSLTSHEET=~cipriangerstenberger/gtsvn/words/dicts/scripts/restruct_paradigme.xsl
GEN_TMP=Gen_tmp

if [ $1 ]; then
    WORDLIST=$1
    XSLTSHEET=$2
    GEN_TMP=$3
else
    WORDLIST=parawlist.txt
fi

rm -rf  $GEN_TMP/*
perl gen-paradigms.pl $WORDLIST $XSLTSHEET $GEN_TMP

