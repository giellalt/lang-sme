# This is a makefile that builds the Northern Sami morphological parser
# *****************************************************************


# =============================== #
# Variable definitions			#
# =============================== #

# Tools used when compiling the transducers
XFST = xfst -utf8
TWOLC = twolc -utf8
LEXC =  lexc -utf8


# =============================== #
# Building the last file isme.fst # 
# =============================== #


# The ultimate goal is to build isme.fst, the generator
# This goal depends on sme.save being up to date.

isme.fst: ../bin/isme.fst
../bin/isme.fst: ../bin/pos-sme.fst ../bin/n-sme.fst ../bin/s-sme.fst \
	../bin/sme.save ../bin/allcaps.fst ../bin/n-sme.fst \
	../bin/caseconv.fst ../bin/d-sme.fst  ../bin/guess-sme \
	../bin/abbr.txt ../bin/cap-sme ../bin/foreign.fst 
	@echo
	@echo "*** Building the inverse isme.fst ***"
	@echo
	@printf "load ../bin/sme.save \n\
	invert net \n\
	save stack ../bin/isme.fst \n\
	quit \n" > ../../tmp/isme-fst-script
	$(XFST) < ../../tmp/isme-fst-script
	@rm -f ../../tmp/isme-fst-script


# ======================================================= #
# Building different versions of the basic sme.fst tagger #
# ======================================================= #


# We want an analyzer with POS tags only. It takes the linguistic 
# sme.fst as input and gives us an alternate pos-sme.fst. 

pos-sme.fst: ../bin/pos-sme.fst
../bin/pos-sme.fst: ../bin/sme.fst ../bin/tag-pos.fst
	@echo
	@echo "*** Building pos-sme.fst, sme.fst with POS tags ***"
	@echo
	@printf "read regex [[@\"../bin/tag-pos.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/pos-sme.fst \n\
	quit \n" > ../../tmp/pos-sme-fst-script
	$(XFST) < ../../tmp/pos-sme-fst-script
	@rm -f ../../tmp/pos-sme-fst-script

# In order to make pos-sme.fst we need a binary tag-pos.fst
# This goal depends on tag-pos.regex. The way it
# is done is that all tags except the POS one are deleted.

tag-pos.fst: ../bin/tag-pos.fst
../bin/tag-pos.fst: tag-pos.regex
	@echo
	@echo "*** Building tag-pos.fst ***" ;
	@echo
	@printf "read regex < tag-pos.regex \n\
	save stack ../bin/tag-pos.fst \n\
	quit \n" > ../../tmp/sme-tag-pos-script
	$(XFST) < ../../tmp/sme-tag-pos-script
	@rm -f ../../tmp/sme-tag-pos-script


# We want an analyzer with Norwegian tags. It takes the linguistic 
# sme.fst as input and gives us an alternate n-sme.fst

n-sme.fst: ../bin/n-sme.fst
../bin/n-sme.fst: ../bin/sme.fst ../bin/tag-no.fst
	@echo
	@echo "*** Building n-sme.fst, sme.fst with Norwegian tags ***"
	@echo
	@printf "read regex [[@\"../bin/tag-no.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/n-sme.fst \n\
	quit \n" > ../../tmp/n-sme-fst-script
	$(XFST) < ../../tmp/n-sme-fst-script
	@rm -f ../../tmp/n-sme-fst-script


# In order to make n-sme.fst we need a binary tag-no.fst
# This goal depends on tag-no.regex

tag-no.fst: ../bin/tag-no.fst
../bin/tag-no.fst: tag-no.regex
	@echo
	@echo "*** Building tag-no.fst ***" ;
	@echo
	@printf "read regex < tag-no.regex \n\
	save stack ../bin/tag-no.fst \n\
	quit \n" > ../../tmp/sme-tag-no-script
	$(XFST) < ../../tmp/sme-tag-no-script
	@rm -f ../../tmp/sme-tag-no-script

# We also want an analyzer with Sami tags. It takes the linguistic 
# sme.fst as input and gives us an alternate s-sme.fst

s-sme.fst: ../bin/s-sme.fst
../bin/s-sme.fst: ../bin/sme.fst ../bin/tag-sme.fst
	@echo
	@echo "*** Building s-sme.fst, sme.fst with Sami tags ***"
	@echo
	@printf "read regex [[@\"../bin/tag-sme.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/s-sme.fst \n\
	quit \n" > ../../tmp/s-sme-fst-script
	$(XFST) < ../../tmp/s-sme-fst-script
	@rm -f ../../tmp/s-sme-fst-script
 
# In order to make s-sme.fst we need a binary tag-no.fst
# This goal depends on tag-sme.regex

