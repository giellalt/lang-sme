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

# Define variable before using it:
GT_FILTER_TARGETS=

# List any local additions here:
GT_FILTER_LOCAL_SRCS=

# Add the target of local additions here:
# HFST targets here:
if CAN_HFST
GT_FILTER_TARGETS+=\
					remove-rel_focus-strings.hfst \
				    remove-illegal-derivation-strings.hfst \
					remove-OLang_ENG-strings.hfst    \
					remove-OLang_FIN-strings.hfst    \
					remove-OLang_NNO-strings.hfst    \
					remove-OLang_NOB-strings.hfst    \
					remove-OLang_SME-strings.hfst    \
					remove-OLang_SWE-strings.hfst    \
					remove-OLang_UND-strings.hfst    \
					extract-OLang_ENG-strings.hfst   \
					extract-OLang_FIN-strings.hfst   \
					extract-OLang_NNO-strings.hfst   \
					extract-OLang_NOB-strings.hfst   \
					extract-OLang_SME-strings.hfst   \
					extract-OLang_SWE-strings.hfst   \
					make-optional-allegro-tags.hfst  \
					make-optional-lang_hom-tags.hfst \
					remove-allegro-tags.hfst         \
					remove-CLB-strings.hfst          \
					remove-Prop-strings.hfst         \
					remove-RCmpnd-strings.hfst       \
					remove-hyphenated-strings.hfst   \
					remove-infl_boundary-marks.hfst  \
					remove-nonfirst_infl_boundary-marks.hfst \
					remove-lang_hom-tags.hfst        \
					remove-mwe-strings.hfst          \
					remove-mwe-tags.hfst             \
					reorder-subpos-tags.$(GTLANG).hfst
endif

# And Xerox targets here:
if CAN_XFST
GT_FILTER_TARGETS+=\
					remove-rel_focus-strings.xfst \
				    remove-illegal-derivation-strings.xfst \
					remove-OLang_ENG-strings.xfst    \
					remove-OLang_FIN-strings.xfst    \
					remove-OLang_NNO-strings.xfst    \
					remove-OLang_NOB-strings.xfst    \
					remove-OLang_SME-strings.xfst    \
					remove-OLang_SWE-strings.xfst    \
					remove-OLang_UND-strings.xfst    \
					extract-OLang_ENG-strings.xfst   \
					extract-OLang_FIN-strings.xfst   \
					extract-OLang_NNO-strings.xfst   \
					extract-OLang_NOB-strings.xfst   \
					extract-OLang_SME-strings.xfst   \
					extract-OLang_SWE-strings.xfst   \
					make-optional-allegro-tags.xfst  \
					make-optional-lang_hom-tags.xfst \
					remove-allegro-tags.xfst         \
					remove-CLB-strings.xfst          \
					remove-Prop-strings.xfst         \
					remove-RCmpnd-strings.xfst       \
					remove-hyphenated-strings.xfst   \
					remove-infl_boundary-marks.xfst  \
					remove-nonfirst_infl_boundary-marks.xfst \
					remove-lang_hom-tags.xfst        \
					remove-mwe-strings.xfst          \
					remove-mwe-tags.xfst             \
					reorder-subpos-tags.$(GTLANG).xfst
endif

include $(top_srcdir)/am-shared/src-filters-dir-include.am

# vim: set ft=automake:
