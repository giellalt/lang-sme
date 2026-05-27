# Lemma-tests for *adjectives* in ...`adjectives.lexc`


## Lemma statistics
* 9625 lemmas
* 100.0 % success

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
