

# DELIMITERS 

Sentence delimiters are the following: <.> <!> <?> <...> <¶>

# TAGS AND SETS

## Tags

This section lists all the tags inherited from the fst, and used as tags
in the syntactic analysis. The next section, **Sets**, contains sets defined
on the basis of the tags listed here, those set names are not visible in the output.

### Beginning and end of sentence
BOS 
EOS

### Parts of speech tags

N
A
Adv
V
Pron
CS
CC
Po
Pr
Pcle
Num
Interj
ABBR
ACR
CLB
LEFT
RIGHT
WEB
LEFT RIGHT because of apertium

### Tags for POS sub-categories

Pers
Dem
Interr
Indef
Recipr
Refl
Rel
Coll
NomAg
G3
Prop
Allegro
Arab
Romertall

### Tags for morphosyntactic properties

Nom
Acc
Gen
Ill
Loc
Com
Ess
Sg
Du
Pl
Cmp/SplitR
Cmp/Attr
Cmp/Cit
Cmpnd
Cmp/SgNom Cmp/SgGen
Cmp/SgGen
Cmp/PlGen
Cmp/Sh
Cmp
PxSg1
PxSg2
PxSg3
PxDu1
PxDu2
PxDu3
PxPl1
PxPl2
PxPl3
Comp
Superl
Attr
Ord
Qst
IV
TV 
Prt
Prs
Ind
Pot
Cond
Imprt
ImprtII
Sg1
Sg2
Sg3
Du1
Du2
Du3
Pl1
Pl2
Pl3
Inf
ConNeg
Neg
PrfPrc
VGen
PrsPrc
Ger
Sup
Actio

### Tags for clitic particles
Foc/ge
Foc/ge
Foc/ge
Foc/gen
Foc/ges
Foc/gis
Foc/naj
Foc/ba
Foc/be
Foc/hal
Foc/han
Foc/bat
Foc/son
Foc/mis
Foc/mat

### Derivation tags

Der/PassL Der/PassS
Der/NomAg
NomAg
Der/adda
Der/alla
Der/easti
Der/d
Der/eamoš
Der/amoš
Der/geahtes
Der/h
Der/Car
Der/Car
Der/huhtti
Der/huvva
Der/halla
Der/l
Der/lasj
Der/las
Der/meahttun
Der/muš
Der/NomAct
Der/sasj
Der/st
Der/stuvva
Der/upmi
Der/supmi
Der/vuota
Der/InchL
Der/laakan
Der/laagasj
Der/jagáš
Der/A Der/A* pga av bug i lookup2cg
Der/Dimin
Der/viđá
Der/viđi
Der/veara
Der/AAdv
Der/Adv
Der/dáfot 
Der/keahtta
Der/nuolus
Der/náittot
Der/seagat
Der/suttat
Der/ár 
`<vdic>`
Cmp/Hyph
`<subqst>`
`<ind>`

### Semantic tags
The semantic tags are included from a generated file.

###  Syntactic tags

* @+FAUXV : finite auxiliary verb 
- ferte: Son ferte oaidnit ollislaš gova. - She must see the whole picture.
* @+FMAINV : finite main verb
- oaidná: Son oaidná ollislaš gova. - She sees the whole picture	
* @-FAUXV : infinite auxiliary verb
- sáhte: In sáhte gáhku borrat. - I cannot eat cake.	
* @-FMAINV : infinite main verb
- oaidnit: Son ferte oaidnit ollislaš gova. - She must see the whole picture.
* @-FSUBJ> : Subject of infinite verb outside the verbal.
- mu: Diet dáhpáhuvai mu dieđikeahttá. - It happened without me knowing about it.
* @-F<OBJ : Subject of infinite verb outside the verbal.
- nuppi: Ulbmil lea oažžut nuppi boagustit. - The goal is to get the other one to laugh.
* @-FOBJ> : Object of infinite verb outside the verbal.
- váldovuoittuid: Sii vurde váldovuoittuid fasket. - They waited to grab the main prizes.
* @-FSPRED<OBJ
* @-F<ADVL
* @-FADVL>
* @-F<SPRED
* @-F<OPRED
* @-FSPRED>
* @-FOPRED>
* @>ADVL
* @ADVL<
* @<ADVL
* @ADVL>
* @>N
* @Interj
* @N<
* @>A
* @P<
* @>P
* @HNOUN
* @INTERJ
* @>Num
* @Pron<
* @>Pron
* @Num<
* @OBJ
* @<OBJ
* @OBJ>
* @OPRED
* @<OPRED
* @OPRED>
* @PCLE
* @COMP-CS<
* @SPRED
* @<SPRED
* @SPRED>
* @SUBJ
* @<SUBJ
* @SUBJ>
* @PPRED
* @APP
* @APP-N<
* @APP-Pron<
* @APP>Pron
* @APP-Num<
* @APP-ADVL<
* @VOC : Vocative
- Miss Turner : Bures boahtin deike, Miss Turner! - Welcome here, Miss Turner!
* @CVP : Conjunction or subjunction that conjoins finite verb phrases.
- go : Leago guhkes áigi dassá go Máreha oidnet? - Is it a long time since you saw Máret?
* @CNP : Local conjunction or subjunction.
- vai : Leago nieida vai bárdni? - Is it a girl or a boy?
* @X : unknown

## Sets containing sets of lists and tags

This part of the file lists a large number of sets based partly upon the tags defined above, and 
partly upon lexemes drawn from the lexicon.
See the sourcefile itself to inspect the sets, what follows here is an overview of the set types.

### Sets for Single-word sets

OKTA and go, and the set INITIAL for initial letters 
OKTA
go
INITIAL

### Sets for word or not

WORD
REAL-WORD
WORD-NOT-de
NOT-COMMA

### Derivational affixes

DER-V

DER-V

DER-N

DER-A1

DER-A

A-V

A-NOT-V

### Case sets

ADLVCASE

CASE-HALFAGREEMENT
CASE-AGREEMENT
CASE

NOT-NOM
NOT-GEN
NOT-ACC

### Verb sets

NOT-V

### Sets for finiteness and mood

REAL-NEG

MOOD-V

GC

VFIN

VFIN-POS

VFIN-NOT-IMPRT

VFIN-NOT-NEG

NOT-PRFPRC

### Sets for person

### Sets consisting of forms of "leat" (these ones need to be rewritten)

### Pronoun sets

### Adjectival sets and their complements

### Adverbial sets and their complements

### Sets for coordinators

### Sets for adverbs that have lookalikes
Here come some adverbs that have identical twins in other POS. 
If these are found in Adv contexts, we treat them as adverbs.

### Sets of elements with common syntactic behaviour

### Sets for verbs

V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.

* The set COPULAS is for predicative constructions

TRANS-V is the set for verbs really taking objects

* Sets for verbs choosing oblique objects or adverbials
* **STVLIST** is the list of strictly transitive verbs. In the rules, refer not to STVLIST, but to the set STV defined below.

STRICT-TRANS-V is the set for verbs which don't let a GenAcc be a modifier of anything else than an object, e.g. Mun organiseren eatni gievkkanis. - eatni wants to be the object

### Valency sets

* **PLACE-V** Those get only not locative if the target is a member TOOL, ABSTR-TOOL or ANIMATE or CONCEPT. Selects more locatives than ONLY-PLACE-LOC-V 

### Adverb sets

### Adjective sets

### NP sets defined according to their morphosyntactic features

### The PRE-NP-HEAD family of sets

These sets model noun phrases (NPs). The idea is to first define whatever can
occur in front of the head of the NP, and thereafter negate that with the
expression **WORD - premodifiers**.

The set **NOT-NPMOD** is used to find barriers between NPs.
Typical usage: ... (*1 N BARRIER NPT-NPMOD) ...
meaning: Scan to the first noun, ignoring anything that can be
part of the noun phrase of that noun (i.e., "scan to the next NP head")

### Other negatively defined morphosyntactic noun sets

### Noun sets

Nominal sets defined according to their morphophonological properties
Sets for lexeme homonymy (most of them are moved to where the actual rules are.)

The words in the set **N-PO** can be both N and Po, the set takes that into account.

### The LAHKA set family

### Nominal sets defined according to their semantical properties

* Spatial noun sets. These nouns behave like postpositions

* Time sets

* Amount sets

* Sets for nouns with morpho-syntactic preferences

* Number-related sets

* Sets for case, possessive, etc.

* Sets for nouns as pred

* Sets for animals

* Sets for things

* Sets for qualities

* Sets for things, not necessarily tools

* Sets for things such that people can be inside them:

* Sets for things such that people cannot be inside them:

* Part-whole sets for human

* Sets for places

* Sets that can both be buildings/places and represent humans

* Sets denoting relations

### Miscellaneous sets

### Border sets and their complements

### Syntactic sets

ALLSYNTAG
NON-APP

*These were the set types.*

## Guessing: Rule for adding Sem/Date as a tag to readings which looks like dates

## Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses

* Rule for adding <vdic> to verbs denoting verbal actions like: ... dadjá Aili Kestkitalo.

###  Removing or selecting proper nouns that are lookalikes

* **AvvilProp** selects Prop for Avvil

* **SamediggiProp** selects Prop after Ášši 01/12

we don't want propernoun analysis of these words, initially in sentences

* **InitialSapmiProp** the initial Sápmi rule. 

* Rules for removing some Props which are identical to common nouns

*Removes **PropPl**, but problems with names as Davviriikkaid Ráđi, there we want Prop Pl

*Select **PlcSur** (Sem/Plc) (Sem/Sur) 

### Some propernouns have two parts and the first is not a genitive. We still have problems with abbr when these propernouns are inflected or are a part of a cmp. The copy rule adds Attr reading to names which not get it in the fst (Soria). The select rule selects Attr when the next word is e.g. Moria.

* **SoriaAttr**  Soria Attr Moria, Harry Attr Potter-girji

* **SoriaMoria**

###  Rules for giving Attr to names, e.g. Ole Attr Kåven.

* **PropAttr** 

Remove unwanted analyses

## Southern Locative vs. Essive

* **SouthLoc** removes Southern Locative vs. Essive

* **Apertium-rule** we want Num as alternativ to Ord reading  

## Numerals

* **NumRom** in beginning of sentence

## Lexicalised derivations

* **derVuohta** removes A Attr Der/vuota if A Der/vuota.	

* **eapmi** compounds with eapmi if they have Der/NomAct analysis

* **derN** removes DER-N if lexicalised non-essives

* **derNEss** removes DER-N if lexicalised essives (revise this) - flytter denne til slutten av fila

* **derA** removes DER-A if lexicalised A

* **derlasj** removes Der/lasj if lexicalised N

* **derV** removes DER-V if lexicalised V,

* **derHderAlla, derAlla, derH, derST** chosses longest Der/tag

* **derPassActio** removes Actio Nom/Gen/Acc for passive forms. I don't think they exist in Sg, we prefer the PrfPrc analysis.

### Particular verbs

* **notRealV** removes verb readings from verbs like álbmotregistreret

* **notN** removes N for adjectives which have got noun analysis because of Px for Divvun 

* **leapmaDimin** removes it

* **leage** removes leahki Allegro

* **Divvun** 

* **Der/PassS** removes some Pass-readings in favour of V not Pass

* **notPass** removes som Pass readings which are not likely at all

* **LEX-PASS** removes passive forms of some lemmas in favour for the lexixalised one

* **LEX-PASSPrfPrc** selects PrfPrc when noun to the right

* **VGenPass** remove when Pass or LEX-PASS

* **Allegro** 

* **LexSelbeassat**

* **LexSelgieldit**

* **LexSelmuohttit**

* LexSelvuhttot

* **LexSelollet**

* **Lexdiehttelasaid** diehttelasaid Adv

* **Lexmearajiekŋa** 

* **Lexmaniija** 

* **Lexgeassit** geassit Adv vs geassit V

* **Lexvaldot** váldot V, not váldu

* **Lexsáhttit** sáhtašit V, sáhttit Err/Orth

* **Ger and GER-NOTV** remove Ger-forms which are not likely at all

## Propernouns

* **PropVfin** selects propernouns which can be Vfin in the beginning of a sentence

* **confProp, Lea, Man, Hui, Mo, Prop** removes Props which confuces the analyser, 

* **Dert** Rule for removing Der/t Prop when there are other analysis

### Some adjectives are never derived as Adv

### Rules for Prop Attr, Sem/Sur and Plc

* **PropAttrIfPropx** removes Attr if no Prop on the right side

* **nationalOrg** removes Prop after nation

* **PropInsideProp** Selects Prop if capital letter inside clause

* **AttrPropDerlaš** Selects (Prop Der/lasj Attr) if first one to the right is a noun

* **PropAttr** Removes (Prop Attr), but not if to the right is Prop or Ord OR ABBR 

* **PropSur** Selects (Prop Sem/Sur) if finite verb to the left. Immediately to the right is Sem/Fem OR Sem/Mal

* **PropAttr1** Selects Attr if you are Sem/Fem OR Sem/Mal, Sem/Sur or INITIAL and to your right is Prop which is Sem/Fem OR Sem/Mal or Sem/Sur 

* Removes **PropAttr** if no Prop on the right side

* Removes **PropEss** if no Der/lasj

