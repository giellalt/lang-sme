# Defining variables
twolrules = twol-sme.txt 
lexica = sme-lex.txt adj-sme-lex.txt \
       adv-sme-lex.txt noun-sme-lex.txt verb-sme-lex.txt \
       closed-sme-lex.txt pp-sme-lex.txt
casing = case.regex

# depending line, target and prerequisites. Command line.
sme.fst :  $(twolrules) $(lexica) $(casing)
	xfst ; load stack caseconv.fst ;  stack sme.save ; \
         compose net ; save stack sme.fst ; quit

twol-sme.txt : twol-sme.bin
	twolc ; read-grammar twol-sme.txt ; compile ; \
         save-binary twol-sme.bin ; quit

$(lexica) : sme.save
	lexc ; compile-source $(lexica) ; read-rules twol-sme.bin ; \
         compose-result ; save-result sme.save ; quit

case.regex : caseconv.fst
	xfst ; read regex < case.regex ; save stack caseconv.fst ; quit


