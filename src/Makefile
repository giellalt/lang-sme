# This is a makefile that builds the Northern Sami morphological parser
# *****************************************************************

# The ultimate goal is to build isme.fst, the generator
# This goal depends on sme.save being up to date.

isme.fst: ../bin/isme.fst
../bin/isme.fst: ../bin/sme.fst ../bin/sme.save ../bin/tok.fst \
	../bin/allcaps.fst
	@echo
	@echo "*** Building the inverse isme.fst ***"
	@echo
	@printf "load ../bin/sme.save \n\
	invert net \n\
	save stack ../bin/isme.fst \n\
	quit \n" > /tmp/isme-fst-script
	@xfst < /tmp/isme-fst-script
	@rm -f /tmp/isme-fst-script

 
# The first goal is to build sme.fst, the analyzer.
# This goal depends on sme.save and caseconv.fst being up to date

sme.fst: ../bin/sme.fst
../bin/sme.fst: ../bin/sme.save ../bin/caseconv.fst ../bin/allcaps.fst \
	../bin/tok.fst
	@echo
	@echo "*** Building sme.fst ***" ;
	@echo
	@printf "read regex @\"../bin/sme.save\" .o. \
	@\"../bin/caseconv.fst\" ; \n\
	save stack ../bin/sme.fst \n\
	quit \n" > /tmp/sme-fst-script
	@xfst < /tmp/sme-fst-script
	@rm -f /tmp/sme-fst-script

# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: ../bin/caseconv.fst
../bin/caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../bin/caseconv.fst \n\
	quit \n" > /tmp/caseconv-script
	@xfst < /tmp/caseconv-script
	@rm -f /tmp/caseconv-script


# This goal depends on allcaps.regex

allcaps.fst: ../bin/allcaps.fst
../bin/allcaps.fst: allcaps.regex
	@echo
	@echo "*** Building allcaps.fst ***" ;
	@echo
	@printf "source allcaps.regex \n\
	save stack ../bin/allcaps.fst \n\
	quit \n" > /tmp/tok-script
	@xfst < /tmp/tok-script
	@rm -f /tmp/tok-script


# The third goal is to build sme.save
# This goal depends on twol-sme.bin and a bunch of lexicon files

sme.save: ../bin/sme.save
../bin/sme.save: ../bin/twol-sme.bin sme-lex.txt adj-sme-lex.txt \
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
	read-rules ../bin/twol-sme.bin \n\
	compose-result \n\
	save-result ../bin/sme.save \n\
	quit \n" > /tmp/sme-save-script
	@lexc < /tmp/sme-save-script
	rm -f /tmp/sme-save-script


# The fourth goal is to build twol-sme.bin
# This goal depends on twol-sme.txt

twol-sme.bin: ../bin/twol.sme.bin
../bin/twol-sme.bin: twol-sme.txt
	@echo
	@echo "*** Building twol-sme.bin ***" ;
	@echo
	@printf "read-grammar twol-sme.txt \n\
	compile \n\
	save-binary ../bin/twol-sme.bin \n\
	quit \n" > /tmp/twol-sme-script
	@twolc < /tmp/twol-sme-script
	@rm -f /tmp/twol-sme-script

# Here we include a preprocessor.
# This goal depends on tok.txt

tok.fst: ../bin/tok.fst 
../bin/tok.fst: tok.txt
	@echo
	@echo "*** Building the tokenizer tok.fst ***" ;
	@echo
	@printf "source tok.txt \n\
	save stack ../bin/tok.fst \n\
	quit \n" > /tmp/tok-script
	@xfst < /tmp/tok-script
	@rm -f /tmp/tok-script


# "make clean" is there to remove the binary files at will.

clean:
	@rm -f ../bin/*.fst ../bin/*.save ../bin/*.bin




