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
GT_ANALYSERS+= analyser-nob-desc.xfst \
			   analyser-nob-norm.xfst 
endif # WANT_MORPHOLOGY

if WANT_GENERATION
GT_GENERATORS+=generator-nob-desc.xfst \
			   generator-nob-norm.xfst 
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
GT_ANALYSERS+=analyser-nob-desc.hfstol \
			  analyser-nob-norm.hfstol
endif # WANT_MORPHOLOGY

if WANT_GENERATION
GT_GENERATORS+=generator-nob-desc.hfstol \
			   generator-nob-norm.hfstol
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

generator-raw-gt-desc.hfst: generator-raw-gt-desc.tmp.hfst \
					filters/reorder-subpos-tags.$(GTLANG).hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/reorder-subpos-tags.$(GTLANG).hfst\" \
			.o. @\"$<\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --xerox-composition=ON \
		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
			-S '+Cmp' -a 10 --arcs-only \
		> $@

analyser-raw-gt-desc.xfst: analyser-raw-gt-desc.tmp.xfst \
					filters/reorder-subpos-tags.$(GTLANG).xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
				@\"filters/reorder-subpos-tags.$(GTLANG).xfst\" \
			.o. @\"$<\" \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

analyser-raw-gt-desc.foma: analyser-raw-gt-desc.tmp.foma \
					filters/reorder-subpos-tags.$(GTLANG).foma
	$(AM_V_XFST)$(PRINTF) "read regex \
				@\"filters/reorder-subpos-tags.$(GTLANG).foma\" \
			.o. @\"$<\" \
			;\n\
		 save stack $@\n\
		 quit\n" | $(FOMA) -p $(VERBOSITY)

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
					filters/remove-semantic-tags.hfst              \
					filters/remove-homonymy-tags.hfst              \
					filters/remove-variant-tags.hfst               \
					filters/remove-derivation-position-tags.hfst   \
					filters/remove-dialect-tags.hfst               \
					filters/remove-norm-comp-tags.hfst             \
					filters/remove-usage-tags.hfst                 \
					filters/remove-ABBR-strings.hfst               \
					filters/remove-ACR-strings.hfst                \
				    filters/remove-derivation-strings.hfst         \
					filters/remove-error-strings.hfst              \
					filters/remove-PUNCT-strings.hfst              \
					filters/remove-UseCirc-strings.hfst            \
					filters/remove-RCmpnd-strings.hfst             \
					filters/remove-orthography-tags.hfst           \
					filters/remove-Orth_Strd-strings.hfst          \
					filters/remove-CLB-strings.hfst                \
					filters/remove-hyphenated-strings.hfst         \
					filters/remove-mwe-strings.hfst
	$(AM_V_RGX2FST)$(PRINTF) \
			   "@\"filters/remove-semantic-tags.hfst\"              \
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
			.o. @\"filters/remove-error-strings.hfst\"              \
			.o. @\"filters/remove-orthography-tags.hfst\"           \
			.o. @\"filters/remove-Orth_Strd-strings.hfst\"          \
			.o. @\"$<\" \
			.o. @\"filters/remove-mwe-strings.hfst\"                \
			.o. @\"filters/remove-hyphenated-strings.hfst\"         \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

# Xerox version, mainly used for debugging
analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst: \
					analyser-raw-gt-desc.xfst                      \
					filters/remove-semantic-tags.xfst              \
					filters/remove-homonymy-tags.xfst              \
					filters/remove-variant-tags.xfst               \
					filters/remove-derivation-position-tags.xfst   \
					filters/remove-dialect-tags.xfst               \
					filters/remove-norm-comp-tags.xfst             \
					filters/remove-usage-tags.xfst                 \
					filters/remove-ABBR-strings.xfst               \
					filters/remove-ACR-strings.xfst                \
				    filters/remove-derivation-strings.xfst         \
					filters/remove-error-strings.xfst              \
					filters/remove-PUNCT-strings.xfst              \
					filters/remove-UseCirc-strings.xfst            \
					filters/remove-RCmpnd-strings.xfst             \
					filters/remove-orthography-tags.xfst           \
					filters/remove-Orth_Strd-strings.xfst          \
					filters/remove-CLB-strings.xfst                \
					filters/remove-hyphenated-strings.xfst         \
					filters/remove-mwe-strings.xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
				@\"filters/remove-semantic-tags.xfst\"              \
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
			.o. @\"filters/remove-error-strings.xfst\"              \
			.o. @\"filters/remove-orthography-tags.xfst\"           \
			.o. @\"filters/remove-Orth_Strd-strings.xfst\"          \
			.o. @\"$<\" \
			.o. @\"filters/remove-mwe-strings.xfst\"                \
			.o. @\"filters/remove-hyphenated-strings.xfst\"         \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

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
	$(AM_V_RGX2FST)$(PRINTF) \
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
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
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
	$(AM_V_XFST)$(PRINTF) "read regex \
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
		 quit\n" | $(XFST) $(VERBOSITY)

# The second step, to extract the strings that follow
# FIN orthographic conventions for the stem (and SME in the inflections):
generator-tts-gt-norm_nonum_noabbr_nohyph_fin.hfst: \
					generator-tts-gt-norm_nonum_noabbr_nohyph.hfst \
					filters/extract-OLang_FIN-strings.hfst         \
					filters/remove-orig_lang-tags.hfst             \
					filters/remove-nonfirst_infl_boundary-marks.hfst
	$(AM_V_RGX2FST)$(PRINTF) \
			   "@bin\"filters/remove-orig_lang-tags.hfst\"     \
			.o. @bin\"filters/extract-OLang_FIN-strings.hfst\"   \
			.o. @bin\"$<\" \
			.o. @bin\"filters/remove-nonfirst_infl_boundary-marks.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

