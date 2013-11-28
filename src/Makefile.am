## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# always build . last here, and tagsets have to be built after morphology
SUBDIRS = phonology morphology filters phonetics hyphenation orthography syntax transcriptions tagsets .

####### Automake targets: ########

if CAN_HFST
GT_ANALYSERS_HFST=analyser-gt-desc.hfst analyser-gt-norm.hfst
GT_GENERATORS_HFST=generator-gt-desc.hfst generator-gt-norm.hfst 
GT_TRANSFORMERS_HFST=transcriptor-clock2text-desc.hfst \
					 transcriptor-date2text-desc.hfst \
					 transcriptor-numbers2text-desc.hfst \
					 transcriptor-text2clock-desc.hfst \
					 transcriptor-text2date-desc.hfst \
					 transcriptor-text2numbers-desc.hfst

if WANT_APERTIUM
# This is just a generic analyser. You need to add pair-specific analysers to
# the language-specific part further down.
APERTIUM_ANALYSERS_HFST=analyser-mt-gt-desc.hfst
APERTIUM_GENERATORS_HFST=generator-mt-gt-norm.hfst \
						generator-mt-apertium-norm.hfst \
						generator-mt-apertium-norm.att.gz
endif # WANT_APERTIUM
endif # CAN_HFST

if CAN_XFST
GT_ANALYSERS_XFST=analyser-gt-desc.xfst analyser-gt-norm.xfst
GT_GENERATORS_XFST=generator-gt-desc.xfst generator-gt-norm.xfst
GT_TRANSFORMERS_XFST=transcriptor-clock2text-desc.xfst \
					 transcriptor-date2text-desc.xfst \
					 transcriptor-numbers2text-desc.xfst \
					 transcriptor-text2clock-desc.xfst \
					 transcriptor-text2date-desc.xfst \
					 transcriptor-text2numbers-desc.xfst

if WANT_DICTIONARIES
GT_ANALYSERS_XFST+=analyser-dict-gt-desc.xfst \
					analyser-dict-gt-norm.xfst
GT_GENERATORS_XFST+=generator-dict-gt-norm.xfst \
					generator-dict-gt-desc.xfst
endif # WANT_DICTIONARIES
endif # CAN_XFST

if WANT_OAHPA
if CAN_HFST
GT_GENERATORS_HFST+=generator-oahpa-gt-norm.hfst
endif # CAN_HFST
if CAN_XFST
GT_GENERATORS_XFST+=generator-oahpa-gt-norm.xfst
endif # CAN_XFST
endif # WANT_OAHPA

#### Local modifications in *fst processing: ####
####
#### Copy the fallback targets, and rename them to the desired targets. Then:
#### Replace the 'cp' command (Xerox) / Prepend the hfst-invert command (Hfst -
#### remember to move the $<) with whatever you need to complete
#### the processing to get the final target transducer.
#### Remember to add the dependencies as well.
#### Also make sure that HFST and Xerox processing are the same.
####
#### If you add new transducers to be built, you need to add them to the
#### relevant variable, e.g.:
####
#### if CAN_HFST
#### GT_GENERATORS_HFST+=generator-oahpa-gt-norm.hfst
#### endif
####
#### NB!!!! The HFST targets should get a hyphen after 'analyser'/'generator'
#### respectively, to make the local targets minimally different from and
#### slightly more specific than the fallback targets. This is to avoid warnings
#### about duplicate targets. That is, the local targets should looke like:
####
#### analyser-%.hfst: analyser-%.tmp.hfst
#### generator-%.hfst: generator-%.tmp.hfst

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

########################################################
#### Add language-specific transducer targets here: ####

#### Xerox transducers:
if CAN_XFST
if WANT_PHONETIC
GT_ANALYSERS_XFST+=
GT_GENERATORS_XFST+=generator-tts-gt-norm_nonum_noabbr_nohyph_sme.xfst \
					generator-tts-gt-norm_nonum_noabbr_nohyph_fin.xfst \
					generator-tts-gt-norm_nonum_noabbr_nohyph_nob.xfst
endif # WANT_PHONETIC
endif

#### HFST transducers
if CAN_HFST
if WANT_PHONETIC
GT_ANALYSERS_HFST+=
GT_GENERATORS_HFST+=generator-tts-gt-norm_nonum_noabbr_nohyph_sme.hfst \
					generator-tts-gt-norm_nonum_noabbr_nohyph_fin.hfst \
					generator-tts-gt-norm_nonum_noabbr_nohyph_nob.hfst
