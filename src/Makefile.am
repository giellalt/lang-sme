## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# always build . last here, and tagsets have to be built after morphology
SUBDIRS = morphology phonology filters phonetics hyphenation orthography syntax transcriptions tagsets .

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
GT_GENERATORS+=analyser-lia_disamb-gt-desc.xfst
#			   generator-nob-desc.xfst \
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
GT_ANALYSERS+=analyser-gt-norm.hfst \
			  analyser-lia_disamb-gt-desc.hfstol
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
GT_ANALYSERS+=analyser-lia_disamb-gt-desc.foma
GT_GENERATORS+=
endif # CAN_FOMA


if WANT_DICTIONARIES
if CAN_HFST
GT_ANALYSERS+=analyser-dict-gt-norm.hfstol
endif # CAN_HFST

if CAN_XFST
GT_ANALYSERS+=analyser-dict-gt-norm.xfst
endif # CAN_XFST

if CAN_FOMA
GT_ANALYSERS+=analyser-dict-gt-norm.foma
endif # CAN_FOMA
endif # WANT_DICTIONARIES


#################################################
#### Add language-specific build rules here: ####

# Hfst - add weights to compounds if using tropical-semiring fst format:
if WITH_OFST_TROPICAL
generator-raw-gt-desc.hfst: generator-raw-gt-desc.tmp.hfst
	$(AM_V_REWEIGHT)$(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
			-S '+Cmp' -a 10 --arcs-only -i $< \
		> $@
endif

#		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
#			-S '+Der'  -a 5 --arcs-only \
#		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
#			-S '+Der1' -a 5 --arcs-only \
#		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
#			-S '+Der2' -a 5 --arcs-only \
#		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
#			-S '+Der3' -a 5 --arcs-only \
#		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
#			-S '+Der4' -a 5 --arcs-only \
#		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
#			-S '+Der5' -a 5 --arcs-only 

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
					filters/remove-UseLIA-strings.%             \
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
			.o. @\"filters/remove-UseLIA-strings.$*\"             \
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
					filters/remove-UseLIA-strings.%             \
					filters/remove-infl_boundary-marks.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@\"filters/remove-orig_lang-tags.$*\"     \
			.o. @\"filters/remove-UseLIA-strings.$*\"     \
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
					filters/remove-UseLIA-strings.%             \
					filters/remove-nonfirst_infl_boundary-marks.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@\"filters/remove-orig_lang-tags.$*\"       \
			.o. @\"filters/remove-UseLIA-strings.$*\"       \
			.o. @\"filters/extract-OLang_FIN-strings.$*\"   \
			.o. @\"$<\" \
			.o. @\"filters/remove-nonfirst_infl_boundary-marks.$*\" \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The second step, to extract the strings that follow
# NOB (and NNO + SWE) orthographic conventions for the stem::
generator-tts-gt-norm_nonum_noabbr_nohyph_nob.%: \
					analyser-tts-gt-norm_nonum_noabbr_nohyph.% \
					filters/extract-OLang_NOB-strings.%        \
					filters/extract-OLang_NNO-strings.%        \
					filters/extract-OLang_SWE-strings.%        \
					filters/remove-UseLIA-strings.%            \
					filters/remove-orig_lang-tags.%            \
					filters/remove-nonfirst_infl_boundary-marks.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			   "@\"filters/remove-orig_lang-tags.$*\"     \
			.o. @\"filters/remove-UseLIA-strings.$*\"             \
			.o. \
			  [ @\"filters/extract-OLang_NOB-strings.$*\"   \
			  | @\"filters/extract-OLang_NNO-strings.$*\"   \
			  | @\"filters/extract-OLang_SWE-strings.$*\" ] \
			.o. @\"$<\" \
			.o. @\"filters/remove-nonfirst_infl_boundary-marks.$*\" \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the analyser:
analyser-gt-desc.%: analyser-gt-desc.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-norm-comp-tags.%           \
					filters/remove-UseLIA-strings.%           \
					filters/remove-grammatical-tags.%         \
					filters/remove-Err_SpaceCmp-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-grammatical-tags.$*\"         \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-UseLIA-strings.$*\"           \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"     \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the analyser:
analyser-dict-gt-desc.%: analyser-dict-gt-desc.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-grammatical-tags.%         \
					filters/remove-norm-comp-tags.%           \
					filters/remove-UseLIA-strings.%           \
					filters/remove-Err_SpaceCmp-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-grammatical-tags.$*\"         \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-UseLIA-strings.$*\"           \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"     \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the analyser:
analyser-dict-gt-desc-mobile.%: analyser-dict-gt-desc-mobile.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-grammatical-tags.%         \
					filters/remove-norm-comp-tags.%           \
					filters/remove-UseLIA-strings.%           \
					filters/remove-Err_SpaceCmp-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-grammatical-tags.$*\"         \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-UseLIA-strings.$*\"           \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"     \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)