generator-tts-gt-norm_nonum_noabbr_nohyph_fin.xfst: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst  \
					filters/extract-OLang_FIN-strings.xfst         \
					filters/remove-orig_lang-tags.xfst             \
					filters/remove-nonfirst_infl_boundary-marks.xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
			    @\"filters/remove-orig_lang-tags.xfst\"     \
			.o. @\"filters/extract-OLang_FIN-strings.xfst\" \
			.o. @\"$<\" \
			.o. @\"filters/remove-nonfirst_infl_boundary-marks.xfst\" \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# The second step, to extract the strings that follow
# NOB (and NNO + SWE) orthographic conventions for the stem::
generator-tts-gt-norm_nonum_noabbr_nohyph_nob.hfst: \
					generator-tts-gt-norm_nonum_noabbr_nohyph.hfst \
					filters/extract-OLang_NOB-strings.hfst         \
					filters/extract-OLang_NNO-strings.hfst         \
					filters/extract-OLang_SWE-strings.hfst         \
					filters/remove-orig_lang-tags.hfst             \
					filters/remove-nonfirst_infl_boundary-marks.hfst
	$(AM_V_RGX2FST)$(PRINTF) \
			   "@bin\"filters/remove-orig_lang-tags.hfst\"     \
			.o. \
			  [ @bin\"filters/extract-OLang_NOB-strings.hfst\"   \
			  | @bin\"filters/extract-OLang_NNO-strings.hfst\"   \
			  | @bin\"filters/extract-OLang_SWE-strings.hfst\" ] \
			.o. @bin\"$<\" \
			.o. @bin\"filters/remove-nonfirst_infl_boundary-marks.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

generator-tts-gt-norm_nonum_noabbr_nohyph_nob.xfst: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.xfst  \
					filters/extract-OLang_NOB-strings.xfst         \
					filters/extract-OLang_NNO-strings.xfst         \
					filters/extract-OLang_SWE-strings.xfst         \
					filters/remove-orig_lang-tags.xfst             \
					filters/remove-nonfirst_infl_boundary-marks.xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
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
		 quit\n" | $(XFST) $(VERBOSITY)

# We need to add processing of language-specific tags in the analyser:
# HFST:
analyser-gt-norm.hfst: analyser-gt-norm.tmp.hfst \
					 filters/remove-allegro-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/remove-allegro-tags.hfst\" \
			.o. @\"$<\"                                       \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		| $(HFST_INVERT) $(VERBOSITY) $(HFST_FLAGS) \
		> $@

# Xerox:
analyser-gt-norm.xfst: analyser-gt-norm.tmp.xfst \
					filters/remove-allegro-tags.xfst
	$(AM_V_XFST)$(PRINTF) "read regex                         \
				@\"filters/remove-allegro-tags.xfst\" \
			.o. @\"$<\"                                       \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# ... and also in the Oahpa analyser:
# HFST:
analyser-oahpa-gt-norm.hfst: analyser-gt-norm.tmp.hfst \
					 filters/remove-allegro-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/remove-allegro-tags.hfst\" \
			.o. @\"$<\"                                       \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		| $(HFST_INVERT) $(VERBOSITY) $(HFST_FLAGS)
		> $@

# Xerox:
analyser-oahpa-gt-norm.xfst: analyser-gt-norm.tmp.xfst \
					filters/remove-allegro-tags.xfst
	$(AM_V_XFST)$(PRINTF) "read regex                         \
				@\"filters/remove-allegro-tags.xfst\" \
			.o. @\"$<\"                                     \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# We need to add processing of language-specific tags in the generator:
# HFST:
generator-gt-%.hfst: generator-gt-%.tmp.hfst \
					 filters/make-optional-allegro-tags.hfst \
					 filters/make-optional-coll-tags.hfst    \
					 filters/make-optional-lang_hom-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/make-optional-allegro-tags.hfst\"  \
			.o. @\"filters/make-optional-coll-tags.hfst\"     \
			.o. @\"filters/make-optional-lang_hom-tags.hfst\" \
			.o. @\"$<\"                                       \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

# Xerox:
generator-gt-%.xfst: generator-gt-%.tmp.xfst \
					 filters/make-optional-allegro-tags.xfst \
					 filters/make-optional-coll-tags.xfst    \
					 filters/make-optional-lang_hom-tags.xfst
	$(AM_V_XFST)$(PRINTF) "read regex                         \
				@\"filters/make-optional-allegro-tags.xfst\"  \
			.o. @\"filters/make-optional-coll-tags.xfst\"     \
			.o. @\"filters/make-optional-lang_hom-tags.xfst\" \
			.o. @\"$<\"                                       \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# We need to add processing of language-specific tags for the Oahpa generators:
# HFST:
generator-oahpa-gt-norm.hfst: generator-oahpa-gt-norm.tmp.hfst \
					 filters/make-optional-allegro-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/make-optional-allegro-tags.hfst\"  \
			.o. @\"$<\"                                       \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

# Xerox:
generator-oahpa-gt-norm.xfst: generator-oahpa-gt-norm.tmp.xfst \
					 filters/make-optional-allegro-tags.xfst
	$(AM_V_XFST)$(PRINTF) "read regex                         \
				@\"filters/make-optional-allegro-tags.xfst\"  \
			.o. @\"$<\"                                       \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

include $(top_srcdir)/am-shared/src-dir-include.am
