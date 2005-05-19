# This is a makefile that builds the Northern Sami morphological parser
# *****************************************************************


# =============================== #
# Variable definitions		  #
# =============================== #

# Tools used when compiling the transducers
XFST = xfst -utf8
TWOLC = twolc -utf8
LEXC =  lexc -utf8

SOURCEFILES = sme-lex.txt adj-sme-lex.txt \
	adv-sme-lex.txt noun-sme-lex.txt verb-sme-lex.txt \
	closed-sme-lex.txt pp-sme-lex.txt acro-sme-lex.txt \
	abbr-sme-lex.txt propernoun-sme-lex.txt punct-sme-lex.txt

NONRECFILES := $(patsubst %.txt,%.nonrec,$(SOURCEFILES))


# =============================== #
# Building the last file isme.fst # 
# =============================== #


# The ultimate goal is to build isme.fst, the generator
# This goal depends on sme.save being up to date.

isme.fst: ../bin/isme.fst
../bin/isme.fst: ../bin/pos-sme.fst ../bin/n-sme.fst ../bin/s-sme.fst \
	../bin/sme.save ../int/allcaps.fst ../bin/n-sme.fst \
	../int/caseconv.fst ../bin/d-sme.fst  ../bin/guess-sme \
	../bin/abbr.txt ../bin/cap-sme ../bin/foreign.fst ../bin/typos.fst \
	../int/typoslist.txt ../int/tag-not-save.fst
	@echo
	@echo "*** Building the inverse isme.fst ***"
	@echo
	@printf "read regex [[@\"../int/tag-not-save.fst\"] .o. \
	[@\"../bin/sme.save\"]] ; \n\
	invert net \n\
	save stack ../bin/isme.fst \n\
	quit \n" > ../../tmp/isme-fst-script
	$(XFST) < ../../tmp/isme-fst-script
	@rm -f ../../tmp/isme-fst-script

#	@printf "read regex [[0 <- %+TV, 0 <- %+IV ] .o. @\"../bin/sme.save\"] ; \n\
#	invert net \n\
#	save stack ../bin/isme.fst \n\
#	quit \n" > ../../tmp/isme-fst-script
#	$(XFST) < ../../tmp/isme-fst-script
#	@rm -f ../../tmp/isme-fst-script

#	Original:
#	@printf "load ../bin/sme.save \n\
#	invert net \n\
#	save stack ../bin/isme.fst \n\
#	quit \n" > ../../tmp/isme-fst-script
#	$(XFST) < ../../tmp/isme-fst-script
#	@rm -f ../../tmp/isme-fst-script





# ======================================================= #
# Building different versions of the basic sme.fst tagger #
# ======================================================= #


# We want an analyzer with POS tags only. It takes the linguistic 
# sme.fst as input and gives us an alternate pos-sme.fst. 

pos-sme.fst: ../bin/pos-sme.fst
../bin/pos-sme.fst: ../bin/sme.fst ../int/tag-pos.fst
	@echo
	@echo "*** Building pos-sme.fst, sme.fst with POS tags ***"
	@echo
	@printf "read regex [[@\"../int/tag-pos.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/pos-sme.fst \n\
	quit \n" > ../../tmp/pos-sme-fst-script
	$(XFST) < ../../tmp/pos-sme-fst-script
	@rm -f ../../tmp/pos-sme-fst-script

# In order to make pos-sme.fst we need a binary tag-pos.fst
# This goal depends on tag-pos.regex. The way it
# is done is that all tags except the POS one are deleted.

tag-pos.fst: ../int/tag-pos.fst
../int/tag-pos.fst: tag-pos.regex
	@echo
	@echo "*** Building tag-pos.fst ***" ;
	@echo
	@printf "read regex < tag-pos.regex \n\
	save stack ../int/tag-pos.fst \n\
	quit \n" > ../../tmp/sme-tag-pos-script
	$(XFST) < ../../tmp/sme-tag-pos-script
	@rm -f ../../tmp/sme-tag-pos-script


# We want to delete the +TV +IV tags for the generator (and other
# tags later on?. For that we need our tag-deleter.
tag-not-save.fst: ../int/tag-not-save.fst
../int/tag-not-save.fst: tag-not-save.regex
	@echo
	@echo "*** Building tag-not-save.fst ***" ;
	@echo
	@printf "read regex < tag-not-save.regex \n\
	save stack ../int/tag-not-save.fst \n\
	quit \n" > ../../tmp/sme-tag-not-save-script
	$(XFST) < ../../tmp/sme-tag-not-save-script
	@rm -f ../../tmp/sme-tag-not-save-script


# We want an analyzer with Norwegian tags. It takes the linguistic 
# sme.fst as input and gives us an alternate n-sme.fst

n-sme.fst: ../bin/n-sme.fst
../bin/n-sme.fst: ../bin/sme.fst ../int/tag-no.fst
	@echo
	@echo "*** Building n-sme.fst, sme.fst with Norwegian tags ***"
	@echo
	@printf "read regex [[@\"../int/tag-no.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/n-sme.fst \n\
	quit \n" > ../../tmp/n-sme-fst-script
	$(XFST) < ../../tmp/n-sme-fst-script
	@rm -f ../../tmp/n-sme-fst-script


# In order to make n-sme.fst we need a binary tag-no.fst
# This goal depends on tag-no.regex

tag-no.fst: ../int/tag-no.fst
../int/tag-no.fst: tag-no.regex
	@echo
	@echo "*** Building tag-no.fst ***" ;
	@echo
	@printf "read regex < tag-no.regex \n\
	save stack ../int/tag-no.fst \n\
	quit \n" > ../../tmp/sme-tag-no-script
	$(XFST) < ../../tmp/sme-tag-no-script
	@rm -f ../../tmp/sme-tag-no-script

# We also want an analyzer with Sami tags. It takes the linguistic 
# sme.fst as input and gives us an alternate s-sme.fst

s-sme.fst: ../int/s-sme.fst
../bin/s-sme.fst: ../bin/sme.fst ../int/tag-sme.fst
	@echo
	@echo "*** Building s-sme.fst, sme.fst with Sami tags ***"
	@echo
	@printf "read regex [[@\"../int/tag-sme.fst\"] .o. \
	[@\"../bin/sme.fst\"]] ; \n\
	save stack ../bin/s-sme.fst \n\
	quit \n" > ../../tmp/s-sme-fst-script
	$(XFST) < ../../tmp/s-sme-fst-script
	@rm -f ../../tmp/s-sme-fst-script
 
# In order to make s-sme.fst we need a binary tag-no.fst
# This goal depends on tag-sme.regex

tag-sme.fst: ../int/tag-sme.fst
../int/tag-sme.fst: tag-sme.regex
	@echo
	@echo "*** Building tag-sme.fst ***" ;
	@echo
	@printf "read regex < tag-sme.regex \n\
	save stack ../int/tag-sme.fst \n\
	quit \n" > ../../tmp/tag-sme-script
	$(XFST) < ../../tmp/tag-sme-script
	@rm -f ../../tmp/tag-sme-script


g-sme.fst: ../int/g-sme.fst
../int/g-sme.fst: ../bin/sme.fst guess-script.xfst
	@echo
	@echo "*** Building g-sme.fst ***" ;
	@echo
	@printf "compile-source sme-lex.txt adj-sme-lex.txt adv-sme-lex.txt \
	noun-sme-lex.txt verb-sme-lex.txt closed-sme-lex.txt \
	pp-sme-lex.txt acro-sme-lex.txt \
	abbr-sme-lex.txt propernoun-sme-lex.txt punct-sme-lex.txt \n\
	save-source ../int/g-sme.save \n\
	quit \n" > ../../tmp/g-sme-save-script
	$(LEXC) < ../../tmp/g-sme-save-script
	@rm -f ../../tmp/g-sme-save-script

	@printf "source guess-script.xfst \n\
	save stack ../int/g-sme.fsm \n\
	quit \n" > ../../tmp/guess-sme-script
	$(XFST) < ../../tmp/guess-sme-script
	@rm -f ../../tmp/guess-sme-script

	@printf "read-source ../int/g-sme.fsm \n\
	read-rules ../int/twol-sme.bin \n\
	compose-result \n\
	save-result ../int/g-sme.fst \n\
	quit \n" > ../../tmp/g-sme-save-script
	$(LEXC) < ../../tmp/g-sme-save-script
	@rm -f ../../tmp/g-sme-save-script

	@printf "read regex @\"../int/g-sme.fst\" .o. \
	@\"../int/caseconv.fst\" ; \n\
	save stack ../int/g-sme.fst \n\
	quit \n " > ../../tmp/g-sme-fst-script
	$(XFST) < ../../tmp/g-sme-fst-script
	@rm -f ../../tmp/g-sme-fst-script