* Removes **HearránEss** we want Px for Voc (we should we add it to the Prop version)

* Selects **PropNom** 

### MISC

* **NotConNegII** removes ConNegII if no Neg Imprt around. This is important, as the homonym forms are common. - 30850

* __errsub_uvvo__ removes -uvvat Err/Orth Sg3 if Der/PassL, e.g. čujuhuvvo

* sutnje is not verb

* **ABBR** Removes ABBR in favour of Adv, Pcle or Pron, e.g. "dii" when there is no punctuation

* **ollit** removes ollit when ollu - move this one?

* **FocbaDu3** removes Foc/ba when Du3 verbs like máhttiba and Adv like juoba and Prop like Jáhkoba (Acc) 

* **Focmis** removes Foc/mis when Loc  

* **Focson** removes Foc/son when Sur  

* **Focmat** removes Foc/mat when not Imprt  

* **Fochan** removes Foc/han when adp  

* **Focbe** removes Foc/be when juobe Adv  

* **Focge** removes Foc/ge when Adv like dieđusge

* **Focge-dis** disambiguation Foc/Neg-ge and Foc/Pos-ge

# ONE-COHORT DISAMBIGUATION - CYCLE 0

The idea behind "cycle 0" is to have safe rules without context first.
These rules typically chose lexicalisations over derivations, 
Saami words instead of marginal names, etc.

## Lexicalised derivations

*Removes **derN** if lexicalised.

*Removes **derNEss** if lexicalised, and both nouns are essive.

*Removes **derA** or PrsPrc or VGen if lexicalised. VGen is a chance.

*Removes **derAdv**  when Adv is lexicalised.  

*Removes **VAbess**  when Adv is lexicalised.  

* Removes **derVhmm** Does this function?

* **derHderAlla** removes Der/h Der/alla if Der/halla.

* **derAlla** removes Der/halla if Der/alla.

* Removes **derH** if Der/InchL.  

* Removes **derST** if Der/ahtti #OBS se på denne	

## Fragments and headliners

* **foto** 

* **Sem/Act** selects lexicalised NomAct in fragments (instead of looking for VFIN). 

* **AnomInf** initial adjectiv or ceartain nouns

* **ACompPl** adjective plural nomitative, not comp sg nor adv

*  **viimmatAdv** 

* **SA kurssat**  

* **NotGen** 

* **compgo** 

## Adjectives or nouns, not adverbs

* **Aifeambbo** selects A after eambbo

* **muhtunlagan** removes lága Ess if Indef ja lágan A

* **aiggePo** removes áigge Po, which belongs to MT and thu

Adjective plural, not comparative

* **positivepl** Pos Pl not Comp Pl for man A sii leat

## Adverbs

* IFF **buotAdv** : buot Adv in front of Superl

### Lexicalised adverbs
It is useful to select early the adverbial reading for potensial nouns or verbs.

* **aibbasAdv** áibbas dolin

***aloGen** removes állu Gen,  álo  Adv vs. N Gen

* **aiddo**

***bealisAdv** 

***bearreAdv** beare vs bearri

***ilusAdv** 

***rámisA** 

* **mannelTimeAdv** golbma jagi maŋŋel

* **Advbadjelii** nahkehit badjelii

* **AdvSTV** váldit mielde, oahppat bajil. eará? STRICT-TRANS-V is too strong

* **cadaAdv** if oažžut juoidá čađa

* **cohkkutAdv** čohkkut

* **dussaiAdv**  

* **gaskanAdvVGen**  

* **gotAdv**  

* **ovdalgoCS**  

* **ikteAdv**  

* **miehtaV**  

* **mannelAdv**  

* **miehtaPr**  

* **aigiAdv**  guokte vahku áigi

* **dalleAdv**

*  **dusseAdv** 

* **alggageAdv**  

* **bearraiAdv**  

* **boaittobealeAdv**  

* **buresAdv**  

* **cadatAdv**  

* **cuozzutAdv**  

* **dadjatAdv**  

* **dadjatAdv2** 

* **dainnaAdv**  

* **danin** (Pron Ess OR Adv)
* **daninAdv** selects danin Adv. It is a special rule, only negative restrictions.

* Select Ess, and then kill?  

* **dassaAdv**  

* **dakkoAdv**  

* **jusCS**  

* **duoAdv**  

* **duoN**  

* **duodaidAdv**  

* **plcadv** words like nuortan adv (DOPPE) not N Ess

* **AdvNotNA** Adverbs, not nouns or adjectives

* **biras** is noun and not adverb if in GN context

* **AComp** remove A Comp when Adv

* **birrasii** removes birrasii N

* dieđusge chooses adv

* **sávvamis** chooses adv

* **beali** chooses adv

* **doarvaiAdv** removes birrasii N

* **doložat** removes doalut N

* **eanasAdv**  

* **eambbogo** selects Adv eambbo go

* **eanetAdv**  

* **AdvComp**  

* **easkkaAdv**  

* **gaskatAdv**  

* **goassigeAdv**  

* **gosaAdv**  

* **gustoAdv**

* **gustoAdvláhka**

* **guhkasAdv**  

* **VifVFIN** removes V 

* **harveAdv**

* **juogoQst**

* **justeAdv**

* **jámasAdv**

* **loahpasAdv**

* **liikkaAdv**

* **luovosAdv**

* **maninAdv**

* **manneAdv**

* **manneAdv**

* **muhtuminAdv3**

* **njuolgaAdv**

* **oddasitAdv**

* **oktanAdv**

* **ollengeAdv**i

* **ovttasAdv**

* **oktiiV** remove

* **oktiiAdv** select

* **ollasitAdv** selects

* **radjaiPo** selects

* **rabasAdv** selects

* **rabasAttr** selects

* **rabasANom** selects

* **sámásAdv** selects

* **soaittáhagasAdv** selects

* **seahkáPl** selects Pl

* **seammaAdv** selects

* **unnanAdv** selects

* **varraAdv** selects

* **valjisAdv** selects

* **vehaziidAdv** selects

* **visotdAdv** selects

* **vuhtiiAdv**

## Pronouns 

* **recipr, reciprPl** select Recipr

### Nouns, not verbs

* **álbmotN**, ii V.

* **headisge**, ii heađisge.

* **loahppa** after TIME Gen.

### Lexical selection - nouns

* **sahkaEss** if Mii lea sáhkan.

* **sahkaPl** after PLURALIZER in NP

* **UsImprt** removes Imprt Sg3 for all nouns in -us	

* **SUBImprt** removes Imprt when it can be a part of an NP	

* **oahppit**, ii Imprt.

* **bargi**, ii Imprt.

### mánnu vs mánus

### Not noun

## Adposition or not

* The rules **Pooaivai, Pogiedas** removes oaivái and gieđas as Po

*  **aldatV1, aldatPo, KillaldatV** for the problem aldat V vs. alde Po

## Not Qst

* **AdvQst** removes dego/nugo Qst 

## Interjections

* **Interjlemma** voja voja nana nana select interj if repeated 

* **Interj** or not

## Px-rules for special nouns

* **NnoPx** Remove Px for special nouns

* **gaskaneaset** selects Po for gaskaneaset	

## Some verb rules

* **vfingo** selects VFIN in front of go Qst

* **buoritV** removes buorit as V

* Some brave rules for removing Imprt

* **ImprtCopPrfPrc** removes imperative readings in front of coopulas and PrfPrc

* **FocV** revmoves Foc when Actio, PrfPrc, VGen, e.g. čađahan, ovttasge

### Particular CS

* **madeCS** for mađe/mađi and dađe/dađi

* **dadeCS** for mađe/mađi and dađe/dađi

### Verb or Noun?

* **Včiehká** selects V instead of N when nomintive to the right and accusative to the left *fápmu čiehká luottaid*

## Adpositions

### Adpositions, not verbs

* **bealisPo** removes imperatives when Po lookalikes

# Section 2: LOCAL DISAMBIGUATION - CYCLE 1

## FAMILY pronouns

### Pron Pers 1. p.

* **moai** This rule is not in use because of REMOVE:Prop

* __miiPersLeft1, miiPersLeft2, _miiPersRight__ select mii Pers 

### Pron Pers 2. p.

* **donDem** selecst don as Dem instead of Pers

* **donPers** selecst don as Pers instead of Dem

### Pron Pers 3. p.

* **sonSG3V, sonRel, goson** select son as Pers, Rel or Pcle 

* **dePcle** de as Pcle

* **sutnje** ( = forms of the verb "suotnjat")

* **datPlIll** selects dát Pron Dem Pl Ill

* **daiddaVerb** removes dáidda N Sg Nom 

* **dasaVGen, dasaLassin dasa,datSg3, datSg3PrfPrc** ( = forms of the verb "dassat"): 

* **dasaILLV** choses dasa to the left of verbs like duhtat, suhttat, luohttit

* **DemPlLoc** selects Dem when Dem Pl Loc and agreement, perhaps no need for it here because we have agreement-rules later. Men viktig: her blir vi kvitt duo N.

* **DemPlCom** selects Dem when Dem Pl Com and agreement, perhaps no need for it here because we have agreement-rules later.

* **datPersCopulas** select Pers in front of copula. I setninger som Riššat dat gal leat musge, jus eai leačča njuoskan. tolker jeg dat som Pcle. Derfor constraint hva som kommer etter.

* **datPcle1** selects dat Pcle between N and finite, even if there is agreement between verb and dat .

* **datPcle2** selects dat Pcle when there is no agreement between verb and dat .

* **KilldatPcle** removes the remaining dat Pcle

* **PersAcc** selects Pers Acc in accusativ infinitive clauses with object

* **datPers** selects Pers. I made it stronger than it was. ref. r897 in sme-dis.rle

* **datDemSg** selects Dem from Pron Pers Sg3 Gen

* **datPersPl3** selects dat Pl3 in front of V Pl3 and V Du3 and Rel Pl

## An early rule for "eanaš"/"eanas"

* **eanasPron** selects Pron in front of Pron Loc

## Px constraints 

First select Px, then remove all remaining Px

* Set with adjectives, which are documented to have Px in our corpus

* **APxifN** Remove A Px if N:

* **PxAlone** Remove Px if it is only word in the sentence, and not a typical px-term

* **APx** Remove A Px if Adv of A Ess og A Attr og PrfPrc or Loc

* **PxLocIll** Remove Px if viesus vissui or similar

* **NPxPrfPrc** Remove Px if PrfPrc with  leat to the left

* Nouns: **NomPxSg1** (not Ess) as the only word in a sentence. Needs no disambiguation.

* Nouns:  **AccPxSg1** after a TV verb. Exception for Aux.

* Nouns:  **AccPxSg1** after a TV Inf verb.

* **PxSg1LocAcc** is Acc to the right.

* **PxSg1Acc** is Acc to the right.

* coordination **PxSg1coord** 

* **PxSg1coordLast** for the last word of a coordination

* **ReflPxSg1** lean oahppan alddán

* Nouns: **PxSg2** if SG2-V. The rule needs no disambiguation. The DON-constraint because of homonymi with (N Pl)

* **PxSg2Acc** if  TV to the right

* **PxSg2AccImprt** if  TV Imprt to the left

* **PxSg2AccPrfPrc** after PrfPrc 

* **NotPxSg2** if no Sg2 

* **PxSg2GenPo** if in front of Po, after til verb

* **PxSg2Loc** after habitivconstruction

* **ánsuPx** 

* **atnitPx** removes Px for for atnit muittus, gudnis, árvvus, čalmmis

* Nouns: **PxSg3Acc** if Sg3 or Sg to the left

* Nouns: **PxSg3Acc** if Sg3 or Sg to the left

* Nouns: **PxSg3AccPrfPrc** if PrfPrc and Sg3 to the left

*  **PxSg3GenPo1** in front of Po, to the left of the owner

*  **PxSg3GenPo2** in front of Po, to the left of the owner

* **Genguossis** is  selection Gen, not only with Px. The FAMILY-set would be better than Sem/Hum-tag, but there is often a propernoun connected to the noun. guossái and guossis should have Po analysis?

* **GenNPFinal** selects Gen as the modifier of a noun in the end of a sentence.

* **PxSg3Nom**

* **PxGenNorPo**  

* **PxGenNum**  

* **PxGenPr**  

* **PXGenoaivai**  for oaivái Po, there could be more Po for this rule?

* **eallitAcc** Selects Acc for eallit IV if you are *eallin* or *eallinahki*

* **PXAccCoor**  

*  **PxSg3CC** in coordination with the owner

* **PxSgIllPx**  

* **gaskaAcc**  

We end section 2 by removing all remaining Px

* **KillPx** removes all remaining Px readings

## Section 3: Certain verb readings

* **FinGoInf** for  vai áigu go njulget.. Lene:  we don't need this

verb or adv	

* **NotVGenIfDer** removes VGen if 0 = Der/Pass or Der...(r947)

* **NotVGenIfDer** selects Actio Ess 

* **NotActio** selects Actio Ess 

### All imperatives

For imperative disambiguation we need the following:
Pick imperative contexts, and thereafter remove imperative.
Such contexts are: Imperative verb sentence-initially with exclamation mark

* **NotEmbeddedImprt** removed Imprt after CS

