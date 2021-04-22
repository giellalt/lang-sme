Disambiguation of grammatical properties
========================================

Actor vs. TV
------------

Com Sg. vs. Loc Pl.
-------------------

Comitative singular and locative plural are homonymous in North Sámi.
This is the biggest unsolved topic in the sme disambiguation file. What
makes the topic so difficult to resolve is the fact that both comitative
and locative can function as arguments of verbs and nouns as well as
adjuncts. Arguments are fixed within the verbs subcategorization frame.
Adjuncts are optional and supply additional information. The border can
be difficult to draw.

### Locative

The locative is quite flexible with respect to its functions, which
usually makes it rather difficult to exclude it as a potential case.

Theta roles according to Sammallahti: GÁLDU, HÁLDDAŠEADDJI, BÁIKI,
LUOBAHEADDJI

GÁLDU: Máhtte bođii Mázes.

HÁLDDAŠEADDJI: Juhána beana lea Máhtes.

BÁIKI: Máhtte orru Mázes.

LUOBAHEADDJI: Máhtte oaččui Márehis sabehiid.

### Comitative

Comiative can have either an instrumental, a sociative or another
idiosyncratic (idiomatic) function. Nickel describes comitative in
object or adverbial position with two main connotations: instrumental
and relational (sociative).

such as in: Dat láve álo riidalit isidiin.

### Disambiguation can be attempted with respect to:

1.  The subcategorization frame of verbs
2.  Number disambiguation
3.  Word order
4.  Signal words

### 1. The subcategorization+adjunct frame of verbs:

There are illative verbs, comitative verbs, locative verbs and verbs
that have variants with different subcategorization frames.
Additionally, there are numerous ways of combining ordered comitative
and locative adjuncts. Verbs taking oblique objects, such as
*luohpat+Loc* that helps in so far as we can exclude variant 6, which
means if we only have one argument the situation is unambiguous

1.  verb+Loc
2.  verb+Loc+Com
3.  verb+Com+Loc
4.  verb+Loc+Com+Loc
5.  verb+Com+Com+Loc
6.  verb+Com
7.  ...

Unless: there are homonymous variants of a verb with different
subcategorization frames (or different realizations of subcategorization
frames if one believes that the object simply is not realized in some
kind of surface structure):

In the case of *borrat*, the verb has a transitive and intransitive
variant:

-   Mun boran. (Used in the same way as the intransitive *boradit*: Mun
    boradan.)
-   Mun boran láibbi.

### 2. Number disambiguation

Some words are typically not used in plural such as for example
"ipmárdus" "doaivu" "dárogiella" "gelbbolašvuohta" "kulturduogáš"
"kulturgelbbolašvuohta" "sámegiella" unless their plurality is stressed
by particular words such as "goappeš", "goappašat", "earálágan",
"máŋgalágan" or Num or Ord. There are other words that typically do not
appear in singular, such as "beassaš" "čalbmeláse" "gálssot" "headja"
"sabet" "sisttet" "skárri". But here the situation is a bit more
difficult as those words can appear in singular with slightly different
semantics.

### 3. Word order

Usually the argument or adjunct can stand to the left or right of the
verb or noun.

Is there a certain order of adjuncts or arguments?

#### Several locatives

There can be more than one locative in a sentence

1.  one verb or noun
    1.  locatives with the same function (theta roles respectively
        adverbial functions) have to stand next to each other, one of
        them is a specification of the other such as in:

        *I live in Berlin, in Germany.*

    2.  locatives with different functions do not have to be in
        neighbouring positions
2.  several verbs and/or nouns
    1.  that means different verbs and nouns can have a locative with
        the same function as adjuncts and arguments

#### Several comitatives

There can be more than one comitative in a sentence

1.  one verb or noun
    1.  comitatives with the same function
    2.  comitatives with different functions
        -   *\*Mon stoagan iežan rátnáiguin vávváiguin. - I play with my
            friends with dolls.*
        -   *Mon stoagan iežan rátnáiguin vávváiin. - I play with my
            friends with a doll.*
        -   *Mon stoagan vávváiguin iežan rátnáiguin. - I play with
            dolls with my friends.*
        -   *Iežan rátnáiguin mon stoagan vávváiguin. - With my friends
            I play with dolls.* (topicalization when the following
            question is answered: *Geaiguin don stoagat vávváguin? -
            With whom do you play with dolls?)*
2.  several verbs and/or nouns

### 4. Signal words

Usually work together with verbs and indicate a particular case

Examples are *oktii* (+Com), *searválagaid* (+Com)

### 5. Heads

Constructions where a head chooses a locative or comitative substantive
can have different forms: examples for this are:

1.  finite or infinte verb + complement
2.  (deverbal) noun + complement
3.  adjectival verb (participle) + complement

