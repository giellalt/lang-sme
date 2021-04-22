Intro
=====

This file documents the background for disambiguation approaches we use
in some specific cases. It describes ambiguities in detail and
interpretation and choice of tags. For a documentation of the structure
of our disambiguation file `sme-dis.rle`, see [this
document](docu-sme-dis.html). The constraint grammar formalism is
discussed [here](/tools/cgii-usage.html).

Here, we discuss numerals (and other topics to be added shortly)

Numerals
========

Definition
----------

### Intro

As numerals we define single or a group of numbers or letters that
represent a number. That means numerals can have the form:

1.  2345
2.  guoktelogi, goalmmát, guovttis
3.  VIII
4.  máŋga, galle

"miljovdna" also gets the numeral tag, not the noun tag as Nickel would
want it to be

### Case

Roman numbers can be nominative, genitive and accusative case without
showing it overtly:

    200     200+Num+Sg+Acc
    200     200+Num+Sg+Gen
    200     200+Num+Sg+Nom

Illative case can look like that:

    "<Kontor>" S:11118, 11118, 11118, 11644
            "kontor" N Sg Nom S:3818 @HNOUN
    "<2000:i>"
            2000" Num Sg Ill S:4409 @ADVL

### Sets

There are several sets regarding numerals:

    SET NUMERALS = Num - OKTA ;
    SET NOT-NUMERALS = WORD - Num ;
    LIST MANGA = "máŋga" "galle" ;  
    SET CARDINALS = Num - Ord - MANGA ;

### Syntactic functions

Numerals can:

1.  quantify a noun

2.  modify a noun as

3.  1.  ordinals ("2. oassi")
    2.  substantival numerals ("oassi 2")

4.  be PRO nouns

5.  make up a time adverbial, such as 21.03.1980

6.  stand for "from (numeral) to (numeral)"

### Syntactic tags

There are various tags they can have:


    @N<:         ## Dat lea s. 240.
    @Pron<:  ## Mii golmmas finaimet Niillas-čeazi geahčen.
    @COMP-CS<:   ## Ráhkkásiiddán, allet vajáldahte ahte Hearrái lea okta beaivi 
                    ## dego duhát jagi ja duhát jagi dego okta beaivi.
    @>N:         ## Mii vuolgit ovttain biillain.
    @N<:         ## Mun boađán diibmu vihtta.
    @ADVL:          ## Mun lean riegádan 1962. 
    @>ADVL:      ## Mun boađán geassemánu 16. b. 
    @APP-ADVL:  ## Mun boađán geassemánu 16. b. 2002. 
    @SUBJ:      ## Mus leat golbma oappá.
    @SPRED:         ## Doaimmabiju jahkásaš bušeahttarámma lea: 380.000 ruvnno.

### Tags used for constituents in combination with numerals:

    @Num<:       ## Mus leat golbma oappá.  
    @>Num:       ## Mun lean ilus go beasan ovdanbuktit St.dieđ. nr. 33.
     

It is interesting to see that numerals following a noun react
differently with respect to the noun. A numeral in combination with
*oassi, kapihtal, siidu, paragráfa* respectively their abbreviations
*s., kap.* and *§* modifies the noun and therefore gets the tag `N<`,
while in the combination *nr., nummár and nummir* + numeral, the numeral
stays head and gets the syntactic tag depending on the larger context.

A possible explanation could be the implicitness of nr, nummár
respectively nummir in expressions such as *oassi (nr) 2* or *kapihtal
(nr) 34.*

In expressions such as *oassi nr 2* the numeral is head of the*nr 2*
expression but modifies oassi and therefore gets the tag `@N<`. The
abbreviations mentioned above are furthermore transitive, which means
the numerals following them have to refer to those abbreviations.

### Morphological tags

There are some complex numerals expressions that are identified as
simple numerals by the preprocessor. Therefore, the two tags

`+Date` `+Range` exist. Both dates and ranges have particular syntactic
behavior in certain contexts that distinguishes them from other
numerals. Dates for example cannot be quantifiers such as other numerals
do. Furthermore it can be an adverbial in certain contexts.

### General expressions for Date and Range

The general expressions add the tags +Date and/or +Range to the
following constructions:

+Date to:

21.03.1960, 21.3.1960 or 21.03.60 or 21.3.60 03-21-1960, 3-21-1960 or
03-21-60 or 3-21-60 1960-03-21, 1960-3-21 or 60-03-21 or 60-3-21

+Range+Date to:

21.-22.03.1960, 21.-22.3.1960, 21.-22.03.60, 21.-22.3.60
21.03.-22.03.1960, 21.3.-22.3.1960, 21.03.-22.03.60, 21.3.-22.3.60
21.03.1960-22.03.1970, 21.3.1960-22.3.1970, 21.03.60-22.03.70,
21.3.60-22.3.70

### Particular examples

#### Telephone numbers etc.

In expressions such as *Fáksa: 22242786* the numeral gets the tag
@SPRED. The ":" is interpreted equally as "lea", which makes the numeral
subject predicate.

#### Dates

Dates got many different formats. A couple of those will be explained in
the following. Most important of all, this paragraph deals with the
question: which part is head and which part is modifier?

1.  month+day+year/ day+month+year
2.  day+month
3.  month+year

##### day+month+year

There are different ways of combining day, month and year. There are
variations with respect to order, wordborders and use of abbreviations
and long date formats.

