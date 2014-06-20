## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# Process subdirs first:
SUBDIRS = filters tagsets .

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

# We want to make semantic tags optional for the nob-targeted analyser:
analyser-mt-gt-desc.nob.hfst: analyser-mt-gt-desc.nob.tmp.hfst \
			$(top_builddir)/src/filters/make-optional-semantic-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
		@\"$(top_builddir)/src/filters/make-optional-semantic-tags.hfst\" \
   	.o. @\"$<\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		| $(HFST_INVERT) $(HFSTFLAGS) \
		| $(HFST_FST2FST) $(HFSTFLAGS) -t \
		-o $@

# We want to make semantic tags optional for the nob-targeted analyser:
analyser-mt-apertium-desc.smn.hfst: analyser-mt-apertium-desc.smn.tmp.hfst \
			filters/modify-tagset.smn.hfst
	$(HFST_INVERT) analyser-mt-apertium-desc.smn.tmp.hfst -o foo.tmp
	$(AM_V_RGX2FST)$(PRINTF) "\
		@\"filters/modify-tagset.smn.hfst\" \
   	.o. @\"foo.tmp\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		| $(HFST_INVERT) $(HFSTFLAGS) \
		| $(HFST_FST2FST) $(HFSTFLAGS) -t \
		-o $@


##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

####### Other targets: ###########

# cleaning
clean-local:
	-rm -f *.hfst *.gz *.cg3 *.bin

include $(top_srcdir)/am-shared/tools-mt-apertium-dir-include.am
