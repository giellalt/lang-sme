# Lemma-tests for *verbs* in ...`verbs.lexc`


## Lemma statistics
* 15286 lemmas
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
        "lexcfile": ".../stems/adjectives.lexc"
    },
    "analyser": ".../analyser-gt-norm.hfstol",
    "generator": ".../generator-gt-norm.hfstol",
    "lexcroot": ".../root.lexc",
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
        "lexcfile": ".../stems/nouns.lexc"
    },
    "otherlexcs": [
        ".../stems/adpositions.lexc",
        ".../stems/adverbs.lexc",
        ".../stems/numerals.lexc",
        ".../stems/conjunctions.lexc",
        ".../stems/interjections.lexc",
        ".../stems/numerals.lexc",
        ".../stems/pronouns.lexc",
        ".../affixes/abbreviations.lexc",
        ".../affixes/adjectives.lexc",
        ".../affixes/nouns.lexc",
        ".../affixes/numerals.lexc",
        ".../affixes/possessive-suffixes.lexc",
        ".../affixes/propernouns.lexc",
        ".../affixes/symbols.lexc",
        ".../affixes/verbs.lexc",
        ".../generated_files/smi-sme-abbreviations.lexc",
        ".../generated_files/smi-sme-acronyms.lexc",
        ".../generated_files/smi-sme-arabic_roman_digits.lexc",
        ".../generated_files/smi-sme-digits.lexc",
        ".../generated_files/mul-sme-punctuation.lexc",
        ".../generated_files/mul-sme-symbols.lexc"
    ],
    "propernouns": {
        "exclusions": [
            "(ProperNoun|\\+Use/MT)"
        ],
        "lemmatags": [
            "+N+Prop+Sg+Nom",
            "+N+Prop+Pl+Nom",
            "+N+Prop+Attr"
        ],
        "lexcfile": ".../stems/sme-propernouns.lexc"
    },
    "verbs": {
        "exclusions": [
            "(STRAYFORMS|ENDLEX|\\+Neg|\\+Use/MT)"
        ],
        "lemmatags": [
            "+V+Inf"
        ],
        "lexcfile": ".../stems/verbs.lexc"
    }
}
```
