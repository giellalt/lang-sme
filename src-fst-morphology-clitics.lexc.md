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
    * `+Use/-GC: K_not_ge_cont ;` - regular clitic analysis, everywhere but in the grammar checker
* `< "+Use/GC":0 "@P.Pmatch.Loc@" 0:"∑" 0:"#" > K_not_ge_cont ;` - the grammar checker case: force the clitics to always be treated as a separate token

    * `+Use/-GC: K-default-neg_cont ;` - regular clitic analysis, everywhere but in the grammar checker
* `< "+Use/GC":0 "@P.Pmatch.Loc@" 0:"∑" 0:"#" > K-default-neg_cont ;` - the grammar checker case: force the clitics to always be treated as a separate token

    * `+Use/-GC: K-ge-neg_cont ;` - regular clitic analysis, everywhere but in the grammar checker
* `< "+Use/GC":0 "@P.Pmatch.Loc@" 0:"∑" 0:"#" > K-ge-neg_cont ;` - the grammar checker case: force the clitics to always be treated as a separate token

    * `+Use/-GC: K-son_cont ;` - regular clitic analysis, everywhere but in the grammar checker
* `< "+Use/GC":0 "@P.Pmatch.Loc@" 0:"∑" 0:"#" > K-son_cont ;` - the grammar checker case: force the clitics to always be treated as a separate token

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/clitics.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/clitics.lexc)</small>

---

