## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	real-DerNomActSgGen-PrfPrc.yaml			  \
	real-DerNomActSgGen-PrsSg1.yaml			  \
	real-DerNomActSgGen-PrtSg1.yaml			  \
	real-Derh-Inf.yaml						  \
	real-Ess-PrfPrc.notfixed.yaml			  \
	real-Ess-PrfPrc.yaml					  \
	real-ImprtDu1-DerPassPrsSg3.yaml		  \
	real-ImprtDu1-NSgNom.notfixed.yaml		  \
	real-ImprtDu1-NSgNom.yaml				  \
	real-ImprtPl2-Inf.notfixed.yaml			  \
	real-ImprtPl2-Inf.yaml					  \
	real-ImprtPl2-PrsPl3.notfixed.yaml		  \
	real-NomAgIll-PrtSg3.notfixed.yaml		  \
	real-NomAgIll-PrtSg3.yaml				  \
	real-PlNomPxSg2-PlNom.yaml				  \
	real-PrtPl3-PrsSg3.notfixed.yaml		  \
	real-PrtPl3-PrsSg3.yaml					  \
	real-adnui-atnui.yaml					  \
	real-alddat.notfixed.yaml				  \
	syn-compound.notfixed.yaml				  \
	syn-compound.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	real-DerNomActSgGen-PrfPrc.yaml			  \
	real-DerNomActSgGen-PrsSg1.yaml			  \
	real-DerNomActSgGen-PrtSg1.yaml			  \
	real-Derh-Inf.yaml						  \
	real-Ess-PrfPrc.notfixed.yaml			  \
	real-Ess-PrfPrc.yaml					  \
	real-ImprtDu1-DerPassPrsSg3.yaml		  \
	real-ImprtDu1-NSgNom.notfixed.yaml		  \
	real-ImprtDu1-NSgNom.yaml				  \
	real-ImprtPl2-Inf.notfixed.yaml			  \
	real-ImprtPl2-Inf.yaml					  \
	real-ImprtPl2-PrsPl3.notfixed.yaml		  \
	real-NomAgIll-PrtSg3.notfixed.yaml		  \
	real-NomAgIll-PrtSg3.yaml				  \
	real-PlNomPxSg2-PlNom.yaml				  \
	real-PrtPl3-PrsSg3.notfixed.yaml		  \
	real-PrtPl3-PrsSg3.yaml					  \
	real-adnui-atnui.yaml					  \
	real-alddat.notfixed.yaml				  \
	syn-compound.notfixed.yaml				  \
	syn-compound.yaml

endif # WANT_GRAMCHECK

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
