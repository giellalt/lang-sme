## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	NegV-ConNeg-3Sg-FAIL.yaml \
	NegV-ConNeg-Cond-FAIL.yaml \
	NegV-ConNeg-VFin-FAIL.yaml \
	double-space-FAIL.yaml \
	formatting-FAIL.yaml \
	msyn-ASgLoc-AAttr-FAIL.yaml \
	msyn-Inf-ConNeg-after-Neg-FAIL.yaml \
	msyn-Pl3-ConNeg-FAIL.yaml \
	msyn-Sg3-ConNeg-FAIL.yaml \
	msyn-attr-not-pred-FAIL.yaml \
	msyn-congruence_subj-verb-FAIL.yaml \
	new-ruletypes-FAIL.yaml \
	real-DerNomActSgGen-PrfPrc-FAIL.yaml \
	real-DerNomActSgGen-PrsSg1-FAIL.yaml \
	real-DerNomActSgGen-PrtSg1-FAIL.yaml \
	real-DerNomAgPlNom-Inf-FAIL.yaml \
	real-DerdImprtSg2-PrsPl3-FAIL.yaml \
	real-Derh-Inf-FAIL.yaml \
	real-Ess-PrfPrc-FAIL.yaml \
	real-ImprtDu1-DerPassPrsSg3-FAIL.yaml \
	real-ImprtDu1-NSgNom-FAIL.yaml \
	real-ImprtDu1-PassSConNeg-FAIL.yaml \
	real-ImprtPl2-Inf-FAIL.yaml \
	real-ImprtPl2-PrsPl3-FAIL.yaml \
	real-ImprtSg1-DerPassPrfPrc-FAIL.yaml \
	real-NSgIll-ASgNom-FAIL.yaml \
	real-NSgIll-PrtSg3-FAIL.yaml \
	real-NomAgIll-PrtSg3-FAIL.yaml \
	real-PlNomPxSg2-PlNom-FAIL.yaml \
	real-PrsConNeg-PrtPl3-FAIL.yaml \
	real-PrsSg1-PrfPrc-FAIL.yaml \
	real-PrtPl3-PrsSg3-FAIL.yaml \
	real-aaibbas-FAIL.yaml \
	real-aalo-FAIL.yaml \
	real-addet-aaddet-FAIL.yaml \
	real-adnui-atnui-FAIL.yaml \
	real-alddat-FAIL.yaml \
	real-bidjui-FAIL.yaml \
	real-cohkke-FAIL.yaml \
	real-cohkken-FAIL.yaml \
	real-cohkket-FAIL.yaml \
	real-earret-FAIL.yaml \
	real-geahccalit-FAIL.yaml \
	real-girjji-FAIL.yaml \
	real-hallan-FAIL.yaml \
	real-heangaat-FAIL.yaml \
	real-jaamas-FAIL.yaml \
	real-johttui-johtui-FAIL.yaml \
	real-logaat-FAIL.yaml \
	real-njuolggat-njuolggaat-FAIL.yaml \
	real-oainnat-FAIL.yaml \
	real-sakka-FAIL.yaml \
	syn-PronPers-PronRefl-FAIL.yaml \
	syn-compound-FAIL.yaml \
	syn-dain_Loc-okta_Loc-FAIL.yaml \
	syn-inf-after-soaitit-FAIL.yaml \
	syn-not_dego-FAIL.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	NegV-ConNeg-3Sg-FAIL.yaml \
	NegV-ConNeg-Cond-FAIL.yaml \
	NegV-ConNeg-VFin-FAIL.yaml \
	double-space-FAIL.yaml \
	formatting-FAIL.yaml \
	msyn-ASgLoc-AAttr-FAIL.yaml \
	msyn-Inf-ConNeg-after-Neg-FAIL.yaml \
	msyn-Pl3-ConNeg-FAIL.yaml \
	msyn-Sg3-ConNeg-FAIL.yaml \
	msyn-attr-not-pred-FAIL.yaml \
	msyn-congruence_subj-verb-FAIL.yaml \
	new-ruletypes-FAIL.yaml \
	real-DerNomActSgGen-PrfPrc-FAIL.yaml \
	real-DerNomActSgGen-PrsSg1-FAIL.yaml \
	real-DerNomActSgGen-PrtSg1-FAIL.yaml \
	real-DerNomAgPlNom-Inf-FAIL.yaml \
	real-DerdImprtSg2-PrsPl3-FAIL.yaml \
	real-Derh-Inf-FAIL.yaml \
	real-Ess-PrfPrc-FAIL.yaml \
	real-ImprtDu1-DerPassPrsSg3-FAIL.yaml \
	real-ImprtDu1-NSgNom-FAIL.yaml \
	real-ImprtDu1-PassSConNeg-FAIL.yaml \
	real-ImprtPl2-Inf-FAIL.yaml \
	real-ImprtPl2-PrsPl3-FAIL.yaml \
	real-ImprtSg1-DerPassPrfPrc-FAIL.yaml \
	real-NSgIll-ASgNom-FAIL.yaml \
	real-NSgIll-PrtSg3-FAIL.yaml \
	real-NomAgIll-PrtSg3-FAIL.yaml \
	real-PlNomPxSg2-PlNom-FAIL.yaml \
	real-PrsConNeg-PrtPl3-FAIL.yaml \
	real-PrsSg1-PrfPrc-FAIL.yaml \
	real-PrtPl3-PrsSg3-FAIL.yaml \
	real-aaibbas-FAIL.yaml \
	real-aalo-FAIL.yaml \
	real-addet-aaddet-FAIL.yaml \
	real-adnui-atnui-FAIL.yaml \
	real-alddat-FAIL.yaml \
	real-bidjui-FAIL.yaml \
	real-cohkke-FAIL.yaml \
	real-cohkken-FAIL.yaml \
	real-cohkket-FAIL.yaml \
	real-earret-FAIL.yaml \
	real-geahccalit-FAIL.yaml \
	real-girjji-FAIL.yaml \
	real-hallan-FAIL.yaml \
	real-heangaat-FAIL.yaml \
	real-jaamas-FAIL.yaml \
	real-johttui-johtui-FAIL.yaml \
	real-logaat-FAIL.yaml \
	real-njuolggat-njuolggaat-FAIL.yaml \
	real-oainnat-FAIL.yaml \
	real-sakka-FAIL.yaml \
	syn-PronPers-PronRefl-FAIL.yaml \
	syn-compound-FAIL.yaml \
	syn-dain_Loc-okta_Loc-FAIL.yaml \
	syn-inf-after-soaitit-FAIL.yaml \
	syn-not_dego-FAIL.yaml

endif # WANT_GRAMCHECK

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
