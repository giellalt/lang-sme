#!/bin/bash

###### Variables: #######
INPUTFILE=${srcdir}/stress-assignment.txt
OUTPUTFILE=stress-assignment.ipa.gen.txt
EXPECTFILE=${srcdir}/stress-assignment.ipa.corr.txt

# The actual testing is done in the sourced (included) file:
source test-ipa-conversion.sh
