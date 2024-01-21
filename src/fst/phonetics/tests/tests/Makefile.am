## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# Variable definition:
TESTS=

######## Test targets: ###########

if WANT_PHONETIC

# List here (space separated) all yaml files to be run as part of make check:
TESTS+=

if CAN_HFST
TESTS+=test-ipa-conversion.sh \
       test-triple-vowel-conversion.sh \
       test-stress-assignment.sh
endif # CAN_HFST

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=test-ipa-conversion.sh \
            test-triple-vowel-conversion.sh \
            test-stress-assignment.sh

endif # WANT_PHONETIC

# Add all scripts here to ensure they are tracked for changes, and to include
# them in the distribution package.
check_SCRIPTS=test-ipa-conversion.sh \
              test-triple-vowel-conversion.sh \
              test-stress-assignment.sh

####### Other targets: ###########
clean-local:
	-rm -f *.gen.txt

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/src-phonetics-tests-dir-include.am
