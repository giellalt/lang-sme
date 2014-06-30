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

####### Source file defs: ########

L2=

if WANT_OAHPA 
L2+=$(GTLANG)-phon-L2.twolc

else
L2+=$(GTLANG)-phon-L1.twolc
endif # WANT_OAHPA


#! @param GT_TWOLC_MAIN required, the source of phonology
#! @param GT_TWOLC_SUPPLEMENTS optional, other sources to distribute and
#! 		  compile for other things
GT_PHONOLOGY_MAIN=$(GTLANG)-phon.twolc
GT_PHONOLOGY_SUPPLEMENTS=

$(GTLANG)-phon.twolc: $(GTLANG)-phon-L1.twolc
	$(AM_V_GEN)cp -f $< $@

$(GTLANG)-phon.twolc: $(GTLANG)-phon-L2.twolc
	$(AM_V_GEN)cp -f $< $@


include $(top_srcdir)/am-shared/src-phonology-dir-include.am

# vim: set ft=automake:
