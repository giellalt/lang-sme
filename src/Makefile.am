## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# always build . last here, and tagsets have to be built after morphology
SUBDIRS = phonology morphology filters phonetics hyphenation orthography syntax transcriptions tagsets .

####### Automake targets: ########

# Define target variables first, before assigning to them:
GT_ANALYSERS=
GT_GENERATORS=

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
#### GT_GENERATORS+=generator-oahpa-gt-norm.hfst
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

if WANT_MORPHOLOGY
#GT_ANALYSERS+= analyser-nob-desc.xfst \
#			   analyser-nob-norm.xfst 
endif # WANT_MORPHOLOGY

if WANT_GENERATION
#GT_GENERATORS+=generator-nob-desc.xfst \
#			   generator-nob-norm.xfst 
endif # WANT_GENERATION

if WANT_PHONETIC
GT_ANALYSERS+=
GT_GENERATORS+=generator-tts-gt-norm_nonum_noabbr_nohyph_sme.xfst \
			   generator-tts-gt-norm_nonum_noabbr_nohyph_fin.xfst \
			   generator-tts-gt-norm_nonum_noabbr_nohyph_nob.xfst
endif # WANT_PHONETIC

endif # CAN_XFST

#### HFST transducers
if CAN_HFST

if WANT_MORPHOLOGY
GT_ANALYSERS+=analyser-gt-norm.hfst
#GT_ANALYSERS+=analyser-nob-desc.hfstol \
#			  analyser-nob-norm.hfstol
endif # WANT_MORPHOLOGY

if WANT_GENERATION
#GT_GENERATORS+=generator-nob-desc.hfstol \
#			   generator-nob-norm.hfstol
endif # WANT_GENERATION

if WANT_PHONETIC
GT_ANALYSERS+=
GT_GENERATORS+=generator-tts-gt-norm_nonum_noabbr_nohyph_sme.hfst \
			   generator-tts-gt-norm_nonum_noabbr_nohyph_fin.hfst \
			   generator-tts-gt-norm_nonum_noabbr_nohyph_nob.hfst
endif # WANT_PHONETIC

endif # CAN_HFST

#### FOMA transducers
if CAN_FOMA
GT_ANALYSERS+=
GT_GENERATORS+=
endif # CAN_FOMA

#################################################
#### Add language-specific build rules here: ####