<!-- -->

1.  \#\# Mii leat lihkostuvvan bures dáinna prošeavttain.  
    The verb "lihkostuvvat" chooses the comitative "dáinna
    prošeavttain".
2.  \#\# Mis leat ovttasbargočoahkkimat PP-bálvalusain, skuvllain,
    mánáidsuodjalusain ja skulvadearvvašvuođabálvalusain.  
    The noun "ovttasbargočoahkkin" chooses the comiatives
    "PP-bálvalusain", "skuvllain", "mánáidsuodjalusain".
3.  \#\# Sieiddi bálvalemiin sturron eallu gohčoduvvui bálvvoseallun.
    Here the participle "sturron" chooses the comitative "bálvalemiin".

### 6. Something about nouns as heads

There are deverbal nouns marked by a derivational affix, which behave as
their verbal counterparts with respect to complementation.

There are other nouns that typically prefer locatives or comitatives as
their complements.

    LIST LOC-COMPL-NOUN = "ávki" "árvalus" "dovdu" "ipmárdus" "ovda#mearka";
        # Nouns that take a locative
        # There is also an idiomatic use of "ovda#mearka" in the constructions "ovdamearkka dihte" and "ovdamearka" (Ess).

    LIST COM-COMPL-NOUN = "bargu" "lihkku" "ovtta#oaivil" "ovttas#bargu" "šiehtadus" ;

Gen vs. Acc
-----------

### rows

We got a problem if there are more than one heads and the number of
genitive modificators without attributes excedes the number of heads,
which are modified.

-   1 head, 1 modifier; 2 heads, 2 modifiers =&gt; no problem
-   2 heads, &gt;2 modifiers =&gt; problem

such as in:

    "<SDD>"
            "SDD" N ACR Sg Nom @SUBJ
    "<jođiha>"
            "jođihit" V TV Ind Prs Sg3 @+FMAINV
    "<bajimus>"
            "bajit" A Superl Attr @AN>
    "<dási>"
            "dássi" N Sg Acc @OBJ
            "dássi" N Sg Gen @GN>
    "<dearvvašvuođapolitihkalaš>"
            "dearvvašvuođa#politihkka" N* laš A Attr @AN>
    "<stivrema>"
            "stivret" V* TV N Actio Sg Acc @OBJ
            "stivret" V* TV N Actio Sg Gen @GN>
    "<fitnodagaid>"
            "fitnodat" N Pl Gen @GP>
    "<hárrái>"
            "hárrái" Po @ADVL
    "<.>"
            "." CLB <<<

TV GA GA Po  
(TV A)(G Po)  
TV G A Adv not Po  
TV (G G Po) null object

