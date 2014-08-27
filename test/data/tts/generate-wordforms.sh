#!/bin/bash

# Wrong usage - short instruction:
if test ! $# -eq 3 ; then
    echo
    echo "Usage: $0 PARADIGMFILE WORDLISTFILE FST"
    echo
    echo "where:"
    echo "   PARADIGMFILE=a file with appropriate tags to create word forms"
    echo "   WORDLISTFILE=a file with words in base form to inflect"
    echo "   FST=generating fst to use to generate the word forms"
    echo
    exit 1
fi

Codelist=$(cat $1)
Wordlist=$(cat $2)
Fst=$3

# echo $Codelist
# echo $Wordlist

wordcodelist=""
for word in $Wordlist; do
    for code in $Codelist; do
        wordcode=$(echo "$word$code")
        wordcodelist="$wordcodelist $wordcode"
    done
done

finallist=$(echo $wordcodelist | tr ' ' '\n')
# echo $finallist

echo "$finallist" | hfst-lookup -qp $Fst
