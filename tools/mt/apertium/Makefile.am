## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# Process subdirs first:
SUBDIRS = filters tagsets .

##################################################################
#### Specify target languages and corresponding file names:   ####
##################################################################

# Earlier, we pecified the list of target languages and their 
# corresponding Apertium directory names in these two variables. 
# Now, we only use und (the unspecified language tag).
APERTIUM_TARGET_LANGS=und
APERTIUM_TARGET_LANG_NAME=apertium-und

##################################################################
#### Specify CG3 source files, main and included ones:        ####
##################################################################
APERTIUM_CG_SRC=disambiguation-mt-gt.cg3

APERTIUM_CG_INCLUDE_SRC=

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

# We want to make semantic tags optional for the apertium-targeted analyser:
analyser-mt-gt-desc.%.hfst: analyser-mt-gt-desc.%.tmp.hfst \
			$(top_builddir)/src/filters/make-optional-semantic-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
		@\"$(top_builddir)/src/filters/make-optional-semantic-tags.hfst\" \
   	.o. @\"$<\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --xerox-composition=ON \
		| $(HFST_INVERT) $(HFSTFLAGS) \
		| $(HFST_FST2FST) $(HFSTFLAGS) -t \
		-o $@

# We want to rename the POS tags in front of derivations:
analyser-mt-gt-desc.hfst: analyser-mt-gt-desc.tmp.hfst \
			$(top_builddir)/src/filters/remove-derivation-position-tags.hfst \
			$(top_builddir)/src/filters/rename-POS_before_Der-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
		@\"$(top_builddir)/src/filters/remove-derivation-position-tags.hfst\" \
	.o. @\"$(top_builddir)/src/filters/rename-POS_before_Der-tags.hfst\" \
   	.o. @\"$<\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --xerox-composition=ON \
		| $(HFST_INVERT) $(HFSTFLAGS) \
		| $(HFST_FST2FST) $(HFSTFLAGS) -t \
		-o $@

generator-mt-gt-norm.hfst: generator-mt-gt-norm.tmp.hfst \
			$(top_builddir)/src/filters/remove-derivation-position-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
		@\"$(top_builddir)/src/filters/remove-derivation-position-tags.hfst\" \
   	.o. @\"$<\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --xerox-composition=ON \
		| $(HFST_FST2FST) $(HFSTFLAGS) -t \
		-o $@

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

####### Other targets: ###########

# cleaning
clean-local:
	-rm -f *.hfst *.gz *.cg3 *.bin *.hfstol

include $(top_srcdir)/am-shared/tools-mt-apertium-dir-include.am
