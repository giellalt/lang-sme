
# Script to generate a list of sme lemmata

grep ";" adj-sme-lex.txt | grep -v 'Err/Sub'|grep -v "^\!" | egrep -v "(LEXICON|ATTR|FINJU|Der|Attr| At |BBO |MUS |BUOREMUSS|OVDDIT |STUORIBUS|BUStem | K | Rreal | R )" | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u > adj-wordfeud.sme


grep ";" adv-sme-lex.txt | grep -v 'Err/Sub'| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX|\+Adv)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u > adv-wordfeud.sme

grep ";" noun-sme-lex.txt | grep -v 'Err/Sub'|grep -v "^\!" | egrep -v '(LEXICON|CmpN/Only|+Gen+|+Loc+|CmpN/Last)' | sed 's/% /€/g' | sed 's/%:/¢/g' |  tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | tr "€" " "\
 | tr "¢" ":" | sort -u >  noun-wordfeud.sme

grep ";" pronoun-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u > pronoun-wordfeud.sme

grep ";" conjunction-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | grep -v '/' | tr -d "[#%]" | sort -u > conjunction-wordfeud.sme

grep ";" interjection-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u >> wordfeud.sme

grep ";" particle-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u > interjection-wordfeud.sme

grep ";" pp-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u >  pp-wordfeud.sme

grep ";" subjunction-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u > subjunction-wordfeud.sme

grep ";" numeral-sme-lex.txt | grep -v 'Err/Sub'| cut -d";" -f1|sed 's/ $//g;'|grep ' '| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX)' | tr ":+" " " | cut -d " " -f1 | grep -v '/' | tr -d "[#%]" | sort -u > numeral-wordfeud.sme

grep ";" verb-sme-lex.txt | grep -v 'Err/Sub'| grep -v "^\!" | egrep -v '(LEXICON|STRAYFORMS|ENDLEX|\+V)' | tr ":+" " " | cut -d " " -f1 | tr -d "[#%]" | sort -u >  verb-wordfeud.sme

cat $GTHOME/words/dicts/smenob/src/*l|tr '\n' '™' | sed 's/<l /£/g;'|tr '£' '\n'|grep '"vd"'|tr '<' '>'|cut -d">" -f2|grep -v ' ' |grep -v '[A-ZÁČŠ]' > dict-wordfeud.sme


cat *-wordfeud.sme | sort -u > wordfeud.sme
rm -f *-wordfeud.sme