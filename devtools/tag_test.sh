#shell script to see if there are tags which are not declared in root.lexc or if tags are misspelled

echo 'Are there tags not declared in root.lexc or misspelled?'
cat src/morphology/clitics.lexc src/morphology/compounding.lexc  src/morphology/affixes/*lexc src/morphology/stems/*lexc |cut -d '!' -f1 |grep ' ;' | cut -d ':' -f1 |tr -s ' ' |sed 's/^ //' | cut -d ' ' -f1 |sed 's/+/¢+/g' |sed 's/@/¢@/g'|tr '¢' '\n' | tr '#"%' '\n'| egrep '(\+|@)' |sort -u | egrep -v '^(\+|\+%|\+\/\-|\+Cmp\-|\+Cmp%\-|\@0|\@%)$' > lexctags

cat src/morphology/root.lexc |cut -d '!' -f1 |cut -d ':' -f1 |sed 's/+/¢+/g'|sed 's/@/¢@/g' |tr '¢' '\n' | egrep '(\+|@)' |tr -d ' ' | tr -d '\t'|sort -u > roottags

echo 'Have a look at these:'

comm -23 lexctags roottags 
echo 'checked'
rm lexctags roottags

#cat src/morphology/clitics.lexc src/morphology/compounding.lexc src/morphology/affixes/*lexc |cut -d '!' -f1 | grep ';' |tr -s ' ' | sed 's/^ //' |grep ':' |cut -d ':' -f1 | sed 's/\+/¢+/g' | tr '¢' '\n' |sort | uniq -c |sort -n |less
# visuell test: cat src/morphology/clitics.lexc src/morphology/compounding.lexc src/morphology/affixes/*lexc |cut -d '!' -f1 | grep ';' |tr -s ' ' | sed 's/^ //' |grep ':' |cut -d ':' -f1 | tr -d '0' | sed 's/\+/¢+/g' | tr '¢' '\n' |egrep -v '^(\+|\@|<)' |grep -v '^$' |less