guess-sme: ../int/guess-sme
../int/guess-sme:
	@echo
	@echo "*** Generating guess-sme ***" ;
	@echo
	@printf "sme ${BINDIR}/sme.fst\n\
	guesser ${INTDIR}/g-sme.fst\n\n\
	sme \n\
	guesser \n" > $@


# Here we build d-sme.fst, the morphological tagger geared towards 
# disambiguation.

d-sme.fst: ../bin/d-sme.fst
../bin/d-sme.fst: ../bin/sme.fst ../int/dis-tag.fst
	@echo
	@echo "*** Building d-sme.fst, sme.fst w/ tags for disambiguation ***"
	@echo
	@printf "read regex [[@\"../int/dis-tag.fst\"] .o. \
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
../bin/sme.fst: ../bin/sme.save ../int/caseconv.fst \
	../int/allcaps.fst ../bin/abbr.txt ../bin/cap-sme
	@echo
	@echo "*** Building sme.fst ***" ;
	@echo
	@printf "read regex @\"../bin/sme.save\" .o. \
	@\"../int/caseconv.fst\" ; \n\
	save stack ../bin/sme.fst \n\
	quit \n" > ../../tmp/sme-fst-script
	$(XFST) < ../../tmp/sme-fst-script
	@rm -f ../../tmp/sme-fst-script






# ================================================= #
# Building auxiliary files for case conversion etc. #
# ================================================= #

# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: ../int/caseconv.fst
../int/caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../int/caseconv.fst \n\
	quit \n" > ../../tmp/caseconv-sme-script
	$(XFST) < ../../tmp/caseconv-sme-script
	@rm -f ../../tmp/caseconv-sme-script

# This goal depends on allcaps.regex

allcaps.fst: ../int/allcaps.fst
../int/allcaps.fst: allcaps.regex ../bin/cap-sme
	@echo
	@echo "*** Building allcaps.fst ***" ;
	@echo
	@printf "source allcaps.regex \n\
	save stack ../int/allcaps.fst \n\
	quit \n" > ../../tmp/allcaps-sme-script
	$(XFST) < ../../tmp/allcaps-sme-script
	@rm -f ../../tmp/allcaps-sme-script



# ========================================================= #
# Building the basic parser from morphophonolgy and lexicon #
# ========================================================= #

# The third goal is to build sme.save
# This goal depends on twol-sme.int and a bunch of lexicon files

sme.save: ../bin/sme.save
../bin/sme.save: ../int/twol-sme.bin sme-lex.txt adj-sme-lex.txt \
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
	read-rules ../int/twol-sme.bin \n\
	compose-result \n\
	save-result ../bin/sme.save \n\
	quit \n" > ../../tmp/sme-save-script
	$(LEXC) < ../../tmp/sme-save-script
	@rm -f ../../tmp/sme-save-script

# We need a variant of this third goal, to build a non-recursive sme.save
# This goal depends on twol-sme.bin and a bunch of lexicon files

nonrec-sme.save: ../int/nonrec-sme.save
../int/nonrec-sme.save: ../int/twol-sme.bin $(NONRECFILES)
	@echo
	@echo "*** Building nonrec-sme.save ***" ;
	@echo
	printf "compile-source $(NONRECFILES) \n\
	read-rules ../int/twol-sme.bin \n\
	compose-result \n\
	save-result ../int/nonrec-sme.save \n\
	quit \n" > ../../tmp/nonrec-sme-save-script
	$(LEXC) < ../../tmp/nonrec-sme-save-script
	@rm -f ../../tmp/nonrec-sme-save-script

$(NONRECFILES): $(SOURCEFILES)
	@echo
	@echo "*** Removing circular entries ***" ;
	@echo
	@grep -v '\^C\^' $< > $@

# The fourth goal is to build twol-sme.bin
# This goal depends on twol-sme.txt

twol-sme.bin: ../int/twol-sme.bin
../int/twol-sme.bin: twol-sme.txt
	@echo
	@echo "*** Building twol-sme.bin ***" ;
	@echo
	@printf "read-grammar twol-sme.txt \n\
	compile \n\
	save-binary ../int/twol-sme.bin \n\
	quit \n" > ../../tmp/twol-sme-script
	$(TWOLC) < ../../tmp/twol-sme-script
	@rm -f ../../tmp/twol-sme-script



