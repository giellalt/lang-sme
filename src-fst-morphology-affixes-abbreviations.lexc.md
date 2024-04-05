
# Continuation lexicons for abbreviations

## Lexica for adding tags and periods

## The sublexica

### Continuation lexicons for abbrs both with and witout final period

* **LEXICON ab-dot-noun-adj-trab**

* **LEXICON ab-noun**

* **LEXICON ab-adj**

* **LEXICON ab-adv**

* **LEXICON ab-num**

### Lexicons without final period

* **LEXICON ab-nodot-noun**  The bulk

* **LEXICON ab-nodot-adj**

* **LEXICON ab-nodot-adv**

* **LEXICON ab-nodot-num**

### Lexicons with final period

* **LEXICON ab-dot-noun**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-adj**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-adv**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-num**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-cc**

* **LEXICON ab-verb**  A lexicon for "gč." and perhaps also other abbreviated verbs.

* **LEXICON ab-dot-verb**

* **LEXICON ab-nodot-verb**

* **LEXICON ab-dot-IVprfprc**

* **LEXICON nodot-attrnomaccgen-infl**

* **LEXICON nodot-attr-infl**

* **LEXICON nodot-nomaccgen-infl**

* **LEXICON dot-attrnomaccgen-infl**

* **LEXICON dot-attr**

* **LEXICON dot-nomaccgen-infl**

* **LEXICON DOT** - Adds the dot to dotted abbreviations.
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

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/abbreviations.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/affixes/abbreviations.lexc)</small>
