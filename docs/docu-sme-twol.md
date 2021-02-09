Documenting the North Saami twol rules file
===========================================

Introduction
------------

This is a documentation of the format of the file `gt/sme/twol-sme.txt`,
the twol rules file.

File structure
--------------

The file format, as well as the rule formalism and the usage of the
twolc program, is documented in [the Xerox manual on
twolc](http://www.xrce.xerox.com/competencies/content-analysis/fssoft/docs/twolc-92/twolc92.html).
The file itself consists of three sections: The Alphabet section, the
Sets section and the Rule section. The sections are treated below, one
by one.

The Alphabet section
--------------------

The parser uses the Saami letters that are found in the offical
spelling, i.e. *á, č, đ, ŋ, š, ŧ, ž*, in the UTF-8 encoding scheme of
Unicode. Unicode values for these North Saami letters can be found at
the relevant chapter of Michael Everson's [The Alphabets of
Europe](http://www.evertype.com/alphabets).

There are also some numbered letters in the alphabet section. They point
to morphophonemes. The symbols *e7, i7, u7, o7* refer to vowels with a
special, alternating behaviour. These are the ones that are printed with
a dot below in Sammallahti's dictionaries and their Norwegian pendants.
These vowels correspont to Nielsens vowel with breve above, and they
denote vowels that are short. The symbols *h8, g8, m8, n8* refer to
consonants that alternate in stem-final position. The symbols *b9, d9,
g9, h9, j9, m9, n9, p9, s9, t9, z9* refer to consonants *b, d, g, h*,
etc., that do not alternate, despite the behaviour of similar Saami
consonants. Thus, the word 'viehkat' has the stem viehkag, whereas the
word 'Rollag' has the stem Rollag9. This is to distinguish betweed the
alternating *-g* in 'viehkag' (which turns to *-t* in word-final
position), and the non-alternating *-g9* in 'Rollag9' (which always is
realised as *g*).

The symbol ¤ has two different functions. It prevents consonant
gradation, and it prevents the word-final vowel weakening i &gt; e, u
&gt; o.

The dummy symbols *X*1 to *Y8* denote morphophonological processes. *X*
are used for *nouns* only, *Y* for verbs only, and *Q* for processes
common to both nouns and verbs, cf. the following table.

There are also (so far undocumented) W symbols

The dummy symbol *:0* is there to prevent consonant gradation for
certain lexemes. Thus, when a stem ends in *:0*, it will not get weak
grade. Also, the *:0* symbol is also a member of the Lenition set.

For each dummy symbol *X1* etc. there is first a list over the rules
where the dummy applies, and then a partial list of the lexicons where
there is reference to the dummy in question (the lexica are in the file
sme-lex.txt, sublexicon paths are indicated by the '-&gt;' symbol.

    X1
    -ALLA- ETC. DERIVATIVES FROM TRISYLLABLES
    "Diphthong Simplification: Conditional in -alla- etc. Derivatives from Trisyllabics"
    "Diphthong Simplification: Optional before Deverbal -alla-, -adda-, -us"
    "Stem Vowel in Present Participials from i-Verbs"
    LEXICON EABBUCASE1 -> +Sg+Nom:X1 K ;  +Ess:X1n K ;
    LEXICON PxV -> :X1 Px3V ;
    LEXICON PxPlComV1 -> :X1 PxPlCom3V ;
    LEXICON BUORRE -> +A:X1 EssV "good A" ;
    LEXICON ARVI !Bisyllabic Impersonal Verbs! -> :X1 NominalFormsV1 ;
    LEXICON PrsV !Present Tense in Vocalic Verb Stems -> :X1 PrsV5 ;
    LEXICON DeverbalNounsMUITAL -> +us:X1uss JOHTOLAT ;
    LEXICON DeverbalVerbsMUITAL -> +alla:X1alla DIEHTIStem ;

    X2
    DIMINUTIVES;
    GENERAL METAPHONY
    "Diphthong Simplification in Certain Forms from u-Stems"
    "Diphthong Simplification in Actor Nouns from u-Verbs (Optional)"
    "Diphthong Simplification in Diminutives etc. from Trisyllabics with 2nd Syll u/o"
    "Metaphony in Actor Nouns of i-, a-, and u-Verbs"
    "Word Final Neutralization of g8, h8, m8"

    X3
    Ill Sg Metaphony (i/a1, a/1, e1/a1)
    "Diphthong Simplification in Certain Forms from u-Stems"
    "Diphthong Simplification in Actor Nouns from u-Verbs (Optional)"
    "Diphthong Simplification in IllSg and Certain Conjug. Forms of a-Stems"
    "Illative Singular Metaphony"
    "Metaphony in Actor Nouns of i-, a-, and u-Verbs"

    X4 WG
    "Stem Vowel in Present Participials from i-Verbs"
    "Word Final Deletion of n8 m8 g8 h8"
    LEXICON VIVVA !Animate Bisyll. V-Nouns -> +N+Sg+Gen:X4 R ;
    LEXICON MALIS !Tris. Inanim. Gradating C-Nouns -> +N:X4 MALIS0 ;
    LEXICON BOAZU !Anim. Contracted 0-Nouns -> +N:X4 BOAZU- ;
    LEXICON GADDI !Bisyll. V-Nouns with Comp. Forms -> +N:X4 BU/MUS ;

    X5 WG
    "Diphthong Simplification in i-Stems before Suffixes Beginning with j:"
    "Diphthong Simplification in Actor Nouns from i- and a-Stems (Optional)"
    "Stem Vowel in Present Participials from i-Verbs"

    X6 WG
    GENERAL METAPHONY
    "Diphthong Simplification in Certain Forms from u-Stems"
    "Diphthong Simplification in Actor Nouns from u-Verbs (Optional)"
    "Metaphony in Actor Nouns of i-, a-, and u-Verbs"
    "Word Final Deletion of n8 m8 g8 h8"

    X7
    vow shortening after long 1st syll
    "Optional Shortening of a1 in Compounds after Long 1st Syllable 1"
    "Optional Shortening of a1 in Compounds after Long 1st Syllable 2"
    "Stem Vowel in Present Participials from i-Verbs"
    "Word Final Neutralization of g8, h8, m8"

    X8
    WG vow shortening after long 1st syll
    "Optional Shortening of a1 in Compounds after Long 1st Syllable 1"
    "Optional Shortening of a1 in Compounds after Long 1st Syllable 2"
    "Stem Vowel in Present Participials from i-Verbs"
    "Word Final Deletion of n8 m8 g8 h8"

    X9 WG
    vow shortening in caritives
    "Word Final Deletion of n8 m8 g8 h8"

    Q1
    "Indicative Present Singular 3rd Final Vowel"
    LEXICON PrsV !Present Tense in Vocalic Verb Stems -> :Q1 PrsV2 ; ->  +Sg3: K ;

    Q2
    "Diphthong Simplification in IllSg and Certain Conjug. Forms of a-Stems"
    "Diphthong Simplification in Certain Conjugational Forms of i- and u-Stems"
    "Stem Vowel Shift a:e, i:e, u:o"
    LEXICON PrsV !Pres in Voc Verb Stems -> :Q2 PrsV3 ; ->  +Du1: K ; +Pl3:t K ;

    Q3
    "Diphthong Simplification in IllSg and Certain Conjug. Forms of a-Stems"
    "Diphthong Simplification in Certain Conjugational Forms of i- and u-Stems"
    "Imperative Present 1st/3rd Person and Connegative Final Vowel"
    LEXICON ImprtV1 !Imp for Voc Verb -> +Sg1:Q3n K ; +Sg3:Q3s K ;

    Q4
    "Stem Vowel in 1st and 2nd Person Singular Present"
    LEXICON PrsV !Pres Tns in Voc Verb -> :Q4 PrsV1 ; ->  +Sg1:n K ; +Sg2:t K ;

    Q5
    DIPHT SIMPLIFIC BEFORE CONDITIONAL MARKER IN U-STEMS
    "Diphthong Simplification in Actor Nouns from i- and a-Stems (Optional)"
    "Diphthong Simplification in u-Stems before Conditional Marker"
    "Stem Vowel before Conditional Marker"
    LEXICON CondV1 -> +Prs:Q5l CondBOAHTI ;

    Q6
    Vow shortening in bisyll sg2 imp&conneg
    "Vowel Shortening in Bisyllabic Sg2 Imperatives and Connegatives"
    LEXICON NominalFormsV -> :Q6 NominalFormsV3 ; ->  +Ger:dettiin K ;
    LEXICON PrsV !Pres in Voc Verb -> :Q6 PrsV4 ; ->  +ConNeg: K ;

    Q7
    "Diphthong Simplification in Certain Conjugational Forms of i- and u-Stems"
    "Potential Marker Metaphony"
    LEXICON ADVV -> +Adv:Q7t K ;
    LEXICON BOAHTICnj -> +Pot+Prs:Q7z1 PrsC ;

    Q8
    "Diphthong Simplification in Certain Forms from u-Stems"
    "Stem Vowel before Frequentative d"
    LEXICON DeverbalVerbsBOAHTI -> +d:Q8d ALISTStem ; ->  SG3PASS ;

    Q9
    "Stem Vowel before Frequentative l"
    !! Q9 not used in lexicon file!

    Y1 Len
    "Stem Vowel in Dual 2nd Person Imperative"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y2 Len
    "Stem Vowel in Dual 1st Person Imperative"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y3 Len
    "Stem Vowel in Plural 2nd Person Imperative"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y4 Len WG
    "Stem Vowel in Imperative Plural 1st Person and Passive Stem"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y5 Len WG
    Not Postvocalic j Surfacing (all other dummys have it)
    Not Word Final Cns Neutralisation (all other dummys have it)
    "Deletion: Final h s j z1 in Contracted Stems"
    "Diphthong Simplification in Certain Forms from u-Stems"
    "Stem Vowel in Contracted Stems"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y6 Len WG
    "Deletion: Final h s j z1 in Contracted Stems"
    "Diphthong Simplification in Certain Forms from u-Stems"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y7
    Len WG
    "Diphthong Simplification in IllSg and Certain Conjug. Forms of a-Stems"
    "Diphthong Simplification in Certain Conjugational Forms of i- and u-Stems"
    "Stem Vowel in Imperative Plural 1st Person and Passive Stem"
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Y8 WG
    "Stem Vowel before Reflexive s"

    Y9 Len
    "Lengthening of Central Consonants hk etc."
    "Lengthening of Central Consonants pm etc."
    "Lengthening of Central Consonants tnj"
    "Lengthening of Central Consonants dj"

    Q Len NonMPDummy
    "Stem Vowel in Present Participials from i-Verbs"


    W3 Second syllable deletion in compounding

    W4 Optional vowel shortening i:e and u:o i diminutives

    W5 Metaphony i:á and u:o in diminutive.frequentative verbs

    W6 Metaphony i:á in subitive-frequentative verbs

    W7 Metaphony in incoative verb derivation -stuvvat and diminutive-frequentative -stallat/-staddat

    W8 Vowel shortening i:e in verb derivation -meahttun.

    W9 Blocking the e:i change in front of illative j, cf. the difference between 
       W9-less Børre:Børrii and W9 Sijte:Sijtei.

Summary of dummy explanations:

            
                  X                 Y               Q
                  1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 9 Q
             WeG        x x x   x x                       x x x x x
             Len                    x x x x x x x                     x
        FinalDum    x   x     x x
        NonMPDum  x     x     x x                                     x
           DnotY  x x x x x x x x x x x x x   x x x x x x x x x x x x x
    FinalH-ctrst
    Diphtsimplif    x x     x               x x                   x
    Diphtsim-Ill      x                         x     x x
    Dipsim-iu-st                                x     x x       x
    Gen Metaphon    x       x
    PrsPtc i-vrb  x     x x   x x
    Wfinnmgh-del        x   x   x x
    WfinCnsneutr    x         x

The *Sets* section
------------------

Vow and Cns are self-explanatory, StemCns are the stem-final consonants.

WeG is the set of Dummy symbols that trigger weak grade.

One set is added to the original inventory, the set DummyNotY5. In the
original file, the rules here involved a subtraction operation that did
not give the desired result.

The Rules section
-----------------

### i:j alternation rules

This is a problematic alternation. The original 1993 rule did not give
"muitalit" for "mujtalit". The operator is "&lt;=" instead of the usual
"&lt;=&gt;", and the rule "Postvocalic j in the stem of words" has been
added to take care of the mujtalit problem. Compiled without lexicon,
the rule "Postvocalic j Surfacing" works well alone, but with the
lexicon involved it seems both are needed.

**"Postvocalic j Surfacing"**  
**Postvocalic j in the stem of words**  
Example: "bijlla &gt; biilla".

These rules turn all underlying j's into i. The phenomenon is actually
just orthographic: The vowel 'i' does not occur postvocalic in North
Sami, but the consonant 'j' does, albeit it is written as "i".

Testing shows that combining these two rules this way gives the correct
result, although it is not completely clear why.

### Word final consonant alternations

Rules:

*"Word Final Consonant Neutralization"* *"Deletion: Final h s j z1 in
Contracted Stems"*  
*"Word Final Cluster Simplification 1"*  
*"Word Final Cluster Simplification 2"*  
*"Word Final Cluster Simplification 3"*  
*"Word Final Cluster Simplification 4"*  
*"Word Final Double Consonant Simplification"*

### The gradation rules

    "Gradation: h Loss" !johka : joga (h:0)
    "Gradation: Prenasal Stops" !sa1pmi : sa1mi (p:0)
    "Gradation: tnj" !latnja : lanja (t:0)
    "Gradation: dj" !vuodjit:vuoja1n
    "Gradation: Double Consonant" !ka1ffe:ka1fes
    "Gradation: Long Double Consonant"
    "Gradation: Preaspirated Geminates"
    "Gradation: Jodded Double Consonants"
    "Gradation: Cluster Non-nasal Sonorant + Non-sonorant"
    !"Gradation: Cluster n1g"
    "Gradation: Cluster n1 + Non-sonorant"
    "Gradation: Cluster m + Non-sonorant"
    "Gradation: Cluster n + Non-sonorant"
    "Gradation: Cluster j/v + Liquid"
    "Gradation: Clusters lv, rj etc."
    "Gradation: Clusters tk, tm"
    "Gradation: Clusters ts, ks"
    "Gradation: Clusters sk, sm etc."
    "Gradation: Cluster vj"
    "Gradation: Cluster jv"
    "Gradation: ihm, vhl etc."
    "Gradation: Clusters lbm, jdn, vdn etc."
    "Gradation: Clusters ldnj, vdnj etc."
    "Gradation: Clusters rbm, rdn rgn1"
    "Gradation: Clusters rdnj"
    "Gradation: ist, vsk etc."
    "Gradation: ms1k, rs1k"
    "Gradation: Clusters kc ks etc. 1"
    "Gradation: Clusters kc ks etc. 2"
    "Gradation: Cluster kst 1"
    "Gradation: Cluster kst 2"
    "Gradation: bb dd etc.1"
    "Gradation: bb dd etc.2"

...

### Lengthening of consonants rules

*"Lengthening of Central Consonants hk etc."*  
*"Lengthening of Central Consonants pm etc."*  
*"Lengthening of Central Consonants tnj"*  
*"Lengthening of Central Consonants dj"*  

### Lenitions rules

*"Lenition: Intervocalic Stops and Affricates"*  

### Vowel shortening rules

*"Vowel Shortening in Bisyllabic Sg2 Imperatives and Connegatives"*  
*"Vowel Shortening in Compounds after Long 1st Syllable 1"*  
*"Optional Vowel Shortening after Short 1st Syllable"*  
*"Optional Vowel Shortening in Caritives"*  
*"Optional Shortening of a1 in Compounds after Long 1st Syllable 2"*  
*"Optional Shortening of a1 in Compounds after Long 1st Syllable 1"*  
*"Optional Shortening of a1 in Compounds after Long 1st Syllable 2"*  
*"Vowel Shortening in Caritives"*  

### Diphtong simplification rules

*"Diphthong Simplification in i-Stems before Suffixes Beginning with
j:"*  
*"Diphthong Simplification in Actor Nouns from i- and a-Stems
(Optional)"*  
*"Diphthong Simplification in Certain Forms from u-Stems"*  
*"Diphthong Simplification in Actor Nouns from u-Verbs (Optional)"*  
*"Diphthong Simplification in Diminutives etc. from Trisyllabics with
2nd Syll u/o"*  
*"Diphthong Simplification: Conditional in -alla- etc. Derivatives from
Trisyllabics"*  
*"Diphthong Simplification in IllSg and Certain Conjug. Forms of
a-Stems"*  
*"Diphthong Simplification in Certain Conjugational Forms of i- and
u-Stems"*  
*"Diphthong Simplification: Optional before Deverbal -alla-, -adda-,
-us"*  
*"Diphthong Simplification in u-Stems before Conditional Marker"*  

### Vowel Rising

*"Vowel Rising"*  

### Metaphony

*"General Metaphony"*  
*"Metaphony in Derivatives -us, -alla, -adda 1"*  
*"Metaphony in Derivatives -us, -alla, -adda 2"*  
*"Illative Singular Metaphony"*  
*"Metaphony in Actor Nouns of i-, a-, and u-Verbs"*  
*"Metaphony in MUSH-Derivatives"*  
*"Potential Marker Metaphony"*  

### Stem vowel alternations

*"Stem Vowel in Contracted Stems"*  
*"Stem Vowel before Frequentative d"*  
*"Stem Vowel before Frequentative l"*  
*"Stem Vowel before Reflexive s"*  
*"Indicative Present Singular 3rd Final Vowel"*  
*"Imperative Present 1st/3rd Person and Connegative Final Vowel"*  
*"Stem Vowel Shift a:e, i:e, u:o"*  
*"Stem Vowel in 1st and 2nd Person Singular Present"*  
*"Stem Vowel before Conditional Marker"*  
*"Stem Vowel in Dual 2nd Person Imperative"*  
*"Stem Vowel in Present Participials from i-Verbs"*  
*"Stem Vowel in Dual 1st Person Imperative"*  
*"Stem Vowel in Plural 2nd Person Imperative"*  
*"Stem Vowel in Imperative Plural 1st Person and Passive Stem"*  

### Special word final consonants

*"Word Final Deletion of n2 m2 g2 h2"*  
*"Word Final Neutralization of g2, h2, m2"*  
