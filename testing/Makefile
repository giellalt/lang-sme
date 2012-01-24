SHELL = /bin/sh
#!/usr/bin/make
#
# This is a makefile to automatise most of the testing.
# It is language independent within the framework of the Sámi language
# technology project. See further user documentation (and technical as well)
# in $CVSROOT/gt/doc/ling/docu-testing.html

# VARIABLE DEFINITIONS
# ====================

# Tools used when compiling
XFST = xfst -utf8

# Where all the perl scripts are:
BINDIR = ../../script/testing

# Directory where all the compiled fst's are:
FSTDIR = ../bin

DIALOGUE = GG

# Directory for the source files (which compile into fst's):
# Changed this to point into the directory where the common makefile is:
SRCDIR = ../../

# The temp directory:
TEMP = ../../tmp

# We define the 
PARATYPE=default

# The temp directories for the generated paradigms:
GEN_TMP = Gen_tmp
PARA_TMP = $(PARATYPE)

TYPEPREF=

ifeq ($(strip $(PARATYPE)),dict)
TYPEPREF = dict-
endif

ifeq ($(strip $(PARATYPE)),oahpa)
TYPEPREF = oahpa-
endif

# This variable is holding the filename of the save file:
# (makes the Makefile truly language independent for
# the Sami languages)
SAVEFILE = $(wildcard $(FSTDIR)/ism?-norm.fst)
#SAVEFILE = $(wildcard $(FSTDIR)/ism?-$(DIALOGUE).restr.fst)

SAVEFILE = $(wildcard $(FSTDIR)/$(TYPEPREF)is??-norm.fst)

 The savetarget is derived from the savefile:
SAVETARGET=`basename $(SAVEFILE)`

# Where to find the paradigm codes:
codesdir=codes/$(PARATYPE)

# Copied from old LS makefile:
# Bond, James Bond
UMASK=@umask 007

# Empty variable to be overridden by the user when
# generating paradigms:
WORD =

# These variables define  the relationship between the source files
# and the final output files (the reports), such that one can con-
# struct a list of targets for the main target
NGenFiles := $(patsubst %.txt,%.greport,$(wildcard n-*.txt))
NAnaFiles := $(patsubst %.txt,%.areport,$(wildcard n-*.txt))
VGenFiles := $(patsubst %.txt,%.greport,$(wildcard v-*.txt))
VAnaFiles := $(patsubst %.txt,%.areport,$(wildcard v-*.txt))
AGenFiles := $(patsubst %.txt,%.greport,$(wildcard a-*.txt))
AAnaFiles := $(patsubst %.txt,%.areport,$(wildcard a-*.txt))


# MAJOR TARGETS, HOUSEKEEPING TARGETS
# ===================================

# Default target:
# Remove the comments in front of the verb and adjective
# targets when you have codes and test cases for them
.PHONY: all
all: n-g.summary \
	 n-a.summary \
	 v-g.summary \
	 v-a.summary \
	 num-a.summary \
	 num-g.summary
#	 a-g.summary \
#	 a-a.summary

# If you only want to test nouns:
.PHONY: all-n
all-n: n-g.summary n-a.summary

# If you only want to test verbs:
.PHONY: all-v
all-v: v-g.summary v-a.summary

# If you only want to test adjectives:
.PHONY: all-a
all-a: a-g.summary a-a.summary

# If you only want to test numerals:
.PHONY: all-num
all-num: num-g.summary num-a.summary

# If you only want to test verbal generation, use v-g.summary
# as target. Etc. for the other cases. And do you only want to
# test a specific word or inflection class, type the name of
# the file containing the infl. word, but replace the suffix
# .txt with .greport for generation, and .areport for analysis.

# Clean up all the mess created during a test pass, to prepare for new tests:
#		  *.tgz	\	# just to remove archive files used for file transfering
#		  *~		# to remove backup copies that may clutter the directory
.PHONY: clean
clean:
	@echo
	@echo "*** Now deleting ALL the generated files ***"
	@echo
	@rm -f *.testbase \
		  *.gtest \
		  *.atest \
		  *.gfacit \
		  *.afacit \
		  *.greport \
		  *.areport \
		  *.gresult \
		  *.aresult \
		  *.summary \
		  *.ptest \
