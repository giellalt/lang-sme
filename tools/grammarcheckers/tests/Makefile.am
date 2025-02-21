## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	NegV-ConNeg-3Sg-FAIL.yaml \
	NegV-ConNeg-Cond-FAIL.yaml \
	NegV-ConNeg-Cond-PASS.yaml \
	NegV-ConNeg-VFin-FAIL.yaml \
	NegV-ConNeg-VFin-PASS.yaml \
	double-space-PASS.yaml \
	formatting-PASS.yaml \
	msyn-ASgLoc-AAttr-FAIL.yaml \
	msyn-ASgLoc-AAttr-PASS.yaml \
	msyn-Inf-ConNeg-after-Neg-FAIL.yaml \
	msyn-Inf-ConNeg-after-Neg-PASS.yaml \
	msyn-Pl3-ConNeg-FAIL.yaml \
	msyn-Sg3-ConNeg-FAIL.yaml \
	msyn-Sg3-ConNeg-PASS.yaml \
	msyn-attr-not-pred-FAIL.yaml \
	msyn-attr-not-pred-PASS.yaml \
	msyn-congruence_subj-verb-FAIL.yaml \
	msyn-congruence_subj-verb-PASS.yaml \
	new-ruletypes-FAIL.yaml \
	real-DerNomActSgGen-PrfPrc-FAIL.yaml \
	real-DerNomActSgGen-PrfPrc-PASS.yaml \
	real-DerNomActSgGen-PrsSg1-FAIL.yaml \
	real-DerNomActSgGen-PrsSg1-PASS.yaml \
	real-DerNomActSgGen-PrtSg1-FAIL.yaml \
	real-DerNomActSgGen-PrtSg1-PASS.yaml \
	real-DerNomAgPlNom-Inf-FAIL.yaml \
	real-DerNomAgPlNom-Inf-PASS.yaml \
	real-DerdImprtSg2-PrsPl3-FAIL.yaml \
	real-DerdImprtSg2-PrsPl3-PASS.yaml \
	real-Derh-Inf-FAIL.yaml \
	real-Derh-Inf-PASS.yaml \
	real-Ess-PrfPrc-FAIL.yaml \
	real-Ess-PrfPrc-PASS.yaml \
	real-ImprtDu1-DerPassPrsSg3-FAIL.yaml \
	real-ImprtDu1-DerPassPrsSg3-PASS.yaml \
	real-ImprtDu1-NSgNom-FAIL.yaml \
	real-ImprtDu1-NSgNom-PASS.yaml \
	real-ImprtDu1-PassSConNeg-FAIL.yaml \
	real-ImprtPl2-Inf-FAIL.yaml \
	real-ImprtPl2-Inf-PASS.yaml \
	real-ImprtPl2-PrsPl3-FAIL.yaml \
	real-ImprtPl2-PrsPl3-PASS.yaml \
	real-ImprtSg1-DerPassPrfPrc-FAIL.yaml \
	real-ImprtSg1-DerPassPrfPrc-PASS.yaml \
	real-NSgIll-ASgNom-FAIL.yaml \
	real-NSgIll-ASgNom-PASS.yaml \
	real-NSgIll-PrtSg3-FAIL.yaml \
	real-NSgIll-PrtSg3-PASS.yaml \
	real-NomAgIll-PrtSg3-FAIL.yaml \
	real-NomAgIll-PrtSg3-PASS.yaml \
	real-PlNomPxSg2-PlNom-FAIL.yaml \
	real-PlNomPxSg2-PlNom-PASS.yaml \
	real-PrsConNeg-PrtPl3-FAIL.yaml \
	real-PrsConNeg-PrtPl3-PASS.yaml \
	real-PrsSg1-PrfPrc-FAIL.yaml \
	real-PrsSg1-PrfPrc-PASS.yaml \
	real-PrtPl3-PrsSg3-FAIL.yaml \
	real-PrtPl3-PrsSg3-PASS.yaml \
	real-aaibbas-FAIL.yaml \
	real-aaibbas-PASS.yaml \
	real-aalo-FAIL.yaml \
	real-aalo-PASS.yaml \
	real-addet-aaddet-FAIL.yaml \
	real-addet-aaddet-PASS.yaml \
	real-adnui-atnui-FAIL.yaml \
	real-adnui-atnui-PASS.yaml \
	real-alddat-FAIL.yaml \
	real-bidjui-FAIL.yaml \
	real-bidjui-PASS.yaml \
	real-cohkke-FAIL.yaml \
	real-cohkke-PASS.yaml \
	real-cohkken-FAIL.yaml \
	real-cohkken-PASS.yaml \
	real-cohkket-FAIL.yaml \
	real-cohkket-PASS.yaml \
	real-earret-FAIL.yaml \
	real-earret-PASS.yaml \
	real-geahccalit-FAIL.yaml \
	real-geahccalit-PASS.yaml \
	real-girjji-FAIL.yaml \
	real-girjji-PASS.yaml \
	real-hallan-FAIL.yaml \
	real-hallan-PASS.yaml \
	real-heangaat-FAIL.yaml \
	real-heangaat-PASS.yaml \
	real-jaamas-FAIL.yaml \
	real-jaamas-PASS.yaml \
	real-johttui-johtui-FAIL.yaml \
	real-johttui-johtui-PASS.yaml \
	real-logaat-FAIL.yaml \
	real-logaat-PASS.yaml \
	real-njuolggat-njuolggaat-FAIL.yaml \
	real-oainnat-FAIL.yaml \
	real-oainnat-PASS.yaml \
	real-sakka-FAIL.yaml \
	real-sakka-PASS.yaml \
	syn-PronPers-PronRefl-FAIL.yaml \
	syn-compound-FAIL.yaml \
	syn-compound-PASS.yaml \
	syn-dain_Loc-okta_Loc-FAIL.yaml \
	syn-inf-after-soaitit-FAIL.yaml \
	syn-inf-after-soaitit-PASS.yaml \
	syn-not_dego-FAIL.yaml \
	syn-not_dego-PASS.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	NegV-ConNeg-3Sg-FAIL.yaml \
	NegV-ConNeg-Cond-FAIL.yaml \
	NegV-ConNeg-VFin-FAIL.yaml \
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
