## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# Build filters first:
SUBDIRS = filters .

#################################
### BEGIN: Local build rules: ###
#
# hyphenator-raw-gt-desc.hfst: hyphenator-raw-gt-desc.tmp.hfst

hyphenator-raw-gt-desc.hfst: \
			hyphenator-raw-gt-desc.tmp.hfst \
			filters/remove-dynamic_compound-char.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex \
		@\"$<\" \
	.o. @\"filters/remove-dynamic_compound-char.hfst\" \
	; \n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

#### END: Local build rules. ####
#################################

#### Do NOT edit below here: ####
include $(top_srcdir)/am-shared/tools-hyphenators-fstbased-dir-include.am
