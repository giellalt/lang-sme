## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# The current dir must be built after the filters, but before the rest.
SUBDIRS = filters . desktop mobile

### BEGIN: Local build rules: *.hfst: *.tmp.hfst ###

# Remove improper derivations by turning the DerN tags into flag
# diacritics blocking wrong order derivations.
#
# Remove ungrammatical compounds by turning tags into flags:
# 1. Insert tags for default compounding
# 2. Split multiple tags into separate paths
# 3. Convert tags to flags
# 4. Make flags two-sided
generator-fstspeller-gt-norm-comp_restricted.tmp1.hfst: \
		generator-fstspeller-gt-norm-comp_restricted.tmp.hfst \
		filters/insert-default-compounding-tags.hfst \
		filters/insert-default_left_compounding-tags.hfst \
		filters/block-illegal_compound-strings.hfst  \
		filters/remove-illegal-derivation-strings.hfst \
		filters/remove-Use_Minus_PLX-tags.hfst       \
		filters/split-CmpN-tags.hfst
	$(AM_V_HXFST)$(PRINTF) "\
		read regex                                                 \
			@\"filters/block-illegal_compound-strings.hfst\"       \
		.o. @\"filters/split-CmpN-tags.hfst\"                      \
		.o. @\"filters/insert-default_left_compounding-tags.hfst\" \
		.o. @\"filters/insert-default-compounding-tags.hfst\"      \
		.o. @\"filters/remove-illegal-derivation-strings.hfst\"    \
		.o. @\"filters/remove-Use_Minus_PLX-tags.hfst\"            \
		.o. @\"$<\"                                                \
		; \n\
		 twosided flag-diacritics\n\
		 save stack $@\n\
		 quit\n" | $(HFST_XFST) -p $(VERBOSITY)

# Always use Foma to eliminate flags if available, independently of
# configuration:
if HAS_FOMA

# Do not change or add the flags eliminated without thoroughly testing the
# effect on fst file size (including the acceptor file) and speller speed:
generator-fstspeller-gt-norm-comp_restricted.hfst: \
		generator-fstspeller-gt-norm-comp_restricted.tmp1.hfst
	$(AM_V_FST2TXT)$(HFST_FST2TXT) --do-not-print-weights --format=att -i $< \
		-o $<.att
	$(AM_V_FOMA)$(PRINTF) "\
		read att $<.att \n\
		eliminate flag NeedsVowRed\n\
		eliminate flag Der1\n\
		eliminate flag Der2\n\
		eliminate flag Der3\n\
		eliminate flag Der4\n\
		eliminate flag Der5\n\
		eliminate flag Der_PassL\n\
		eliminate flag Der_PassS\n\
		eliminate flag CmpHyph\n\
		eliminate flag CmpN\n\
		eliminate flag Want_Left\n\
		write att $@.att\n\
		quit\n" | $(FOMA) $(VERBOSITY)
	$(AM_V_TXT2FST)$(HFST_TXT2FST) -i $@.att -o $@

# Else fall back to Hfst, but skip buggy eliminations:
else

# Do not change or add the flags eliminated without thoroughly testing the
# effect on fst file size (including the acceptor file), speller speed and
# linguistic correctness (run the yaml tests):
generator-fstspeller-gt-norm-comp_restricted.hfst: \
		generator-fstspeller-gt-norm-comp_restricted.tmp1.hfst
	$(AM_V_HXFST)$(PRINTF) "\
		load $< \n\
		eliminate flag Der1\n\
		eliminate flag Der2\n\
		eliminate flag Der3\n\
		eliminate flag Der4\n\
		eliminate flag Der5\n\
		eliminate flag Der_PassL\n\
		eliminate flag Der_PassS\n\
		eliminate flag CmpHyph\n\
		save stack $@\n\
		quit\n" | $(HFST_XFST) -p $(VERBOSITY)

endif

#		eliminate flag CmpN\n\
#		eliminate flag NeedNoun\n\
#		eliminate flag NeedsVowRed\n\
#### END: Local build rules: *.hfst: *.tmp.hfst ####

include $(top_srcdir)/am-shared/tools-spellcheckers-fstbased-dir-include.am