endif # WANT_PHONETIC

if WANT_APERTIUM
APERTIUM_ANALYSERS_HFST+=analyser-mt-apertium-desc.sma.hfst \
						 analyser-mt-apertium-desc.sma.att.gz \
						 analyser-mt-apertium-desc.smj.hfst \
						 analyser-mt-apertium-desc.smj.att.gz
APERTIUM_GENERATORS_HFST+=

endif
endif

#################################################
#### Add language-specific build rules here: ####

# A generator for producing word forms suitable for tts:
# * no circular constructions:
# ** no (arabic) cardinals
# ** no (arabic) ordinals
# ** no generated acronyms
# ** no dynamic compounding
# * no abbreviations (they should instead be expanded)
# * no punctuation
# * no substandard forms
# * no illegal derivations
# * only Guovdageaidnu dialect forms (NB! not yet implemented!!)
#
# First we build a general-purpose fst with the above things removed, but
# with all lexical content retained, irrespective of orthography/loan word
# source:
generator-tts-gt-norm_nonum_noabbr_nohyph.hfst: \
					generator-raw-gt-desc.hfst                     \
					filters/remove-semantic-tags-except-prop.hfst  \
					filters/remove-homonymy-tags.hfst              \
					filters/remove-variant-tags.hfst               \
					filters/remove-derivation-position-tags.hfst   \
					filters/remove-dialect-tags.hfst               \
					filters/remove-norm-comp-tags.hfst             \
					filters/remove-usage-tags.hfst                 \
					filters/remove-sub-forms.hfst                  \
					filters/remove-ABBR-strings.hfst               \
					filters/remove-ACR-strings.hfst                \
				    filters/remove-derivation-strings.hfst         \
					filters/remove-lexsub-strings.hfst             \
					filters/remove-PUNCT-strings.hfst              \
					filters/remove-UseCirc-strings.hfst            \
					filters/remove-RCmpnd-strings.hfst             \
					filters/remove-orthography-tags.hfst           \
					filters/remove-Orth_Strd-strings.hfst          \
					filters/remove-CLB-strings.hfst                \
					filters/remove-hyphenated-strings.hfst         \
					filters/remove-mwe-strings.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@\"filters/remove-semantic-tags-except-prop.hfst\"  \
			.o. @\"filters/remove-homonymy-tags.hfst\"              \
			.o. @\"filters/remove-variant-tags.hfst\"               \
			.o. @\"filters/remove-derivation-position-tags.hfst\"   \
			.o. @\"filters/remove-dialect-tags.hfst\"               \
			.o. @\"filters/remove-norm-comp-tags.hfst\"             \
			.o. @\"filters/remove-usage-tags.hfst\"                 \
			.o. @\"filters/remove-ABBR-strings.hfst\"               \
			.o. @\"filters/remove-ACR-strings.hfst\"                \
			.o. @\"filters/remove-derivation-strings.hfst\"         \
			.o. @\"filters/remove-PUNCT-strings.hfst\"              \
			.o. @\"filters/remove-UseCirc-strings.hfst\"            \
			.o. @\"filters/remove-RCmpnd-strings.hfst\"             \
			.o. @\"filters/remove-Orth_Strd-strings.hfst\"          \
			.o. @\"filters/remove-CLB-strings.hfst\"                \
			.o. @\"filters/remove-lexsub-strings.hfst\"             \
			.o. @\"filters/remove-sub-forms.hfst\"                  \
			.o. @\"filters/remove-orthography-tags.hfst\"           \
			.o. @\"filters/remove-Orth_Strd-strings.hfst\"          \
			.o. @\"$<\" \
			.o. @\"filters/remove-mwe-strings.hfst\"                \
			.o. @\"filters/remove-hyphenated-strings.hfst\"         \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