* **NotImprtWhenInd** removes Imprt if part of an Ind domain

* **NotImprtWhenIndCoor** removes Imprt when coordination of an Ind domain - a very special case

* **NotImprtIfAttrLeft** removes Imprt after attribute

* **NotImprtIfRel** removes Imprt after Rel, unify this with other left context (r948)

* **ImprtDADJAT** removes  DADJAT

### Sg1 - early cycle, safe rules

* **VSg1IfLeftMun** selects Sg1 when "mun" is to the left (r949)

* **VSG1IfRightMun** selects Sg1 when "mun" is to the right (r950)

### Sg2 - early cycle, safe rules

* **VSG2IfLeftDon** selects Sg2 when "don" is to the left (r951)

* **VSG2IfRightDon** selects Sg2 when "don" is to the right (r952)

* **VInfIfAhte** removes Inf if there is no other VFIN between BOS and "ahte" (r953)

### Sg3 - early cycle, safe rules

* **VSG3IfLeftSon** selects Sg3 when "son" is to the left (r954)

* **VSG3IfRithgSon** selects Sg3 when "son" is to the right (r954)

* **VNotSg3When12Left** removes Sg3 if 12 Pron immediate left (r955)

* **VNotSg3IfCom** removes Sg3 in X with Y is... (r957)

* **Sg3vdic** selects Sg3 if VERBAL-ACTIVITY between comma and Nom

* **NegSg3BeforeFoc** selects Neg before Foc/ge or ConNeg (r959)

* **vfin** removes verb reading when the reading should be noun  

Negative verb, not abbreviation or roman numeral Ii.

### Du1 - early cycle, safe rules

These Du1, Du2 rules are (almost) not in use in our corpus, but we keep them for completeness.

* **VDu1IfMoaiLeft** selects Du1 when "moai" left (r960)

* **VDu1IfMoaiRight** selects Du1 when "moai" right (r961)

### Du2 - early cycle, safe rules

The next two rules are not found in the corpus, but logically
they belong, to cover the whole paradigm. There is no verb-internal
homonymy here, but there is homonymy with e.g. Illative for certain verbs.

* **VDu2IFDoaiLeft** selects Du2 if "doai" to the left (r962)	 

* **VDu2IFDoaiRight** selects Du2 if "doai" to the right (r963)	 

### Du3 - early cycle, safe rules

The competitor to Du3 is -ba Foc.

* **VDu3IfSoaiLeft** selects Du3 when "soai" left (r964)

* **VDu3IFSoaiLeft** selects Du2 if "doai" to the right (r965)	 

* **VDu3IfGuokteLeft** selects Du3 if "guokte" left (r966) - 15

* **VDu3IfGuokteRight** removes Sg3 if "guokte" right and 0 Du3 (r967)

* **VDu3IfNjaNLeft** selects Du3 as verb with coordinated subject to the left (r968) - 43

* **VDu3IfNjaNRight** selects Du3 as verb with coordinated subject to the right (r969) - 12

* **VDu3IfCollLeft** hmm, remove this?

### Pl1 - early cycle, safe rules

The competitor here is obviously Inf, but also Pl3 and Prt Sg2.

* **goasbeareInf** goas beare Inf

* **VPl1IfMiiLeft** selects Pl1 if "mii" Pron to the left (r971) - 3163

* **VPl1IfMiiRight** selects Pl1 if "mii" Pron to the right (r972) - 272

* **VPl1NotImprIfMiiLeft** removes Imprt if if "mii" Pron to the left and 0 = "mii" (r973) - 557

### Pl2 - early cycle, safe rules

These rules are not used when disambiguating the corpus
* **VPl2IfDiiLeft** selects Pl2 if "dii" Pron to the left (r974) - 0

* **VPl2IfDiiRight** selects Pl2 if "dii" Pron to the right (r975) - 0

### Pl3 - early cycle, safe rules

Select...

* **r976** SE V Pl1 if *-1 SII

* **r977** SE V Pl1 if *1 SII

* **VPl3jaPl3** selects Prt Pl3 in coordination (r978)

* **muVPl3** removes Prs Pl1 after mu

The following two may be joined:

* **VPl3IfPronRelLeft1** selects Pl3 if -1 Rel is linked to -2 Pl (r979) - 7801

* **VPl3IfPronRelLeft2** selects Pl3 if -1 Rel is linked via COMMA to -3 Pl (r980) - 853

* **VPl3IfCSLinkPl3Left** selects Pl3 if -1 Rel is linked via COMMA to -3 Pl (r979) - 341

Remove...

The following two may be joined:

* **r982** removes Prt Sg2 if Pl3 subject - 6002

* **r983** removes Prt Sg2 if Pl3 subject via CS - 305

* **VPl3Lookalikes** removes "verbs" like "manne" and "dušše" (r984) - 274

* **VSg3Lookalikes** removes "verbs" like "skuvlii" 

* **VPl3NotSg2BefPassive** removes Sg2 for Pl3 and Inf before passive (r985)

* **EssNotV** selects Ess instead of VFIN

* nuorra (vs. nuorrat V)
* **PlNomCoor** Selects (N Pl Nom)

* **johtilit og bastilit** removed johtit + Der/l 

### PrsPrc

* **PrsPrc** selects PrsPrc if coordinated with A - 10
Early rule since many PrsPrc readings are removed later.

OBS: denne er ikke helt bra

* Actio Gen

* **BeallileatPl3** when bealli or oassi + Pl Loc

* **ENInf1** 

* **ENInf2** selects Inf (NOTE, this was further down in sme-dis)

* **ENInfcoor1** selects Inf coor

* **ENInfcoor2** selects Inf coor

***listInf** in lists

# Section 4: CYCLE 1B: REMOVING THE READINGS THAT WERE LEFT FROM THE 1A RULES 

We don't need more Px sections, it's done alrady

## Noun, adjectiv, PrsPrc or not?

* **NnotAcoord** removes A instead of N (earlier: selects N instead of A), based on coordination with N, and a vfin-verb

* **NPlbeforeRel, NSgbeforeRel** select N in front of Rel and MO

## Adjectives and adverbs

### Adv or not?
maid has many readings and as Rel it is a member of S-BOUNDARY. Therefore we need to disambiguate is early in this file. Most important is to select Adv. Because of that A ang N still can have Vfin readings, it is difficult to make very general rules.

* **vaikkomii**

* **giitu** or not

* **gilvu** or not

* **AdvPx**

* **comparAdv**

* **badjelisAdv**

* **guhkáAdv**

* **lasiAdv**

* **loanasAdv**

* **oaivvisAdv**

* **guossaiAdv**

* **AdvinfrontofPrfPrc**

* **viidáseappotAdv**

* **viidásetAdv**

* **vuostálagaAdv**

* **maidAdv1** selects maid Adv when there is no vfin to the right.

* **maidAdv2** selects maid Adv copulas and PrfPrc or Actio Ess. We need this rule because of that there can be an Inf to the right which also has Vfin reading.

* **maidAdv3** selects maid Adv even if there is a vfin to the right.

* **maidAdv4** selects maid Adv between two verbs or the verb after is IV

* **maidAdv5** selects maid Adv in front of Comp which at this stage can have vfin analysis.

* **maidAdv6** selects maid Adv between copulas Pl3 and N Pl.

* **maidAdv7** in a special construction with geahččat

* **maidAdv8** selects maid Adv after a Pers

* **maidAdv9** selects maid Adv even 

* **maidAdv10** selects maid Adv iežas 

* **maidAdv11** selects maid Adv iežas 

* **maidAdv12** selects maid Adv for Lea maid A Inf

* **maidAdv13** selects maid Adv for 

* **AdvPlc** selects Adv for 

* **KillmaidAdv** removed the remaining maid Adv

* **mielasAdv** 

**matPcle**

The following two rules are omitted. They only inflect on the disambiguation of mat pcle, a wackernagel, which is done in the rule over here, I think.

* **olluNom** 

* **olluAdv**

* **valjitAdv**

* **vejolaččatAdv**

* **aččatAttr**

* **jogoAdv** jogo and juoga as adverbs

* **AdvPx** selects Adv Px instead of N Px

* **AdvwhenAPl** selects A Pl instead of Adv

## Disambiguating abbreviations

* **AttrABBRNum**

## Disambiguating particles

* **sonPcle** selects son Pcle, the remaining Pcle are removed

## Disambiguating rom attr

## Disambiguating clitics

## Disambiguating numerals

## Disambiguating adpositions

### čađa
* **caddaN** if čađa and movement-v

Commented out som adp-rules we don't need anymore:

### geahčai
* **geahcaiPP** not geahččat V

### guovddaš
* **guovddasPP** or not 

### mađe
* **madePo** after Num Gen

* **NumMade** Num before mađe

### miehta
* "miehtá" is also VFIN, and miehtá needs special treatment 
- **miehtaPo** after place or time Gen

- **miehtaPr** before place or time Gen

* **oidnosisAdv**

* "ovddas" has many readings and needs special treatment 
- **ovddasPo**  - commented out because we don't need it

* special rules for rastá because it often is Adv, and it can be an object connected to the PP
- **rastaAdv**  čuohppat/časkit/sahet rastá

- **rastaPo, rastaPr**  fievrridit olbmo man nu rastá

- **rastaPr**  rastá ráji/rájá

- **sisaAdv**   sisa

- **unnimusatAdv**   

* **birraPo, birraPr** special rules for birra because it often is Adv, and it can be an object connected to the PP

* "vuostá" has many readings and needs special treatment 
- **vuostaAdv**  váldit vuostá/vuostái
- **vuostaPr**  váldit vuostá/vuostái	

* vuollel ja badjel as Adv in front of Num

### LIST LG-MATERIAL = Inf Adv Nom ;

* **gaskasPosticky, gaskasPrsticky** selects Po after coordinating language materials

* **PoParantes** selects Po after paranteces

* **PoNomCompl** removes Po if no possible complement to the left

* **PoMeasure** removes Po when MEASURE to the left

* **PrGen1** selects Pr

* **PrGen2** selects Pr

* **PrNoCompl** removes Pr if no complement to the right	

* **PoGen** selects Po

### Diambiguation  Noun vs. Po or Pr:

* **vuollaiPo** selects

* **beallaiPo** selects

* **PrTime** 

* **ovdalPr** selects

* **gaskanPo** selects

* **gaskkasPo** selects

* **lassinPo** removes

* **ovddasPo1** selects

* **ovddasPo2** selects

* **ovddasPo3** 	selects

* **ovddasPocoord** selects

* **NwhenPo** removes N if Po

* **VwhenPo** removes V if Po

## Some particular subjunctions and Neg Sup

* **amasCS** selects CS, not A or Neg Sup

* **amasA** selects A, not CS or Neg Sup

* **amasNegSup** selects Neg Sup, not CS or A

* **amasNegSup** selects Neg Sup, not CS or A

* **amatNegSup** selects Neg Sup, not CS

* **dasgoCS** selects CS, not Qst

* Select and remove **vaikkoAdv** , 

## go as CS and Qst Pcle
First select all "go" Qst Pcle, then remove them so the rest will be "go" CS

* **standQst** selects Pcle in standard questions with question mark. Also without question mark if the verb is in 2. person.

* **standQst** selects Pcle in standard questions without question mark

* **objQst** selects Pcle in questions which function as object in the clause

* **objQst2** selects Pcle in standard questions where an object follows VFIN

* **subQst** selects Pcle in questions as subordinated clause

* **vaiQst** selects Pcle in questions with vai

* **auxQst** selects Pcle in questions as subordinated clause, starting with AUX

* **refQst** selects Pcle in two main clauses, the first one a question which is referred to in the second.

* **nounQst** selects Pcle for go after NP

* **poQst** selects Pcle for go after Po

* **negQst** selects Pcle for go after Neg

* **AdvQst** selects Pcle for go after WORD

* **killPcle** removes all remaining Pcle for go 

# Section 9 WORD-SPECIFIC RULES

## Some particular subjunctions

## Adverb rules

# MAPPING OF COMP-CS< , COMPLEMENTS OF PARTICLES IN COMPARISON
First map all COMP-CS<, then remove the other readings

* **compInf** Inf go Inf

* **ComptimeAdvl** buoret go ovdal

* **ComptimeAdvl** ii nu ollu go dál

* **Compadvlcase** eará sivas go fuorrávuođas

* **CompNumP** uhcit go njealji stivrralahtu doarjagiin

* **CompNumP** numerals

* **CompEanet** dohko eanet go 

* **Compvejolas** go vejolaš

* **compNomHead** NP-HEAD-NOM (ADVL) go NP-HEAD-NOM (ADVL). VFIN-NOT-IMPRT pga manglende disamgiguering

* **CompNomHead** Comp NP-HEAD-NOM leat go NP-HEAD-NOM  

* **compMisc** go geassebuođut, go dán áigge

* **Compdego** dego @COMP-CS<

* **compAccdego** Acc dego Acc

* **compAccgo** Acc go Acc

* **compNum** TRANS-V eambbo go Num  

* **compCoord** coordination	

* **compCoordAttr** coordination again, now with Attr. Speacial rule because of that Attr also has other readings.	

* **compInf** 

* **compInf** 

* **compInfCoor** 