tag-sme.fst: ../bin/tag-sme.fst
../bin/tag-sme.fst: tag-sme.regex
	@echo
	@echo "*** Building tag-sme.fst ***" ;
	@echo
	@printf "read regex < tag-sme.regex \n\
	save stack ../bin/tag-sme.fst \n\
	quit \n" > ../../tmp/tag-sme-script
	$(XFST) < ../../tmp/tag-sme-script
	@rm -f ../../tmp/tag-sme-script


g-sme.fst: ../bin/g-sme.fst
../bin/g-sme.fst: ../bin/sme.fst guess-script.xfst
	@echo
	@echo "*** Building g-sme.fst ***" ;
	@echo
	@printf "compile-source sme-lex.txt adj-sme-lex.txt adv-sme-lex.txt \
	noun-sme-lex.txt verb-sme-lex.txt closed-sme-lex.txt \
	pp-sme-lex.txt acro-sme-lex.txt \
	abbr-sme-lex.txt propernoun-sme-lex.txt punct-sme-lex.txt \n\
	save-source ../bin/g-sme.save \n\
	quit \n" > ../../tmp/g-sme-save-script
	$(LEXC) < ../../tmp/g-sme-save-script
	@rm -f ../../tmp/g-sme-save-script

	@printf "source guess-script.xfst \n\
	save stack ../bin/g-sme.fsm \n\
	quit \n" > ../../tmp/guess-sme-script
	$(XFST) < ../../tmp/guess-sme-script
	@rm -f ../../tmp/guess-sme-script

	@printf "read-source ../bin/g-sme.fsm \n\
	read-rules ../bin/twol-sme.bin \n\
	compose-result \n\
	save-result ../bin/g-sme.fst \n\
	quit \n" > ../../tmp/g-sme-save-script
	$(LEXC) < ../../tmp/g-sme-save-script
	@rm -f ../../tmp/g-sme-save-script

	@printf "read regex @\"../bin/g-sme.fst\" .o. \
	@\"../bin/caseconv.fst\" ; \n\
	save stack ../bin/g-sme.fst \n\
	quit \n " > ../../tmp/g-sme-fst-script
	$(XFST) < ../../tmp/g-sme-fst-script
	@rm -f ../../tmp/g-sme-fst-script



guess-sme: ../bin/guess-sme
../bin/guess-sme:
	@echo
	@echo "*** Generating guess-sme ***" ;
	@echo
	@printf "sme ${BINDIR}/sme.fst\n\
	guesser ${BINDIR}/g-sme.fst\n\n\
	sme \n\
	guesser \n" > $@


# Here we build d-sme.fst, the morphological tagger geared towards 
# disambiguation.

d-sme.fst: ../bin/d-sme.fst
../bin/d-sme.fst: ../bin/sme.fst ../bin/dis-tag.fst
	@echo
	@echo "*** Building d-sme.fst, sme.fst w/ tags for disambiguation ***"
	@echo
	@printf "read regex [[@\"../bin/dis-tag.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/d-sme.fst \n\
	quit \n" > ../../tmp/d-sme-fst-script
	$(XFST) < ../../tmp/d-sme-fst-script
	@rm -f ../../tmp/d-sme-fst-script


# ================================= #
# Building the basic tagger sme.fst #
# ================================= #

# Here we build sme.fst, the core morphological tagger
# It takes sme.save as input and adds the caseconv fst in order to 
# handle initial capitals.

sme.fst: ../bin/sme.fst
../bin/sme.fst: ../bin/sme.save ../bin/caseconv.fst \
	../bin/allcaps.fst ../bin/abbr.txt ../bin/cap-sme
	@echo
	@echo "*** Building sme.fst ***" ;
	@echo
	@printf "read regex @\"../bin/sme.save\" .o. \
	@\"../bin/caseconv.fst\" ; \n\
	save stack ../bin/sme.fst \n\
	quit \n" > ../../tmp/sme-fst-script
	$(XFST) < ../../tmp/sme-fst-script
	@rm -f ../../tmp/sme-fst-script






# ================================================= #
# Building auxiliary files for case conversion etc. #
# ================================================= #

# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: ../bin/caseconv.fst
../bin/caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../bin/caseconv.fst \n\
	quit \n" > ../../tmp/caseconv-sme-script
	$(XFST) < ../../tmp/caseconv-sme-script
	@rm -f ../../tmp/caseconv-sme-script

# This goal depends on allcaps.regex

allcaps.fst: ../bin/allcaps.fst
../bin/allcaps.fst: allcaps.regex ../bin/cap-sme
	@echo
	@echo "*** Building allcaps.fst ***" ;
	@echo
	@printf "source allcaps.regex \n\
	save stack ../bin/allcaps.fst \n\
	quit \n" > ../../tmp/allcaps-sme-script
	$(XFST) < ../../tmp/allcaps-sme-script
	@rm -f ../../tmp/allcaps-sme-script



