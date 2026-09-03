# Usage:
# sh check-explanation-tags.sh
# The script fetches tags from the LIST definitions of grammarchecker.cg3 and
# Compares the list against the various error files.

echo "\n"
echo "Are the rule tags in grammarchecker.cg3 in use and declared in the error tags files?"
echo "=========================================================================\n"
cat grammarchecker.cg3 |grep "^LIST &"|tr -s " "|cut -d" " -f2|tr -d "&"|sort | uniq > xxd # defined
cat grammarchecker.cg3 |grep "^ADD:"|tr "\t" " "| tr -s " "| cut -d" " -f1|cut -d":" -f2|sort|uniq > xxb   # in use
cat errors-se.ftl |grep "^[a-z]"|cut -d" " -f1|sort | uniq > xxn # native
cat errors-en.ftl |grep "^[a-z]"|cut -d" " -f1|sort | uniq > xxe # emglish
cat errors.json |grep '"id"'|cut -d'"' -f4|sort | uniq > xxj #json
cat errors.source.xml | grep "error id"|cut -d'"' -f2|sort | uniq > xxx # xml

echo " Tags defined:"
cat xxd |wc -l

echo " Tags used:"
cat xxb |wc -l 

echo "Number of tags not in use: "
comm -13 xxb xxd | wc -l
echo "Number of undefined tags: "
comm -23 xxb xxd | wc -l

echo "The tags declared but not used in the grammarchecker file are:"
comm -23 xxd xxb | tr "\n" ","|sed 's/,/, /g;'
echo "\n"


echo " Tags in native ftl:"
cat xxn |wc -l 

echo "Number of tags missing in errors-se.ftl: "
comm -23 xxd xxn | wc -l
echo "The tags tags missing in the native ftl file were:"
comm -23 xxd xxn | tr "\n" ","|sed 's/,/, /g;'
echo "\n"

echo " Tags in en ftl:"
cat xxe |wc -l 

echo "Number of tags missing in errors-en.ftl: "
comm -23 xxd xxe | wc -l
echo "The tags tags missing in errors-en.ftl file were:"
 comm -23 xxd xxe | tr "\n" ","|sed 's/,/, /g;'
echo "\n"
 
echo "Tags in json:"
cat xxjx |wc -l 
echo "Number of tags missing in errors.json: "
comm -23 xxd xxj | wc -l
echo "The tags issing in errors.json were: "
comm -23 xxd xxj | tr "\n" ","|sed 's/,/, /g;'
echo "\n"

echo "Tags in xml:"
cat xxx |wc -l 
echo "Number of tags missing in errors.source.xml: "
comm -23 xxd xxx | wc -l
echo "The tags missing in errors.xml were: "
comm -23 xxd xxx | tr "\n" ","|sed 's/,/, /g;'
echo "\n"


#echo "Delete auxiliary xx* files\n"
rm -f xxb xxe xxn xxd xxj xxx 

