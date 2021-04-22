Introduction
============

This file documents the use of a preprocessor no longer in use. As
explained below, the current preprocessor (called `preprocess`) is
documented (the documentation of the current preprocessor is found
[here](../../ling/preprocessor.html). The present document is left here
partly because it contains issues neutral to the choice of preprocessor
method, and partly because we might return to this preprocessor at some
point.

Within the Xerox framework, this is done with the *tokenize* tool. The
code itself is written as a set of regular expressions, and the source
file (tok.txt) is compiled by xfst into a preprocessor `tok.fst`.

In the present project, we have temporarily abandoned the preprocessor
`tok.fst` (from spring 2004 on), and replaced it with a perl-based
preprocessor (see the [documentation](../../ling/preprocessor.html) for
the file `gt/script/preprocess`. The main reason why we abandoned the
Xerox preprocessor that we document here is that its compilation time
ecxeeded half an hour on victorio, and several hours on local machines.
The reason why compilaton time exploded was our use of the Replace
operator @-&gt; (see below), it looks for the longest match, which takes
time.

When the abbreviation list was part of the tok.txt file, it meant a
pause of more than half an hour for every added abbreviation or
multiword expression. Thus, we moved to a non-compiled version, perl,
during the developmental phase. In a stable, finished parser, tokenize
is probably faster than perl, and we should consider migrating back.
This documentation will be important if and when we migrate back, but
also in the meantime it contains program-independent documentation on
abbreviation handling which deserves to be browsed through.

Tokenizing
==========

The tokenizer file
------------------

The starting point for the preprocessor was the tok1.fst preprocessor
file, written by Anne Schiller, and printed in the Karttunen/Beesley
book (cf. the first cvs versions of the tok.txt file). This file has
been revised several times. The leading idea behind the file is the
following:

The tokenizer has two purposes: It cuts text into sentences, and it cuts
sentences into words. Thus, symbols that are not letters or numbers are
separated from words and numbers. Sentence delimiter symbols (.?!) are
treated as separate tokens. In the morphological parser itself, these
symbols are given the tag '+CLB', for clause boundary.

The file is an xfst source file. It defines sets, joins them together as
either words, symbols, abbreviations, initials, or numerals (all being
referred to by the variable 'Token'. Then, a newline (NL) is introduced
after each token (Token + NL is called TOK1), all spaces are replaced by
newlines (TOK2). The abbreviations get a separate treatment, as
described in the next sentence. At the end of the tok.txt file, the
different token types (TOK1, TOK1, and the different classes of
abbreviations are composed together into one regular expression.

Handling abbreviations
----------------------

The challenge is to handle abbreviations, like e.g. this one. Even
though e.g. contains a final period, it shall not end a sentence. Then
there are other abbreviations, like "Ltd.", that may end sentences. The
preprocessor thus divides the abbreviations in 4 different groups,
according to whether they take *objects* or not (i.e. according to
whether there is an obligatory word or numeral following them or not):

-   INTRANSABBR (abbr that do not take an object: 'Lloyds Ltd.')
-   INTRANSNUMABBR (abbr that take CAP objects: '')
-   INTRANSCAPABBR (abbr that take NUM objects: 'Downing Str. 10')
-   TRANSABBR (abbr. that do take an object: 'Mr. Peters')

Here is the rule set that lies behind the treatment of abbreviations:

1.  *WORD + dot + space -&gt; sentence boundary*  
2.  When there is a listed abbreviation + space, it is detected what
    follows after the space. There are three possibilities: there can be
    a small letter, an capital letter or a number:
3.  *Any abbreviation + space + small letter -&gt; no sentence
    boundary*  
    Thus, all groups: TRANSABBR + INTRANSNUMABBR + INTRANSCAPABBR +
    INTRANSABBR. When a word starting with a small letter follows the
    abbreviation, all listed abbreviations are treated as *transitive*,
    i.e. no sentence boundary is inserted.
4.  Certain abbreviations + space + **capital letter** -&gt; no sentence
    boundary (TRANSABBR + INTRANSNUMABBR)  
    All other abbreviations (complement of "certain") + space + capital
    letter -&gt; sentence boundary (INTRANSCAPABBR + INTRANSABBR)
5.  Certain abbreviations + space + **number** -&gt; no sentence
    boundary (TRANSABBR + INTRANSCAPABBR)  
    All other abbreviations (complement of "certain") + space + number
    -&gt; sentence boundary  
    (from INTRANSNUMABBR + INTRANSABBR)

We thus have four groups:

-   A list of abbreviations that never end a sentence (A set called
    **TRANSABBR**)  
-   A list of abbreviations that do not end a sentence if followed by
    any letter. These abbreviations do end a sentence if followed by a
    number (A set called **INTRANSNUMABBR**)  
-   A list of abbreviations that do not end a sentence if followed by a
    number or a small letter. These abbreviations do end a sentence if
    followed by a capital letter. (A set called **INTRANSCAPABBR**)  
-   A list of abbreviations end a sentence if followed by a capital
    letter or a number. These do no end a sentence if followed by a
    small case letter. (A set called **INTRANSABBR**)  

In other words:

TRANSABBR / INTRANSNUMABBR / INTRANSCAPABBR / INTRANSABBR + small -&gt;
no sentence boundary

TRANSABBR + capital -&gt; no sentence boundary  
TRANSABBR + number -&gt; no sentence boundary

INTRANSNUMABBR + capital -&gt; no sentence boundary  
INTRANSNUMABBR + number -&gt; a sentence boundary

INTRANSCAPABBR + capital -&gt; a sentence boundary  
INTRANSCAPABBR + number -&gt; no sentence boundary

INTRANSABBR + capital -&gt; a sentence boundary  
INTRANSABBR + number -&gt; a sentence boundary  

It is better to have too few sentence boundaries than too many. Of the 4
sets listed above, the first invokes no sentence boundaries, and the
following ones invoke an increasing amount of them. Thus, when in doubt,
put the abbreviation in question in the sets as follows:  
*TRANSABBR* is better than *INTRANSNUMABBR*, which is better than
*INTRANSCAPABBR*, which is better than *INTRANSABBR*.

Examples
========

*Jeg kjøpte epler. de var dyre.* A sentence boundary, rule 1. A sentence
beginning with a small letter will be found in the grammar checker.  
*Siv.ing. Pia Aho stakk innom.* No sentence boundary, rule 3.  
*Siv.ing. og kunstner Pia Aho stakk innom.* No sentence boundary, rule
2.  
*Dette er Pia Aho, siv.ing. Hun kjøper ost.* No sentence boundary, rule
3. This is where there is a sentence boundary (in real life), but we
have to trust probabilities: it is likely that the first type of example
is more common than this type of example. If this hypothesis turns out
to be wrong, abbreviations can be moved into a more proper set. The
point is that we need to have this kind of an option.  
*F.eks. i Europa kjøpes det mye ost.* No sentence boundary, rule 3.  
*F.eks. kunstnerne kjøper mye ost.* No sentence boundary, rule 2.  
*Kjøp f.eks. 12 epler.* No sentence boundary, rule 4.  
*Jeg kjøper ost o.a. godt.* No sentence boundary, rule 2.  
*Jeg kjøper ost o.a. Ta med litt melk også.* A sentence boundary, rule
3  
*Jeg kjøpte epler, pærer, osv. Jeg tok også med meg melk.* A sentence
boundary, rule 3.  
*Kjøp epler, pærer, osv. ta med melk også.* No sentence boundary, rule
2.  
*Kjøp epler, pærer, osv. og ta også med melk.* No sentence boundary,
rule 2.  
*Også § 9, 3. avsn. nevner denne saka.* No sentence boundary, rule 2.  
*Les også § 9, 3. avsn. Der tar man opp denne saka.* A sentence
boundary, rule 3.  
*I Trosterudveien 6, leilighet nr. 7 bor det en mann.* No sentence
boundary, rule 4.  
*Jeg trekker lodd i Lotto. I fjor trakk jeg 110 000 nr. Året før trakk
jeg bare 18 000 nr. og det første året mitt 500 nr.* Two cases: A
sentence boundary, rule 3, and no sentence boundary, rule 2.
