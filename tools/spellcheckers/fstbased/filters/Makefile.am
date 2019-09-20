## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

# List any local additions here:
GT_LOCAL_FSTSPELLER_FILTER_SRCS=\
	remove-Use_Minus_PLX-tags.regex

# Source files copied from:
# 	src/filters/
# OR from:
# 	$(GIELLA_SHARED)/all_langs/tools/spellcheckers/fstbased/filters
GT_LOCAL_COPY_FILTER_SRCS=\
	remove-illegal-derivation-strings-flagbased.regex \
	block-illegal_compound-strings.regex    \
	insert-default-compounding-tags.regex   \
	insert-default_left_compounding-tags.regex \
	split-CmpN-tags.regex \
	convert_to_flags-CmpNP-tags.regex \
	split-CmpNP-tags.regex \
	rename-POS_before_Der-tags.regex

# Only build these things if speller fst's are enabled:
if WANT_SPELLERS

# List generated regexes here:
GENERATED_REGEXES=

endif # WANT_SPELLERS

# Add the build code of local additions here:

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

####### Other targets: ###########
clean-local:
	-rm -f *.hfst *.xfst $(GT_LOCAL_COPY_FILTER_SRCS)

include $(top_srcdir)/am-shared/tools-spellcheckers-fstbased-filters-dir-include.am