analyser-gt-norm.%: analyser-gt-norm.tmp.% \
					filters/remove-derivation-position-tags.% \
					filters/remove-grammatical-tags.%         \
					filters/remove-allegro-tags.% \
					filters/remove-Err_SpaceCmp-strings.% \
					filters/remove-illegal-derivation-strings-flagbased.% \
					filters/remove-MinusSpell-strings.% \
					filters/insert-default-compounding-tags.% \
					filters/insert-default_left_compounding-tags.% \
					filters/block-illegal_compound-strings.%  \
					filters/split-CmpN-tags.% \
					filters/convert_to_flags-CmpNP-tags.% \
					filters/remove-UseLIA-strings.%             \
					filters/split-CmpNP-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-allegro-tags.$*\" \
			.o. @\"filters/remove-grammatical-tags.$*\"         \
			.o. @\"filters/remove-derivation-position-tags.$*\"        \
			.o. @\"filters/block-illegal_compound-strings.$*\"         \
			.o. @\"filters/split-CmpN-tags.$*\"                        \
			.o. @\"filters/insert-default_left_compounding-tags.$*\"   \
			.o. @\"filters/insert-default-compounding-tags.$*\"        \
			.o. @\"filters/remove-UseLIA-strings.$*\"                  \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"            \
			.o. @\"filters/remove-illegal-derivation-strings-flagbased.$*\" \
			.o. @\"filters/convert_to_flags-CmpNP-tags.$*\"            \
			.o. @\"filters/split-CmpNP-tags.$*\"                       \
			.o. @\"filters/remove-MinusSpell-strings.$*\"              \
			.o. @\"$<\"                                                \
			;\n\
		 twosided flag-diacritics\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The operation 'twosided flag-diacritics" crashes Xerox badly, so we do with
# a simpler, less restrictive normative fst when building with Xerox:
analyser-gt-norm.xfst: analyser-gt-norm.tmp.xfst \
					filters/remove-norm-comp-tags.xfst             \
					filters/remove-grammatical-tags.xfst           \
					filters/remove-derivation-position-tags.xfst   \
					filters/remove-illegal-derivation-strings.xfst \
					filters/remove-allegro-tags.xfst               \
					filters/remove-UseLIA-strings.xfst             \
					filters/remove-Err_SpaceCmp-strings.xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
				@\"filters/remove-allegro-tags.xfst\"             \
			.o. @\"filters/remove-grammatical-tags.xfst\"         \
			.o. @\"filters/remove-norm-comp-tags.xfst\"           \
			.o. @\"filters/remove-derivation-position-tags.xfst\" \
			.o. @\"filters/remove-illegal-derivation-strings.xfst\" \
			.o. @\"filters/remove-UseLIA-strings.xfst\"           \
			.o. @\"filters/remove-Err_SpaceCmp-strings.xfst\"     \
			.o. @\"$<\"                                           \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# ... and also in the Oahpa analyser:
analyser-oahpa-gt-norm.%: analyser-oahpa-gt-norm.tmp.% \
					filters/remove-norm-comp-tags.%           \
					filters/remove-grammatical-tags.%         \
					filters/remove-derivation-position-tags.% \
					filters/remove-allegro-tags.%             \
					filters/remove-UseLIA-strings.%           \
					filters/remove-Err_SpaceCmp-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-allegro-tags.$*\" \
			.o. @\"filters/remove-grammatical-tags.$*\"         \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-UseLIA-strings.$*\"           \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"     \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... and also in the dict analyser:
# Needed to write a static pattern rule to avoid it also hitting *.hfstol files.
analyser-dict-gt-norm.hfst \
analyser-dict-gt-norm.xfst \
analyser-dict-gt-norm.foma: \
analyser-dict-gt-norm.%: generator-dict-gt-norm.%
	$(AM_V_XFST_TOOL)$(PRINTF) "\
		load stack $< \n\
		invert net \n\
		save stack $@ \n\
		quit \n" | $(XFST_TOOL)

# We need special treatment of the disamb fst going to further pmatch processing
# mainly due to the target pattern, thus listed here. The rule body and the
# dependencies should be the same as the regular disamb analysers below:
analyser-pmatchdisamb-gt-desc.hfst: analyser-pmatchdisamb-gt-desc.tmp.hfst \
				filters/remove-dialect-tags.hfst               \
				filters/remove-norm-comp-tags.hfst             \
				filters/remove-derivation-position-tags.hfst   \
				filters/remove-orig_lang-tags.hfst             \
				filters/rename-POS_before_Der-tags.hfst        \
				filters/remove-UseLIA-strings.hfst             \
				filters/remove-Err_SpaceCmp-strings.hfst       \
				filters/remove-semantic-tags-before-derivations.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex \
		    @\"filters/remove-derivation-position-tags.hfst\" \
		.o. @\"filters/remove-dialect-tags.hfst\"             \
		.o. @\"filters/remove-norm-comp-tags.hfst\"           \
		.o. @\"filters/remove-orig_lang-tags.hfst\"           \
		.o. @\"filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"filters/remove-semantic-tags-before-derivations.hfst\" \
		.o. @\"filters/remove-UseLIA-strings.hfst\"           \
		.o. @\"filters/remove-Err_SpaceCmp-strings.hfst\"     \
		.o. @\"$<\"                                           \
		;\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

# Regular disamb analysers here, all formats:
analyser-disamb-gt-desc.%: analyser-disamb-gt-desc.tmp.%      \
					filters/remove-orig_lang-tags.%           \
					filters/remove-norm-comp-tags.%           \
					filters/remove-dialect-tags.%             \
					filters/remove-derivation-position-tags.% \
					filters/remove-UseLIA-strings.%           \
					filters/rename-POS_before_Der-tags.%      \
					filters/remove-semantic-tags-before-derivations.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-dialect-tags.$*\"             \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-orig_lang-tags.$*\"           \
			.o. @\"filters/remove-UseLIA-strings.$*\"           \
			.o. @\"filters/rename-POS_before_Der-tags.$*\"      \
			.o. @\"filters/remove-semantic-tags-before-derivations.$*\" \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# LIA disamb analysers here, all formats:
analyser-lia_disamb-gt-desc.%: analyser-disamb-gt-desc.tmp.%      \
					filters/remove-orig_lang-tags.%           \
					filters/remove-grammatical-tags.%         \
					filters/remove-norm-comp-tags.%           \
					filters/remove-dialect-tags.%             \
					filters/remove-derivation-position-tags.% \
					filters/rename-POS_before_Der-tags.%      \
					filters/remove-semantic-tags-before-derivations.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-grammatical-tags.$*\"         \
			.o. @\"filters/remove-dialect-tags.$*\"             \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-orig_lang-tags.$*\"           \
			.o. @\"filters/rename-POS_before_Der-tags.$*\"      \
			.o. @\"filters/remove-semantic-tags-before-derivations.$*\" \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The HFST Grammar Checker analyser (keep the Err/SpaceCmp strings):