* **killAllnotComp** Removes analysis which are not @COMP-CS<

- *This was the kill all not Comp rule!!*

* **goCSbeforeComp** Selects CS analysis in front of @COMP-CS<

* **ACompgo** Selects Comp analysis in front of go and @COMP-CS<

# MAPPING OF CC AND CS

Mostly we map both @CNP and @CVP, then we select @CNP, after that we remove them so @CVP remains

* **cnpCompSC** Map @CNP if @COMP-CS< or COMPAR ahte

* **cnpCompSpec** special rule because of PrfPrc = VFIN

* **CSasCNPCVP** Map some CSs both @CNP @CVP

* **CSasCVP** Map @CVP to CS

* **CCasCNPCVP** Map (@CNP @CVP) to CC

* **ahteCNP** ahte CC @CNP, remove the rest

* **killAllahtenotCS** All other occurrences of "ahte" are CSs.

* **RelCNPRel** maid ja gos

* **vaiCCCNP** vai as CC or CS

* **vaiCC** remove vai as CC 

* **vaiCCNegQst1** vai CC @CVP before Neg or question

* **vaiCCNegQst2** vai CC @CNP in question about two alternatives

* **vaiCCPrfPrcInfQst** vai CC @CNP in question about two alternatives

* **killAllvainotCSCVP** Select all vai CS @CVP	

* **dadeCNP** removes dađe @CNP, so @CVP remains

* **CVPNPron** No finite verb or verbalactivity in front N/Pron @CNP N/Pron	

* **CVPnoVfin** No potential finite verb following

* **CVPnoVfin** Infitive following

* __CVPnoVfin_iige__ didn't succeed including iige in barrier in the last rule

* **CVPInfInf** between to Inf

* **CVPadvladvl** between to ADVL

* **CVPAdvAdv** between to Adv

* **CVPActioNom** 

* **CVPnoVfinAdvl** No finite verb in front ADVLCASE @CNP ADVLCASE	

* **CVPAdvNom** Nom @CNP Adv Nom	

* **CVPCopNomInf** COPULAS Nom @CNP Nom Inf	

***CVPoppramsing** Lásse, Iŋgá ja mun

***CVPCmp/SplitR** Cmp/SplitR @CNP

* **CVPwrongCmpnd** wrongly formatted compounds

* **CVPAAttr** A Attr @CNP A Attr	

* **CVPA** A @CNP A 	

* **CVPAccAdv** Acc @CNP Adv Acc	

* **CVNFauxcFmainv** 

* **killAllCNP** removes all remaining @CNP

* **XCC-CS** removes CC and CS with no synttag

## PRONOUNS

### Plural?

* **PlSg3V** removes plural in front of Sg3 verb (and **SgPl3V** does the opposite)

## Interrogative and relative pronouns

* **Interr** selects interrogative pronouns in questions

* **InterrIfPot** selects interrogative pronouns in potential sentences, and after that we remove the remaining Interr

* **munPl3** removes Pron Pers Pl3 if there is no verb agreement

* **Rel** selects Rel

* **RelSg1, RelSg2** select Rel

* **RelPl** selects Rel

* **RelPl** removes Rel

## Emphatic ieš     

* **ies1Pl, ies2Pl** select Pl for ieža

* **iesDu** select Pl for ieža

## Numerals

* **NifNum** 

* **AdvOvtta** 

* **AdvNumEss** 

* **NumCurrency** Selects Num

* **NumNomJahki** Selects (Num Nom) 

* **NumDassa** Selects (Num Nom)

* **NumAccCurrency** Selects (Num Acc)	

* **árvosátniNum** Selects (Num Nom) 

* **NumNom** Selects (Num Nom) 

* **NumNomCoord** Selects (Num Nom) 

* **r1082** Selects (Num Nom) 

* **year** Selects (Num Gen)

* **numunit** Selects (Num Gen) + NUMUNIT 

* **NumGenPo** Selects Gen if you are Num and there is a Gen following the first Gen to the right *gávcci máná njuni ovddas* 

* **WWNumOrdIllAttr** selects Ill Attr and Loc Attr for numerals and ordinals

## Indefinite pronouns
The rules are not documented yet

* **IndefAttr1** Selects (Indef Attr) 	

* **IndefAttr2** Selects (Indef Attr) 

* **IndefAttr3** Selects (Indef Attr)

* **NoAttr** Removes Attr if you are Pron and first one to your right is (Pron Rel)	

* **NoIndefAttr** Removes (Indef Attr) if first one to the right is (Pron Pers Loc)

* **NoIndefGen** Removes (Pron Gen Indef) or (Pron Acc Indef) if intransitive mainverb to the left and end of sentence to the right *muhto gávdnojit maid eará*

* **IndefAttr4** Selects Indef if you are Interr, and to the left is *jus*

* **AttrBuot** IFF-rule

* **IndefNom** Selects (Pron Indef Nom) if you are BUOT and first one to the right is PL3-V 	

* **IndefNom2** Selects Indef Nom if you are BUOT and there is no transitive verb to your left or roght in the clause

* **miiIndef** it vaikko mii or mii beare

## Demonstrative pronouns - should have a look at these

* **DemPlIll** removes Dem Ill and Dem Loc in front of Acc

* **DemSgNom** selects Dem Nom Sg if VFIN Sg3

* **DemIndefAttr** selects Dem in front of Indef Attr, no verb to the left

* **DemGenSeammas** selects dat Dem Gen in front seammás

* **DemSg** removes Dem Sg when there is no Sg N to the right

* **datPersSg3** selects dat Pers Sg3 when there is no N to the right

* **PersNRel** selects Pers Sg3 when there is a N and a Rel to the right

* **DemMeasure** removes Dem in front of a Num and MEASURE or NUMUNIT in Ill

## Disambiguating adjectives 

### Rules related to specific adjectives

* jagáš

* boaris A or N

* dáláš

* dološ 

* garra N vs. garas A

* nanus

* adjective or noun?

* sierra

* surgat

* veara

* **vulitAttr**

* **Comp** rules select Comp A

### Attribute disambiguation

* **AttrVFIN** removes Attr in front of VFIN

* **AttrnotNA** removes Attr when no N or A to the right

* **AttrnotNA** removes Attr when no N or A to the right

* **ANomILLA** selects Nom when ILL-A	

### Rules for Attr between Dem and N

* **AAttrDemSg1, AAttrDemPl1** 

* **AAttrDemSg2, AAttrDemPl2** 

* **AAttrDemSg3, AAttrDemPl3** 

* **AAttrDemSgIll, AAttrDemPlIll** 

* **AAttrDemSgLoc, AAttrDemPlLoc** 

* **AAttrDemComPl** 

* **AAttrDemdakkar** 

### Other attribute rules 

* Not attribute in front of Ess: dovddus sánálaš nissonin

* **AAttrN** no copulas close to the left

* **AAttrCop**  copulas close to the left

* **AttrPlacelaš** This rule selects Sem/Plc Der/lasj A Attr in front of Prop or N

* **AttrCord** 

* **AdvManimus** 

* **Advovdalaš** 

* **AttrIllCop** 

* **AttrAdv** 

* **Cop** 

* **ANom**  removes A Nom

* **AAttr**  selects A Attr

* **ASuperlAttr**  selects A Superl Attr

* **AdvN** removes Adv   

* **AAttrPunct**    

* **AAttrgoAAttr**    

* **AttrTIME**    bad rule

* **AAttrCoord1** coordination, first part

* **AAttrCoord2** coordination, first part

* **AAttrCoord2** coordination, second part

* **PrfPrcCoordA** selects PrfPrc in coordination with an A

* **ACoordPrfPrc** selects A itn coordination with PrfPrc 

* **AAttrContra** selects A itn coordination with PrfPrc 

### Special rules for 'buorre' (the only adjective showing case agreement)

This block of rules is there to ensure case agreement for comparatives.

* Select Pl Nom if V Pl3

* Remove Nom, Acc and Gen if Comp

### alit vs. allat Comp Attr

* **allat** in front of ALLAT OR MONEY OR EDUCATION OR go

* **alitColour** in coordination with COLOUR

* **alitN** in front of VEHICLE, CLOTHES, BEDCLOTHES, BUILDING and more

* **alitEOS** in the end of a sentence

* **APlNomafterCop** selects A Pl Nom after copulas and Pl Nom OR Pl Pron

* **APlNomafterCop2** selects A Pl Nom after copulas and Pl Nom OR Pl Pron

* **APlNomafterDu** selects A Pl Nom after copulas and Du

* **ASgNomNoSubj** selects A Sg Nom after copulas Sg3 or Neg Sg3

* **ASgNomafterCop** selects A Sg Nom after copulas and Sg Nom, not so strong constraint for the target

* **ASgNomEssCopNeg** selects A Sg Nom after copulas Sg3 or Neg Sg3s, 

* dsfa

* **AcompGo** Selects (A Comp Nom) even if there is no verb (ellipse)

* **Wr1775xc** Selects (A Sg Nom) if you are (N Sg Loc), Der/NomAg or (Ex/N A). Copulas is to the left. EOS or CLB is to the right

* **Wr1776xc** selects (A Sg Nom) 

## And now some rules for adverbs that modify adjectives

## Proper nouns

# VERBS

## Disambiguating verbs - part 1 

First ConNeg forms, they are dependent upon Neg verbs. Then Imperative 
(with their special syntax), infinitive, and other infinite forms. 
Person comes later (in part 2)

## ConNeg forms

Number following the rule headers below refer to numbers of hit in a 13 053 859 word corpus.

* **ConNegImp** selects ConNeg Imprt if Neg Imprt to the left. - 4265

* **PrfPrcConNeg**  to ConNeg Aux after PrfPrc

* **ConNegIfNeg** selects Ind ConNeg if Neg Ind to the left. This is the main (and common) ConNeg rule. - 660327

* **ConNegPrt** selects Prt if Prt to the left

* **ConNegCondIfNeg** selects Cond ConNeg if Neg Cond to the left. Less used, obviously. - 0 - homonymi?

* **ConNegPrfPrc** selects ConNeg for leat when topicalised PrfPrc between Neg and leat - 713

* **ConNegImpCC** catches the second ConNeg in cases like don't smile or laugh - 0

* **ConNegIndCC** catches the second ConNeg in cases like doesn't smile or laugh - 369

* **NotConNegIfNotNeg** removes ConNeg if no Neg to the left. Consider unifying with NotConNegNotNeg. - 1094269

* **NotConNegNotNeg** removes remaining ConNegs whenever no Neg to the left. - 5862

## Imperative

See also *Imprt or Ind* some sections down.

* **PassLNotImprt** removes Imprt when passive (sentence-initial, hence important)

* **ImprtLeat** says BOS Leat A is Imprt - 575

* **ImprtDál** 

* **SelImprtExcl** selects initial Imprt when excl mark 

* **ImprtComma** 

* **ImprtNotVGen**

* **NotImprtInd** 

* **NotImprtConNeg** 

* **NotImprtA** 

* **NotImprtN** 

* **NotImprtVFIN** 

* **NotImprtSlash** 

* **NotImprtGo** 

* bearrat TV or berret IV - berret is aux

## Infinitive

* **r2974** was moved up to select PL3-V after N Pl, might be relaxed to REMOVE Inf

* **headofparts** 

* **r2976** was moved up to select PL3-V after N Pl, might be relaxed to REMOVE Inf

* **r1809** Not Pl1 (but Inf) if VFIN to the left, This is the basic Inf rule.

* **r1812** 

* **InfCompCs** 

* **r1811** 

* **EssInf**

Rules that prevent later selection of Inf for a finite verb in the frame 			

*INF-V...CC...*

* **r1816** 

* **r1818** 

* **r1819** 

* **r1820** 

* **r1821** 

* **r1823** 

* **r1824** 

* **r1825** 

* **r1827** 

* **r1828** 

## Verbgenitive

* **VGen** is typo

* **VGen** selects VGen after VGEN-V-TRIGGER-verb

* **Gen2**	selects VGen after after gaskan and lahka

* **VGen3** selects VGen after copulas

* **VGen4**

* **VGenCoor**

* **KillAllVGen** removes all VGen (r1842)

## Supinum vs. potential -- no example found in large corpus

## Perfect Participle

* **r1844** removes PrfPrc if 0 is the second N in an N and ... N construction

* **r1844** removes PrfPrc if 0 is the second N in an N and Gen ... N construction (this is marginal)

* __PrfPrc_Ess__ removes N Ess if 0 PrfPrc

* **r1852** selects PrfPrc if copula to the left

* **r1853** selects PrfPrc if Rel to the left which again is linked to copula

### Topicalized version

the following chapter should be possible to unify.

* **r1855** selects PrfPrc if Nom to the left linked to copula

* **r1857** selects PrfPrc if Acc to the left linked to copula

* **r1858** selects PrfPrc if NP head to the left linked to copula

* **r1857** selects PrfPrc if copula to the left

* **r1861** selects PrfPrc if VFIN to the left

* **r3576** selects PrfPrc if Acc to the left linked to activity verb

* **r1863** is the mannan vahkku rule

## Actio

## Present participle
*orrut vs. orrot) 
## Rules for "addit" (which is an adjective, but more often a verb)
## Actio Loc = N Loc

