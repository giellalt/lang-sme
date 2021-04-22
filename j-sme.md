[What is this?](WhatIsThis.html)

Source file documentation
=========================

-   [Documentation written in the source files](Links.html)
-   The source files themselves:
    [stems](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/morphology/stems/)
    /
    [affixes](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/morphology/affixes/)
    /
    [twolc](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/phonology/sme-phon.twolc)
    / [IPA](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/phonetics)
    / [syntax](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/syntax)

Using the analysers
===================

-   In the terminal: analyse words by writing `usme`, generate with
    `dsme`
-   Generation of:
    [paradigms](http://giellatekno.uit.no/cgi/p-sme.sme.html) /
    [text](http://giellatekno.uit.no/cgi/d-sme.sme.html) /
-   For more info, see [How to use the morphological
    parsers](/tools/docu-sme-manual.html)

Projects involving North Saami
==============================

-   [Oversyn over ulike FST-ar for nordsamisk](KompilereFST.html)
-   [Dictionary projects](/dicts/dicts.html)
-   [ICALL](/ped/index.html)
-   [Machine translation](/mt/MachineTranslation.html)
    -   [Converting the transducers to Apertium
        format](ConvertingToApertium.html)
-   [Grammar
    checker](http://gtweb.uit.no/cgi-bin/wiki/index.php/North_Saami_grammar_checker)
-   [Text-to-speech](http://giellatekno.uit.no//tts-plan.html)
-   [The L2 Transducer](TheL2Transducer.html)

Tags used for analysis
======================

-   The [morphological](docu-sme-grammartags.html), [morphological
    (readable version)](docu-mini-smi-grammartags.html) and
    [syntactic](docu-sme-syntaxtags.html) and
-   [Lemma homonymies and variants - tags for indentifying and
    sorting](../smi/lemma.html)
-   [Lemma homonymies and variants: Main documentation in
    English](../common/Variation_in_lexc.html)
-   [Documentation of how use the tags for search in
    Korp](../common/cqp.nob.html)

Discussions on improving our linguistic analysis
================================================

-   [Discussions on issues common for Saami
    languages](../smi/index.html)
-   [Discussions on restricting generating of possessive
    suffixes](PXdiscussion.html)

Morphophonology, morphology and syntax
======================================

-   [Documentation](docu-sme-twol.html) of the
    [`twol-sme.txt`](https://gtsvn.uit.no/langtech/trunk/gt/sme/src/twol-sme.txt)
    rule file
-   [Documentation](docu-sme-lex.html) of [the lexicon
    files](https://gtsvn.uit.no/langtech/trunk/gt/sme/src/)
-   [The use of flag diacritics](docu-sme-flag-diacritics.html)
-   Partly obsolete [Documentation of the disambiguation
    file](docu-sme-dis.html)
-   Syntax regression testing: run
    `sh test/src/syntax/disambiguation_developertest.sh` (you may
    eventually have to adjust the path following `$GTBIG`, the files are
    in `$GTBIG/gt/sme/corp`)
-   See also the general [disambiguation
    page](../../ling/docu-disambiguation.html).

Pre- and postprocessing
=======================

-   [Documentation of the preprocessing of running
    text](../../ling/preprocessor.html)
    1.  The perl-based
        [`preprocess`](https://gtsvn.uit.no/langtech/trunk/gt/script/preprocess)
        script, our current preprocessor
    2.  For reference: Documentation of the old xfst-based preprocessor
        [`tok.txt`](https://gtsvn.uit.no/langtech/trunk/gt/sme/src/tok.txt)
        is found [here](docu-sme-preprocessor.html)
-   [Documentation](../../ling/docu-case-allcaps.html) of
    [`inituppercase.regex`](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/orthography/inituppercase.regex),
    (initial capitalisation) and
    [`allcaps.xfst`](https://gtsvn.uit.no/langtech/trunk/gt/common/src/allcaps.xfst),
    the file for words written in all-caps. Note: The latter is
    presently not in use.
-   Translating from xerox-style to vislcg3-style is done with the
    script
    [`lookup2cg`](https://gtsvn.uit.no/langtech/trunk/gt/script/lookup2cg)

Normativity issues
==================

-   [A list of issues to the Saami language
    board](normativity-issues.html)

Speller optimisations
=====================

There is a [separate page](SpellerConfiguration.html) on speller
optimisations for SME.

Obsolete test reports, for reference
====================================

-   [A test plan for sme](docu-sme-testplan.html) (obsolete)
-   [A test diary for sme](sme-testdiary.html) (obsolete)
-   [Bug report sheet from the days before we got a bug report
    system)](docu-sme-bugs.html) (obsolete)
-   [Our earlier treatment of foreign
    words](../../ling/docu-foreign.html) (obsolete)