#		  paradigm* \
		  *.tgz	\
		  *~ \
		  *.in \
		  *.out \
		  $(TEMP)/*test-script
	@rm -f a*.xml
	@rm -f b*.xml
	@rm -f c*.xml
	@rm -f č*.xml
	@rm -f d*.xml
	@rm -f e*.xml
	@rm -f f*.xml
	@rm -f g*.xml
	@rm -f h*.xml
	@rm -f i*.xml
	@rm -f j*.xml
	@rm -f k*.xml
	@rm -f l*.xml
	@rm -f m*.xml
	@rm -f n*.xml
	@rm -f o*.xml
	@rm -f p*.xml
	@rm -f r*.xml
	@rm -f s*.xml
	@rm -f t*.xml
	@rm -f u*.xml
	@rm -f v*.xml
	@rm -f *.xml
	@rm -f a*.paradigm
	@rm -f b*.paradigm
	@rm -f c*.paradigm
	@rm -f č*.paradigm
	@rm -f d*.paradigm
	@rm -f e*.paradigm
	@rm -f f*.paradigm
	@rm -f g*.paradigm
	@rm -f h*.paradigm
	@rm -f i*.paradigm
	@rm -f j*.paradigm
	@rm -f k*.paradigm
	@rm -f l*.paradigm
	@rm -f m*.paradigm
	@rm -f n*.paradigm
	@rm -f o*.paradigm
	@rm -f p*.paradigm
	@rm -f r*.paradigm
	@rm -f s*.paradigm
	@rm -f t*.paradigm
	@rm -f u*.paradigm
	@rm -f v*.paradigm
	@rm -f *.paradigm

.PHONY: almost-clean
almost-clean:
	@echo
	@echo "*** Now deleting all generated files but the summary & parad. files ***"
	@echo
	@rm -f *.testbase \
		  *.gtest \
		  *.atest \
		  *.gfacit \
		  *.afacit \
		  *.greport \
		  *.areport \
		  *.gresult \
		  *.aresult \
		  *.ptest \
		  *.tgz	\
		  *~ \
		  *.in \
		  *.out \
		  $(TEMP)/*test-script


# POS SPECIFIC SECTIONS
# =====================

# NOUNS
# =====

# Create all the noun test file bases:
n-%.testbase: n-%.txt $(codesdir)/n-codes.txt
	@echo
	@echo "*** Creating the test base for n-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/n-codes.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
n-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
n-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
n-para.ptest: $(codesdir)/n-codes.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: n-paradigm
n-paradigm: n-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@if [ ! -d "$(GEN_TMP)/$(PARA_TMP)/" ]; then mkdir -p "$(GEN_TMP)/$(PARA_TMP)"; fi
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_n.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_n.paradigm


# VERBS
# =====

# Create all the verb test file bases:
v-%.testbase: v-%.txt $(codesdir)/v-codes.txt.txt
	@echo
	@echo "*** Creating the test base for v-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/v-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports:
v-g.summary: $(VGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All verb word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
v-a.summary: $(VAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All verb word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create verb paradigm generation input file:
v-para.ptest: $(codesdir)/v-codes.txt.txt
	@echo
	@echo "*** Creating the verb paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
v-paradigm: v-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_v.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_v.paradigm


# ADJECTIVES
# ==========

# Create all the adjective test file bases:
a-%.testbase: a-%.txt $(codesdir)/a-codes.txt.txt
	@echo
	@echo "*** Creating the test base for a-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/a-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports:
a-g.summary: $(AGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
a-a.summary: $(AAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create adjective paradigm generation input file:
a-para.ptest: $(codesdir)/a-codes.txt.txt
	@echo
	@echo "*** Creating the adjective paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
a-paradigm: a-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_a.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_a.paradigm


# NUMERALS
# ========

# Create all the noun test file bases:
num-%.testbase: num-%.txt $(codesdir)/num-codes.txt.txt
	@echo
	@echo "*** Creating the test base for num-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/num-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
num-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
num-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
num-para.ptest: $(codesdir)/num-codes.txt.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: num-paradigm
num-paradigm: num-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_num.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_num.paradigm


# PROPER NOUNS
# ============

# Create all the proper noun test file bases:
prop-%.testbase: prop-%.txt $(codesdir)/prop-codes.txt.txt
	@echo
	@echo "*** Creating the test base for prop-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/prop-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
prop-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
prop-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
prop-para.ptest: $(codesdir)/prop-codes.txt.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: prop-paradigm
prop-paradigm: prop-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_prop.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_prop.paradigm


# ACTOR NOUNS
# ============

# Create all the actor noun test file bases:
actor-%.testbase: actor-%.txt $(codesdir)/actor-codes.txt.txt
	@echo
	@echo "*** Creating the test base for actor-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/actor-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
actor-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
actor-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
actor-para.ptest: $(codesdir)/actor-codes.txt.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: actor-paradigm
actor-paradigm: actor-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_actor.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_actor.paradigm

# G3 NOUNS
# ============

# Create all the G3 noun test file bases:
g3-%.testbase: g3-%.txt $(codesdir)/g3-codes.txt.txt
	@echo
	@echo "*** Creating the test base for g3-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/g3-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
g3-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
g3-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
g3-para.ptest: $(codesdir)/g3-codes.txt.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: g3-paradigm
g3-paradigm: g3-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_g3.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_g3.paradigm


# pron indef
# ============

# Create all the pron test file bases:
pron-%.testbase:pron-%.txt $(codesdir)/pronIndef-codes.txt.txt
	@echo
	@echo "*** Creating the test base for pron-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/pronIndef-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
pron-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
pron-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
pron-para.ptest: $(codesdir)/pronIndef-codes.txt.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: pron-paradigm
pron-paradigm: pron-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_pron.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_pron.paradigm

# npl NOUNS
# ============

# Create all the npl noun test file bases:
npl-%.testbase: npl-%.txt $(codesdir)/npl-codes.txt.txt
	@echo
	@echo "*** Creating the test base for npl-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl $(codesdir)/npl-codes.txt.txt $< > $@
	@chmod 660 $@

# Finally, we concatenate all *.greports
npl-g.summary: $(NGenFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form generation testing is done.      ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Finally, we concatenate all *.areports:
npl-a.summary: $(NAnaFiles)
	@cat $^ > $@
	@echo
	@echo "*** All noun word form analysis testing is done.        ***"
	@echo "*** The concatenated reports are stored in $@. ***"
	@echo
#	@less $@

# Create noun paradigm generation input file:
npl-para.ptest: $(codesdir)/npl-codes.txt.txt
	@echo
	@echo "*** Creating the noun paradigm input file for '$(WORD)' ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNword.pl $< $(WORD) > $@
	@chmod 660 $@

# Paradigm generation:
.PHONY: npl-paradigm
npl-paradigm: npl-para.ptest savefile
	@echo
	@echo "*** Running the paradigm generator for '$(WORD)' ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$@-gtest-script
	$(XFST) < $(TEMP)/$@-gtest-script > $(GEN_TMP)/$(PARA_TMP)/$(WORD)_npl.paradigm
	@rm -f $(TEMP)/$@-gtest-script
	@rm -f $<
#	@less $(GEN_TMP)/$(PARA_TMP)/$(WORD)_npl.paradigm



# POS-independent parts:
# ======================

# Make sure there is an available smX.save in the parallel bin directory:
savefile:
	@cd $(SRCDIR)/ && $(MAKE) $(SAVETARGET) TARGET=sme
#	@cd $(SRCDIR)/ && $(MAKE) ifst-restr TARGET=sme
#	@cd $(SRCDIR)/ && $(MAKE) ifst TARGET=sme
# Harmonize the choice here with the choice of SAVEFILE at appr line 30

# Word form generation:
# ---------------------

# Make test cases for word form generation tests,
# based on the test file bases:
%.gtest: %.testbase
	@echo
	@echo "*** Creating test cases for word form generation for $*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-gen-test.pl $< > $@
	@chmod 660 $@

# Make facit files containing the expected output from the
# word form generation test run:
%.gfacit: %.testbase
	@echo
	@echo "*** Creating facit file for word form generation for $*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-gen-test-facit.pl $< > $@
	@chmod 660 $@

# Here we run the actual generation test:
%.gresult: %.gtest savefile
	@echo
	@echo "*** Running the word form generator test for $*.txt ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply up < $< \n\
	quit \n" > $(TEMP)/$*-gtest-script
	$(XFST) < $(TEMP)/$*-gtest-script > $@
	@rm -f $(TEMP)/$*-gtest-script

# Then we compare with the facit, and report any differences:
%.greport: %.gresult %.gfacit
	@echo
	@echo "*** Diffing the test result and the facit file for   ***"
	@echo "*** word form generation for $*.txt ***"
	@echo "*** \"Error 1 (ignored)\" means that there were diffs. ***"
	@echo
	@rm -f $@
	-$(UMASK) && \
	diff --side-by-side --width=70 $< $*.gfacit > $@
	@chmod 660 $@


# Word form analysis:
# -------------------

# First, create the needed test file
# NB! The sorting specified does not work completely as intended!
# This will lead to small differences between the facit file and
# the analysis output. This happens when one input string gives
# more than one analysis. The expected output is according to the
# order in the inflection lexicon, but the tags in the facit file
# are sorted alphabetically (due to the way sorting is performed -
# there is no way to tell GNU sort to ONLY sort on a specified key).
# For a completely satisfactory result we need a different solution.
# The present solution will have to be good enough for now.
%.atest: %.testbase
	@echo
	@echo "*** Creating test cases for word form analysis for $*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-ana-test.pl $< \
	| sort -t '\t' -k 1 | cut -f 1 | uniq > $@
	@chmod 660 $@

# Make facit files containing the expected output from the
# word form analysis test run:
%.afacit: %.testbase
	@echo
	@echo "*** Creating facit file for word form analysis for $*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-ana-test.pl $< \
	| sort -t '\t' -k 1 | cut -f 2 > $@
	@chmod 660 $@

# Here we run the actual analysis test:
%.aresult: %.atest savefile
	@echo
	@echo "*** Running the word form analysis test ***"
	@echo
	@printf "load $(SAVEFILE) \n\
	apply down < $< \n\
	quit \n" > $(TEMP)/$*-atest-script
	$(XFST) < $(TEMP)/$*-atest-script > $@
	@rm -f $(TEMP)/$*-atest-script

# Finally, we compare with the facit, and report any differences:
# Due to the sorting problems mentioned above, there will always (?)
# be (small) differences.
%.areport: %.aresult %.afacit
	@echo
	@echo "*** Diffing the test result and the facit file for ***"
	@echo "*** word form analysis for $*.txt       ***"
	@echo "*** \"Error 1 (ignored)\" means that there were diffs.   ***"
	@echo
	-@diff --side-by-side --width=70 $< $*.afacit > $@


# TWOL-testing :
# ==============

# Usage:
# make twol-test (extracts the test words from src/twol-sme.txt, and runs them
#                 through both the normative and descriptive twols)
# make twol-pos  (tests for the positive test pairs, output to twol-pos.out)
# make twol-neg  (tests for the positive test pairs, output to twol-neg.out)
# make twol-test FILE=filename.txt (test for pairs in filename.txt)
# make twol      (recompiles the twol binaries when the twol rules are changed)

TWOLC = twolc
TYPE = pos
FILEPOS = twol-pos.in
FILENEG = twol-neg.in
FILE = $(FILEPOS)
M4 = m4
M4FLAGS = 


twol-extract: ../src/twol-sme.txt
	@echo
	@echo "*** Extracting twol tests ***"
	@echo
	@grep '^!€' $< > $(FILEPOS)
	@grep '^!$$' $< > $(FILENEG)
	@touch twol-pos.out
	@touch twol-neg.out

twol-test: twol-test-desc twol-test-norm
	diff -s twol-$(PARATYPE)-desc.out twol-$(PARATYPE)-norm.out

twol-test-desc: twol-desc twol-extract
	@echo
	@echo "*** Testing descriptive twolc rules ***"
	@echo
	@printf "install-binary ../bin/twol-sme-descriptive.bin \n\
	pair-test-file $(FILE) twol-$(PARATYPE)-desc.out \n\
	quit \n" > $(TEMP)/twol-test-desc-script
	$(TWOLC) < $(TEMP)/twol-test-desc-script
	@rm -f     $(TEMP)/twol-test-desc-script

twol-test-norm: twol-norm twol-extract
	@echo
	@echo "*** Testing normative twolc rules ***"
	@echo
	@printf "install-binary ../bin/twol-sme.bin \n\
	pair-test-file $(FILE) twol-$(PARATYPE)-norm.out \n\
	quit \n" > $(TEMP)/twol-test-norm-script
	$(TWOLC) < $(TEMP)/twol-test-norm-script
	@rm -f     $(TEMP)/twol-test-norm-script


# Make sure there are up-to-date twol binaries:
twol: twol-desc twol-norm
twol-desc:
	@cd $(SRCDIR)/ && $(MAKE) TARGET=sme twol
twol-norm:
	@cd $(SRCDIR)/ && $(MAKE) TARGET=sme twol


twol-pos: TYPE=pos
twol-pos: FILE=$(FILEPOS)
twol-pos: twol-test

twol-neg: TYPE=neg
twol-neg: FILE=$(FILENEG)
twol-neg: twol-test

# This doesn't work, because both twol-pos and twol-neg call twol-test
twol-both: twol-pos twol-neg
