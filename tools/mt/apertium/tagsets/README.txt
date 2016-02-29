README
======

This directory contains reordering and relabeling files to be
used by analysers and generators in Apertium. One file is generated, and the
manually written files can either be general or language-pair specific.

The recognised filenames and filename patterns, and their use in the order they
are applied, are:

apertium.relabel             - automatically generated, Giella -> Apertium
modify-tags.regex            - general tagset changes, man. added/maintained
apertium.postproc.relabel    - general relabelling, manually added/maintained DEPRECATED
modify-tags.TARGETLANG.regex - pair-specific changes using regex, manually m.
apertium.TARGETLANG.relabel  - pair-specific relabelling, manually add/maint.
gt2apertium.cg3relabel       - to be documented

Replace TARGETLANG with the language code of the actual target language you
are building your Northern Sami apertium analyser for.


The remaining files can be added as needed, and will be automatically picked up
by the build process if found.

NB! Regex files are applied BEFORE manually written relabel files if both files
are used. But the generated apertium.relabel always goes first. See order of
application above!
