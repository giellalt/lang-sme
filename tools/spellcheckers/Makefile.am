## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# Subdirs in build order:
SUBDIRS = filters weights neural . test

# Temporary

analyser.default.hfst: analyser-desktopspeller-gt-norm.hfst
	hfst-fst2fst -f olw -i $< -o $@

# end temporar
# # end temporaryy

include $(srcdir)/Makefile.mod-spellcheckers.am
include $(srcdir)/Makefile.mod-fstbased.am
include $(srcdir)/Makefile.mod-desktop.am
include $(srcdir)/Makefile.mod-desktop-hfst.am
include $(srcdir)/Makefile.mod-mobile.am
include $(srcdir)/Makefile.mod-mobile-hfst.am
include $(top_srcdir)/../giella-core/am-shared/tools-spellcheckers-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
