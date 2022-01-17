
# Continuation lexicons for abbreviations

## Lexica for adding tags and periods

## The sublexica

### Continuation lexicons for abbrs both with and witout final period

* **LEXICON ab-dot-noun-adj-trab**@CODE@****

* **LEXICON ab-noun**@CODE@****

* **LEXICON ab-adj**@CODE@****

* **LEXICON ab-adv**@CODE@****

* **LEXICON ab-num**@CODE@****

### Lexicons without final period

* **LEXICON ab-nodot-nounbulk**  The bulk

* **LEXICON ab-nodot-adj**@CODE@****

* **LEXICON ab-nodot-adv**@CODE@****

* **LEXICON ab-nodot-num**@CODE@****

### Lexicons with final period

* **LEXICON ab-dot-nounperiod.**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-adjperiod.**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-advperiod.**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-numperiod.**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-cc**@CODE@****



* **LEXICON ab-verbverbs.**  A lexicon for "gč." and perhaps also other abbreviated verbs.


* **LEXICON ab-dot-verb**@CODE@****

* **LEXICON ab-nodot-verb**@CODE@****


* **LEXICON ab-dot-IVprfprc**@CODE@****


* **LEXICON nodot-attrnomaccgen-infl**@CODE@****

* **LEXICON nodot-attr-infl**@CODE@****

* **LEXICON nodot-nomaccgen-infl**@CODE@****


* **LEXICON dot-attrnomaccgen-infl**@CODE@****

* **LEXICON dot-attr**@CODE@****

* **LEXICON dot-nomaccgen-infl**@CODE@****


* **LEXICON DOTabbreviations.** - Adds the dot to dotted abbreviations.
we also allow different variations of dotted abbreviations at
the end of the sentence (especially for tokenisers)
* "su." gets analysed as `"su" Adv ABBR`
in tokeniser mode also:
* "su." -> `"su" Adv ABBR` + `"." CLB` to account for sentence
final su with no extra full stop.
* also `"son" Pron Pers Sg3 Gen/Acc` + `"." CLB` due to
homonymy.
Same treatment is done with two and three full stops after abbreviation in
the end of the sentence:
* "su.." -> `"su" Adv Abbr` + `"." CLB Err/Orth`
* "su..." -> `"su" Adv Abbr` + `"..." CLB`

* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/abbreviations.lexc](http://github.com/giellalt/lang-sme/blob/main/../src/fst/affixes/abbreviations.lexc)</small>