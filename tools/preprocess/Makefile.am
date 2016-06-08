## Include this file to lexc directory to build lexical automata

## Copyright (C) 2011 Samediggi

## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

########################################################
#### Add language-specific transducer targets here: ####

# Set this variable to point to generated lexc source files, if any:
GENRSRCS:=$(wildcard $(top_builddir)/src/morphology/generated_files/smi-$(GTLANG)-*.lexc)

#################################################
#### Add language-specific build rules here: ####

# ... as well as in the HFST disambiguation analyser:
analyser-disamb-gt-desc.hfst: analyser-disamb-gt-desc.tmp.hfst \
			$(top_builddir)/src/filters/remove-derivation-position-tags.hfst \
			$(top_builddir)/src/filters/rename-POS_before_Der-tags.hfst \
			$(top_builddir)/src/filters/remove-Use_Disamb-tags.hfst          \
			$(top_builddir)/src/filters/remove-Use_GC-strings.hfst \
			$(top_builddir)/src/filters/remove-Use_minus_PMatch-strings.hfst \
			$(top_builddir)/src/filters/remove-Err_SpaceCmp-strings.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex \
		    @\"$(top_builddir)/src/filters/remove-derivation-position-tags.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-Use_Disamb-tags.hfst\"          \
		.o. @\"$(top_builddir)/src/filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"$(top_builddir)/src/filters/remove-Use_minus_PMatch-strings.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-Err_SpaceCmp-strings.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-Use_GC-strings.hfst\"       \
		.o. @\"$<\" \
		;\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

# ... as well as in the HFST Grammar Checker analyser:
# (keep the Err/SpaceCmp strings here)
analyser-gramcheck-gt-desc.hfst: analyser-gramcheck-gt-desc.tmp.hfst \
			$(top_builddir)/src/filters/remove-derivation-position-tags.hfst \
			$(top_builddir)/src/filters/rename-POS_before_Der-tags.hfst      \
			$(top_builddir)/src/filters/remove-Use_Disamb-tags.hfst          \
			$(top_builddir)/src/filters/remove-Use_GC-tags.hfst              \
			$(top_builddir)/src/filters/remove-Use_minus_PMatch-strings.hfst \
			$(top_builddir)/src/filters/remove-word-boundary.hfst            \
			$(top_builddir)/src/orthography/spellrelax-with-flagtags.compose.hfst \
			$(top_builddir)/src/orthography/comprelax-with-flagtags.compose.hfst
	$(AM_V_HXFST)$(PRINTF) "\
	set encode-weights ON\n\
	read regex \
		    @\"$(top_builddir)/src/filters/remove-Use_Disamb-tags.hfst\"          \
		.o. @\"$(top_builddir)/src/filters/remove-Use_GC-tags.hfst\"              \
		.o. @\"$(top_builddir)/src/filters/remove-derivation-position-tags.hfst\" \
		.o. @\"$(top_builddir)/src/filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"$(top_builddir)/src/filters/remove-Use_minus_PMatch-strings.hfst\" \
		.o. @\"$<\"                                                               \
		.o. @\"$(top_builddir)/src/orthography/spellrelax-with-flagtags.compose.hfst\" \
		.o. @\"$(top_builddir)/src/orthography/comprelax-with-flagtags.compose.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-word-boundary.hfst\"            \
		;\n\
	twosided flag-diacritics\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)


##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

####### Other targets: ###########
clean-local:
	-rm -f *.hfst *.xfst abbr.txt *.pmhfst

include $(top_srcdir)/am-shared/tools-preprocess-dir-include.am

