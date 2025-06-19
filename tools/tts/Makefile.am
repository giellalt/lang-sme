## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

SUBDIRS = . test

####### Source file names: ########
# NB! If any of the filenames below are changed, then remember to also update
# the corresponding filename in `pipespec.xml.in`

GIELLA_ANL_VALENCY_SRC=valency.cg3
GIELLA_ANL_WHSPACE_ANAL_SRC=analyser-gt-whitespace.regex
GIELLA_ANL_MWEDIS_SRC=mwe-dis.cg3
GIELLA_ANL_DISAMBIGUATOR_SRC=disambiguator.cg3
GIELLA_ANL_FUNCTIONS_SRC=functions.cg3
GIELLA_ANL_DEPENDENCY_SRC=dependency.cg3
GIELLA_ANL_SEMSETS_SRC=semsets.cg3

# Tokeniser:
GIELLA_ANL_TOKENISER=tokeniser-tts-cggt-desc.pmhfst

# List transcriptor source files from src/transcriptions/ (without extension)
# that should NOT be included in the tts text processing (by default everything
# is included):
GIELLA_ANL_REMOVE_TRANSCRIPTORS=transcriptor-date-digit2text

# If there are additional, language specific files used in the GC archive,
# specify here:
LOCAL_ANL_ZIP_FILES=generated-remove-lexicalised-compounds.bin \
					acro2text.hfstol \
					text2phontext.hfstol \
					disamb-cleanups.bin \
					normalisation-cleanups.bin

#### BEGIN: Local build targets: ####

# Copy to file with another name, to work around VPATH / CG3 INCLUDE incomps:
generated-remove-lexicalised-compounds.cg3: remove-lexicalised-compounds.cg3
	$(AM_V_CP)cp -f $< $@

# Compile acro conversion to spelled out letters:
acro2text.hfstol: acro2text.regex
	$(AM_V_RGX2FST)$(HFST_REGEXP2FST) -S -i $< \
		| $(HFST_FST2FST) -O -o $@

# Convert normalised text to some sort of phonemic form:
text2phontext.hfstol: text2phontext.regex
	$(AM_V_RGX2FST)$(HFST_REGEXP2FST) -S -i $< \
		| $(HFST_FST2FST) -O -o $@

#### END: Local build targets:   ####

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-tts-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
