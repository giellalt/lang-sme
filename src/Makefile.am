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
					 transcriptor-numbers2text-desc.hfst

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
					 transcriptor-numbers2text-desc.xfst
endif

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
GT_ANALYSERS_XFST+=analyser-dict-gt-desc.xfst analyser-dict-gt-norm.xfst
GT_GENERATORS_XFST+=generator-dict-gt-norm.xfst generator-dict-gt-desc.xfst
endif

#### HFST transducers
if CAN_HFST
GT_ANALYSERS_HFST+=
GT_GENERATORS_HFST+=generator-tts-gt-norm.hfst

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
# * only Guovdageaidnu dialect forms
generator-tts-gt-norm.hfst: generator-raw-gt-desc.hfst             \
					filters/make-optional-semantic-tags.hfst       \
					filters/make-optional-transitivity-tags.hfst   \
					filters/make-optional-homonymy-tags.hfst       \
					filters/make-optional-variant-tags.hfst        \
					filters/remove-derivation-position-tags.hfst   \
					filters/remove-dialect-tags.hfst               \
					filters/remove-hyphenation-marks.hfst          \
					filters/remove-infl_deriv-borders.hfst         \
					filters/remove-norm-comp-tags.hfst             \
					filters/remove-number-string-tags.hfst         \
					filters/remove-usage-tags.hfst                 \
					filters/remove-sub-forms.hfst                  \
					filters/remove-ABBR-strings.hfst               \
					filters/remove-illegal-derivation-strings.hfst \
					filters/remove-PUNCT-strings.hfst              \
					filters/remove-UseCirc-strings.hfst            \
					filters/remove-RCmpnd-strings.hfst             \
					filters/remove-CLB-strings.hfst
	$(AM_V_GEN)$(HFST_COMPOSE) $(HFST_FLAGS) -F -1 $< \
			-2 filters/remove-infl_deriv-borders.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-sub-forms.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-ABBR-strings.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-illegal-derivation-strings.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-PUNCT-strings.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-UseCirc-strings.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-RCmpnd-strings.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-CLB-strings.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-usage-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-number-string-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-norm-comp-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-dialect-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-derivation-position-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/make-optional-homonymy-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/make-optional-variant-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/make-optional-transitivity-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/make-optional-semantic-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		-o $@

# Apertium-related language-specific targets - modify to suit each language:
analyser-mt-%.und.hfst: analyser-mt-%.tmp.hfst
	$(AM_V_GEN)$(HFST_INVERT) $< \
		| $(HFST_FST2FST) $(HFST_FLAGS) -t -o $@

analyser-mt-gt-desc.sma.hfst: analyser-mt-gt-desc.tmp.hfst \
					filters/remove-dialect-tags.hfst \
					filters/remove-g-tags.hfst \
					filters/reorder-semantic-tags.hfst \
					filters/remove-deriv-strings-MT-sma.hfst \
					filters/remove-sub-forms.hfst
	$(AM_V_GEN)$(HFST_COMPOSE) $(HFST_FLAGS) -F -2 $< \
			-1 filters/remove-sub-forms.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/reorder-semantic-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-g-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-deriv-strings-MT-sma.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-dialect-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_INVERT) $(HFST_FLAGS) \
		-o $@

analyser-mt-gt-desc.smj.hfst: analyser-mt-gt-desc.tmp.hfst \
					filters/remove-dialect-tags.hfst \
					filters/reorder-semantic-tags.hfst \
					filters/remove-deriv-strings-MT-sma.hfst \
					filters/remove-sub-forms.hfst
	$(AM_V_GEN)$(HFST_COMPOSE) $(HFST_FLAGS) -F -2 $< \
			-1 filters/remove-sub-forms.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/reorder-semantic-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-g-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-deriv-strings-MT-sma.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_COMPOSE) $(HFST_FLAGS) -F \
			-1 filters/remove-dialect-tags.hfst \
		| $(HFST_MINIMIZE) $(HFST_FLAGS) \
		| $(HFST_INVERT) $(HFST_FLAGS) \
		-o $@


# We need to add processing of language-specific tags in the generator:
generator-gt-%.xfst: generator-gt-%.tmp.xfst \
				     filters/make-optional-lang_hom-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex                              \
				@\"filters/make-optional-lang_hom-tags.xfst\"     \
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
