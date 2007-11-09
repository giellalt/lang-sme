#!/bin/sh
# Shell script to run paradigm generation for a list of words
# It first cleans a bit, and then calls a perl script that does
# the processing of the word list and calls make.

rm -f paradigm-sme.txt
rm -f *.paradigm
perl gen-paradigms.pl parawlist.txt
