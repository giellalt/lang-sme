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


include $(top_srcdir)/am-shared/tools-grammarcheckers-dir-include.am