Both month+day+year and day+month+year exist:

-   cuoŋománu 8. b. 1913
-   9\. cuoŋománu 1687

With respect to wordborders, the whole expression can be one word, the
day and "b./beaivvi" part can make up one word and be separated from the
rest of the expression, and of course, the expression can constist
separate words for each element

-   4.6.1981
-   cuoŋománu 29.b 1997
-   geassemánu 16. b. 2002

the expression varies with respect to the use of "b", "beaivvi" or
simply the nominalized numeral

-   cuoŋománu 27.beaivvi 2001
-   geassemánu 16. b. 2002
-   4.6.1981

depending on the format there are different analyses of the date
expression.

in an expression like geassemánu 16. b. 2002, b. geassemánu modifies
16.b. and 16. modifies b. 2002 is an apposition to the "b".

    "<Mun>" S:4527, 4531, 16552
            "mun" Pron Pers Sg1 Nom S:4266 @SUBJ
    "<boađán>"
            "boahtit" V IV Ind Prs Sg1 S:4095 @+FMAINV
    "<geassemánu>" S:10483
            "geasse#mánnu" N Sg Gen S:3628 @>ADVL
    "<16.>"
            "16" A Ord S:3207 @>ADVL
    "<b.>" S:4527, 4527, 4531, 6674, 10520, 15603
            "b" ABBR Gen S:3639 @ADVL
    "<2002>" S:8525, 10492
            "2002" Num Sg Nom S:3230 @APP-ADVL<
    "<.>"
            "." CLB

### Roman digits

Roman digits differ in their use from arabic digits. Generally they are
ordinals, in some cases cardinals, but usually they do not appear as
quantifiers. Morphology and syntax differs from that of arabic digits:

Roman digits can stand to the left of nounphrases as ordinals such as in
*III. kapihtal* or *III kapihtal, and they can stand to the right of a
nounphrase such as in Kapihtal III*

1.  To the left of the nounphrase:*  
    III. kapihtal*: III is unambiguously an ordinal and modifies
    kapihtal, in other cases it could also modify a preceeding noun  
    III kapihtal: III could be both ordinal and cardinal, but preceeding
    kapihtal has to be an ordinal (in contrast to arabic digits) and is
    therefore an ordinal modifying a noun to the right such as the first
    example  
2.  To the right of the nounphrase:  
    Arkiivaláhka III: III is a cardinal and modifies arkiivaláhka to the
    left  
    Heinrich IV.: the phrase is equivalent to "Heinrich njealját". The
    sentence "Heinrich IV:s lea fápmu." shows that IV. is the head, and
    it can have several kind of tags. Heinrich is the modyfier and gets
    @&gt;N.

Ambiguity:

Arkiivalága III kapihtal priváhta arkiivvaid birra máinnaša
vuosttažettiin gáhttenárvosaš priváhta arkiivvaid.

III can modify both arkiiválaga and kapihtal.

Roman digits are usually ambiguous with acronyms.

    LVI
    LVI     LVI+A+Ord
    LVI     LVI+Num+Acc
    LVI     LVI+Num+Gen
    LVI     LVI+Num+Nom
    LVI     LVI+N+ACR+Sg+Acc
    LVI     LVI+N+ACR+Sg+Gen
    LVI     LVI+N+ACR+Sg+Nom

Otherwise case is ambiguous (Nom=Gen=Acc) and ordinal or cardinal use
(Ord vs. default cardinal).

"buot"
======

possible analyses
-----------------

Buot has several meanings:  
everything, all, completely

it can be:

1.  quantifier such as in *Buot olbmot šaddet okte jápmit.*
2.  pronoun (in genitive an accusative) *Mun lean oaidnán buot.*
3.  adverb such as in *Lei buot njuoskan.*

Nickel uses the term "indefinite pronoun" (ubestemt pronomen) for both
quantifier and pronoun, which is a bit problematic, for the first
because it uses "indefinite", and secondly because it does not
distinguish between quantifiers and pronouns.

### possible morphological tags

buot buot+Adv  
buot buot+Pron+Indef question:

1\. should we take away Indef

2\. should we add quantifier

### possible syntactic tags

1.  @SUBJ
2.  @OBJ
3.  @N&lt; (?)
4.  @&gt;A (*Guhtemuš báhkkon lea buot mávssolaččamus?*)
5.  @&gt;N *Buot oktanuppelohkái máhttájeaddji vulge Galileai., Buot
    dáid mun attán dutnje., Ámtamánnii gulai "bearráigeahččat buot min
    gullevaš eatnamiid, gittiid ja opmodagaid".*

Disambiguation
--------------

### 1. adverbial

1.  in connection with PrfPrc or PrsPrc such as "in lei buot njuoskan".
2.  in connection with A (adjective) such as in "buot buoremus"

### 2. pronoun and quantifier

a\) for example with a restrictive relative sentence following such as
in: *Attášii sutnje buot maid dárbbašit.*

In contrast to that, there is the non-restrictive relative sentence:
*Son lea njuoskan buot, mii lea fuones ášši.* Here buot is adverb.

The comma distinguishes the restrictive from the non-restrictive
relative sentence.  
But is the comma in non-restrictive relative sentences really
prescriptive?

Does a rule like REMOVE Adv IF (1 Interr OR N)(1 Rel); suffice?