# =========================== #
# Building preprocessor files #
# =========================== #

# We want to make a parser with tags for parsing. 
# In order to get that we make a tag modifier

dis-tag.fst: ../int/dis-tag.fst
../int/dis-tag.fst: dis-tag.txt
	@echo
	@echo "*** Building the tag manipulator dis-tag.fst ***" ;
	@echo
	@printf "source dis-tag.txt \n\
	save stack ../int/dis-tag.fst \n\
	quit \n" > ../../tmp/dis-tag-sme-script
	$(XFST) < ../../tmp/dis-tag-sme-script
	@rm -f ../../tmp/dis-tag-sme-script


# Here we include a preprocessor.
# This goal depends on tok.txt

#tok.fst: ../int/tok.fst 
#../int/tok.fst: tok.txt
#	@echo
#	@echo "*** Building the tokenizer tok.fst ***" ;
#	@echo
#	@printf "source tok.txt \n\
#	save stack ../int/tok.fst \n\
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

INTDIR := $(shell pwd | sed -e s/src/int/)

cap-sme: ../bin/cap-sme
../bin/cap-sme:
	@echo
	@echo "*** Generating cap-sme ***";
	@echo
	@printf "analyzer ${BINDIR}/sme.fst\n\
	allcaps ${INTDIR}/allcaps.fst\n\n\
	allcaps analyzer \n" > $@


foreign.fst: ../bin/foreign.fst 
../bin/foreign.fst: ../int/old-foreign.fst ../int/new-foreign.fst
	@echo
	@echo "*** Building a transducer for foreign words ***" ;
	@echo
	@printf "load stack ../int/old-foreign.fst \n\
	load stack ../int/new-foreign.fst  \n\
	union net \n\
	save stack ../bin/foreign.fst \n\
	quit \n" > ../../tmp/foreign-sme-script
	$(XFST) < ../../tmp/foreign-sme-script
	@rm -f ../../tmp/foreign-sme-script

foreign.fst: ../int/new-foreign.fst 
../int/new-foreign.fst: ../../script/new-foreign.txt
	@echo
	@echo "*** Our transducer for new foreign words ***" ;
	@echo
	@printf "read text < ../../script/new-foreign.txt \n\
	save stack ../int/new-foreign.fst \n\
	quit \n" > ../../tmp/new-foreign-sme-script
	$(XFST) < ../../tmp/new-foreign-sme-script
	@rm -f ../../tmp/new-foreign-sme-script

foreign.fst: ../int/old-foreign.fst 
../int/old-foreign.fst: ../../script/old-foreign.txt
	@echo
	@echo "*** Our ready-built transducer for foreign words ***" ;
	@echo
	@printf "read text < ../../script/old-foreign.txt \n\
	save stack ../int/old-foreign.fst \n\
	quit \n" > ../../tmp/old-foreign-sme-script
	$(XFST) < ../../tmp/old-foreign-sme-script
	@rm -f ../../tmp/old-foreign-sme-script



typos.fst: ../bin/typos.fst 
../bin/typos.fst: ../int/typoslist.txt
	@echo
	@echo "*** Our transducer for typographical errors ***" ;
	@echo
	@printf "read text < ../int/typoslist.txt \n\
	save stack ../bin/typos.fst \n\
	quit \n" > ../../tmp/typos-sme-script
	$(XFST) < ../../tmp/typos-sme-script
	@rm -f ../../tmp/typos-sme-script

typoslist.txt: ../int/typoslist.txt
../int/typoslist.txt: typos.txt
	@echo
	@echo "*** Our list of common typographical errors ***" ;
	@echo
	@cut -f1 typos.txt > ../int/typoslist.txt


# ========== #
# make clean #
# ========== #

# "make clean" is there to remove the binary files, as well as the
# temporary nonrec files, at will.

clean:
	@rm -f ../bin/*.fst ../bin/*.save ../bin/*.bin ../bin/abbr.txt *.nonrec
	@rm -f ../int/*.fst ../int/*.save ../int/*.int ../bin/abbr.txt *.nonrec

# Another clean target to remove only the temp files for making the 
# non-circular transducer:
rec-clean:
	@rm -f *.nonrec
