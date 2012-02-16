This dir contains compounds only recognised using the dynamic compounding mechanism, plus intermediate files that can be useful in the work with lexicalising the compounds.

There are two sets of files, one for the $GTFREE corpus, and another for $GTBOUND. The commands to
create the files are as follows:

1. Create a candiate list using the nonrec (non-recursive/non-circular) transducer:

ccat -l sme -a -r $GTBOUND/converted/sme/ | preprocess --abbr=../bin/abbr.txt | lookup ../bin/nonrec-sme.fst | fgrep '+?' | cut -f1 | grep '[a-z]' > bound-nonrec-unrec.txt

2. Sort and count the first list:

sort bound-nonrec-unrec.txt | uniq -c | sort -rn > bound-nonrec-unrec-freqsorted.txt

3. Extract all strings occuring more than once, run them through the normative transducer, grep only the relevant strings, remove some tags, and you are set:

grep -v ' 1 ' bound-nonrec-unrec-freqsorted.txt | tr -s ' ' | sed -e 's/^ //' | cut -d ' ' -f2 | usmeNorm | grep '#[a-zášžčđŋŧ]' | grep -v '\?' | grep -v 'PxSg3' | sed -e 's/\+[^#]*-#/-#/g' -e 's/\+[^#-]*#/#/g' -e 's/\+[^+]*\+[^+]*$//g' | sort -u > non-hapax-compounds-bound.txt

NB! The $GTBOUND files are only available on victorio or the XServe (divvun server).
NB2! Make sure you have up-to-date transducers when doing this!
