
# File containing North Saami abbreviations

## Lexica for adding tags and periods

Splitting in 4 + 1 groups, because of the preprocessor

* **LEXICON Abbreviation-sme **
1. The ITRAB ;	   lexicon (intransitive abbrs)
1. The TRNUMAB ;  lexicon (abbrs trans wrt. numberals)
1. The TRAB ;	   lexicon (transitive abbrs)
1. The NOAB ;	   lexicon (not really abbrs)
1. The NUMNOAB ;  lexicon (not behaving as abbr before num)

## The abbreviation lexicon itself

* **LEXICON ITRAB ** are intransitive abbreviations, A.S. etc.

* **LEXICON NOAB ** du, gen, jur

This class contains homonyms, which are both intransitive
abbreviations and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentnece (when next word has small letters) can be
considered as true cases.

* **LEXICON TRNUMAB ** contains abbreviations who are transitive in front of numerals

For abbrs for which numerals are complements, but other
words not necessarily are. This group treats arabic numerals as
if it were transitive but letters as if it were intransitive.

* **LEXICON TRAB ** contains transitive abbreviations

This lexicon is for abbrs that always have a constituent following it.

* **LEXICON NUMNOAB ** su, dii

This class contains homonyms, which are both abbrs for
which numerals are complements and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentence can be considered as true cases.

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/sme-abbreviations.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/stems/sme-abbreviations.lexc)</small>
