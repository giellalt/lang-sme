# Lemma-tests for *nouns* in ...`nouns.lexc`


**eananiehttevuodja** failures:

* `eananiehttevuodja+N+Sg+Nom` => `eananniehttevuodja`
* `eananiehttevuodja+N+Pl+Nom` => `eananniehttevuojat`
* `eananiehttevuodja` has following analyses:
  * `eana+N+Cmp/SgNom+Cmp#niehttevuodja+N+Sg+Nom`
  * `eananiehtti+N+Cmp/SgNom+Cmp#vuodja+N+Sg+Nom`
  * `eana+N+Cmp/SgNom+Cmp#niehtti+N+Cmp/SgNom+Cmp#vuodja+N+Sg+Nom`

## Lemma statistics
* 91327 lemmas
* 99.99890503356073 % success

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
