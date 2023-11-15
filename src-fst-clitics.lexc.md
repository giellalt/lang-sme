Divvun & Giellatekno - open source grammars for Sámi and other languages

Clitics
-------

* `LEXICON K` - The starting point for all clitic handling. It contains:
    * `ENDLEX ;` - the no clitic case
    * `+Use/-GC: K_only ;` - regular clitic analysis, everywhere but in the grammar checker
* `< "+Use/GC":0 "@P.Pmatch.Loc@" 0:"∑" 0:"#" > K_only ;` - the grammar checker case: force the clitics to always be treated as a separate token

The lexicon K_only is for paths not going to  the K-less ENDLEX

The following lexicons are not referenced by the `K` lexicon, but directly in specific cases.

* `LEXICON K_not_ge` - mainly referenced by numerals

* * *

<small>This (part of) documentation was generated from [src/fst/clitics.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/clitics.lexc)</small>

---

