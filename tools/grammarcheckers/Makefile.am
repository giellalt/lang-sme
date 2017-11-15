## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

SUBDIRS = filters .

# If valency is used, define it here:
GIELLA_GC_VALENCY=valency.bin

blanktagger.hfst: blanktagger.xfst
	hfst-regexp2fst --disjunct -i $< -o $@.tmp
	hfst-fst2fst -O -i $@.tmp -o $@
	rm $@.tmp


# If there are additional, language specific files used in the GC archive,
# specify here:
LOCAL_GC_ZIP_FILES=

# Do not edit below here:
include $(top_srcdir)/am-shared/tools-grammarcheckers-dir-include.am