TV GA GA GA Po  
(TV A)(G G Po)  
(TV (G A)(G Po)  
(TV (G G A) Adv  
(TV (G G G Po)

How to overcome this: Look at the properties of the involved GA
constituents: GA1 GA2 is not (G A) if: 1 = common, 2 = proper  
1 = abstract, 2 = concrete

Gen vs. Nom
-----------

The typical Gen/Nom case is a string of *1 2 3.. X*, where *X* is a
Genitive case assigner.. The question is then whether it is possible to
break the string at some point, and claim that we have, say *G N G N
Po*. Cases in point:

-   **Min plánaid Sámi skuvllaid oktavuođas:**  
    Here, the *Prop* breaks the Gen string

Numerals
--------

\- check the usefulness of the tag +Range for other than dates

\- write rules that include + Range/ +Date

TIME expressions
----------------

Our TIME set consists of the following subsets:

    SET TIME = MANNU | VAHKKU | BEAIVI | AIGODAT
     

TIME expressions are special with respect to their behaviour as
adverbials. They can be time adverbials not only in one of the oblique
cases, but also in genitive and accusative.

One gets the following syntactic tags from homonymy

1.  Genitive @GN&gt;
2.  Genitive @ADVL
3.  Accusative @ADVL
4.  Accusative @OBJ
5.  Locative @ADVL
6.  Nominative @SUBJ

### 1. Genitive @GN&gt;

jagi: *Mis ii leat guolli ovdal go jagi loahpas.*

áigodaga: *Doaibmagolut leat kr 54 378', mii lea kr 964' eambbo go
áigodaga gaskamearálašbušeahtta.*

suoidnemánu: *Suoidnemánu gaskamearalaš temperatuvra govvida muhtin
muddui man bures šattut sáhttet lieđđugoahtit.*

### 2. Genitive @ADVL

Expresses according to Nickel how often or how many times something
happens, when it happens and under which circumstances.

*Mun ledjen doppe máŋgga geardde.* - I have been there a lot of times.

*Mun vuolggán boahtte vahku.* - I am leaving next week.

### 3. Accusative @ADVL

This is for expression where the time period in contrast to point of
time is expressed.

*Dat orui doppe vihtta jagi.* - He lived ther for five years.

### 4. Accusative @OBJ

such as in:

*Lea leamaš liiggás oanehis áigodat oažžut bohtosiid oidnosii, čájehuvvo
ahte easttadeaddji buohcanjávkan dárbbaha áiggi vai váikkuha nu movt lea
sávaldat. (áiggi)*

### 5. Locative @ADVL

That applies to locatives vs. AccPx such as in:

*Jus oahppi dahje ohppiidjoavku jávká lobihemiid osiid diimmus dahje
olles diimmu.*

### 6. Nominative @SUBJ

This applies to *vahkku* which can be Nom, Gen and Acc

Jus vássá vahkku nu ahte dákkár duođaštus ii leat boahtán goddái, de
galgá dát dieđihuvvot riikka stevdnevihtana bokte.

### Resolving ambiguity between @GN&gt; and @ADVL

Ambiguity in this case is usually avoided by a particular word order:

*dan áigodaga goanagas* (@GN&gt;) vs. *gonagas dan áigodaga* (@ADVL)

*áigodaga goanagas* (@GN&gt;)

*dan áiggi goanagas* (@GN&gt;) vs. *gonagas dan áiggi* (@ADVL)

*áiggi goanagas* (@GN&gt;)

*jagi bušeahtta* (@GN&gt;) vs. *bušeahtta jagi* (@ADVL)

Px vs. Loc
----------

Time expressions with numerals that modify them cannot/usually do not
bear a possessive suffix.

Jagis 2002. - In the year 2002. / \* Her year 2002.

SgNomCmpnd vs. SgGenCmp
-----------------------

This is a case that cannot be disambiguated.

    "<Dikšun->" S:1862, 1862
            "dikšun" N SgNomCmp Cmpnd S:1440 @CMPND
            "dikšun" N SgGenCmp Cmpnd S:1440 @CMPND
        

    "<Sosiála->"
            "sosiála" A SgGenCmp Cmpnd @CMPND
            "sosiála" A SgNomCmp Cmpnd @CMPND

One possibility could be to introduce a third tag, and have it as a last
resort: *SgNGCmp* or something like that. Another possibility is to just
go for Gen (this is not an optimal solution).

Disambiguation of idiosyncratic cases
=====================================

Disambiguation of *buot*
------------------------

The question is whether it should be adverbial or whether it should be
quantifier (called indefinite pronoun)

Disambiguation of suorggis vs. suorggi
--------------------------------------

Disambiguation of Sápmi vs. sápmi
---------------------------------

The first question to ask: Is this real ambiguity? Or do we simply have
one form which always includes two different possiblities of
interpretation.

    Sápmi
    Sápmi   Sápmi+N+Prop+Sem/Plc+Sg+Nom
    Sápmi   sápmi+N+Sg+Nom

Sápmi is a place propernoun meaning Sámiland; the noun sápmi on the
other hand means Saami person, Saami language and is often used
adjectival denoting everything regarding the Sámi; an adjective form
does not exist.

The problem of ambiguity arises in cases where the singular genitive
form is used with capital letters modifying some other noun such as in
the following examples.

    Sámi Ovdanahttinfoanda ferte vuordit árra čakčii ovdal ruhtadilli čielga.
    Sámi doaibmaplána dárbu ja ulbmilat .
    Sámi perspektiiva iešguđet bálvalussuorggis.
    Sámi mánáid ja nuoraid bajásšaddaneavttut.
    Sámi geavaheaddjiid bálvalusaid vuođđun ferte leat sámegielmáhttu ja sámi kulturmáhttu.
    Sámi fierpmádagat ollet dávjá gielddarájáid rastá, ja danin veajášii leat buorre, juos gielddat barggašedje ovttas.
    ...2001 giđa mátkkoštii Beaivváš Sámi Teáhter...

In some cases "Sámi", the genitive form, clearly denotes the place-name:

    Sámi Radio - Sámiland's radio
    Sámi dutkamiid guovddáš - Sámiland's research centre
    Sámi Kulturmuitoráđđi - Sámiland's culture..council

In other cases it clearly does not:

    Sámi guovllut - Sámi-related areas
    Sámi perspektiiva lea dehálaš. - Sámi-related perspectives are important

Within a sentence it would have been written with minuscules.

This is an example, where the plural is used, clearly indicating sápmi,
not Sápmi:

    Norgga Sámiid Riikkabellodat - The Norwegian Sámi-people's ..party

To be continued...

Disambiguation of guđetge
-------------------------

Discussion
==========

maidege Sg or Pl
----------------

In: "In leat gullan dus maidege."