analyser-gramcheck-gt-desc.hfst: analyser-gramcheck-gt-desc.tmp.hfst \
				filters/remove-dialect-tags.hfst             \
				filters/remove-MinusSpell-strings.hfst       \
				filters/remove-norm-comp-tags.hfst           \
				filters/remove-derivation-position-tags.hfst \
				filters/rename-POS_before_Der-tags.hfst      \
				filters/remove-semantic-tags-before-derivations.hfst \
				filters/remove-word-boundary.hfst            \
				filters/remove-UseLIA-strings.hfst           \
				filters/remove-illegal-derivation-strings-flagbased.hfst \
    			filters/insert-default-compounding-tags.hfst      \
    			filters/insert-default_left_compounding-tags.hfst \
    			filters/block-illegal_compound-strings.hfst       \
    			filters/split-CmpN-tags.hfst                      \
    			filters/convert_to_flags-CmpNP-tags.hfst          \
    			filters/split-CmpNP-tags.hfst                     \
				orthography/block-double_spellrelax.compose.hfst  \
				orthography/spellrelax-with-flagtags.compose.hfst \
				orthography/comprelax-with-flagtags.compose.hfst
	$(AM_V_HXFST)$(PRINTF) "\
	set encode-weights ON\n\
	read regex \
			@\"filters/remove-dialect-tags.hfst\"             \
		.o. @\"filters/remove-norm-comp-tags.hfst\"           \
		.o. @\"filters/remove-derivation-position-tags.hfst\" \
		.o. @\"filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"filters/block-illegal_compound-strings.hfst\"       \
    	.o. @\"filters/split-CmpN-tags.hfst\"                      \
    	.o. @\"filters/insert-default_left_compounding-tags.hfst\" \
    	.o. @\"filters/insert-default-compounding-tags.hfst\"      \
    	.o. @\"filters/remove-illegal-derivation-strings-flagbased.hfst\" \
    	.o. @\"filters/convert_to_flags-CmpNP-tags.hfst\"             \
    	.o. @\"filters/split-CmpNP-tags.hfst\"                        \
		.o. @\"filters/remove-semantic-tags-before-derivations.hfst\" \
		.o. @\"filters/remove-UseLIA-strings.hfst\"                   \
		.o. @\"filters/remove-MinusSpell-strings.hfst\"               \
		.o. @\"orthography/block-double_spellrelax.compose.hfst\"     \
		.o. @\"$<\"                                                   \
		.o. @\"orthography/spellrelax-with-flagtags.compose.hfst\" \
		.o. @\"orthography/comprelax-with-flagtags.compose.hfst\"  \
		.o. @\"filters/remove-word-boundary.hfst\"                 \
		;\n\
	twosided flag-diacritics\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

# We need to add processing of language-specific tags in the generator:
define giella_generators
generator-gt-%.$(1): generator-gt-%.tmp.$(1) \
					 filters/remove-norm-comp-tags.$(1)               \
					 filters/remove-derivation-position-tags.$(1)     \
					 filters/make-optional-grammatical-tags.$(1)      \
					 filters/make-optional-allegro-tags.$(1)          \
					 filters/make-optional-coll-tags.$(1)             \
					 filters/make-optional-lang_hom-tags.$(1)         \
					 filters/rename_optional-POS_before_Der-tags.$(1) \
					 filters/remove-UseLIA-strings.$(1)               \
					 filters/remove-Err_SpaceCmp-strings.$(1)
	$$(AM_V_XFST_TOOL)$$(PRINTF) "read regex \
				@\"filters/make-optional-allegro-tags.$(1)\"          \
			.o. @\"filters/make-optional-coll-tags.$(1)\"             \
			.o. @\"filters/make-optional-lang_hom-tags.$(1)\"         \
			.o. @\"filters/make-optional-grammatical-tags.$(1)\"      \
			.o. @\"filters/rename_optional-POS_before_Der-tags.$(1)\" \
			.o. @\"filters/remove-norm-comp-tags.$(1)\"               \
			.o. @\"filters/remove-derivation-position-tags.$(1)\"     \
			.o. @\"filters/remove-UseLIA-strings.$(1)\"               \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$(1)\"         \
			.o. @\"$$<\"                                              \
			;\n\
		 $$(INVERT_XFST)$$(INVERT_FOMA)\
		 save stack $$@\n\
		 quit\n" | $$(XFST_TOOL)
