# This is a makefile that builds the Northern Sami morphological parser
# *****************************************************************



# =============================== #
# Building the last file isme.fst # 
# =============================== #


# The ultimate goal is to build isme.fst, the generator
# This goal depends on sme.save being up to date.

isme.fst: ../bin/isme.fst
../bin/isme.fst: ../bin/pos-sme.fst ../bin/n-sme.fst ../bin/s-sme.fst \
	../bin/sme.save ../bin/tok.fst ../bin/allcaps.fst ../bin/n-sme.fst \
	../bin/tok.fst ../bin/caseconv.fst ../bin/d-sme.fst
	@echo
	@echo "*** Building the inverse isme.fst ***"
	@echo
	@printf "load ../bin/sme.save \n\
	invert net \n\
	save stack ../bin/isme.fst \n\
	quit \n" > ../../tmp/isme-fst-script
	@xfst < ../../tmp/isme-fst-script
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
	@xfst < ../../tmp/pos-sme-fst-script
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
	@xfst < ../../tmp/sme-tag-pos-script
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
	@xfst < ../../tmp/n-sme-fst-script
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
	@xfst < ../../tmp/sme-tag-no-script
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
	@xfst < ../../tmp/s-sme-fst-script
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
	@xfst < ../../tmp/tag-sme-script
	@rm -f ../../tmp/tag-sme-script



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
	@xfst < ../../tmp/d-sme-fst-script
	@rm -f ../../tmp/d-sme-fst-script


# ================================= #
# Building the basic tagger sme.fst #
# ================================= #

# Here we build sme.fst, the core morphological tagger
# It takes sme.save as input and adds the caseconv fst in order to 
# handle initial capitals.

sme.fst: ../bin/sme.fst
../bin/sme.fst: ../bin/sme.save ../bin/caseconv.fst ../bin/allcaps.fst \
	../bin/tok.fst
	@echo
	@echo "*** Building sme.fst ***" ;
	@echo
	@printf "read regex @\"../bin/sme.save\" .o. \
	@\"../bin/caseconv.fst\" ; \n\
	save stack ../bin/sme.fst \n\
	quit \n" > ../../tmp/sme-fst-script
	@xfst < ../../tmp/sme-fst-script
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
	@xfst < ../../tmp/caseconv-sme-script
	@rm -f ../../tmp/caseconv-sme-script

# This goal depends on allcaps.regex

allcaps.fst: ../bin/allcaps.fst
../bin/allcaps.fst: allcaps.regex
	@echo
	@echo "*** Building allcaps.fst ***" ;
	@echo
	@printf "source allcaps.regex \n\
	save stack ../bin/allcaps.fst \n\
	quit \n" > ../../tmp/allcaps-sme-script
	@xfst < ../../tmp/allcaps-sme-script
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
	@lexc < ../../tmp/sme-save-script
	@rm -f ../../tmp/sme-save-script

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
	quit \n" > ../../tmp/twol-sme-script
	@twolc < ../../tmp/twol-sme-script
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
	@xfst < ../../tmp/dis-tag-sme-script
	@rm -f ../../tmp/dis-tag-sme-script


# Here we include a preprocessor.
# This goal depends on tok.txt

tok.fst: ../bin/tok.fst 
../bin/tok.fst: tok.txt
	@echo
	@echo "*** Building the tokenizer tok.fst ***" ;
	@echo
	@printf "source tok.txt \n\
	save stack ../bin/tok.fst \n\
	quit \n" > ../../tmp/tok-sme-script
	@xfst < ../../tmp/tok-sme-script
	@rm -f ../../tmp/tok-sme-script



# ========== #
# make clean #
# ========== #

# "make clean" is there to remove the binary files at will.

clean:
	@rm -f ../bin/*.fst ../bin/*.save ../bin/*.bin