* **ActioLocleat** is an IFF rule, we also need rule for 'leat', like in lea go biergu oastimis

* **ActioLoc** is an IFF rule, we also need rule for 'leat', like in lea go biergu oastimis

## Actio Nom = Ess

## Imprt or Ind

* **removeAllImp**

## Nouns or verbs

The rules are no documented yet

* **VFINAttr**

* **NPlbuorit**  

* **ActioEssNum**	

* **ActEssIfSensationv**	

* **NoActorIfSg3**

* **GenIfPo**

* **semináraNOM**

## Demonstrative pronouns, agreement in DP - should it be moved to after verbmappings? 
The rules are no documented yet

* **DemAttr**

* **IndefAgree** guhtege goappašat iešguhtege guhte

* **DemCASEPl**

* **DemCASESg**

* **DemAttrNum**

* **DemAcc**

* **DemAttr**

# VERB MAPPINGS

## Verbs as predicatives (@SPRED>) and (@<OPRED) 

### The tags (@SPRED>) and (@<OPRED) target  PrfPrc
The rules are no documented yet

* **spredPrfPrc** Buressivdniduvvon lehkos (topicalised PrfPrc) -- was r494

* **opredPrfPrc**	

* **opredPrfPrc**

## Passive verbs often have 

## Verbs as prenominal participles (@>N):

* Some verbs will not be @>N if not Pass

* **NPrfPrc1** with 1C N Nom

* **NPrfPrc2** with -1C Dem or Num or Attr or Indef

* **NPrfPrc3** with PrfPrc or ConNeg to the left, the N can be different cases

* **NPrfPrc4** mannat in front of TIME

* **NPrfPrc5** for LEX-PASS

* **NPrfPrcPr** after Pr 

* **NPrfPrcPo** before Po

* **NPrfPrcGen** after Gen

* **NPrfPrc** between aux and prfprc

* **NPrfPrc6** the verb can be to the right

* **NPrfPrc7** Der/Pass, no TIME to the right

* **NPrfPrcCoor** coordination

### (@+FAUXV) and (@+FMAINV) target Neg, orrut
* **+FAUXVNeg**

* **+FMAINVorrut** finite orrut

* **FAUXVorrut** finite orrut

* **FAUXVorrut** infinite orrut

### (@A<)  target Inf 	
* **AInf** Inf 	

* **r368**	

### (@<SUBJ)  target Inf

* **<SUBJInf2**

* **r354**

* **<SUBJInf3**

* **<SUBJInf4**

* **<SUBJInf5**

* **<SUBJInf6**

* **SUBJ>Inf**

### (@<SPRED)  target Inf

### (@<ADVL)  target Inf, Actio Ess

### @-F<OBJ  target Inf 

### (@N<)  target Inf, Actio Ess

* **N<Infcoor**

### (@<ADVL)  target Inf, Actio Ess

* **ADVLActioEss** Inf 		

### (@<OBJ)  target Inf, Actio Ess, PrfPrc 

* **OBJActioEss** Inf 		

* **OBJPrfPrc** PrfPrc 			

### (@+FMAINV) and (@+FAUXV) and (@-FAUXV)

* **+FMAINVaux** AUX-OR-MAIN verbs     

* **+FAUXVcop** AUX  COPULAS     

* **+FMAINVcop** COPULAS verbs     

* **+FAUXVaux** AUX  verbs     

* **+FAUXVboahtit** boahtit as AUX      

* **-FAUXVaux** AUX verbs     

* **+FMAINVcopInfconstr** leat before Inf     

* **+FMAINVCop**  copulas even if PrfPrc coming after

* **+FAUXVCop**  copulas coming before the mainverb

* **+FAUXVCop**  copulas coming before the mainverb, relative clause inbetween

* **+FMAINVcopMannan**  leat before mannan TIME     

* **+FMAINVHabconstr**  in habitive constructions    

* **+FMAINVCoopCoord** coordination  

* **+FAUXVleat**  

* **+FMAINVAux1**  

* **-FMAINVAux2**  

* **+FAUXVCop**  copulas coming after the mainverb

* **+FAUXVboahtit**  boahtit coming before the mainverb

* **+FMAINVCop**  copulas 	

* **+FMAINV**  to the remaining finite verbs which are not AUX    

* **+FMAINV**  to finite verb after mainverb

### (@-FMAINV) and (@-FAUXV)

* **-FAUXVConNegCop**  to ConNeg COPULAS   

* **-FAUXVConNegAux**  to ConNeg AUX-OR-MAIN   

* **-FAUXVConNegAux**  to ConNeg AUX   

* **-FMAINVConNeg**  to ConNeg   

* **-FMAINVConNeg**  to ConNeg

* **-FMAINVConNeg**  to ConNeg Aux after PrfPrc

* **-FMAINVConNegCop**  to ConNeg COPULAS   

* **-FAUXVPrfPrcAux**  to PrfPrc AUX  before Inf or Actio Ess

* **-FMAINVPrfPrc**  to PrfPrc 

* **-FMAINVPrfPrcEss**  to PrfPrc before Ess

* **-FMAINVPrfPrcleat**  to PrfPrc leat

* **-FMAINVPrfPrcafterAuxAux**  to PrfPrc after two Auxs

* **-FMAINVPrfPrccoord**  to PrfPrc coordination	

* **-FMAINVPrfPrccoord**  to PrfPrc coordination	

* **-FMAINVPrfbeforeAux**  to PrfPrc before the Aux	

* **-FMAINVPrfafterMan**  to PrfPrc before the Aux	

* **-FMAINVInf**  to Inf

* **-FMAUXVActioEss**  to Actio Ess

* **-FMAINVActioEss**  to Actio Ess

* **-FMAINVSup**  to Sup

* **+FAUXV** to  Aux

* **NPrsPrc1** with 1C N Nom

* **ActioNom** with 1C N Nom

* **<ADVLVAbess** VAbess ADVL

* **<ADVLVGen** VGen ADVL

* **ADVL>VGen** VGen ADVL

* **<ADVLGer** Gerundium ADVL

* **ADVLGer>**

* **-FMAINVLoc** Actio Loc

* **>AActioGen** Actio Gen

* **PrfPrcEllipsis** being verbal head when finite verb is missing

### And then we remove the verbs which didn't get any syntactic tag, in favour of verbs with syntactic tags.

* **realverbX**

* **NomActLocX**

* **NomActX** removes other readings when PrfPrc Or Actio Ess

* **IfonlyVerb** selects the FMAINV reading in the cohort

* **IfonlyConNeg** ConNeg if it is @-FMAINV or @-FAUXV

### **killifVinCohort** This rule removes all other readings, if there is a mapped V reading in the same cohort. Every case which this goes wrong, should be fixed in mapping rules or previous disrules.

* **X**

# NOUNS

# CASE DISAMBIGUATION

## Num as subject, tricky cases - the rule should be here because of the verbdisambiguation

* **DiminNomPxSg1**	

## ACCUSATIVE-GENITIVE DISAMBIGUATION

## Secure rules for choosing Acc

* **PGenN** selects Gen when (Pron Pers) to the left and N to the right *mu sámevuođa iđuid*

* **CoGen1** (quite strict) selects the first of coordinated genitives *riikkaid, čearuid ja boazoorohagaid ovttasbarggu*

###  Semantihkka: Choosing accusative or genitive semantically

* **vuoiAcc** selects accusative if *vuoi* or *vuoi surgat* to the left 

* **lihkkuAcc** selects accusative 

* **SEMnotPossessor** Removes Gen if you are not a possible possessor (a human) # HAB-ACTOR

* **SEMnotHUM** removes Gen. This is when an NP is thought to be the OBJ, because it's not in the human sets and to the right is NON-FAMILY *njálgáid mánáide*. 

* **SEMXr2066** Removes Gen if there is a human or org to the right, exeption for *čállingiela áhčči* and so on

* **SEMgenEss** Removes Acc if there is Gen + Ess, like *dálu eamidin*

* **SEMXxr2071** Removes Gen: Nobody can possess a Proper name? Except from (Pron Pers) and Sem/Fem OR Sem/Mal

* **SEMXxPropOrg** Removes Gen: Who can possess Prop Sem/Org?    

* **SEMlohkat**     

* **SEMNation** Removes Gen: Who can possess Sápmi?    

* **SEMdep** Select Gen if main-organization in front of department   
* **SEMorghum** select gen if organization or education in front of human or text  

* **SEMXr2073** Remove Gen: Accusative in front of a human group *loktema sámiid buorrin*

* **SEMr2074** Selects Gen in front of HUMAN-GROUP

* **SEMGenOrg** Selects Gen in front of Sem/Act

* **SEMactor** Select Gen in front of ABSTRACT and RIEKTEDILLI *unnitlogu oaidninčiegas*

* **SEMXr2076** Selects Gen if you are HUMAN or Pron with an ABSTRACT to your right *iežaset vuoigatvuođa*

* **VocNom** 

* **SEMyouareNom** Removes Gen and Acc when 0 FAMILY or PROFESSION because you are Nom. Not if -1 Num and VFIN is LEAT or IV *Oahpai go Sire sámegiela*

* **SEMyouareGen** Removes Nom if movement verb to the left and illative to the right, because you are the modifier of Ill *mannat Madame Tussaud kabinehttii*

* **SEMnotNom** Removes Nom if a Nom to the right followed by a transitive verb. 0 is animate and to the right is Ill. You are the modifier of Ill

* **SEMXxr2081** Removes Gen if NATION or POLITICAL-PLACE are to your right *dilálašvuođaid sámi*

* **SEMr2082** Selects Gen if you are LANGUAGE, giellanjuolggadus or giellaláhka in Acc-case and to your right is SAPMI-N-HEAD *sámegiela hálddašanguovlun*

* **SEMr2084** Selects Gen for *hálddašanguovllu suohkanat/gielddat*

* **SEMguovttis** selects genitive in front of guovttos and guovttis

* **SEMXr2087** selects Gen if you are a Prop/Plc followed by "gielda" or "suohkan"

* **SEMXr2087** Selects Gen if you have "eana" or "guovu" immediately to your right *Gomorra eatnamii*

* **SEMhumgroup** , tja

* __SEMplcGen_a__ Selects Gen if you are GEOGRAPHICAL-PLACE or (Prop Sem/Plc) in front of PLACE-ADV *Finnmárkku máttabealde*
* __SEMplcGen_b__ Selects Gen if you are GEOGRAPHICAL-PLACE or (Prop Sem/Plc) after a PLACE-ADV

* **SEMplcGen2** Removes Gen in front of a GENERAL-PLACE or POLITICAL-PLACE, if you are a noun *bidjen hildu sadjásis* 

* **SEMplcGen3** Removes Gen in front of GENERAL-PLACE or POLITICAL-PLACE, if you are ABSTR-TEXT or TEXT *cealkámušaid guovlluid dearvvašvuođafitnodagaid jahkedieđáhusain*

* **SEMXr2079** Removes Gen if you are Acc in front of MANNU *guđii virggi skábmanánu 1. b.*

* **SEMxhab** Selects Acc if COPULAS to the left of HAB-ACTOR *lea min*

* **SEMxboaris** Selects Gen if you are *boaris* in front of SAPMI-N-HEAD or SAPMI-PROP-HEAD *sii dolvo áhku boarrásiid siidii*

* **EMeallimamuorra** Selects Gen eallima muorra

* **ACRGen** Selects genitive: NRK Sápmi

* **ACRAttr** Selects genitive: IL Nordlys

* **AccSemFeat** Selects genitive: IL Nordlys

* **SEMXxr2093** Selects accusative: if váldit to the left and mielde to the right: *váldit mielde*

* **SEMXr2096** Removes genitive: because Accusative in front of an organization

* **SEMGenORG** selects Gen (modifier): in front of an organization *Stáhta Oahpahuskantuvra*

* **SEMGenORG** selects Gen (modifier): in front of an organization *Stáhta Oahpahuskantuvra*

* **SEMgen1** removes Acc if buot, gait or buohkat in front of a genitive, followed by a plural noun *buot Norlándda ohppiid*

* **SEMgen2** removes Acc if bargat or dihte are FMAINV or Inf and are found somewhere to the left of a Gen, which is followed by a noun *bargame boazodoallolága ođastemiin*

* **SEMXr2103** Selects accusative: OASSI is usually accusative *hálddaša stuora oasi*

* **SEMXxr2104** Selects accusative: if WRITING-ACTIVITY-V to the left and you are a TEXT *čállá vaidaga*

* **SEMXxacc**Removes accusative: if WRITING-ACTIVITY-V to the left and a noun to the right *čállit Norgga vásáhusaid*

* **SEMXxOrgRep** Selects genitive: An organization´s representative *Sámiráđi ovdaolmmoš*

* **SEMxr2107** Acc if *-1 fáktemuš

* **SEMXxr2108** Selects genitive if you are SAPMI with an Acc/Gen immediately to your left and a noun immediately to your right *girji sámi áššiid (birra)*

* **SEMsapmiModifier** Selects genitive (modifier): Sámi, suoma or ruoŧa  as modifier of noun *sámi oahpahus*

* **SEMsamegiellaCoord** Selects genitive 

* **SEMAcc** Selects accusative #to be generalised

* **SEMálbmot** Selects genitive #to be generalised

* **SEMsapmiModifier2** Select genitive (modifier): Sámi, suoma or ruoŧa on both sides of CNP as modifier of noun *Suoma ja Ruošša soahti*

* **SEMdazaModifier** Selects genitive (modifier): dáža, indiána, maya-indiána or romer  as modifier of noun *dáža oahpahus*

* **SEMXr2115** Selects genitive (modifier) in front of a lahka-noun *spábbačiekčanlága vuoigatvuohta*

* **SEMXr2116** Selects genitive (modifier) if you are LAHKA OR ORGANIZATION followed by mannu, day and numerals..

* **SEMvaldi** Selects removes NomAg váldi, till we find examples of actual use of it 

* **SEMtext** (modifier) selects genitive (modifier) if you are a TEXT in front of KLASS *doalloplána čuoggái*

*  **SEMgiella1** (modifier) selects Gen if you are a LANGUAGE in front of LESSON or SATNI *sámegiela oahpahusa*

* **SEMsamegiella** selects Gen for LANGUAGE if *1 is LESSON 

* **SEMlang** removes Gen if LANGUAGE is to the right, but not if you are ACTOR-ROLE and so on *oahpponeavvuid sámegillii* 

* **SEMlang2** Gen if you are LANGUAGE with 1 N: You are only a modifier in a sentence with a TV-verb, if there is an Acc or Com between you, or if the Obj is topicalized *ráhkadii sámegiela Áppesa*

* **SEMgiella2** Gen if you are Pron followed by giella *iežas giella*

* **vdicNom** Selects Nom

* **SEMstahta1** Gen if 0 stáhta 1 org etc.

* **SEMfylka1** Gen if you are FYLKA followed by fylka *Romssa fylkkasuohkan*

* **SEMfylka2** Gen if you are FYLKA, then "ja" to the right followed by FYLKA *Finnmárkku ja Romssa fylkkagielddaide*

* **SEMfylka3** Gen if FYLKA and some place or org to the right *Finnmárkku ássiide*

### Other genitive rules

* **topGEN** Selects Gen if sentence intitial. To the right a Prf Prc that modifies nominative *Stáhta nammadan láhtu*

* **NomQst** Selects Nom in a Qst-sentence. To the left is Nom and leat with a Qst-particle *Leat go álbmotmeahcit veahkaváldi*

***Genlassin** Selects Gen if first one to the right is lassin *bargostipeanddaid lassin*

***lassinIll** Selects Ill if first one to the left is lassin *lassin Sarai*

### Gen and preposition/postposition

* **GenAPP** Selects genitive when a preposition to the left, or when a postposition to the right *rastá riikarájiid*

* **NomIfPo** removes Nom if sentence initial, because it modifies Gen

* **GenPoCoordPunct** Selects genitive for coordinated postpositions: with PUNKT to the left 

* **GenPoCoord** Selects genitive for coordinated postpositions *ráŋggáštusa ja buhtadusa hárrái*

* **GenGenPo** (modifies pp-phrase) selects Gen in front of postposition-phrase *álgojagiid soađi maŋŋá*

* **GenORG** (modifies Loc) selects Gen if you are MAIN-ORGANIZATION and to your right is Loc *dearvvašvuođafitnodagaid jahkedieđáhusain*

* **GenPropSem/Semcon** 

* **SEMnom** (modifies Nom) removes Acc if sentence boundary or adv to the left. To the right is Nom followed by a transitive verb and Acc *stálu beana njoallu háviid*

* **SEMDomain** 

* **deaivatGenlusa** selects genitive when used like deaivat Gen lusa/lahkosii even if the verb deaivat belongs to the strict TV set.

### Genitive in place adverbials ROUTE

* **GenPlc** Selects genitive if you are ROUTE, and there is a MOVEMENT-V to your left or right *boahtiba dán geainnu*

* Selects accusative if you are ROUTE, and the verb čuovvut to the left. 

* **ruovttoluottaAdv**

### Adjectives take object

### Temporal adverbials: Choosing accusative or genitive TIME

* **GenMannuOrdRight** selects Gen if you are mannu and to your right is A Ord *miessemánu 10.*

* **GenMannuOrdLeft** selects Gen if you are mannu, to your left is Ord and to your right is a numeral

* **JahkeNumNom** selects Nom if you are Num, to your left is beaivi, then ord/Num and then mannu *borgemánu 1. b. 1891*

* **GenBoahtte** selects Gen if you are time, to your left is boahtte, boahtit, čuovvovaš or ovddit

* **TIMEobs** selects Gen if you are time, and to your right is an intransitive real-verb. No adverbials allowed to the right *vuolggán bearjadaga*

* **GenGuhte** selects Gen if you are vahkku with guhte to your left *guđe beaivvi*

* **GenMan** selects Gen : man adj

* __Nom_b_1__ selects Nom if you are b/beaivi with a numeral/Ord to your left and a mannu to the left of that. To your right a finite verb čuovvut

* __Nom_b_2__ selects Nom if your are b with a numeral/Ord to your left and a mannu to the left of that. To your right copulas followd by beaivi in nom-case *juovlamánu 1. b. 1972 lei buorre beaivi*

* __Nom_b_3__ selects Nom if you are b/beaivi with Num/Ord to your left, with mannu to the left of that, with copulas even futer to the left and beaivi to the left of copulas

* **aigiAcc** Gen if 0 TIME 1 áigi

* **GenBeaivi2** selects Gen if you are beaivi with the end of the sentence or comma to your right. Restrictions to the left *riegádanbeaivvi,*

* **GenBeaivi3** selects Gen if you are beaivi with the beginning of the sentence to your right *Bearjadaga mii vuolgit*

* **GenBeaivi4** selects Gen if you are beaivi with a NP-boundary to your right

* **GenDate** selects Gen if you are Sem/Date

* **GenJuohke** selects Gen if juohke or seamma to the left *juohke dálvvi*

* **GenJahkiNum** selects Gen if you are jahki num with a numeral to your right *Skuvlajagi 1998-99*

* **AigiModifier** (modifier) selects Gen if aigi to the right *konferánssa áiggi*

* **GenHávvi** selects Gen for hávvi if Acc somewhere to the right 

* **GenHávvi2** selects Gen for hávvi if a transitive verb cannot be found somewhere in the sentence

* **GenGeardi** selects Gen if the beginning of the sentence to the left *Eará háviid*

* **GenRbeaivi** (modifier) selects Gen if riegádanbeaivi to your right 

* **GenGeardi2** selects Gen for geardi if Num Gen or Ord to the left 

* **GenTimePl** selects Gen for TIME-N + Pl if an attribute to the left *lagamus beivviid*

* **GenDURadj1** selects Gen if a duration adverbial to the left 

* **GenDURadj2** removes Gen for TIME-N, if duration adjective to the left *olles dálvvi*

* **accgenbeaivi** ávvudit riegádanbeaivvi

* **GenDURNumPl** duháhiid jagiid

* **GenDUR1** removes Gen for VAHKKU-DUR if duration verb or place verb somewhere in the sentence. Restrictions. *ádjánii beaivvi*

* **GenDURNum** vázzen guokte maŋimuš jagi doppe

* **GenDUR2** removes Gen for VAHKKU-DUR if the duration verb or place verb to the left is perfectum participle or infinitive with an auxiliary to the left 

* **NoTimeAcc** removes Acc for time if POINT-IN-TIME-SPEC or Ord to the left *vuosttas beaivvi*

* **NoTimeAccII** removes Acc for time if POINT-IN-TIME verb to the left 

* **NoTimeAccIII** removes Acc for time if POINT-IN-TIME verb to the left is infinitive or perfectum participle with an auxilliary or negation to the left 

* **AccBeaivi** removes Acc for relative pronouns if followed by general beaivi *guđe beaivvi*

* **timeADVL** selects Gen for time: when perfectum participle or infinitive to the left are time adverbial verbs or not time object verbs, to the left of this there shall be an auxiliary *lean čoavdán cealkagiid maŋimuš áiggi*

* **theAccusative**_ selects Acc if you are a N or Pron with CC to your right, followed by Acc and a CLB or VFIN *gápmagiid ja vuoddagiid, sii geavahedje*

* **NotGenitive** selects Acc if you are a N or Pron with punctuation marks to your right, followed by a noun-phrase boundary

###  Reflexive pronouns: acc or gen

* **NUGOr2159** selects Gen between nugo and N *nugo suorri dulkaoahpu*

* **AccIEScoord** selects (Pron Refl Acc) Acc in front of "ja" to the left. To the right Loc or Ill *elliideaset ja iežaset ealáhussii*

* **GenIES** (modifier) selects (Pron Refl Gen) if NON-FAMILY OR ("bellodat") OR SAMEDIGGI-GEN to the right *iežaset mánáide*

* **AccIES** SELECTS accusative object (Pron Refl Acc)  

* **AccIES** (modifier) removes accusative object (Pron Refl Acc) if Ill or Loc to the right, but not if a transitive verb is found to the left 

* **GenIESinf** removes (Pron Refl Gen) if a transitive verb to the left and an Inf to the right 

* **NomIfProp** Removes Acc and Gen when you Prop because you are Nom. To the left is a sg3-verb. Should not hit Prop that are Sem/Plc.

* **NomIfProp2** Removes Acc and Nom when you are Prop Sem/Plc because you are Gen. To the left is a sg3-verb. To the right is a noun.

* **NomSentFin** Selects Nom if you are Acc or Gen and EOS is to yoru right. Copulas is found to the left 

* __jr_sr__ Selects (ABBR Nom) if you are *jr* or *sr* and first one to your left is (Sem/Sur Nom)

### Accusative object 

* **AccActioEss** Selects accusative: when a Strict transitive verb actio ess to the left, but not if there is an other Acc to the right followed by EOS

* **AccEss** removes Acc when you are SAPMI-N-HEAD with an Ess to your right, but not if there is a transitive mainverb to the left *dutkama duogážin*

***topOBJPers** Removes Gen if you are Acc, and to you right is a Pron followed by a transitive verb. You have to be sentence initial

***AccVAbess** Selects Gen if to the right is abessive 

* **topOBJ1** Selects accusative: when a Strict transitive verb to the right (topicalized object) *beaskka geavahedje*

* **topOBJ2** Selects Acc when a transitive finite mainverb to the right (less strict) *dan juohkehaš fuobmá*

* **topOBJ3** Selects Acc. It is not depending on a transitive verb like topOBJ1 and 2, but selects Acc when Aux to the left, but only if there is no chanse of it beeing a Nom 

* **AccTV1** Selects accusative: when a Strict transitive verb to the left (barrier exludes everything but: adv, N Ess , N Loc and Pcle). No Acc allowed to the left of the verb. No Acc allowed to the right of you, except pronouns and education (sentenceboundary and N Ess as barriers). Only numunit numerals are allowed to the left. You are not Acc if you are: time, ruote or Pron Indef. Neither if you are Pron Refl with Gen to your right followed by N Ess. Neither if you are Pron Refl with Gen to your right followed by Po. N Nom and Ger not allowed immediatly to your right. You are not Acc if you are a Nom cased Prop and the verb is some kind of verbalactivityverb and ahte or sentenceboundary is to the right. Vdic not allowed immediately to your left. If váldit is the verb, you are likely to be a Gen if Ill-body noun is found to the right. *oste mielkki gávppis*

* **gosnevrriid** selects Acc in the special cases where there is an Acc Pl in the beginning of the question which is not the object of the verb: Gos nevrriid...

* **PronNP** (removes Acc): selects Gen for Pron Pers if Acc or Ill to the right, given that there is a secure object or that no transitive verb is found *bija ruđa mu kontoi*

* **dahkatGen** selects Gen when dahkat or bargat takes only adverb

* **r2206** selects Gen when a finite verb to the left and Nom or Acc to the right *lohkaba su girjji*

* **r2271** Removes genitive when a transitive verb to the left and you (not if you are a pronoun) are followed by Ill/Loc/Com/Adv: *doalvvui stálu meahccái*

* **AccTV2** Selects accusative: when a transitive verb to the left. No Acc allowed to the left in the sentence (sentenceboundary as a barrier). No Acc allowed to the right (barriers are CC, comma and sentenceboundary). Note that Gen to the right followed by a noun is allowed. You shall not be: route, time, Pron Dem. You are not Acc if you are: Gen-cased Pron or Animate with Ill immediately to your right. No Acc, Com, N Nom or Gerundium allowed immediately to your right. No Gen followed by Po allowed immediately to your right. A SG3-verb is only allowed to your left (barriers excluding everything except NP-heads and adverbs, PrfPrc is also a barrier) if there is a Nom left to the SG3-verb. No vdic allowed immediately to your left. You are not Acc if: you are a Nom-cased Prop, followed by ahte or EOS and the verb found to the left (SV-boundary) is some kind of verbalactivityverb or a humanagentverb.

* **AccTV3** Selects accusative: when transitive verb to the left, if it doesn't find a barrier: comma, Num, real-v, Ess, s-boundary. Acc not allowed to the left of the verb. Not Acc if animate or Gen in front of Ill. Numerals the only Acc allowed to the right. Not Num, time route or adv. Not Com or Ger immediately to the right. Neither Po. Not Acc if sg3-verb to the left without a Nom to its left. Not Pron Dem followed by N, neither Pron Rel followed by time. No vdic immediately to your left. No Nom-cased Prop with some sort of verbal activity to its left is allowed..  

* **OLDr2466** Selects accusative: when transitive verb to the left, but not if the TV is FAUX OR LOC-V

* **AccInf** Selects Acc if the verb to the left is TV + Inf (you are the obj of the Inf). Differs from the other rules by not beeing restricted by an Acc to the right *hállat eatnigiela*

* **AccCOP** Selects Acc if copulas to the left and nominative to the left of COP *gápmagat leat áhči*

### Gen modifiers inside NP 

* **GenNP1** Selects Gen for Pron Pers (modifier): if NP-BOUNDARY OR Acc (but not if the finite verb is TV) to the left and N to right 

* **GenNP2** Selects Gen for N (modifier): if CC "ja" immediately to your left and accusative to your right *ja sámi jurddašanvuogi*

* **GenNP3** Selects Gen (modifier): if first one to right is Nom or Loc *Norgga oaivegávpogis*

* **GenNP4** (modifier) selects Gen -1 BOS or COMMA, 1 Nom *nissoniid bargu*

* **GenNPCo** (modifier) Selects Pron Pers Gen if Nom to the left of ja *Mun ja mu ustibat*

* **GenRefl** (modifier) selects Gen in front of a noun in accusative or nominative case *iežaset oiviliid*

* **AccAfterCC** Select accusative: if genitiv to the left, and CC "ja" to the left of genitive *eamiálbmot- ja globaliserenprošeavtta koordináhtor*

### Accusative in coordination

* **CoAcc1** Selects Acc when NP inbetween commas *guolleoivviid, dáraid, debbuid, buđeittaid, boares rásiid*

* **CoAcc2** Select Acc if coordinator to your left and accusative to the left of the coordinator *deaja dahje sávtta*

* **CoAcc3** Selects Acc in front of *ja* if there is a secure Acc to the right *semináraid ja diehtojuohkinčoahkimiid*

* **CoAccJA** Selects Acc when "ja" to the left and comma to the left of "ja" with a secure Acc to the left of comma *sámegiela, ja heajos dárogiela.*

* **CoAccJA2** Selects Acc in front of Gen + Po if ja in front of Acc *ja ruhtan sávzzaid ovddas*

### Intransitive verbs can sometimes be transitive

* **IVasTV** Selects Acc if you are GEOGRAPHICAL-PLACE, ABSTR-ROUTE or EDUCATION and somewhere in the sentence is a intransitive verb acting as a transitive verb *sii vázzet skuvlla*

* **IVisTrans** Selects Acc if you are *spábba* and somewhere is *viehkat* 

* **IVisTrans2** Selects Acc if you are SHOE or HUNT-ANIMAL or BOAZU and somewhere is *vázzit*

* **IVceavzit** Selects Acc for ceavzit IV if you are *eksámen* and ceavzit is found somewhere in the clause 

* **IVnohkkat** Selects Acc if you are BEDCLOTHES  

* **IVsahttit** Selects Acc 

* **IVsahttit2** Selects Acc 

### Accusative or genitive in front of ALU and in front of adjectives

### Exceptional accusative attributes in front of ALU nouns.

* **ALU** Selects Acc when Num and right is MEASURE LINK 1 ALU

* **ALU2** Selects Acc when Num and not Adv, and 1 ALU

* **ALU3** Selects Acc for Num when right context Num ALU

* **arabpros** Selects Nom

* **NumAcc** Selects Acc

* **NumNom** Selects Nom

* **NumNom** Selects Nom

* **NumComplAcc** (complement of numerals) Selects Acc Sg when Num Sg to the left is Acc

* **NewGen** (complement of numerals) Selects Gen Sg when Num Sg to the left *guhtta kilu*

* **NewGenCo** (coordinated complement of numerals) Selects Gen if Num Acc + NewGen found to the left of "ja" *máŋga dáhpáhusa ja digaštallama*

* **ALU4** Selects Acc if you are Num and to your right Num Acc followed by MEASURE OR ALU/A *guokte golbma mehtara alu* 

* **ALU5** Selects Gen if Num to the right, followed by Num, followed by ALU/A 

* **NumTimeMannel** Selects Acc for Num before TIME MANNEL

* **NumPageMannel** Selects Acc for Num before siiddu etc + MANNEL.

* **NumPageMannel2** Selects Acc for Num before ovdalis etc

* **GenBoaris** Selects Gen in golbma *jagi* boaris

- Ritva comment: Find a rule for "viđa" aswell, this hits "mehter" as it should

* **XXr2002** Selects genitive if there is a numeral immediately to your left, and you are TIME: *golbma jagi*

### Numerals 

* **NumGenPo** Selects Gen for a numeral if a transitive verb to the left. To the right a Gen followed by a postposition *vuovdán 163 000 ruvnnu ovddas*

* **NumMoney** Removes Gen if you are a numeral and immediately to your right is CURRENCY *vihtta ruvnnu*

* **NumGitta** Selects Acc when you are a numeral with "gitta" immediately to your right followed by a numeral with acc-case *180 gitta 200*

* **NumAcc1** Selects Acc if you have a transitive verb to the left and you are a numeral followed by a noun  *oste guokte mielkki*

* **NumJahki** Removes Acc if you are a numeral and JAHKI-NUM is immediately to your left *mávssii mannan jagi 43 ruvnnu*

* **NomIfNum** Removes Acc if Gen to the right (because you are Nom). Transitive verb with an Acc to the right *máŋga gávpeolbmá lonuhedje fáhcaid*

**NumGenMeasure** Genitive numerals in front of ruvdnosaš with friends

* **NumAcc2** Selects Acc for singular numerals if there is a transitive verb somewhere in the sentence and the numeral is followed by a noun *logi báhkkoma* OBS

* **GenIfNum** (complement of numerals) Selects Gen Sg if there is a Num Sg to your left *guđa geardde* 

* **NumAccCo** (coordinated num) Selects Acc if you are Num Sg and to your right: CC with a Num to the right *guokte ja eanemusat golbma*

* **NumAccIV** Selects Acc 

* **NumAge** Selects Acc for Sg numerals if a time unit to the right is followed by boaris *vihtta jagi boaris*

* **NumAccPlRight** Selects Acc when transitive verb to the left. You are Num Pl and to your right is Acc *goarui viđaid gápmagiid*

* **NumAccPlLeft** Selects Acc when tranistive verb to the right (same as the previous. Only differs in which direction the verb is found). *galliid sabehiid don ostet*	

* **NumAccPlLeft** Selects Acc if you are N Acc Pl and to your left is Num Acc Pl *galliid sabegiid*		

* **NumOktaAcc** Selects Acc if 0 okta followed by a noun. Transitive verb to the left *oidnen ovtta nieidda*

* **QUANgenCoord** Selects Gen for coordinated complement of a numeral

* **QUANgen1** Selects Gen if a numeral with Nom-case to the left and 3Pl-verb to the right

* **QUANr2142** Selects Gen if a numeral to the left and genitive to the right. Transitive verb not allowed to the left.

### Leftover accusatives

***COMPInfAcc** Selects Acc if you are Gen and to the left is an Inf TV @COMP-CS<

* **NomInf** Selects Nom

* **NomInf** Selects Nom

* **AccInf2** Selects Acc if Inf immediately to the RIGHT *guliid čoallut*

* **AccNomCOPconstr** Selects Acc in front of Inf; only if there is no chance for itself beeing Nom

* **AccTV4** Selects Acc if transitive mainverb to the left. Lots of restrictions to the right

* **AccPronRel** Selects (Pron Rel Acc) when a secure Acc or Nom to the left *gáibidedje internáhttaskuvlla man*

* **AccPronRel2** Selects (Pron Rel Acc) when somewhere in the sentence is a Nom (barrier is sv-boundary), but only if leat isn't the main verb. *geaid eamiálbmogat* 

* **AccPronRel3** Selects Acc if there is a (Pron Rel Nom) to the right. Obs: not hit nominatives, hence negations. *eanu mii šealgá*	

* **AccActioLoc** Selects Acc when transitive Actio Loc somewhere in the sentence *guldeleames muitalusaid*

* **AccAhte** Selects Acc when *ahte* is found to the right 

* **AccAux** Selects Acc if beginning of sentence to the right and aux, not leat,  is to the left. No Acc allowed to the left *láđđi fertejetne oastit*

* **HabGenAdvl** Removes Acc; in a habitive adverbial construction with Gen, but only if there is no chans of 0 beeing Nom *Dat lea áhči*

* **AccIll** Selects Acc if a strict transitive verb is found to the left and Ill to your right. You are not allowed to be a possible modifier of ill: Pron, Px. *buktán heasttaid meahccái*

* **Gerundium0** Selects Acc as the complement of Ger

* **Gerundium1** Removes Gen if no other object available for the preceding tv-verb

* **Gerundium2** Selects Acc in front of Ger, but not if it is not HAB-ACTOR/Pron Pers. No transitive verb allowed to the left, exept it it has an object of its own.

* **GerundiumTEST** Selects Acc 
* **GerundiumTEST** selects Gen for HAB-ACTOR and Pron Pers in front of Ger, but only if there is an Acc belonging to a transitive to the left

## Accusative before @COMP-CS<
## Accusative before some A
## Accusative sentence-finally

## Genitive

* **r2143** The most frequent genitive rule: Gen when postpos immediately to the right:

## Nominative and accusative

* **NAr2266** Selects Nom

***NomIFInitialThenSg3** Selects Nom if -1 BOS and 1 oblique / Sg3 lookalike. Works in fragments.

* **NAAccEllipsis1** Selects Acc	

* **NAAccEllipsis2** Selects Acc

* **r2281** marginal

* **NAr2288** Removes Nom

## Nominative

### Miscellaneous rules
* **NDnom** Selects Nom

* **NDr2300** Selects Nom if Gen immediately to the left. You are N-SG-NOM and to your right is SG3-V *Du ášši lea dehálaš*

* **NDr2302** Selects Nom if immediately to the left is "ruvdno" and to the left of it is Num *70 ruvnno mehtar*

* **NDr2304** Selects Nom for (Num Sg Loc) if to the left is a spesific word and to the right is EOC 	

* **NDr2305** Selects Nom for (Coll Nom) if to the left is (Pers Pl Nom) *mii golmmas*

* **NDr2306** Selects Nom for (N Nom) if to the left is "okta" or "nubbi" *okta lihtter*

* **NDr2308** Selects Nom for PROP asdf 11231

### Vocatives, subjects of sentence fragments
* **NDr2309** Selects Nom

* **NDr2310** Selects Nom	

* **NDr2311** Selects Nom

* **NDr2312** Selects Nom

* **NDr2313** Selects Nom

* **NDr2314** Selects Nom

* **NDr2315** Selects Nom

### Nominative in titles and sentence fragments

* **NDr2317** Selects Nom: A single word is nominative

* **NDr2318** Selects Nom: A single word with a numeral in front of it is nominative

* **NDr2319** Selects Nom: An NP head with a genitive modifier is nominative 

* **NDr2320** Selects Nom: A title is nominative if it has a Nom reading at all

* **NDr2321** Selects Nom: An NP head with an Attr modifier is nominative

* **onlyProp** Selects Nom

* **nomAuthor**

### Nominative after "go", "dego", "dugo" and "nugo"

* **NDr2324** Selects Nom

* **NDr2325** Selects Nom

* **NDr2326** Selects Nom

* **NDr2327** Selects Nom

* **NumNomgo** Selects (Num Nom)

* **NumAccgo** Selects (Num Acc)

### Preverbal subjects

* **NDr2331** Selects (N Nom)

* **NDr2332** Selects (Num Nom)

* **NDr2333** Selects (Num Nom)	

* **NDr2334** Selects Nom

* **NomEss** Selects Nom when not copula

* **NDr2335** Selects Nom

* **NDr2336** selects (N Sg Nom) when 1 SG3-V

* **NDr2337** Selects (N Sg Nom)	

* **NDr2338** Selects (N Sg Nom)	

* **NDr2339** Selects (N Sg Nom)	

* **NDr2341** Selects Nom

* **NDr2341** Selects Nom

* **NDr2343** Selects (Sg Nom)

* **NDr2345** Selects Nom

* **NDr2350** Selects Nom

* **NDr2351** Selects Nom

* **NDr2353** Selects Adv

* **NDr2354** Selects Adv - Outcommented: This rule does not function well

* **NDr2355** Selects Adv

* **NDr2357** Selects (A Pl Nom)

* **NDr2358** Selects (A Pl Nom)

* **NDr2359** Selects (A Pl Nom)

### Postverbal subjects

* **NDr2360** Selects Nom

* **NDr2361** Selects Nom

* **NDr2364** Selects (Sg Nom)

* **NDr2366** Selects Nom

* **NDr2367** Selects Nom

* **NDr2368** Selects (N Pl Nom)

* **NDr2369** Selects (Pl3 Nom)

* **NDr2370** Selects (Num Nom)

* **NDr2372** Selects (Pron Pl Nom)

* **NDr2373** Selects Nom

