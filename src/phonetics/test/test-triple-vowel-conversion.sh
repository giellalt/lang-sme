#!/bin/bash

###### Variables: #######
INPUTFILE=${srcdir}/triple-vowels.txt
OUTPUTFILE=triple-vowels.ipa.gen.txt
EXPECTFILE=${srcdir}/triple-vowels.ipa.corr.txt

# The actual testing is done in the sourced (included) file:
source test-ipa-conversion.sh
