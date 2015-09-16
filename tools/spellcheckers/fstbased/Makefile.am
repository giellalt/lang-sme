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
ENABLE_CORPUS_WEIGHTS=no

### BEGIN: Local build rules: *.hfst: *.tmp.hfst ###

#### END: Local build rules: *.hfst: *.tmp.hfst ####

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

include $(top_srcdir)/am-shared/tools-spellcheckers-fstbased-dir-include.am