# Hfst - add weights to compounds if using tropical-semiring fst format:
if WITH_OFST_TROPICAL
generator-raw-gt-desc.hfst: generator-raw-gt-desc.tmp.hfst
	$(AM_V_REWEIGHT)$(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
			-S '+Cmp' -a 10 --arcs-only -i $< \
		> $@
endif

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
analyser-tts-gt-norm_nonum_noabbr_nohyph.%: \
					analyser-raw-gt-desc.%                      \
					filters/remove-derivation-position-tags.%   \
					filters/remove-semantic-tags.%              \
					filters/remove-homonymy-tags.%              \
					filters/remove-variant-tags.%               \
					filters/remove-derivation-position-tags.%   \
					filters/remove-dialect-tags.%               \
					filters/remove-norm-comp-tags.%             \
					filters/remove-usage-tags.%                 \
					filters/remove-ABBR-strings.%               \
					filters/remove-ACR-strings.%                \
				    filters/remove-derivation-strings.%         \
					filters/remove-error-strings.%              \
					filters/remove-PUNCT-strings.%              \
					filters/remove-UseCirc-strings.%            \
					filters/remove-RCmpnd-strings.%             \
					filters/remove-orthography-tags.%           \
					filters/remove-Orth_Strd-strings.%          \
					filters/remove-CLB-strings.%                \
					filters/remove-hyphenated-strings.%         \
					filters/remove-mwe-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@\"filters/remove-semantic-tags.$*\"              \
			.o. @\"filters/remove-homonymy-tags.$*\"              \
			.o. @\"filters/remove-variant-tags.$*\"               \
			.o. @\"filters/remove-derivation-position-tags.$*\"   \
			.o. @\"filters/remove-dialect-tags.$*\"               \
			.o. @\"filters/remove-norm-comp-tags.$*\"             \
			.o. @\"filters/remove-usage-tags.$*\"                 \
			.o. @\"filters/remove-ABBR-strings.$*\"               \
			.o. @\"filters/remove-ACR-strings.$*\"                \
			.o. @\"filters/remove-derivation-strings.$*\"         \
			.o. @\"filters/remove-PUNCT-strings.$*\"              \
			.o. @\"filters/remove-UseCirc-strings.$*\"            \
			.o. @\"filters/remove-RCmpnd-strings.$*\"             \
			.o. @\"filters/remove-Orth_Strd-strings.$*\"          \
			.o. @\"filters/remove-CLB-strings.$*\"                \
			.o. @\"filters/remove-error-strings.$*\"              \
			.o. @\"filters/remove-orthography-tags.$*\"           \
			.o. @\"filters/remove-derivation-position-tags.$*\"   \
			.o. @\"filters/remove-Orth_Strd-strings.$*\"          \
			.o. @\"$<\" \
			.o. @\"filters/remove-mwe-strings.$*\"                \
			.o. @\"filters/remove-hyphenated-strings.$*\"         \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The second step, to extract the strings that only (or mostly) follow
# SME orthographic conventions.
generator-tts-gt-norm_nonum_noabbr_nohyph_sme.%: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.% \
					filters/remove-OLang_ENG-strings.%          \
					filters/remove-OLang_FIN-strings.%          \
					filters/remove-OLang_NNO-strings.%          \
					filters/remove-OLang_NOB-strings.%          \
					filters/remove-OLang_SWE-strings.%          \
					filters/remove-OLang_UND-strings.%          \
					filters/remove-orig_lang-tags.%             \
					filters/remove-infl_boundary-marks.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@\"filters/remove-orig_lang-tags.$*\"     \
			.o. @\"filters/remove-OLang_ENG-strings.$*\"  \
			.o. @\"filters/remove-OLang_FIN-strings.$*\"  \
			.o. @\"filters/remove-OLang_NNO-strings.$*\"  \
			.o. @\"filters/remove-OLang_NOB-strings.$*\"  \
			.o. @\"filters/remove-OLang_SWE-strings.$*\"  \
			.o. @\"filters/remove-OLang_UND-strings.$*\"  \
			.o. @\"$<\" \
			.o. @\"filters/remove-infl_boundary-marks.$*\" \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The second step, to extract the strings that follow
# FIN orthographic conventions for the stem (and SME in the inflections):
generator-tts-gt-norm_nonum_noabbr_nohyph_fin.%: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.% \
					filters/extract-OLang_FIN-strings.%         \
					filters/remove-orig_lang-tags.%             \
					filters/remove-nonfirst_infl_boundary-marks.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@bin\"filters/remove-orig_lang-tags.$*\"     \
			.o. @bin\"filters/extract-OLang_FIN-strings.$*\"   \
			.o. @bin\"$<\" \
			.o. @bin\"filters/remove-nonfirst_infl_boundary-marks.$*\" \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The second step, to extract the strings that follow
# NOB (and NNO + SWE) orthographic conventions for the stem::
generator-tts-gt-norm_nonum_noabbr_nohyph_nob.%: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.% \
					filters/extract-OLang_NOB-strings.%         \
					filters/extract-OLang_NNO-strings.%         \
					filters/extract-OLang_SWE-strings.%         \
					filters/remove-orig_lang-tags.%             \
					filters/remove-nonfirst_infl_boundary-marks.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@bin\"filters/remove-orig_lang-tags.$*\"     \
			.o. \
			  [ @bin\"filters/extract-OLang_NOB-strings.$*\"   \
			  | @bin\"filters/extract-OLang_NNO-strings.$*\"   \
			  | @bin\"filters/extract-OLang_SWE-strings.$*\" ] \
			.o. @bin\"$<\" \
			.o. @bin\"filters/remove-nonfirst_infl_boundary-marks.$*\" \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the analyser:
analyser-gt-desc.%: analyser-gt-desc.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-Err_SpaceCmp-strings.% \
					filters/remove-Use_Disamb-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"   \
			.o. @\"filters/remove-Use_Disamb-strings.$*\"     \
			.o. @\"$<\"                                       \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

analyser-gt-norm.%: analyser-gt-norm.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-allegro-tags.% \
					filters/remove-Err_SpaceCmp-strings.% \
					filters/remove-Use_Disamb-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-allegro-tags.$*\" \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"   \
			.o. @\"filters/remove-Use_Disamb-strings.$*\"     \
			.o. @\"$<\"                                       \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... and also in the Oahpa analyser:
analyser-oahpa-gt-norm.%: analyser-oahpa-gt-norm.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-allegro-tags.% \
					filters/remove-Err_SpaceCmp-strings.% \
					filters/remove-Use_Disamb-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-allegro-tags.$*\" \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"   \
			.o. @\"filters/remove-Use_Disamb-strings.$*\"     \
			.o. @\"$<\"                                       \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... as well as in the HFST disambiguation analyser:
analyser-disamb-gt-desc.hfst: analyser-disamb-gt-desc.tmp.hfst \
                filters/remove-derivation-position-tags.hfst \
                filters/rename-POS_before_Der-tags.hfst \
		filters/remove-Err_SpaceCmp-strings.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex \
            @\"filters/remove-derivation-position-tags.hfst\" \
		.o. @\"filters/remove-Err_SpaceCmp-strings.hfst\"   \
        .o. @\"filters/rename-POS_before_Der-tags.hfst\" \
        .o. @\"$<\"                                      \
        ;\n\
     invert net\n\
     save stack $@\n\
     quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

# ... as well as in the HFST Grammar Checker analyser:
# (keep the Err/SpaceCmp strings here)
analyser-gramcheck-gt-desc.hfst: analyser-gramcheck-gt-desc.tmp.hfst \
                filters/remove-derivation-position-tags.hfst \
                filters/rename-POS_before_Der-tags.hfst \
				filters/remove-Use_Disamb-tags.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex \
            @\"filters/remove-derivation-position-tags.hfst\" \
        .o. @\"filters/rename-POS_before_Der-tags.hfst\" \
        .o. @\"$<\"                                      \
        ;\n\
     invert net\n\
     save stack $@\n\
     quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

# ... as well as in the XEROX/FOMA disambiguation analyser
# (remove the Err/SpaceCmp thing here):
analyser-disamb-gt-desc.%: analyser-disamb-gt-desc.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/rename-POS_before_Der-tags.% \
					filters/remove-Err_SpaceCmp-strings.% \
					filters/remove-Use_Disamb-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/rename-POS_before_Der-tags.$*\"  \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\" \
			.o. @\"filters/remove-Use_Disamb-strings.$*\"   \
			.o. @\"$<\"                                     \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the generator:
define giella_generators
generator-gt-%.$(1): generator-gt-%.tmp.$(1) \
					 filters/remove-derivation-position-tags.$(1) \
					 filters/make-optional-allegro-tags.$(1) \
					 filters/make-optional-coll-tags.$(1)    \
					 filters/make-optional-lang_hom-tags.$(1) \
					 filters/remove-Err_SpaceCmp-strings.$(1) \
					 filters/remove-Use_Disamb-strings.$(1)
	$$(AM_V_XFST_TOOL)$$(PRINTF) "read regex \
				@\"filters/make-optional-allegro-tags.$(1)\"  \
			.o. @\"filters/make-optional-coll-tags.$(1)\"     \
			.o. @\"filters/make-optional-lang_hom-tags.$(1)\" \
			.o. @\"filters/remove-derivation-position-tags.$(1)\" \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$(1)\"   \
			.o. @\"filters/remove-Use_Disamb-strings.$(1)\"     \
			.o. @\"$$<\"                                        \
			;\n\
		 $$(INVERT_XFST)$$(INVERT_FOMA)\
		 save stack $$@\n\
		 quit\n" | $$(XFST_TOOL)
endef
$(foreach fst,hfst xfst foma,$(eval $(call giella_generators,$(fst))))

# We need to add processing of language-specific tags for the Oahpa generators:
generator-oahpa-gt-norm.%: generator-oahpa-gt-norm.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/make-optional-allegro-tags.% \
					filters/remove-Err_SpaceCmp-strings.% \
					filters/remove-Use_Disamb-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/make-optional-allegro-tags.$*\"  \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"   \
			.o. @\"filters/remove-Use_Disamb-strings.$*\"     \
			.o. @\"$<\"                                       \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

include $(top_srcdir)/am-shared/src-dir-include.am
