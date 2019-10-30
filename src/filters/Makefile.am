## Process this file with automake to produce Makefile.in

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

#########################################################
############## BEGIN: Local modifications ###############
# List any local filter regex files here:
GIELLA_FILTER_LOCAL_REGEX_SRCS=\
					downcase_UCletters.regex                          \
					remove-norm-comp-tags.regex                       \
					make-optional-allegro-tags.regex                  \
					make-optional-coll-tags.regex                     \
					make-optional-lang_hom-tags.regex                 \
					reorder-tags.$(GTLANG).regex                      \
					rename-POS_before_Der-tags.regex                  \
					rename_optional-POS_before_Der-tags.regex         \
					remove-allegro-tags.regex                         \
					remove-lang_hom-tags.regex                        \
					remove-rel_focus-strings.regex                    \
					remove-illegal-derivation-strings.regex           \
					remove-derivation-position-tags.regex             \
					remove-Err_SpaceCmp-strings.regex                 \
					remove-UseLIA-strings.regex                       \
					remove-dynamic_compound-char.regex                \
					simplify-triple-der-borders.regex                 \
					remove-illegal-derivation-strings-flagbased.regex \
					insert-default-compounding-tags.regex             \
					insert-default_left_compounding-tags.regex        \
					block-illegal_compound-strings.regex              \
					split-CmpN-tags.regex                             \
					split-CmpNP-tags.regex                            \
					convert_to_flags-CmpNP-tags.regex                 \
					change-optionally-word_boundary_to_hyphen.regex

# List any local filter xfscript files here:
GIELLA_FILTER_LOCAL_XFSCRIPT_SRCS=

# List any local filter lexc files here:
GIELLA_FILTER_LOCAL_LEXC_SRCS=

# List any locally generated regex source files here:
GIELLA_FILTER_LOCAL_GENERATED_REGEX_SRCS=

# List any locally generated xfscript source files here:
GIELLA_FILTER_LOCAL_GENERATED_XFSCRIPT_SRCS=

# List any locally generated lexc source files here:
GIELLA_FILTER_LOCAL_GENERATED_LEXC_SRCS=

# List any additional source files here, so that they are included in the dist.
# Source files that are not directly compiled to fst's but are instead used as
# part of a local build step should be listed here.
EXTRA_SRCS=

########## Add local build rules below here: ############
all-local: change-optionally-word_boundary_to_hyphen.whfst

change-optionally-word_boundary_to_hyphen.whfst: \
		change-optionally-word_boundary_to_hyphen.hfst
	$(AM_V_REWEIGHT)$(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
		-a10000 --symbol="@C.LexComp@" --arcs-only < $< > $@

############### END: Local modifications ################
#########################################################

# Included build file, where the actual build instructions are:
include $(top_srcdir)/am-shared/src-filters-dir-include.am

# vim: set ft=automake:
