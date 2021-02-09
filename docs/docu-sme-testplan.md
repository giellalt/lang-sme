Test plan for sme
=================

Testing the morphological multitagger
-------------------------------------

### Lexical testing

Texts from various domains should be tested at regular intervals

-   Fiction
-   Religious texts
-   Administrative language, politics, etc.
-   Scientific texts

The corpus should be inspected, e.g. with the following command
(\~/gt/sme/ as the working directory):

`cat corp/* | preprocess abbr=bin/abbr.txt | lookup -flags             mbTT mbTT bin/sme.fst | grep '\?' | grep -v CLB | sort | uniq -c |             sort -nr | less`

The result will contain all non-Saami words in the lexicon. In order to
remove these foreign words from the list, the following command may be
used:

`cat corp/* | preprocess abbr=bin/abbr.txt | lookup -flags             mbTT mbTT bin/s\ me.fst | grep '\?' | grep -v CLB | cut -f1 | lookup             -flags mbTT bin/foreign.fst | grep '\?' | sort | uniq -c | sort -nr             | less`

The resulting list is an overview over words not recognised by the
parser. All-capital words should be ignored, or they could be tested
separately, with the command

`... | lookup -flags mbTT -f bin/cap-sme | ...`

By using this script words written in CAPITALS are analysed as well, but
run in this mode, the parser is to slow to analyse the full one-million
word corpus.

The remaining words should be inspected. Failure of recognising words
has one of three reasons:

1.  They are misspellings
2.  They are missing from the lexicon
3.  They are listed in the lexicon, but an error in the morphological or
    morphophonological system prevents the parser from recognising them.

In simple cases, errors should just be corrected. Otherwise they should
be reported to the [Bugzilla
database](http://giellatekno.uit.no/bugzilla/). Misspellings may be
ignored, or, if they are frequent, they should be added to the lexicon,
with a tag (at present the tag is "!SUB"). When developing a spell
checker, misspellings become interesting in their own right, but for the
development of the disambiguator, we are more interested in actually
analysing the words, than in pointing out that they are misspelled.

Clear formatting errors may be corrected in the corpus files, with the
following command:

`perl -i -pe 's/formatting_error/corrected_formatting/g'             corp/filename`

This should be done only in our old corpus, and only when it is totally
clear that the input string cannot be interpreted as anything else than
a formatting error. In our common corpus database we deal with
formatting errors with our file-specific [conversion
tools](/tools/docu-conversionscripts.html).

Words missing in the lexicon should be added, with their proper lexicon.

Words listed in the lexicon, but with one or more word forms not
analysed, are the most challenging ones. This implies that there is an
error in the morphophonological file twol-sme.txt or more probably in
the morphological section (for nouns, verbs and adjectives this means
sme-lex.txt). In case of morphological errors, the path through the
morphological derivation should be traced and inspected. In case of
morphophonological errors there are procedures within twolc for
detecting them (see the twolc manual).

### Grammatical testing

We want to test the following:

-   All forms of all paradigms
-   All consonant gradation patterns
-   All vowel alternations
-   Compounds

There is a discussion of this on the newsgroup. TODO: copy that
discussion into this document.

### Testing the parser

[testing tools](../../ling/docu-testing.html)

Status quo and directions for actively testing the parser:

#### Testing the morphology

The best way of testing the morphology is perhaps the command
`make n-paradigm WORD=johka`, as described in the testing tools. This
method is fine for the inflection of nouns, verbs and adjectives. As of
september 2004, the basic noun paradigms in Nickel have all ben tested,
as have the CG patterns. Priority should now be given to adjectives, and
to the verbs. The sublexica should all be run through the generator.

### Testing the individual lexemes

#### Adjectives

As for the adjectives, there are several subtypes that are not covered
by the existing lexica. One possible way of monitoring the situation
would be to write a perl script (or shell script) that takes as input a
list of adjectives, and gives their nom.sg., attributive form, gen.sg,
comparative nominative, comparative genitive, superlative and
superlative genitive forms, and then run representative lists of
adjectives through the script.

#### Verbs

As for the verbs, the verb file should be read through and checked for
transitivity (the question is whether the verbs are assigned correct
sublexicon).

#### P-positions and adverbs

TODO for a person with Saami as mother tongue: Read through the
pp-sme-lex.txt and adv-sme-lex.txtfiles and evaluate the division into
prepositions, postpositions, adpositions and adverbs.

#### Pronouns

Perhaps a script could be made to run all pronouns through a test.

#### Numerals

The chapter on numerals is still not properly written. Wait with testing
this until the code is more stable.

### Testing the correctness of the given analyses

When we test whether words are let through or not, we do not test
whether the parser actually gives correct analyses. A word may thus be
misanalysed, in two ways:

1.  It is misspelled, but still given an (errouneous) analysis
2.  It is correctly spelled, but given a grammatical analysis that it
    should not have had

The first issue is of major concern to the spell checker project, and
will not be dealt with here.

The second issue has great importance to the disambiguator, and to the
form generator isme.fst. Errors of this type pop up in two contexts:
When the parser is used as input to the disambiguator (and the correct
reading is missing from the input), and as a result of regularly reading
through the analysis of a shorter, non-disambiguated text.

Testing of the disambiguator
----------------------------

### Methods

Disambiguating is tested in the following way:

-   Ambiguity = \#Parses / \#Tokens
-   Recall = \#Tokens Correctly Disambiguated / \# Tokens = TP/P
-   Precision = \#Tokens Correctly disambiguated / \#Parses = TP/(TP+FP)

A token is correctly disambiguated when *at least one* of the readings
(parses) of the token is correct.

In the ideal case each token is uniquely and correctly disambiguated
with the correct parse. Here, both recall and precision will be 1.0. A
text where each token is annotated with all possible parses, the recall
will be 1.0, but the precision will be low. A high recall thus comes
with a price of low presicion. In other words: A recall of less than
100% indicates that some correct analyses were removed, and a precision
of less than 100% indicates that some wrong analyses were not removed.
The goal is to have both recall and precision as high as possible.

Testing procedure:

1.  Choose a reasonable short test, that has not been run on the parser
    before
2.  Run the test
    1.  Run the text through the morphological parser, and inspect the
        words that are not recognised by the parser. Add them to the
        parser, or remove the sentence in question from the text.
        Eventually: just run the test, but remove the sentences with
        unknown words afterwards. The idea here is that it is
        unreasonable to demand disambiguation from a sentence where some
        words are not recognised in the first place
    2.  A different test would be to include all sentences, and just
        count the failed words as well. They will have the analysis
        '?+', which of course is wrong.
3.  Count the ambiguity, prior to disambiguation. The number of parses
    is found like this:
    `cat file.txt | preprocess                --abbr=bin/abbr.txt | lookup -flags mbTT -utf8 bin/sme.fst |                lookup2cg | egrep '\t' | wc -l`.
    The number of tokens is
    `cat file.txt | preprocess --abbr=bin/abbr.txt | wc                -l`
4.  Count the tokens correctly disambiguated (by hand): Read through the
    analysed text, and count the number of words that have got a correct
    analysis. The string is
    `cat file.txt |                preprocess --abbr=bin/abbr.txt | lookup -flags mbTT -utf8                bin/sme.fst | lookup2cg | vislcg --grammar=src/sme-dis.rle |                less`.
5.  Then divide this number with the number of parses and get the
    presicion, and with the number of tokens, and get the recall.

During parser construction the recall and presicion data need not be a
goal in themselves. Another, equally important goal is to identify
errors and try to correct them. Deleting correct readings is a more
serious error than leaving the token ambigous.

### Testing recall of texts

At regular intervals, new, previously unseen texts should be tested for
type and token recall. The test prcedure, as well as test results, are
explained in the [sme test diary](sme-testdiary.html).

Reading through the code
------------------------

Although the parser might give correct output, the internal lexicon
structure may not be optimal. At some point, the code should be read
through with this in mind.
