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

# Set this variable to point to generated lexc source files, if any:
GENRSRCS:=$(wildcard $(top_builddir)/src/morphology/generated_files/smi-$(GTLANG)-*.lexc)

tokeniser-disamb-gt-desc.pmhfst: tokeniser-disamb-gt-desc.pmscript relabelled-analyser-disamb-gt-desc.hfst
	$(AM_V_GEN)hfst-pmatch2fst < $< > $@

relabelled-analyser-disamb-gt-desc.hfst: analyser-disamb-gt-desc.hfst relabeller.hfst
	$(AM_V_GEN)hfst-substitute -f '@P.Pmatch.Loc@' -T relabeller.hfst $< -o $@

relabeller.hfst:
	$(AM_V_GEN)printf '0\t1\t@0@\t@PMATCH_INPUT_MARK@\n1\n' | hfst-txt2fst -e '@0@' -o $@

####### Other targets: ###########
clean-local:
	-rm -f *.hfst *.xfst abbr.txt *.pmhfst

include $(top_srcdir)/am-shared/tools-preprocess-dir-include.am
