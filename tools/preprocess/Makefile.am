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

tokeniser-disamb-gt-desc.pmhfst: tokeniser-disamb-gt-desc.pmscript \
								 analyser-disamb-gt-desc.hfst \
								 withrepeats-analyser-disamb-gt-desc.hfst
	$(AM_V_GEN)hfst-pmatch2fst < $< > $@

# TODO: clean up the intermediates
space.hfst:
	$(AM_V_GEN)echo '% :"@PMATCH_INPUT_MARK@"' | hfst-regexp2fst -o $@

unmin-withrepeats-%.hfst: repeated-%.hfst %.hfst
	$(AM_V_GEN)hfst-union $^ -o $@

withrepeats-%.hfst: unmin-withrepeats-%.hfst
	$(AM_V_GEN)hfst-minimise $< -o $@

repeated-%.hfst: %.hfst space.hfst
	hfst-concatenate -1 $< -2 space.hfst -o analyser-space.hfst
	hfst-concatenate -F -1 analyser-space.hfst -2 $< -o analyser-space-analyser.hfst
	hfst-invert analyser-space-analyser.hfst -o generator-space-generator.hfst
	hfst-project -p upper $< -o forms.hfst
	hfst-compose-intersect -1 generator-space-generator.hfst -2 forms.hfst -o generator-repeated.hfst
	hfst-invert generator-repeated.hfst -o $@


####### Other targets: ###########
clean-local:
	-rm -f *.hfst *.xfst abbr.txt *.pmhfst

include $(top_srcdir)/am-shared/tools-preprocess-dir-include.am
