#!/bin/sh
# Litt pseudo aktig, filnavn og target må være utskiftbar
rm -f paradigm-sme.txt
rm -f *.paradigm
perl generate-paradigm.pl parawlist.txt