# Xerox version, mainly used for debugging
analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst: \
					analyser-raw-gt-desc.xfst                      \
					filters/remove-semantic-tags-except-prop.xfst  \
					filters/remove-homonymy-tags.xfst              \
					filters/remove-variant-tags.xfst               \
					filters/remove-derivation-position-tags.xfst   \
					filters/remove-dialect-tags.xfst               \
					filters/remove-norm-comp-tags.xfst             \
					filters/remove-usage-tags.xfst                 \
					filters/remove-sub-forms.xfst                  \
					filters/remove-ABBR-strings.xfst               \
					filters/remove-ACR-strings.xfst                \
				    filters/remove-derivation-strings.xfst         \
					filters/remove-lexsub-strings.xfst             \
					filters/remove-PUNCT-strings.xfst              \
					filters/remove-UseCirc-strings.xfst            \
					filters/remove-RCmpnd-strings.xfst             \
					filters/remove-orthography-tags.xfst           \
					filters/remove-Orth_Strd-strings.xfst          \
					filters/remove-CLB-strings.xfst                \
					filters/remove-hyphenated-strings.xfst         \
					filters/remove-mwe-strings.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
				@\"filters/remove-semantic-tags-except-prop.xfst\"  \
			.o. @\"filters/remove-homonymy-tags.xfst\"              \
			.o. @\"filters/remove-variant-tags.xfst\"               \
			.o. @\"filters/remove-derivation-position-tags.xfst\"   \
			.o. @\"filters/remove-dialect-tags.xfst\"               \
			.o. @\"filters/remove-norm-comp-tags.xfst\"             \
			.o. @\"filters/remove-usage-tags.xfst\"                 \
			.o. @\"filters/remove-ABBR-strings.xfst\"               \
			.o. @\"filters/remove-ACR-strings.xfst\"                \
			.o. @\"filters/remove-derivation-strings.xfst\"         \
			.o. @\"filters/remove-PUNCT-strings.xfst\"              \
			.o. @\"filters/remove-UseCirc-strings.xfst\"            \
			.o. @\"filters/remove-RCmpnd-strings.xfst\"             \
			.o. @\"filters/remove-Orth_Strd-strings.xfst\"          \
			.o. @\"filters/remove-CLB-strings.xfst\"                \
			.o. @\"filters/remove-lexsub-strings.xfst\"             \
			.o. @\"filters/remove-sub-forms.xfst\"                  \
			.o. @\"filters/remove-orthography-tags.xfst\"           \
			.o. @\"filters/remove-Orth_Strd-strings.xfst\"          \
			.o. @\"$<\" \
			.o. @\"filters/remove-mwe-strings.xfst\"                \
			.o. @\"filters/remove-hyphenated-strings.xfst\"         \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# The second step, to extract the strings that only (or mostly) follow
# SME orthographic conventions.
generator-tts-gt-norm_nonum_noabbr_nohyph_sme.hfst: \
					generator-tts-gt-norm_nonum_noabbr_nohyph.hfst \
					filters/remove-OLang_ENG-strings.hfst          \
					filters/remove-OLang_FIN-strings.hfst          \
					filters/remove-OLang_NNO-strings.hfst          \
					filters/remove-OLang_NOB-strings.hfst          \
					filters/remove-OLang_SWE-strings.hfst          \
					filters/remove-OLang_UND-strings.hfst          \
					filters/remove-orig_lang-tags.hfst             \
					filters/remove-infl_boundary-marks.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@\"filters/remove-orig_lang-tags.hfst\"     \
			.o. @\"filters/remove-OLang_ENG-strings.hfst\"  \
			.o. @\"filters/remove-OLang_FIN-strings.hfst\"  \
			.o. @\"filters/remove-OLang_NNO-strings.hfst\"  \
			.o. @\"filters/remove-OLang_NOB-strings.hfst\"  \
			.o. @\"filters/remove-OLang_SWE-strings.hfst\"  \
			.o. @\"filters/remove-OLang_UND-strings.hfst\"  \
			.o. @\"$<\" \
			.o. @\"filters/remove-infl_boundary-marks.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

