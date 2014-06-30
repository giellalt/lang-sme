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

if CAN_XFST
GENERATOR=generator-gt-desc.xfst
else
if CAN_HFST
GENERATOR=generator-gt-desc.hfst
ANALYSER=analyser-gt-desc.hfst
PMHFST=preprocessor-gt-desc.pmhfst

hfstdatadir=$(datadir)/giella/$(GTLANG)
hfstdata_DATA=$(PMHFST)

else
GENERATOR=false
endif # CAN_HFST
endif # CAN_XFST

SRCS:=$(wildcard $(top_srcdir)/src/morphology/stems/*.lexc)
empty:=
comma:=,
space:=$(empty) $(empty)
ABBRSRCS:=$(subst $(space),$(comma),$(SRCS))

SCRIPTDIR=$(GTCORE)/scripts

# Build the abbr.txt file:
abbr: abbr.txt
abbr.txt: \
		$(top_srcdir)/src/morphology/stems/abbreviations.lexc \
		$(top_srcdir)/test/data/paradigm.$(GTLANG).txt        \
		$(top_srcdir)/test/data/korpustags.$(GTLANG).txt      \
		$(SRCS) \
		../../src/$(GENERATOR)
	$(AM_V_GEN)perl -I $(SCRIPTDIR) $(SCRIPTDIR)/extract-abbr.pl  \
		--paradigm=$(top_srcdir)/test/data/paradigm.$(GTLANG).txt \
		--tags=$(top_srcdir)/test/data/korpustags.$(GTLANG).txt   \
		--fst=../../src/$(GENERATOR) \
		--output=$@.tmp \
		--abbr_lex=$< \
		--lex=$(ABBRSRCS)
	$(AM_V_at)sed -e 's/\+MWE//' < $@.tmp | uniq > $@
	$(AM_V_at)rm -f $@.tmp


###############
### Test builds for hfst-pmatch and a preprocessor based on it and the
### regular, lexical fst.:

$(ANALYSER): $(top_builddir)/src/$(ANALYSER)
	$(AM_V_GEN)cp -f $< $@

%.pmhfst: %.pmregex $(ANALYSER)
	$(AM_V_GEN)hfst-pmatch2fst < $< > $@

### Use the pmhfst file as follows:

# echo "Mun ja son." | hfst-pmatch $(PMHFST)
