## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

SUBDIRS = filters .

# If valency is used, define it here:
GIELLA_GC_VALENCY=valency.bin

blanktagger.hfst: blanktagger.xfst
	$(AM_V_RGX2FST)$(HFST_REGEXP2FST) --disjunct -i $< -o $@.tmp
	$(AM_V_FST2FST)$(HFST_FST2FST) -O -i $@.tmp -o $@
	$(AM_V_at)rm $@.tmp


# If there are additional, language specific files used in the GC archive,
# specify here:
LOCAL_GC_ZIP_FILES=blanktagger.hfst

# Do not edit below here:
include $(top_srcdir)/am-shared/tools-grammarcheckers-dir-include.am