generator-tts-gt-norm_nonum_noabbr_nohyph_sme.xfst: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst \
					filters/remove-OLang_ENG-strings.xfst         \
					filters/remove-OLang_FIN-strings.xfst         \
					filters/remove-OLang_NNO-strings.xfst         \
					filters/remove-OLang_NOB-strings.xfst         \
					filters/remove-OLang_SWE-strings.xfst         \
					filters/remove-OLang_UND-strings.xfst         \
					filters/remove-orig_lang-tags.xfst            \
					filters/remove-infl_boundary-marks.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
			    @\"filters/remove-orig_lang-tags.xfst\"     \
			.o. @\"filters/remove-OLang_ENG-strings.xfst\"  \
			.o. @\"filters/remove-OLang_FIN-strings.xfst\"  \
			.o. @\"filters/remove-OLang_NNO-strings.xfst\"  \
			.o. @\"filters/remove-OLang_NOB-strings.xfst\"  \
			.o. @\"filters/remove-OLang_SWE-strings.xfst\"  \
			.o. @\"filters/remove-OLang_UND-strings.xfst\"  \
			.o. @\"$<\" \
			.o. @\"filters/remove-infl_boundary-marks.xfst\" \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# The second step, to extract the strings that follow
# FIN orthographic conventions for the stem (and SME in the inflections):
generator-tts-gt-norm_nonum_noabbr_nohyph_fin.hfst: \
					generator-tts-gt-norm_nonum_noabbr_nohyph.hfst \
					filters/extract-OLang_FIN-strings.hfst         \
					filters/remove-orig_lang-tags.hfst             \
					filters/remove-nonfirst_infl_boundary-marks.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@bin\"filters/remove-orig_lang-tags.hfst\"     \
			.o. @bin\"filters/extract-OLang_FIN-strings.hfst\"   \
			.o. @bin\"$<\" \
			.o. @bin\"filters/remove-nonfirst_infl_boundary-marks.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

generator-tts-gt-norm_nonum_noabbr_nohyph_fin.xfst: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst  \
					filters/extract-OLang_FIN-strings.xfst         \
					filters/remove-orig_lang-tags.xfst             \
					filters/remove-nonfirst_infl_boundary-marks.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
			    @\"filters/remove-orig_lang-tags.xfst\"     \
			.o. @\"filters/extract-OLang_FIN-strings.xfst\" \
			.o. @\"$<\" \
			.o. @\"filters/remove-nonfirst_infl_boundary-marks.xfst\" \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# The second step, to extract the strings that follow
# NOB (and NNO + SWE) orthographic conventions for the stem::
generator-tts-gt-norm_nonum_noabbr_nohyph_nob.hfst: \
					generator-tts-gt-norm_nonum_noabbr_nohyph.hfst \
					filters/extract-OLang_NOB-strings.hfst         \
					filters/extract-OLang_NNO-strings.hfst         \
					filters/extract-OLang_SWE-strings.hfst         \
					filters/remove-orig_lang-tags.hfst             \
					filters/remove-nonfirst_infl_boundary-marks.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@bin\"filters/remove-orig_lang-tags.hfst\"     \
			.o. \
			  [ @bin\"filters/extract-OLang_NOB-strings.hfst\"   \
			  | @bin\"filters/extract-OLang_NNO-strings.hfst\"   \
			  | @bin\"filters/extract-OLang_SWE-strings.hfst\" ] \
			.o. @bin\"$<\" \
			.o. @bin\"filters/remove-nonfirst_infl_boundary-marks.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

generator-tts-gt-norm_nonum_noabbr_nohyph_nob.xfst: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst  \
					filters/extract-OLang_NOB-strings.xfst         \
					filters/extract-OLang_NNO-strings.xfst         \
					filters/extract-OLang_SWE-strings.xfst         \
					filters/remove-orig_lang-tags.xfst             \
					filters/remove-nonfirst_infl_boundary-marks.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
			    @\"filters/remove-orig_lang-tags.xfst\"     \
			.o. \
			  [ @\"filters/extract-OLang_NOB-strings.xfst\"   \
			  | @\"filters/extract-OLang_NNO-strings.xfst\"   \
			  | @\"filters/extract-OLang_SWE-strings.xfst\" ] \
			.o. @\"$<\" \
			.o. @\"filters/remove-nonfirst_infl_boundary-marks.xfst\" \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# MT/Apertium-related language-specific targets - modify to suit each language:
analyser-mt-%.und.hfst: analyser-mt-%.tmp.hfst
	$(AM_V_GEN)$(HFST_INVERT) $< \
		| $(HFST_FST2FST) $(HFST_FLAGS) -t -o $@