* **NDr2375** Selects Nom

* **NDr2376** Selects Nom

* **PostVNom** Selects Nom if a singular third person verb to the left with no Nom to the left of it

* **PostVNomComp** Selects (N Sg Nom)

### Nominative predicatives

* **NDr2378** Selects (Sg Nom)

* **ND** selects Nom if; you are HUMAN and immediately to your right is a place. Leat is to the left, and there is HUMAN or Pers to the left of leat *Son lei oahpaheaddji Kárášjogas*

* **NDr2379** Selects (Sg Nom)

* **NDr2380** Selects (Pl Nom)

* **NDr2381** Selects (Pl Nom)	

* **NDr2382** Selects (Pl Nom)

* **NDr2383** Selects Nom

* **NDr2384** Selects Nom

* **NDr2385** Selects Nom

* **NDr2386** Selects Nom

* **CollNom** Selects Nom

* **CollGen** Selects Nom

### Nominative as objects in existential clauses

* **NDSgr2388** Selects Nom

* **NDPlr2388** Selects Nom

* **NDr2389** Selects Nom

* **NDr2390** Selects Nom

* **NDr2391** Selects Nom 

* **NDr2392** Selects Nom

* **NDr2396** Selects (Pl Nom)

* **NDr2391** Selects Nom

### Nominative in coordination and apposition

* **NDr2399** Selects Nom  

* **NDr2400** Selects Nom

* **NDr2401** Selects Nom

* **NDr2402** Selects Nom

* **NDr2403** Selects Nom

* **NDr3529** Selects Nom	

* **NDr2406** Selects Nom

* **NDr2407** Selects Nom

* **NDr2408** Selects Nom

* **NDr2409** Selects Nom

* **NDr2411** Selects Nom

* **NDr2412** Selects Nom

* **NDr2413** Selects Nom

* **NDr2414** Selects Nom

* **NomCCNom** Selects Nom

* **NDr2416** Selects Nom

* **NDr2417** Selects Nom

* **NDr2418** Selects Nom

* **NDr2420** Selects Nom

* **NDr2421** Selects 

### Nominative in parallell constructions

* **NDr2422** Selects Nom

* **NDr2423** selects Nom if it finds a Nom to the left of CC and to the left of a verb. No verb allowed to the right *eamit barggai vuođđoskuvllas ja isit fas gymnásas*

* **nomHnoun** Selects Nom

* **SOV** Selects Nom in front of an Acc	

### Not nominative
* **NDr2424** Removes Nom

* **NDr2425** Removes Nom

* **NDr2426** Removes Nom, but not Actio 

* **NDr2427** Removes Nom

* **ND** Removes Nom	

* **ImprtAcc** removes Nom

## Comitative rules

### NP internal disambiguation of Com

* **PlSg-W** removes Pl when SG-WORD

* **SgCom** removes Sg when PLURALIZER or OASSI OR HEADOFPARTS

* **Locgoabbat** selects Pl Loc after goabbat Foc/ge

* **LocNames** selects Pl Loc 

* **NumCom** selects Num Com: guvttiin nieiddain if not plural-noun like: guvttiin heajain

* **gástaCom** selects Com: Johánas gásta

* **ComDemNum1** selects N Com if there is a Dem or Num or buorre + Com to the left: Exception for plural-nouns  

* **Comburiin** selects N Com if there is a safe N Com to the right: buriin vugiin  

* **ComCOM-A** selects Sg Com after COM-A

* **Comduhtavas** selects Sg Com after duhtavaš

* **ComComAdv1** selects Com after COM-ADV or juohke

* **vuoitit** select Com Sem/Time

### Disambiguation based upon verb valency

* **comheaitit** select Sg Com if heaitit

* **LocLocVL1, LocLocVR** select Pl Loc if there is a LOC-V

* **LLocAccLocVL** select Pl Loc if there is a ACC-LOC-V

* **Loc-v** select Sg Loc if LOC-V to the left in the clause. No mainverb to the right in the clause

### Disambiguation of Com depending on Adv or certain verb or N

* **ComComAdv1** selects Com for ACTOR OR ACTOR-ROLE after og before COM-ADV 

* **Comboahtit** selects riika Com when boahtit: boahtit riikkainis, which is a special construction

* **Comjohtit** selects bihttá and čájálmas and čájáhus Com 

* **Comnamma** selects namma  Com 

* **Combealli** selects riika Com when boahtit: boahtit riikkainis, which is a special construction

* **ComComplPl-N** selects Sg Com for HUMAN, ORGANIZATION, INSTITUTION, STATE, EVENT-TOOL-ACTIVITY, láhka when there is a COM-COMPL-N to the left or right

* **Comoktavuohta** selects Sg Com when oktavuohta is to the left or right

* **ComDU-NR** selects Sg Com after Pers dualis: moai áhčiin, munno vieljain

* **ComHumanOrg** selects HUMAN Sg Com after HUMAN, ORGANIZATION, INSTITUTION

### Animate nouns
* **ComAnimate** selecst Sg Com if there is an animate to the left, and the noun itself is not a ABSTR-TEXT,  TEXT,  PLACE,  INDUSTRY,  EDUCATION,  INSTITUTION,  ANIMATE

* **ComProp** selecst Prop Sg Com for person names. Exception for habitive constructions.

### HAB-ACTOR in habitive-constructions

* **LocHab1, LocHab2** select Pl when HAB-ACTOR

* **LocHab1, LocHab2** select Pl when HAB-ACTOR

* **LocGenerell** select Pl 

váldit vára + Loc

dahkat earrodearvvuođat geainna nu

eallit mainna nu

### Disambiguation based upon verb valency 

### COM-V 
* **ComVR, ComVL** select Com when COM-V

* **ComVOktiiL** select Com when OKTII-V 

* **ComVOktiiR** select Com when OKTII-V 

### tools (concrete and abstract)

* **ComTool1, ComTool2, ComToolCoord** select Com TOOL when ACTIVITY-V, MOVEMENT-V, PLACE-V-V 

* **ComHuman** selects Com ABSTR-TOOL OR SATNI when HUMAN-AGENT-V - does it function? 

### BODY as an instrument

* **ComBodyVerbalV** selects Com BODY when VERBAL-ACTIVITY-V 

* **ComHumanVerbalV** selects Com HUMAN when VERBAL-ACTIVITY-V or báhcit

* Abstract-entity-com-verbs

* **ComAbstract** selects Com if ABSTR-ENTITY-COM-V somwhere

* **ComOnlyPlaceV** is Only-place-loc-verb 

* **ComMaterial** selects Com Sem/Mat when some verbs 

### Dynamic-verbs

* **LocdynamicVR, LocdynamicVL** select Pl Loc if there is a DYNAMIC-V and the noun itself is not a TOOL, ABSTR-TOOL, WRITING-TOOL, CONCEPT, HUMAN, VEHICLE, buorre, Der/NomAc

### Event-tool-actio
Most actio can be both tool and event. 

### PLACE-V

* **LocFurniture** select Pl Loc FURNITURE if there is a PLACE-V

* **ComPlaceV** select Com ANIMATE, CONCEPT, TOOL, ABSTR-TOOL, EVENT-TOOL-ACTIVITY if there is a PLACE-V

* **HumPxComPlaceV**  

* **HumPxComPlaceV**  

* **LocInstitution** select Loc INSTITUTION if there is a ABSTR-PLACE-V

* **LocPlaceIndustry** select Loc GEOGRAPHICAL-PLACE if there is a INDUSTRY to the right

* **LocSourceVR** select (Pl Loc)  

* **LocHumanAgVL** XXX This one was commented out (cf. 0 .. LINK ... BARRIER). Note that this rule did not affect the test result

* **LocHuman-agentV** XXX This one was commented out (cf. 0 .. LINK ... BARRIER). Note that this rule did not affect the test result

### STATE-V (eallit)

### Movement-verbs

### The super-set Dynamic-verb according to choose (Pl Loc) or (Sg Com)

The idea is that the superset DYNAMIC-V are not connected to TOOL, ABSTR-TOOL or CONCEPT in (Pl Loc). This is the "minste felles multiplum". The sub-sets are different, f.i. many of them (but not all) are not connected to HUMAN in (Pl Loc), one is not connected to ABSTR-ENTITY and ACTOR in (Pl Loc). We work with negation so the rules don´t destroy analysis because of insufficent sets. 

First the general-rules for selecting (Sg Com), then the more special rules for selecting (Sg Com), and then we selct (Pl Loc) for the rest of them under # Another round of locative rules.

* **ComDynV** Dynamic-verbs selects Com when TOOL, ABSTR-TOOL, WRITING-TOOL, CONCEPT, EVENT-TOOL-ACTIVITY

* Dynamic-verb selects Com when HUMAN, but not for HUMAN-SOURCE-VEHICLE-V 

* **ComBody** Body-activity-verb Selects Com when BODY, for BODY-ACTIVITY-V or VERBAL-ACTIVITY-V

* **LocBody** deaddu Selects Loc when BODY

* **ComVeh** Selects (Sg Com) if you are VEHICLE, default is Sg Com

### HUMAN-LOC-V 
* **LOCsatni** Selects (Pl Loc)

* **LOCwordparts** Selects (Pl Loc)

* bivvat - we don't need this any more

* ealihit

* ipmirdit / áddet

* ruhtadit

* ávvudit

* suokkardit and čielggadit

* haddegoargŋun 

* vástidit 

* Coordination

* **AccTV1NoC** was Eckhard's late version of AccTV1 without C. We will look at this.

* **AccEOS** is The Dangerous Rule: it is one of the last rules before removing all leftover Acc. It only selects Acc if Nom is not an option, dont change this btw, and the end of the sentence is the next one to the right

* **AccEllipse** 

* **genRel** removes genitive if Rel OR @CVPg to your right *ožžot olbmot skoviid maid*

* **genAcc** selects Acc 

* **TopObj** selects Acc for Finnish-style topicalisation

* **genNom** removes Acc

* **makkárAcc** selects Acc after makkár, if not time or route

* **DemAcc** selects Den Acc after the last acc-disambiguation of nouns

* **KillAcc** Removes Acc if you are Gen 

* **NumOktaGen** Selects Gen after okta gen 

### Locative and comitative - Disambiguation based upon coordination

### And then we remove the remaining Sg Com analysis

## Essive   OBS

## Late case rules (after other case rules have worked). 

# VERBS PART 2, Section #22

## Finite or not

### Finite

### Not Finite

### Indicative Negative

### Infinitive

* **InfComplToN** Inf when -1 N

## Indicative or imperative

## Verbs according to person and number

### Sg1 - First person singular

* **InitialLeanRule** selects lean when no VFIN to the left

* **Sg1WhenAloneVfin** selects Sg1 when no other VFIN or PrfPrc

### Sg2 - Second person singular

* --r2907**Sg2** Prt Sg2 if ikte etc.

### Sg3 - Third person singular
Infinitive and clausal subject

Rules that look backwards for a subject across a relative clause:

Rules that look backwards for a subject across a subordinate clause (CP boundary):

Extension possibilities: Coordination

Son oaidná du ja mu ovdal go boahtit... 

Coordinated Sg3 verbs

Not V + Sg3 

### Du1 - First person dual 

* **MunJaDonDu** selects Du1 if Mon V ja don V de V-Du2

* **DonJaMunDu** selects Du1 if Don V ja mun V de V-Du2

The previous two rules look marginal.	

* **DuNotPrtIfToday** selects Du1 over Prt in the context of a present-marker.

* **Du1IfDu1** selects Du1 with a left context Du1 ... ja ... 

* **NoDu1** removes Du1 if no MOAI or Du1 around.

### Du2 - Second person dual

### Rules for leahppi = ("leahppi" N Sg Nom)

### Du3 - Third person dual

### Pl1 - First person plural

### Pl2 - Second person plural

### Pl3 - Third person plural

* **Pl3IfPlSubj** Pl3 if Pl noun to the left

* **Pl3IfPlSubj** Pl3 if safe plural (incl pron) to the left

* **Sg2LeftDon** selects Sg2 in Rel phrase if don to the left of it

* **groupPl3** selects Prs Pl3

* **allSg2leat** removes Sg2 if leat Prs Pl3

* **allPrsPl3** selects and removes PrsPl3 if PrtSg2 initially

* **allPrtSg2** removes PrtSg2 if PrsPl3

## Rules for a special infinitive construction
## More finite verbs
## Passive
## Infinitive

## Present Participle
## Actio/Perfect Participle 

## Actio
## Selecting some more finite verbs

## Lexical disambiguation of verbs 

# NOMEN

## Case rules

## Other rules for nouns and pronouns

## Determiners
## Adverbs and adjectives

# NOUNS

* **derNEss** removes DER-N if lexicalised essives 

## Variant lemmas

* Remove lemma2 if lemma 1

* **cleanSemClass** cleans up if a word has more semclasses. This is just a start.

# VERBS

## Final removing rules

* **TEST** selects some infinte verb readings in the cohort

# Removing Err/Orth

* * *

<small>This (part of) documentation was generated from [src/cg3/speech_disambiguator.cg3](https://github.com/giellalt/lang-sme/blob/main/src/cg3/speech_disambiguator.cg3)</small>
