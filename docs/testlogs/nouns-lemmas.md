# Lemma-tests for *nouns* in ...`nouns.lexc`


**purporoaifiehta** failures:

* `purporoaifiehta+N+NomAg+Pl+Nom` does not generate!
* `purporoaifiehta+N+NomAg+Sg+Nom` does not generate!
* `purporoaifiehta+N+G7+Sg+Nom` does not generate!
* `purporoaifiehta+N+G3+Sg+Nom` does not generate!
* `purporoaifiehta+N+Pl+Nom` does not generate!
* `purporoaifiehta+N+Sg+Nom` does not generate!
* `purporoaifiehta` has no analyses either

**heaksa** failures:

* `heaksa+N+Pl+Nom` does not generate!
* `heaksa+N+G7+Sg+Nom` does not generate!
* `heaksa+N+NomAg+Sg+Nom` does not generate!
* `heaksa+N+Sg+Nom` does not generate!
* `heaksa+N+NomAg+Pl+Nom` does not generate!
* `heaksa+N+G3+Sg+Nom` does not generate!
* `heaksa` has no analyses either

**seavdinbumpa** failures:

* `seavdinbumpa+N+NomAg+Pl+Nom` does not generate!
* `seavdinbumpa+N+G7+Sg+Nom` does not generate!
* `seavdinbumpa+N+NomAg+Sg+Nom` does not generate!
* `seavdinbumpa+N+Sg+Nom` does not generate!
* `seavdinbumpa+N+G3+Sg+Nom` does not generate!
* `seavdinbumpa+N+Pl+Nom` does not generate!
* `seavdinbumpa` has no analyses either

**Mororeakšuvdna** failures:

* `Mororeakšuvdna+N+NomAg+Pl+Nom` does not generate!
* `Mororeakšuvdna+N+NomAg+Sg+Nom` does not generate!
* `Mororeakšuvdna+N+G7+Sg+Nom` does not generate!
* `Mororeakšuvdna+N+Pl+Nom` does not generate!
* `Mororeakšuvdna+N+G3+Sg+Nom` does not generate!
* `Mororeakšuvdna+N+Sg+Nom` does not generate!
* `Mororeakšuvdna` has no analyses either

**endometriosa** failures:

* `endometriosa+N+Sg+Nom` does not generate!
* `endometriosa+N+Pl+Nom` does not generate!
* `endometriosa+N+G3+Sg+Nom` does not generate!
* `endometriosa+N+NomAg+Pl+Nom` does not generate!
* `endometriosa+N+G7+Sg+Nom` does not generate!
* `endometriosa+N+NomAg+Sg+Nom` does not generate!
* `endometriosa` has no analyses either

## Lemma statistics
* 91323 lemmas
* 99.98904985600561 % success

## Settings used

```json
{
    "adjectives": {
        "exclusions": [
            "(FINJU|\\+Use/MT|Lex|Sub)"
        ],
        "lemmatags": [
            "+A+Sg+Nom",
            "+A+Attr",
            "+A+Pl+Nom"
        ],
        "lexcfile": ".../adjectives.lexc"
    },
    "analyser": ".../analyser-gt-norm.hfstol",
    "generator": ".../generator-gt-norm.hfstol",
    "nouns": {
        "exclusions": [
            "(CmpN/Onlu|ShCmp|\\+Cmp/SplitR|\\+V\\+|AGAdj|AHKASAS|NOT-TO-LEMMATEST|ALLGUOVT|\\+Use/MT|RHyph|Cmp/Sh|Rnoun)"
        ],
        "lemmatags": [
            "+N+Sg+Nom",
            "+N+Pl+Nom",
            "+N+NomAg+Sg+Nom",
            "+N+NomAg+Pl+Nom",
            "+N+G3+Sg+Nom",
            "+N+G7+Sg+Nom"
        ],
        "lexcfile": ".../nouns.lexc"
    },
    "propernouns": {
        "exclusions": [
            "(ProperNoun|\\+Use/MT)"
        ],
        "lemmatags": [
            "+N+Prop+Sg+Nom",
            "+N+Prop+Pl+Nom",
            "+N+Prop+Attr"
        ],
        "lexcfile": ".../sme-propernouns.lexc"
    },
    "verbs": {
        "exclusions": [
            "(STRAYFORMS|ENDLEX|\\+Neg|\\+Use/MT)"
        ],
        "lemmatags": [
            "+V+Inf"
        ],
        "lexcfile": ".../verbs.lexc"
    }
}
```
