## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

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

######## Test targets: ###########

# List here (space separated) all test scripts that should be run:
TESTS=

# The following test scripts depend on HFST being available:
if CAN_HFST
if WANT_PHONETIC
TESTS+=test-triple-vowel-conversion.sh \
       test-stress-assignment.sh
endif # WANT_PHONETIC
endif # CAN_HFST

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=

# Add all scripts here to ensure they are tracked for changes, and to include
# them in the distribution package.
check_SCRIPTS=test-ipa-conversion.sh \
              test-triple-vowel-conversion.sh \
              test-stress-assignment.sh

####### Other targets: ###########
clean-local:
	-rm -f *.gen.txt

# vim: set ft=automake:
