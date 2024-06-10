## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

# List here (space separated) all test scripts that should be run:
TESTS=

YAML_TEST_RUNNERS=

OTHER_TEST_RUNNERS=

if CAN_YAML_TEST
# Add your shell scripts for running python-based tests here:

if WANT_APERTIUM
TESTS+=run-mt-gt-desc-anayaml-testcases.sh \
		run-mt-gt-desc.und-anayaml-testcases.sh \
		run-mt-apertium-desc.und-anayaml-testcases.sh \
		run-mt-apertium-norm-genyaml-testcases.sh

endif # WANT_APERTIUM
endif # CAN_YAML_TEST

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=

include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
include $(top_srcdir)/../giella-core/am-shared/tools-mt-apertium-test-include.am
