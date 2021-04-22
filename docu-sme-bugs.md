Bug reports, errors
===================

This file is now abandoned, as our bugs are reported and solved in our
[Bugzilla bug report system](http://giellatekno.uit.no/bugzilla). This
file is kept here for nostalgic reasons.

Morphophonological (twol) errors
--------------------------------

it accepts girkudáidda but not girkodáidda. The vow shortening in
compounds thus does not quite work. Other examples:

    Muitosuodjalus

    oskkoldat
    oskkoldat       oskkoldat+N+Sg+Nom

    diehtaga
    diehtaga        died1a+N+Sg+Gen
    diehtaga        died1a+N+Sg+Acc

    oskkoldatdiehtaga
    oskkoldatdiehtaga       oskkoldatdiehtaga       +?

    oahpaheaddjeoahpus
    oahpaheaddjeoahpus      oahpaheaddjeoahpus      +?

Answer: because Nom + Nom is not accepted for this type of words.

Moprpholoical errors (Errors in the rule file)
----------------------------------------------

### comparative

dárkil works but dárkileappot does not.

### no paradigm for actio of DOHPPE

    dohppema
    dohppema        dohppema        +?

    beastima
    beastima        beastit+V+n+N+Actio+Sg+Gen
    beastima        beastit+V+n+N+Actio+Sg+Acc

besten, dohppen, beastin are ok, but not bestema, dohppema, contrary to
beastima. This is a problem for the DOHPPE lexicon.

### Definite pronouns

    goappas1 (wesrt)
    goappas1iid
    goappas1iid
    goappas1iidda
    goappas1iin
    goappas1iiguin
    goappas1in

    guktot (east)
    guktuid
    guktuid
    guktuide
    guktuin
    guktuiguin
    gukton (?)

HAVE A LOOK.

### e in front of -las in deverbal adjectives

The parser gives bealkálas from bealkit, which is correct, but it
overgenerates to joavdálas for joavdit, where the correct form should be
jovdelas. Look into this.

### Illative of foreign names in -e

There are two documented patterns:

Lene -&gt; Lenii

Manasse -&gt; Manassei

The question is: Can there be made some generalisations?

### Qestions, open issues

Missing POS

    otnás1
    otnás1 otnás1+Sg+Gen
    otnás1 otnás1+Sg+Acc
    otnás1 otnás1+Sg+Nom
    otnás1 otnás1+N+Sg+Gen
    otnás1 otnás1+N+Sg+Acc
    otnás1 otnás1+N+Sg+Nom

### Missing POS in derivatives

    mánnálas1
    mánnálas1     mánná+N+las1+Sg+Nom
    mánnálas1     mánnálas1+N+Sg+Nom
    mánnálas1     mánnálas1+A+Sg+Nom
    mánnálas1     mánnálas1+A+Attr

The first entry does not say "+A".

### Diacritical marks in the lexicon forms

### The forest of comparatives

    apply down> issoras+A+Comp+Sg+Nom
    issorasat
    issorat
    issorabbu
    issoreabbo
    issoreabbu
    issoret
    issorit
    issorut

    apply down> fargat+A+Sg+Gen
    fargat
    fargada
    suovat
    suovada

### Missing declension forms (?)

deaivat &gt; deives1 (missing)

jeagadit &gt; jeagolas1 (missing)

### Gradation error for certain nouns

Weak grade not rec. for *máhli, duihmi, c1áihmi*, -hl-, -hm-, -hn- also
in weak grade.

Errors in the lexicon files (missing words)
-------------------------------------------

MUSH  
has defect Acc, Gen, and 'apply down' does not work

LASIS  
is not found in the lexicon list at all. TODO: Write a lexicon for LASIS

### Checking diary

All CG cases of series II E are checked. The ihx ones do not work (cf.
above), but the other ones do.

### The multiple genitive forms

At one stage , Acc/Gen forms were accompanied by several strange
additional forms (Gen\#vuoign1an/vuoignám). These are now commented out
of the noun lexicon, by a ! mark.

TODO: Check with the original lexicon, to ensure that nothing crucial
has been lost in the conversion process.

Miscellania
-----------

### Comitative plural and Px

    Correct:
    apply down> giella+N+Pl+Com+PxSg3
    gielaidisguin
    apply down> giella+N+Pl+Com+PxPl3
    gielaideasetguin

    Errouneous:
    apply down> beana+N+Pl+Com+PxPl3
    beatnagiiddiset
    apply down> beana+N+Pl+Com+PxSg3
    beatnagiiddis

Also the contracted words *luomi* and *gahpir* behaved the same way as
*beana*. It thus seems this is an error for all contracted nouns.

TODO: Go through the Px paradigm, and see if *beana* shows errors in
other parts of the paradigm, and if there are other words that have
problems in the Comitative Plural paradigm.

### Words

    apply down> jearaldat+N+Pl+Ill
    jearaldahkaide

Also for servodat

Missing:

dihto tietty

    apply up> buorre
    buorri1+A+Sg+Nom     <== what is buorri1 ?
    buorre+A+Sg+Nom

tag missing

    duogás1 duogás1+Sg+Gen
    duogás1 duogás1+Sg+Acc
    duogás1 duogás1+Sg+Nom

### Compounds

### Closed classes

#### goappa

Have a look at this:

    apply up> goappa
    goabbá+Pron+Interr+Sg+Acc
    goabbá+Pron+Interr+Sg+Gen
    apply up> goappá
    goabbá+Pron+Interr+Sg+Acc
    goabbá+Pron+Interr+Sg+Gen

It seems the first one is errouneous.

The tokenizer
-------------

bienasta bitnii must be included in a list of multiword expressions in
the preproscessor.

The vislcg preprocessor lookup2cg
---------------------------------

This preprocessor is located in gt/script/. It has two main problems:

1.  The quotation marks are not always in place
2.  The grammatical tags are kept on non-final elements in compounds.

### The quotation marks are not always in place

(find examples)

### The grammatical tags are kept on non-final elements in compounds.

Cf. this example:

    "<girkoás1s1it>"
            "girku" N Sg Nom # ás1s1i N Pl Nom
            "girku" N Sg Gen # ás1s1i N Pl Nom
    "<gulle>" S:1314, 1573, 1573, 1530
            "gullat" V Ind Prs Du1
            "gullet" V VGen
            "gullet" V Ind Prs Sg3

Here, the correct reading "gullet V Ind Prt Pl3" is removed due to rule
1314, saying

REMOVE Pl3 IF (0 Sg3) (-1 (N Sg Nom)); \#\# Dokumeanta c1ilge, mo mii
eallit.

But the Sg Nom in the preceeding word is the first part of the compound,
not the second, and it should be disregarded during the context
evaluation of the 1314 rule.

Possible solutions:

-   **Remove all grammatical information before the \# symbol:**  
    This is a clean solution. One marginal problem is that the initial
    tag, the "word" itself is kept, and this may act as a tag in its own
    right.
-   **Change the grammatical tags before the \# symbol into something
    else, e.g. by wrapping &lt; &gt; parentheses around them.:**  
    The output becomes cumbersome to read, but it may still be the best
    solution.
-   **One possibility may be to include the \# symbol in the set
    definitions, so that for each tag, the set of corresponding tags
    including a succeeding \# is disregarded, e.g. SET NSGNOM = (N Sg
    Nom) - (N Sg Nom \#);:**  
    This looks cumbersome, though, as all tag combinations must be
    decleared as sets.

Todo: Evaluate this.
