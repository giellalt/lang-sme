## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	NegV-ConNeg-Cond-PASS.yaml \
	NegV-ConNeg-3Sg-PASS.yaml \
	NegV-ConNeg-VFin-PASS.yaml \
	double-space-PASS.yaml \
	formatting-PASS.yaml \
	lex-gaskan-gaskkas-PASS.yaml \
	lex-majuscule-PASS.yaml \
	lex-valjis-valljugas-PASS.yaml \
	lex-vallji-valjit-PASS.yaml \
	msyn-addhyphen-PASS.yaml \
	msyn-ASgLoc-AAttr-PASS.yaml \
	msyn-Inf-ConNeg-after-Neg-PASS.yaml \
	msyn-Sg3-ConNeg-PASS.yaml \
	msyn-Sg3-PASS.yaml \
	msyn-attr-not-pred-PASS.yaml \
	msyn-case-number-congruence-moanat-PASS.yaml \
	msyn-congruence_subj-verb-PASS.yaml \
	msyn-gen-jahkasas-PASS.yaml \
	msyn-hab-nom-loc-PASS.yaml \
	msyn-num_geardde-Ill-PASS.yaml \
	msyn-numphrase-ess-PASS.yaml \
	msyn-numphrase-sgacc-PASS.yaml \
	msyn-numphrase-sgcom-PASS.yaml \
	msyn-numphrase-sggen-PASS.yaml \
	msyn-numphrase-sgill-PASS.yaml \
	msyn-numphrase-sgloc-PASS.yaml
	msyn-numphrase-sgnom-PASS.yaml \
	msyn-partitive-loc-PASS.yaml \
	msyn-valency-ahte-not-fs-PASS.yaml \
	msyn-valency-nom-acc-PASS.yaml \
	real-DerNomActSgGen-ActioEss-PASS.yaml \
	real-DerNomActSgGen-PrfPrc-PASS.yaml \
	real-DerNomActSgGen-PrsSg1-PASS.yaml \
	real-DerNomActSgGen-PrtSg1-PASS.yaml \
	real-DerNomAgPlNom-Inf-PASS.yaml \
	real-DerdImprtSg2-PrsPl3-PASS.yaml \
	real-Derh-Inf-PASS.yaml \
	real-Ess-PrfPrc-PASS.yaml \
	real-GenSg-NomSg-PASS.yaml \
	real-ImprtDu1-DerPassPrsSg3-PASS.yaml \
	real-ImprtDu1-NSgNom-PASS.yaml \
	real-ImprtPl2-Inf-PASS.yaml \
	real-ImprtPl2-PrsPl3-PASS.yaml \
	real-ImprtSg1-DerPassPrfPrc-PASS.yaml \
	real-ImprtSg2-Inf-PASS.yaml \
	real-NSgIll-ASgNom-PASS.yaml \
	real-NSgIll-PrtSg3-PASS.yaml \
	real-NomAgIll-PrtSg3-PASS.yaml \
	real-PlNomPxSg2-PlNom-PASS.yaml \
	real-PrsConNeg-PrtPl3-PASS.yaml \
	real-PrsSg1-DerNomActNom-PASS.yaml \
	real-PrsSg1-PrfPrc-PASS.yaml \
	real-PrtPl3-PrsSg3-PASS.yaml \
	real-aaibbas-PASS.yaml \
	real-aalo-PASS.yaml \
	real-addet-aaddet-PASS.yaml \
	real-adnui-atnui-PASS.yaml \
	real-ággi-áiggi-PASS.yaml \
	real-barggan-barggán-PASS.yaml \
	real-biddjui-PASS.yaml \
	real-bidjui-PASS.yaml \
	real-cohkke-PASS.yaml \
	real-cohkken-PASS.yaml \
	real-cohkket-PASS.yaml \
	real-dáhtu-dáhto-PASS.yaml \
	real-earret-PASS.yaml \
	real-fidnet-PASS.yaml \
	real-geahccalit-PASS.yaml \
	real-girjiide-girjjiide-PASS.yaml \
	real-girjji-PASS.yaml \
	real-hallan-PASS.yaml \
	real-heangaat-PASS.yaml \
	real-jaamas-PASS.yaml \
	real-johttui-johtui-PASS.yaml \
	real-logaat-PASS.yaml \
	real-oainnat-PASS.yaml \
	real-sakka-PASS.yaml \
	real-varra-PASS.yaml \
	sty-prop-not-cearru-PASS.yaml \
	syn-accat-PASS.yaml \
	syn-case-congruence-buorre-PASS.yaml \
	syn-compound-PASS.yaml \
	syn-illative-agent-with-hallat-passive-PASS.yaml \
	syn-inf-after-soaitit-PASS.yaml \
	syn-komp-PASS.yaml \
	syn-not_dego-PASS.yaml \
	syn-pers-refl-congruence-PASS.yaml \
	syn-uvvot-passive-active-PASS.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=	
endif # WANT_GRAMCHECK

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
