# This is a makefile that builds the Northern Sami morphological parser
# *****************************************************************
 
# The first goal is to build sme.fst
# This goal depends on sme.save and caseconv.fst being up to date

sme.fst: sme.save caseconv.fst tok.fst
	@echo
	@echo "*** Building sme.fst ***" ;
	@echo
	@printf "read regex @\"sme.save\" .o. @\"caseconv.fst\" ; \n\
	save stack sme.fst \n\
	quit \n" > /tmp/sme-fst-script
	@xfst < /tmp/sme-fst-script
	@rm -f /tmp/sme-fst-script

# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack caseconv.fst \n\
	quit \n" > /tmp/caseconv-script
	@xfst < /tmp/caseconv-script
	@rm -f /tmp/caseconv-script

# The third goal is to build sme.save
# This goal depends on twol-sme.bin and a bunch of lexicon files

sme.save: twol-sme.bin sme-lex.txt adj-sme-lex.txt \
	adv-sme-lex.txt noun-sme-lex.txt verb-sme-lex.txt \
	closed-sme-lex.txt pp-sme-lex.txt acro-sme-lex.txt \
	abbr-sme-lex.txt propernoun-sme-lex.txt punct-sme-lex.txt
	@echo
	@echo "*** Building sme.save ***" ;
	@echo
	printf "compile-source sme-lex.txt adj-sme-lex.txt adv-sme-lex.txt \
	noun-sme-lex.txt verb-sme-lex.txt closed-sme-lex.txt \
	pp-sme-lex.txt acro-sme-lex.txt \
	abbr-sme-lex.txt propernoun-sme-lex.txt punct-sme-lex.txt \n\
	read-rules twol-sme.bin \n\
	compose-result \n\
	save-result sme.save \n\
	quit \n" > /tmp/sme-save-script
	@lexc < /tmp/sme-save-script
	rm -f /tmp/sme-save-script

# The fourth goal is to build twol-sme.bin
# This goal depends on twol-sme.txt

twol-sme.bin: twol-sme.txt
	@echo
	@echo "*** Building twol-sme.bin ***" ;
	@echo
	@printf "read-grammar twol-sme.txt \n\
	compile \n\
	save-binary twol-sme.bin \n\
	quit \n" > /tmp/twol-sme-script
	@twolc < /tmp/twol-sme-script
	@rm -f /tmp/twol-sme-script



# If sme.fst had included the preprocessor, this part would have come in.
# Now, it does not, and this must wait for a new makefile.
# This goal depends on tok.txt

tok.fst: tok.txt
	@echo
	@echo "*** Building the tokenizer tok.fst ***" ;
	@echo
	@printf "source tok.txt \n\
	save stack tok.fst \n\
	quit \n" > /tmp/tok-script
	@xfst < /tmp/tok-script
	@rm -f /tmp/tok-script


# Added this, and added a mentioning of the tok.txt in the beginning of
# the file (under the dependencies of sme.fst)

# Then, the intermediate files will be cleaned up
# I leave twol-sme.bin because I need it for twolc, and tok.fst
# because that is used seperately on the command line.


clean:
	@rm -f caseconv.fst sme.save


# ##############################################################


