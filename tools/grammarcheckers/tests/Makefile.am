## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	NegV-ConNeg-Cond-PASS.yaml \
	NegV-ConNeg-VFin-PASS.yaml \
	formatting-PASS.yaml \
	msyn-ASgLoc-AAttr-PASS.yaml \
	msyn-Inf-ConNeg-after-Neg-PASS.yaml \
	msyn-Sg3-ConNeg-PASS.yaml \
	msyn-attr-not-pred-PASS.yaml \
	msyn-congruence_subj-verb-PASS.yaml \
	real-DerNomActSgGen-PrfPrc-PASS.yaml \
	real-DerNomActSgGen-PrsSg1-PASS.yaml \
	real-DerNomActSgGen-PrtSg1-PASS.yaml \
	real-DerNomAgPlNom-Inf-PASS.yaml \
	real-DerdImprtSg2-PrsPl3-PASS.yaml \
	real-Derh-Inf-PASS.yaml \
	real-Ess-PrfPrc-PASS.yaml \
	real-ImprtDu1-DerPassPrsSg3-PASS.yaml \
	real-ImprtDu1-NSgNom-PASS.yaml \
	real-ImprtPl2-Inf-PASS.yaml \
	real-ImprtPl2-PrsPl3-PASS.yaml \
	real-ImprtSg1-DerPassPrfPrc-PASS.yaml \
	real-NSgIll-ASgNom-PASS.yaml \
	real-NSgIll-PrtSg3-PASS.yaml \
	real-NomAgIll-PrtSg3-PASS.yaml \
	real-PlNomPxSg2-PlNom-PASS.yaml \
	real-PrsConNeg-PrtPl3-PASS.yaml \
	real-PrsSg1-PrfPrc-PASS.yaml \
	real-PrtPl3-PrsSg3-PASS.yaml \
	real-aaibbas-PASS.yaml \
	real-aalo-PASS.yaml \
	real-addet-aaddet-PASS.yaml \
	real-adnui-atnui-PASS.yaml \
	real-bidjui-PASS.yaml \
	real-cohkke-PASS.yaml \
	real-cohkken-PASS.yaml \
	real-cohkket-PASS.yaml \
	real-earret-PASS.yaml \
	real-geahccalit-PASS.yaml \
	real-girjji-PASS.yaml \
	real-hallan-PASS.yaml \
	real-heangaat-PASS.yaml \
	real-jaamas-PASS.yaml \
	real-johttui-johtui-PASS.yaml \
	real-logaat-PASS.yaml \
	real-oainnat-PASS.yaml \
	real-sakka-PASS.yaml \
	syn-compound-PASS.yaml \
	syn-inf-after-soaitit-PASS.yaml \
	syn-not_dego-PASS.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=	
endif # WANT_GRAMCHECK

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