# ========================================================= #
# Building the basic parser from morphophonolgy and lexicon #
# ========================================================= #

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
	quit \n" > ../../tmp/sme-save-script
	$(LEXC) < ../../tmp/sme-save-script
	@rm -f ../../tmp/sme-save-script

# The fourth goal is to build twol-sme.bin
# This goal depends on twol-sme.txt

twol-sme.bin: ../bin/twol-sme.bin
../bin/twol-sme.bin: twol-sme.txt
	@echo
	@echo "*** Building twol-sme.bin ***" ;
	@echo
	@printf "read-grammar twol-sme.txt \n\
	compile \n\
	save-binary ../bin/twol-sme.bin \n\
	quit \n" > ../../tmp/twol-sme-script
	$(TWOLC) < ../../tmp/twol-sme-script
	@rm -f ../../tmp/twol-sme-script



# =========================== #
# Building preprocessor files #
# =========================== #

# We want to make a parser with tags for parsing. 
# In order to get that we make a tag modifier

dis-tag.fst: ../bin/dis-tag.fst
../bin/dis-tag.fst: dis-tag.txt
	@echo
	@echo "*** Building the tag manipulator dis-tag.fst ***" ;
	@echo
	@printf "source dis-tag.txt \n\
	save stack ../bin/dis-tag.fst \n\
	quit \n" > ../../tmp/dis-tag-sme-script
	$(XFST) < ../../tmp/dis-tag-sme-script
	@rm -f ../../tmp/dis-tag-sme-script


# Here we include a preprocessor.
# This goal depends on tok.txt

#tok.fst: ../bin/tok.fst 
#../bin/tok.fst: tok.txt
#	@echo
#	@echo "*** Building the tokenizer tok.fst ***" ;
#	@echo
#	@printf "source tok.txt \n\
#	save stack ../bin/tok.fst \n\
#	quit \n" > ../../tmp/tok-sme-script
#	$(XFST) < ../../tmp/tok-sme-script
#	@rm -f ../../tmp/tok-sme-script


abbr.txt: ../bin/abbr.txt
../bin/abbr.txt: ../../script/abbr-extract abbr-sme-lex.txt \
		propernoun-sme-lex.txt closed-sme-lex.txt adv-sme-lex.txt \
		noun-sme-lex.txt sme-num.txt
	@echo
	@echo "*** Extracting abbreviations from abbr-sme-lex.txt to abbr.txt ***" ;
	@echo
	@perl ../../script/abbr-extract \
		--abbr_lex=abbr-sme-lex.txt \
		--lex=propernoun-sme-lex.txt,closed-sme-lex.txt,adv-sme-lex.txt,noun-sme-lex.txt,sme-num.txt \
		--output=../bin/abbr.txt

BINDIR := $(shell pwd | sed -e s/src/bin/)

cap-sme: ../bin/cap-sme
../bin/cap-sme:
	@echo
	@echo "*** Generating cap-sme ***";
	@echo
	@printf "analyzer ${BINDIR}/sme.fst\n\
	allcaps ${BINDIR}/allcaps.fst\n\n\
	allcaps analyzer \n" > $@


foreign.fst: ../bin/foreign.fst 
../bin/foreign.fst: ../bin/old-foreign.fst ../bin/new-foreign.fst
	@echo
	@echo "*** Building a transducer for foreign words ***" ;
	@echo
	@printf "load stack ../bin/old-foreign.fst \n\
	load stack ../bin/new-foreign.fst  \n\
	union net \n\
	save stack ../bin/foreign.fst \n\
	quit \n" > ../../tmp/foreign-sme-script
	$(XFST) < ../../tmp/foreign-sme-script
	@rm -f ../../tmp/foreign-sme-script

foreign.fst: ../bin/new-foreign.fst 
../bin/new-foreign.fst: ../../script/new-foreign.txt
	@echo
	@echo "*** Our transducer for new foreign words ***" ;
	@echo
	@printf "read text < ../../script/new-foreign.txt \n\
	save stack ../bin/new-foreign.fst \n\
	quit \n" > ../../tmp/new-foreign-sme-script
	$(XFST) < ../../tmp/new-foreign-sme-script
	@rm -f ../../tmp/new-foreign-sme-script

foreign.fst: ../bin/old-foreign.fst 
../bin/old-foreign.fst: ../../script/old-foreign.txt
	@echo
	@echo "*** Our ready-built transducer for foreign words ***" ;
	@echo
	@printf "read text < ../../script/old-foreign.txt \n\
	save stack ../bin/old-foreign.fst \n\
	quit \n" > ../../tmp/old-foreign-sme-script
	$(XFST) < ../../tmp/old-foreign-sme-script
	@rm -f ../../tmp/old-foreign-sme-script


# ========== #
# make clean #
# ========== #

# "make clean" is there to remove the binary files at will.

clean:
	@rm -f ../bin/*.fst ../bin/*.save ../bin/*.bin ../bin/abbr.txt