endef
$(foreach fst,hfst xfst foma,$(eval $(call giella_generators,$(fst))))

# We need to add processing of language-specific tags for the Oahpa generators:
generator-oahpa-gt-norm.%: generator-oahpa-gt-norm.tmp.% \
					filters/remove-norm-comp-tags.%               \
					filters/remove-derivation-position-tags.%     \
					filters/make-optional-allegro-tags.%          \
					filters/make-optional-grammatical-tags.%      \
					filters/rename_optional-POS_before_Der-tags.% \
					filters/remove-UseLIA-strings.%               \
					filters/remove-Err_SpaceCmp-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/make-optional-allegro-tags.$*\"          \
			.o. @\"filters/make-optional-grammatical-tags.$*\"      \
			.o. @\"filters/rename_optional-POS_before_Der-tags.$*\" \
			.o. @\"filters/remove-norm-comp-tags.$*\"               \
			.o. @\"filters/remove-derivation-position-tags.$*\"     \
			.o. @\"filters/remove-UseLIA-strings.$*\"               \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"         \
			.o. @\"$<\"                                             \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# morpher is a morph segmenting variant: taloautoissani -> talo#auto>i>ssa>ni
morpher-gt-desc.%: morpher-gt-desc.tmp.% \
					filters/remove-dynamic_compound-char.% \
					filters/simplify-triple-der-borders.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-dynamic_compound-char.$*\".i  \
			.o. @\"filters/simplify-triple-der-borders.$*\".i  \
			.o. @\"$<\" \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# Dict-fst local modifications and language-specific changes:
generator-dict-gt-norm.%: generator-dict-gt-norm.tmp.%             \
					filters/remove-norm-comp-tags.%                \
					filters/remove-derivation-position-tags.%      \
					filters/make-optional-grammatical-tags.%       \
					filters/rename_optional-POS_before_Der-tags.%  \
					filters/remove-UseLIA-strings.%                \
					filters/remove-Err_SpaceCmp-strings.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			 @\"filters/rename_optional-POS_before_Der-tags.$*\" \
			.o. @\"filters/make-optional-grammatical-tags.$*\"   \
			.o. @\"filters/remove-norm-comp-tags.$*\"            \
			.o. @\"filters/remove-derivation-position-tags.$*\"  \
			.o. @\"filters/remove-UseLIA-strings.$*\"            \
			.o. @\"filters/remove-Err_SpaceCmp-strings.$*\"      \
			.o. @\"$<\"                                          \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... as well as in the HFST Grammar Checker generator:
generator-gramcheck-gt-norm.hfst: generator-gramcheck-gt-norm.tmp.hfst \
				filters/remove-norm-comp-tags.hfst           \
				filters/remove-derivation-position-tags.hfst \
				filters/remove-UseLIA-strings.hfst           \
				filters/make-optional-grammatical-tags.hfst  \
				filters/rename-POS_before_Der-tags.hfst
	$(AM_V_HXFST)$(PRINTF) "\
	set encode-weights ON\n\
	read regex \
			@\"filters/remove-norm-comp-tags.hfst\"           \
		.o. @\"filters/remove-derivation-position-tags.hfst\" \
		.o. @\"filters/make-optional-grammatical-tags.hfst\"  \
		.o. @\"filters/remove-UseLIA-strings.hfst\"           \
		.o. @\"filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"$<\"                                           \
		;\n\
	twosided flag-diacritics\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)


##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

include $(top_srcdir)/am-shared/src-dir-include.am
