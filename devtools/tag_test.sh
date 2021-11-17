#shell script to see if there are tags which are not declared in root.lexc or if tags are misspelled

echo 'Possible tags not declared in root.lexc or misspelled:'
cat src/fst/clitics.lexc src/fst/compounding.lexc  src/fst/affixes/*lexc src/fst/stems/*lexc  ../giella-shared/smi/src/fst/stems/*lexc |cut -d '!' -f1 |grep ' ;' | cut -d ':' -f1 |rev |cut -d ' ' -f1 |rev |sed 's/+/¢+/g' |sed 's/@/¢@/g'|tr '¢' '\n' | tr '#"' '\n'| egrep '(\+|@)' |sort -u | egrep -v '^(\+|\+%|\+\/\-|\+Cmp\-|\+Cmp%\-|\@0|\@%)$' > lexctags

cat src/fst/root.lexc |cut -d '!' -f1 |cut -d ':' -f1 |sed 's/+/¢+/g'|sed 's/@/¢@/g' |tr '¢' '\n' | egrep '(\+|@)' |tr -d ' ' | tr -d '\t'|sort -u > roottags

comm -23 lexctags roottags 

echo 'Checking for double semicolon in stem files:'
cat src/fst/stems/*lexc |cut -d '!' -f1 |grep ';.*;'

echo 'Checking for missing Der-tags:'
cat src/fst/stems/*lexc |cut -d '!' -f1 |grep '\+Der/.*;' |egrep -v 'Der([1234]|\+)'

echo 'Checking for double Sem-tags:'
cat src/fst/stems/*lexc |cut -d '!' -f1 |grep '+Sem.*+Sem' 


echo 'checked'
rm lexctags roottags