analyser-mt-gt-desc.sma.hfst: analyser-mt-gt-desc.tmp.hfst \
					filters/remove-dialect-tags.hfst \
					filters/remove-semantic-tags-except-prop.hfst \
					filters/reorder-semantic-tags.hfst \
					filters/remove-deriv-strings-MT-sma.hfst \
					filters/remove-sub-forms.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@bin\"filters/remove-dialect-tags.hfst\"     \
			.o. @bin\"filters/remove-semantic-tags-except-prop.hfst\"   \
			.o. @bin\"filters/extract-deriv-strings-MT-sma.hfst\"   \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/remove-sub-forms.hfst\"     \
			.o. @bin\"$<\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

analyser-mt-gt-desc.smj.hfst: analyser-mt-gt-desc.tmp.hfst \
					filters/remove-dialect-tags.hfst \
					filters/remove-semantic-tags-except-prop.hfst \
					filters/reorder-semantic-tags.hfst \
					filters/remove-deriv-strings-MT-sma.hfst \
					filters/remove-sub-forms.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@bin\"filters/remove-dialect-tags.hfst\"     \
			.o. @bin\"filters/remove-semantic-tags-except-prop.hfst\"   \
			.o. @bin\"filters/extract-deriv-strings-MT-sma.hfst\"   \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/reorder-semantic-tags.hfst\"     \
			.o. @bin\"filters/remove-sub-forms.hfst\"     \
			.o. @bin\"$<\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

generator-mt-gt-norm.hfst: generator-mt-gt-norm.tmp.hfst \
					filters/make-optional-semantic-tags.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@bin\"filters/make-optional-semantic-tags.hfst\" \
			.o. @bin\"$<\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

# Oahpa-related local modifications and language-specific changes:
# HFST:
generator-oahpa-gt-norm.hfst: generator-oahpa-gt-norm.tmp.hfst \
					filters/make-optional-semantic-tags.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@bin\"filters/make-optional-semantic-tags.hfst\" \
			.o. @bin\"$<\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

# Xerox:
generator-oahpa-gt-norm.xfst: generator-oahpa-gt-norm.tmp.xfst \
					filters/make-optional-semantic-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex                          \
				@\"filters/make-optional-semantic-tags.xfst\" \
			.o. @\"$<\".i                                     \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST)

# Dict-fst local modifications and language-specific changes:
generator-dict-gt-norm.xfst: generator-dict-gt-norm.tmp.xfst \
					filters/make-optional-semantic-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex                          \
				@\"filters/make-optional-semantic-tags.xfst\" \
			.o. @\"$<\".i                                     \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST)

analyser-dict-gt-norm.xfst: analyser-dict-gt-norm.tmp.xfst \
					filters/make-optional-semantic-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex                          \
				@\"filters/make-optional-semantic-tags.xfst\" \
			.o. @\"$<\"                                       \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST)

# We need to add processing of language-specific tags in the generator:
# HFST:
generator-gt-%.hfst: generator-gt-%.tmp.hfst \
					 filters/make-optional-lang_hom-tags.hfst \
					 filters/make-optional-semantic-tags.hfst
	$(AM_V_GEN)$(PRINTF) \
			   "@\"filters/make-optional-lang_hom-tags.hfst\"     \
			.o. @\"filters/make-optional-semantic-tags.hfst\"     \
			.o. @\"$<\"                                           \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

# Xerox:
generator-gt-%.xfst: generator-gt-%.tmp.xfst \
					 filters/make-optional-lang_hom-tags.xfst \
					 filters/make-optional-semantic-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex                              \
				@\"filters/make-optional-lang_hom-tags.xfst\"     \
			.o. @\"filters/make-optional-semantic-tags.xfst\"     \
			.o. @\"$<\".i                                         \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST)

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

#### HFST transducer fallback target:
#### - inversion is needed FOR THE ANALYSER because the hfst model is upside
#### down compared to Xerox AT APPLICATION TIME. The other command makes the
#### final transducer ready for use.
analyser%.hfst: analyser%.tmp.hfst
	$(AM_V_GEN)$(HFST_INVERT) $< \
		| $(HFST_FST2FST) $(HFST_FLAGS) -f olw -o $@

generator%.hfst: generator%.tmp.hfst
	$(AM_V_GEN)$(HFST_FST2FST) $(HFST_FLAGS) -t -i $< -o $@

#### Xerox transducer fallback target:
%.xfst: %.tmp.xfst
	$(AM_V_GEN)cp -f $< $@

include $(top_srcdir)/am-shared/topdir-include.am
