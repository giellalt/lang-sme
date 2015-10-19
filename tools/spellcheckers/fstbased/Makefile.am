## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# The current dir must be built after the filters, but before the rest.
SUBDIRS = weighting filters . hfst foma

# Name of speller corpus sans suffix:
CORPUSNAME=spellercorpus

# Specify whether to use corpus weights for frequency ranking of suggestions.
# Make sure you test the suggestion quality both before and after changing this
# setting.
ENABLE_CORPUS_WEIGHTS=yes

# Number of lines (= word forms) in the sort-uniqued corpus. If empty the whole
# corpus will be used. Too large a corpus can make the acceptor fst unneccessary
# big without improving the suggestion quality in a noticable way. A starting
# point could be to only include word forms occurring at least twice. Try
# different values to find the best compromise between fst size and suggestion
# quality.
CORPUS_SIZE=29090

### BEGIN: Local build rules: *.hfst: *.tmp.hfst ###

# Remove ungrammatical compounds by turning tags into flags:
# 1. Insert tags for default compounding
# 2. Split multiple tags into separate paths
# 3. Convert tags to flags
# 4. Make flags two-sided
generator-fstspeller-gt-norm-comp_restricted.hfst: \
		generator-fstspeller-gt-norm-comp_restricted.tmp.hfst \
		filters/insert-default-compounding-tags.hfst \
		filters/block-illegal_compound-strings.hfst  \
		filters/remove-Use_Minus_PLX-tags.hfst       \
		filters/split-CmpN-tags.hfst
	$(AM_V_HXFST)$(PRINTF) "\
		read regex                        \
			@\"filters/block-illegal_compound-strings.hfst\"  \
		.o. @\"filters/split-CmpN-tags.hfst\"                 \
		.o. @\"filters/insert-default-compounding-tags.hfst\" \
		.o. @\"filters/remove-Use_Minus_PLX-tags.hfst\"       \
		.o. @\"$<\"                                           \
		; \n\
		 twosided flag-diacritics\n\
		 save stack $@\n\
		 quit\n" | $(HFST_XFST) -p $(VERBOSITY)

# Remove improper derivations:
generator-fstspeller-gt-norm.hfst: \
		generator-fstspeller-gt-norm.tmp.hfst \
		filters/remove-illegal-derivation-strings.hfst
	$(AM_V_HXFST)$(PRINTF) "\
		set encode-weights ON \n\
		read regex \
			@\"filters/remove-illegal-derivation-strings.hfst\"  \
			.o. @\"$<\"                                       \
		; \n\
		twosided flag-diacritics\n\
		save stack $@\n\
		quit\n" | $(HFST_XFST) -p $(VERBOSITY)

#### END: Local build rules: *.hfst: *.tmp.hfst ####

include $(top_srcdir)/am-shared/tools-spellcheckers-fstbased-dir-include.am
