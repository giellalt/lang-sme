README
======

This directory contains reordering and relabeling files to be
used by analysers and generators in Apertium. One file is generated, and the
manually written files can either be general or language-pair specific.

The recognised filenames and filename patterns, and their use in the order they
are applied, are:

apertium.relabel             - automatically generated, converts all tags in src/morphology/root.lexc
                               to apertium format
modify-tags.regex            - general changes of fst tags, input = apertium.relabel format: All tags you
			       want CHANGED from gt to apertium format you change (or delete) here
apertium.postproc.relabel    - general relabelling, manually added/maintained DEPRECATED FILE, DO NOT USE
modify-tags.TARGETLANG.regex - language-pair-specific changes using regex, ma
apertium.TARGETLANG.relabel  - language-pair-specific relabelling, manually add/maint.
gt2apertium.cg3relabel       - tag conversion to CG, manually maintained (to be documented)

Replace TARGETLANG with the language code of the actual target language you
are building your Northern Sami apertium analyser for.


The remaining files can be added as needed, and will be automatically picked up
by the build process if found.

NB! Regex files are applied BEFORE manually written relabel files if both files
are used. But the generated apertium.relabel always goes first. See order of
application above!
