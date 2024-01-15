# North Sami description 

All documents in one file



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

* N
* A
* Adv
* V
* Pron
* CS
* CC
* SET CC-CS = CC OR CS ;
* Po
* Pr
* Pcle
* Num
* Interj
* ABBR
* ACR
* CLB clb (clb lagt til for apertium, fungerer ikke uten)
* LEFT
* RIGHT
* WEB
* LEFT RIGHT because of apertium

* ### Tags for POS sub-categories

* Pers
* Dem
* Interr
* Indef
* Recipr
* Refl
* Rel
* Coll
* NomAg
* G3
* Prop
* Allegro
* Arab
* Romertall
* Subqst
* CLBfinal

* ### Tags for morphosyntactic properties

* Nom
* Acc
* Gen
* Ill
* Loc
* Com
* Ess
* Sg
* Du
* Pl
* Cmp/SplitR
* Cmp/Attr
* Cmp/Cit
* Cmpnd
* Cmp/SgNom Cmp/SgGen
* Cmp/SgGen
* Cmp/PlGen
* Cmp/Sh
* Cmp
* PxSg1
* PxSg2
* PxSg3
* PxDu1
* PxDu2
* PxDu3
* PxPl1
* PxPl2
* PxPl3
* Der/Comp
* Der/Superl
* Gram/Comp for adverbs,  Der/Comp for adverbs  
* Gram/Superl for adverbs, and Der/Superl for adjectives
* Attr
* Ord
* Qst
* IV
* TV 
* Prt
* Prs
* Ind
* Pot
* Cond
* Imprt
* ImprtII
* Sg1
* Sg2
* Sg3
* Du1
* Du2
* Du3
* Pl1
* Pl2
* Pl3
* Inf
* ConNeg
* Neg
* PrfPrc
* VGen
* PrsPrc
* Ger
* Sup
* Actio
* VBAbess
* Known
* sentinit

* ### Tags for clitic particles
* Foc/ge
* Foc/ge
* Foc/ge
* Foc/gen
* Foc/ges
* Foc/gis
* Foc/naj
* Foc/ba
* Foc/be
* Foc/hal
* Foc/han
* Foc/bat
* Foc/son
* Foc/mis
* Foc/mat

* ### Derivation tags

* Der/PassL Der/PassS
* Der/NomAg
* NomAg
* Der/adda
* Der/alla
* Der/easti
* Der/d
* Der/eamoš
* Der/amoš
* Der/geahtes
* Der/h
* Der/Car
* Der/Car
* Der/huhtti
* Der/huvva
* Der/halla
* Der/l
* Der/lasj
* Der/las
* Der/meahttun
* Der/muš
* Der/NomAct
* Der/sasj
* Der/st
* Der/stuvva
* Der/upmi
* Der/supmi
* Der/vuota
* Der/InchL
* Der/laakan
* Der/laagasj
* Der/jagáš
* Der/A Der/A* pga av bug i lookup2cg
* Der/Dimin
* Der/viđá
* Der/viđi
* Der/veara
* Der/AAdv
* Der/Adv
* Der/dáfot 
* Der/keahtta
* Der/nuolus
* Der/náittot
* Der/seagat
* Der/suttat
* Der/ár 
* <vdic>
* Cmp/Hyph 

### Semantic tags

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

* **Focmat** removes Foc/mat when not Imprt  

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

* **LexSelpluralnouns**

* **LexSelbeassat**

* **LexSelgieldit**

* **LexSelgirdit**

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

* **Sem/Sur* removes Mal and Fem if no more names to the right

* **nationalOrg** removes Prop after nation

* **PropInsideProp** Selects Prop if capital letter inside clause

* **AttrPropDerlaš** Selects Prop + Der/lasj + Attr if first one to the right is a noun

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

* **eambbogo** selects Adv

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

* **lihkusAdv**

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

* **sáhkkiiA** selects

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

* **Imprtmannat** selects Imprt before dearvan

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

* **Esscoor** selects Ess instead of NomAct

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

* **ENInf** selects Inf  

* **ENInf** selects Inf  

* **InfgoInf** selects Inf  

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

* **bálddasAdv**

* **erenomážitAdv**

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

* **maidAdv** selects maid Adv when there is a comma to the right.

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

* **maidAdv14** selects maid Adv for 

* **maidAdvProp** selects maid Adv for 

* **AdvPlc** selects Adv for 

* **Adv** selects Adv after lohkat 

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

* **ASgNomNoSubj** selects A Sg Nom also when no copulas 

* **ASgNomafterCop** selects A Sg Nom after copulas and Sg Nom, not so strong constraint for the target

* **ASgNomEssCopNeg** selects A Sg Nom after copulas Sg3 or Neg Sg3s, 

* dsfa

* **AcompGo** Selects (A Der/Comp Nom) even if there is no verb (ellipse)

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

* **NPrfPrcdouble** the verb can be to the right

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

* **+FAUXVboahtit** boahtit as AUX      

* **+FAUXVboahtit**  boahtit coming before the mainverb

* **-FAUXVboahtit** boahtit as AUX      

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

* **SEMGenOrg** Selects Gen in front of Ill after ILL-V

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

* __SEMplcGen_a__ Selects Gen if you are GEOGRAPHICAL-PLACE or Prop + Sem/Plc in front of PLACE-ADV *Finnmárkku máttabealde*
* __SEMplcGen_b__ Selects Gen if you are GEOGRAPHICAL-PLACE or Prop + Sem/Plc after a PLACE-ADV

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

***GenAhkásaš** Selects Gen 

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

* **accgenbeaivi** ávvudit riegádanbeaivvi

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

* **AccTimePl** selects Acc for TIME-N + Pl if an attribute to the left *lagamus beivviid*

* **GenDURadj1** selects Gen if a duration adverbial to the left 

* **GenDURadj2** removes Gen for TIME-N, if duration adjective to the left *olles dálvvi*

* **GenDURNumPl** duháhiid jagiid

* **GenDUR1** removes Gen for VAHKKU-DUR if duration verb or place verb somewhere in the sentence. Restrictions. *ádjánii beaivvi*

* **GenDURNum** vázzen guokte maŋimuš jagi doppe

* **GenDUR2** removes Gen for VAHKKU-DUR if the duration verb or place verb to the left is perfectum participle or infinitive with an auxiliary to the left 

* **NoTimeAcc** removes Acc for time if POINT-IN-TIME-SPEC or Ord to the left *vuosttas beaivvi*

* **NoTimeAccII** removes Acc for time if POINT-IN-TIME verb to the left 

* **NoTimeAccIII** removes Acc for time if POINT-IN-TIME verb to the left is infinitive or perfectum participle with an auxilliary or negation to the left 

* **AccBeaivi** removes Acc for relative pronouns if followed by general beaivi *guđe beaivvi*

* **timeADVL** selects Gen for time: when perfectum participle or infinitive to the left are time adverbial verbs or not time object verbs, to the left of this there shall be an auxiliary *lean čoavdán cealkagiid maŋimuš áiggi*

* **DemCASEPl**

* **theAccusative**_ selects Acc if you are a N or Pron with CC to your right, followed by Acc and a CLB or VFIN *gápmagiid ja vuoddagiid, sii geavahedje*

* **NotGenitive** selects Acc if you are a N or Pron with punctuation marks to your right, followed by a noun-phrase boundary

###  Reflexive pronouns: acc or gen

* **NUGOr2159** selects Gen between nugo and N *nugo suorri dulkaoahpu*

* **AccIEScoord** selects (Pron Refl Acc) Acc in front of "ja" to the left. To the right Loc or Ill *elliideaset ja iežaset ealáhussii*

* **GenIES** (modifier) selects (Pron Refl Gen) if NON-FAMILY OR ("bellodat") OR SAMEDIGGI-GEN to the right *iežaset mánáide*

* **AccIES** SELECTS accusative object (Pron Refl Acc)  

* **AccIES** (modifier) removes accusative object (Pron Refl Acc) if Ill or Loc to the right, but not if a transitive verb is found to the left 

* **GenIESinf** removes (Pron Refl Gen) if a transitive verb to the left and an Inf to the right 

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

* **IVvaikkuhit** Selects Acc for váikkuhit IV   

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

* **relNomVfin** Selects (N Nom)

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

* **app** Selects Nom

* **dasalassinNom** Selects Nom

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

* **ProperNom** Selects Nom, adjusted for arabics in paranthesis between  

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

Test: Go for minimal weight.

## Final removing rules

* **TEST** selects some infinte verb readings in the cohort

# Removing Err/Orth

* * *
<small>This (part of) documentation was generated from [src/cg3/disambiguator.cg3](https://github.com/giellalt/lang-sme/blob/main/src/cg3/disambiguator.cg3)</small>

* * *
<small>This (part of) documentation was generated from [src/cg3/semanticroles.cg3](https://github.com/giellalt/lang-sme/blob/main/src/cg3/semanticroles.cg3)</small>

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
<vdic>

### Semantic tags

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

* * *
<small>This (part of) documentation was generated from [src/cg3/valency.cg3](https://github.com/giellalt/lang-sme/blob/main/src/cg3/valency.cg3)</small>
# Continuation lexicons for abbreviations

## Lexica for adding tags and periods

## The sublexica

### Continuation lexicons for abbrs both with and witout final period

* **LEXICON ab-dot-noun-adj-trab**

* **LEXICON ab-noun**

* **LEXICON ab-adj**

* **LEXICON ab-adv**

* **LEXICON ab-num**

### Lexicons without final period

* **LEXICON ab-nodot-noun**  The bulk

* **LEXICON ab-nodot-adj**

* **LEXICON ab-nodot-adv**

* **LEXICON ab-nodot-num**

### Lexicons with final period

* **LEXICON ab-dot-noun**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-adj**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-adv**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-num**  This is the lexicon for abbrs that must have a period.

* **LEXICON ab-dot-cc**

* **LEXICON ab-verb**  A lexicon for "gč." and perhaps also other abbreviated verbs.

* **LEXICON ab-dot-verb**

* **LEXICON ab-nodot-verb**

* **LEXICON ab-dot-IVprfprc**

* **LEXICON nodot-attrnomaccgen-infl**

* **LEXICON nodot-attr-infl**

* **LEXICON nodot-nomaccgen-infl**

* **LEXICON dot-attrnomaccgen-infl**

* **LEXICON dot-attr**

* **LEXICON dot-nomaccgen-infl**

* **LEXICON DOT** - Adds the dot to dotted abbreviations.
we also allow different variations of dotted abbreviations at
the end of the sentence (especially for tokenisers)
* "su." gets analysed as `"su" Adv ABBR`
in tokeniser mode also:
* "su." -> `"su" Adv ABBR` + `"." CLB` to account for sentence
final su with no extra full stop.
* also `"son" Pron Pers Sg3 Gen/Acc` + `"." CLB` due to
homonymy.
Same treatment is done with two and three full stops after abbreviation in
the end of the sentence:
* "su.." -> `"su" Adv Abbr` + `"." CLB Err/Orth`
* "su..." -> `"su" Adv Abbr` + `"..." CLB`

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/abbreviations.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/abbreviations.lexc)</small>

---



# North Saami acronyms - affix part

## The lexica giving tags and suffixes to the acronyms

* **LEXICON ACRONOUN** is the lexicon for **nouns** (not +Prop) like ATV

* **LEXICON UNIT**  As acro, but without paradigm

* **LEXICON ACRO_ACCRA**

* **LEXICON acroconnector** Here comes a set of possible symbols to
put between the abbreviation and its suffix

* **LEXICON acronull**  for suffixless forms, redirecting to K_only for clitic forms

* **LEXICON acrooblique**

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/acronyms.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/acronyms.lexc)</small>

---

Divvun & Giellatekno - open source grammars for Sámi and other languages

# North Saami adjective declension file

## Bisyllabic adjectives

* **LEXICON BUORRE**  For this adj only

* **LEXICON BUOROT** SUB, Southern dialect

* **LEXICON ALKI**  Bisyll V-Adj, -es-Attr, no WeG.

* **LEXICON SEARRA** Bisyll. V-Adj's with s-Attr in WeG.

* **LEXICON HOHPI** Bisyll. V-Adj's with s-Attr. in WeG & Adv.

* **LEXICON LAIKI** Bisyll. V-Adj's with es-Attr. in WeG & Adv.

* **LEXICON LODJI** bisyll V-Adj with -es and -is Attr in WeG

* **LEXICON JUHKKIS** Bisyll. V-Adj. with s-Attr; no Adv.

* **LEXICON HAHTTI** Bisyll. V-Adj. no Adv. !sponsors wants comparatives for these!

* **LEXICON EADDJI** Bisyll. V-Adj. no Adv.

* **LEXICON NUORRA** Bisyll. V-Adj. w/CG, w/o Sep. Attr; no Adv.

* **LEXICON RIEKTA**  Bisyll adj w/o obl sg forms, WeG Attr

* **LEXICON VIELG**  adj with -es -attrib. (cns final adj)

* **LEXICON VIELGAT**  just a sublexicon to VIELG

* **LEXICON VIELG_NOCOMP**  adj with -es -attrib. (cns final adj)

* **LEXICON VIELGAT_NOCOMP**  just a sublexicon to VIELG_NOCOMP

* **LEXICON CAHKK**  -at final adj with attr -es and -dis

* **LEXICON JALGAT**  only jalgat, attr jalga and jalges

* **LEXICON UHCC**  uhcci, unni, seaggi, attr uhca, unna, seakka

* **LEXICON JEAGOHEAPMI**  caritives

* **LEXICON BIVNNUHEAPME**  no bivnnuhis here, special, beacause popular and unpopular collide in attribute form :)

* **LEXICON JEAGOHEAPMI_NOCOMP**  caritives, no comparative

* **LEXICON OATNI**  only this adj, no attr

## Consonant-final even-syllabic adjectives

* **LEXICON TUVRRAHAS**

* **LEXICON ISSORAS**  issoras and certain as-adj. also derivations, final -s

* **LEXICON IHKALAS-DABALAS** loan adjectives ending on -ihkalaš - kritihkalaš etc

* **LEXICON IIVVAL-DABALAS** loan adjectives ending on -iivvalaš

* **LEXICON ISTTALAS** loan adjectives ending on -ihkalaš

* **LEXICON DABALAS**   -laš adjectives with short Attr and SgNom Comp forms - dábálet, dábálut etc

* **LEXICON NVDCompAttr_ISSORASSA-**  sublexicon to DABALAS

* **LEXICON DEARVVASLAS**  -laš adjectives without short Attr and SgNom Comp forms. The word dearvvaslaš/dearvvašlaš is not directed here, but to DABALAS

* **LEXICON DEARVVASLAS2**  only to lift out ISSORASSA-, see DEARVVASLAS

* **LEXICON STUORIBUS**  -buš comparatives

* **LEXICON ASEHAS**  5 words with -is attr: asehis, asihis, oanehis, vuollegis, vuolligis

* **LEXICON UNOHAS**  for this word only

* **LEXICON IPMAHA** Tris. Gradating C-adj:s, The Troms declension: imaš:ipmaha, gáđaš:gáhtaha

## Trisyllabic adjectives

* **LEXICON MEAHTTUS**  meahttun-adj. with comp. and superl. forms -seabbo, -seamos etc.

* **LEXICON BEAKKAN** Trisyll. Non-gradating C-Adj. without Separate Attr.

* **LEXICON BEAKKAN_NOCOMP** Trisyll. Non-gradating C-Adj. without Separate Attr. No comparatives

* **LEXICON GEARDAN** Trisyll. Non-gradating C-Adj. without Separate Attr.

* **LEXICON JOHTIL** Trisyll. Non-gradating C-Adj. with is-Attr.

* **LEXICON RAHKAT** Trisyll. Non-gradating C-Adj. with is-Attr. TO AVOID RAHKADIT

* **LEXICON HEITTOHA** Trisyll. Non-gradating C-Adj. with is-Attr.

* **LEXICON GUOHCA** Trisyll. Gradating V-Adj., no sep. Attr.

* **LEXICON GARAS** Trisyll. Gradating C-Adj. with Bisyll. a-Attr. and final s Pred

* **LEXICON LINIS** Trisyll. Gradating C-Adj. with Bisyll. a-Attr. and final s Pred

* **LEXICON SUVRRIS** Trisyll. Gradating C-Adj. with Bisyll. weak grade a-Attr. and final s Pred

* **LEXICON NANUS** Trisyll. Gradating C-Adj. with Bisyll. weak grade u-Attr. and final s Pred

* **LEXICON LOSSAT** Trisyll. Gradating C-Adj. with Bisyll. a-Attr. and final t  Pred. geahppat and lossat, words with bisyllable form comparatives in addition to trisyllable form: geahpit, losit

* **LEXICON CAVGAT** Trisyll. Gradating C-Adj. with Bisyll. a/es-Attr. and final t Pred, both -but and -eappot comparatives

* **LEXICON CIENAL** Trisyll. Gradating C-Adj. with Strong Grade is-Attr.

* **LEXICON NJUORAS** Trisyll. Gradating C-Adj., with Strong Grade a-Attr.

* **LEXICON DILDDAS**  ,-ld-(#=is) Trisyll Grad., facult is-Attr.

* **LEXICON VUOGAS**  Trisyll. adj. with gradation I-III and no sep. attr. only this word, vuogas, vuohkkasat

* **LEXICON HEAHKAS**  ,-hkk-#=is heahkka Trisyll Grad., is-Attr & heahkka

* **LEXICON EATTAS**  ,-dd-#=is Trisyll. Grad. C-Adj. with WeG -is Attr.

* **LEXICON BOAKKAS**  ,-gg-#boagge9- Trisyll no attr

* **LEXICON FARGAT**  :d#Ø Trisyll no attr

* **LEXICON GAPPUS**  -bbo- Trisyll, attr same as pred

* **LEXICON VATTIS**  Trisyll CG, -es/-is Attr

* **LEXICON BIEKKUS**  ,-iggo-#=is Trisyll Grad, is-Attr,

* **LEXICON LIEKKUS**  ,-iggo-(#=is) Trisyll Grad,  attr same as pred

* **LEXICON GUOROS**  guoros and luovos, Trisyll Grad,  attr same as pred

* **LEXICON NUOLUS**  ,-u8llo-(#nuolo9s)

* **LEXICON GEARGGUS**  ,-ergo-#gearggo9s

* **LEXICON VUDDJII**

* **LEXICON VUDDJII_DECLINED** misses most cases

* **LEXICON JIEDNAI**

* **LEXICON JIEDNAI_DECLINED** misses most cases

* **LEXICON BOARIS**  As GAPPUS, but with different attr.

* **LEXICON BOARIS_NOCOMP**

* **LEXICON IIDNA_NOCOMP**   

* **LEXICON IIVA_NOCOMP**  IIVA_A without comparatives

* **LEXICON IIVA_A**  loans ending with -a, same attr as pred

* **LEXICON FRIIJA**  loans ending with -a, same attr as pred

* **LEXICON BOREALA** FRIIJA without comparatives

* **LEXICON SPANSKA** spánska, dánska, fránska, ránska. WeG attr

* **LEXICON ALLAT** allat, gassat, govdat, attr: alla, gassa, govda. Trisyllables with Bisyllable compforms: alit, gasit, govddit

* **LEXICON ALLAGA** sublexicon to ALLAT and word árrat

## Contracted adjectives

* **LEXICON FIINNIS**  ,-dná-(:Ø)#fiinna, western comp: fiidnát, eastern comp: fiidnásabbo/-sut/-sat

* **LEXICON DEAHTIS**  as fiinnis, but with StrGr in Attr

* **LEXICON SMAVIS**  as deahtis, but with even more Attr forms and comparative smávit in addition

* **LEXICON STUORIS**  As fiinnis, but with different comparation

* **LEXICON NJALGGAT** Comp+Sg+Nom: njálgát, njálgásut/-sit/-sut/-sat, njálgáseabbo/-sabbo

* **LEXICON CAPPIS**  western comp: čábbát, eastern comp: čábbásabbo/-sut/-sat

* **LEXICON VIISSIS**  Contr, CG and -is -> -á, attr -es/-is, western and eastern comp forms

* **LEXICON RAHPIS**  Contr, CG and -is -> -á, attr -es, with long and short comp forms

* **LEXICON HARVVIS**  Contr, CG and -is -> -á, attr -e, short comp forms

* **LEXICON MALLASadj-**

* **LEXICON MALLASadj-_MINIP**  for giving Use/NGminip-tags

* **LEXICON MALLASI-/NUORABUadj-**

* LEXICON DEVNVCASE  bisyllabic nominal declension

* LEXICON GOAHTI-OBLadj

* **LEXICON GOAHTI-NEadj**

* **LEXICON GODIIadj-**

* **LEXICON GOADIadj-**

* **LEXICON NomVadj**

* **LEXICON EssVadj**

## Special cases

* **LEXICON VEARATAG**

* **LEXICON VEARA**

## Final note on the adjective sublexica

todo: Rewrite the adj lexica so that the attr variation is kept separate
from the otherwise uniform declension.

* **LEXICON VUDDJI-**

* **LEXICON BOHCCOadj**

* **LEXICON BOHCCUadj**

# Adjective declension

* **LEXICON ATTR**  This is the normal lexicon for ATTR forms

* **LEXICON ATTRCONT**  This lexicon is for forms with non-sub Attr, where we sub the rest.

* **LEXICON LAIKI0**  Directing adjectives ...

* **LEXICON ISSORASSA-**

* **LEXICON EABBO/EAMOS** comparision for trisyllable adjectives

* **LEXICON EABBO/EAMOS_MINIP**  for giving Use/NGminip-tags

* **LEXICON EABBO/EAMOS_CONT**

* **LEXICON EABBO/EAMOS_CONT_MINIP** for giving Use/NGminip-tags

* **LEXICON EAMOS_MINIP**  for giving Use/NGminip-tags

* **LEXICON EABBO/EAMOS_CONT-contracted** for certain contracted adjectives, divided dialectwise

* **LEXICON SHORTCOMP**

* **LEXICON SHORTCOMP_MINIP**  for giving Use/NGminip-tags

* **LEXICON SHORTCOMP_PRED_MINIP**  for giving Use/NGminip-tags

* **LEXICON EABBU** eastern form -abbo as well

* **LEXICON EABBUCASE1**

* **LEXICON EABBUCASE2**

* **LEXICON EABBU_MINIP**  for giving Use/NGminip-tags

* **LEXICON EABBUCASE1_MINIP**  for giving Use/NGminip-tags

* **LEXICON EABBUCASE2_MINIP**  for giving Use/NGminip-tags

* **LEXICON BU/MUS**  Bisyllabic adjectives comparision

* **LEXICON BUStem**

* **LEXICON EAMOS** eastern form -amos as well

* **LEXICON GAPPUS0** Almost id. to MALIS0. MALIS0 has no VUOHTA, GAPPUS0 has no Px Ess., and shouldn't have either.

* **LEXICON GAPPUS-**

GOAL: Keep GAPPUS- and MALLAS- apart, because of
the Px(1)V issue, but unify the rest.
GAPPUS- and MALLAS- differ
in the A and N treatment of
Pl Nom Px (only 1st p. for A
and all persons for N).
Now that MALLASI- is deleted,
GAPPUS- and MALLAS- are
identical. We check by pointing
GAPPUS- to MALLAS-. Look into this.
and remove GAPPUS- for MALLAS-
eventually.

* **LEXICON MEAHTTUN** Deverbal adjectives.

* **LEXICON LEXATTR_GEAHTES** trisyllabic stems: geahtes for trisyll, heapmi for bisyll

* **LEXICON GEAHTES**  geahtes for trisyll, heapmi for bisyll

* **LEXICON OVDDIT** Inherently comparative adjectives, bisyll

* **LEXICON MADDELEABBO** Inherently comparative adjectives, trisyll

# Nominal derivation

## Noun derivation

* **LEXICON VUOHTA** +CmpN/SgG

* **LEXICON VUOHTAMORPH**

# Adjective derivation

* **LEXICON LAS** from verbs: čirrolas, bealkálas etc

* **LEXICON BUOREMUSS** superlatives, from bisyll adjectives

* **LEXICON BUOREMUS**

* **LEXICON BUOREMUSSA-**

* **LEXICON HEAPMI** caritives

* **LEXICON LAGAN** lágan, lágán and subform lagan as well

* **LEXICON LAGAS** lágaš, lágáš and subform lagaš as well

* **LEXICON LAGAN_LAGAS**

* **LEXICON AHKASAS** derived words on -saš, -haš, -laš

* **LEXICON AHKASAS_PL**  derived words on -saš, -haš, -laš, only plural,

* **LEXICON SISKKALDAS** olgguldas, siskkáldas, siskkildas, nuppáldas, that's all

* **LEXICON DenominalAdjsV1** caritives and their derivatives (huvva, huhtti), from bisyll nouns

* **LEXICON DenominalAdjsV1Long** caritives and their derivatives (huvva, huhtti), from bisyll nouns without vowel shortening

* **LEXICON DenominalAdjsV1Short** caritives and their derivatives (huvva, huhtti), from bisyll nouns with vowel shortening

* **LEXICON DenominalAdjsV2** from bisyllables, muoralaš, gieđalaš etc

* **LEXICON DenominalAdjsV2_lasj** from bisyllables, muoralaš, gieđalaš etc

* **LEXICON DenominalAdjsC** from trisyllables, -laš and caritives on -heapme

* **LEXICON DenominalAdjsCLong** from trisyllables, -laš and caritives on -heapme

* **LEXICON DenominalAdjsCShort** from trisyllables, -laš and caritives on -heapme

* **LEXICON DenominalAdjsV3** +CmpN/SgN +CmpN/SgG +CmpN/PlG !from Propernames

* **LEXICON DenominalAdjsV3case** from bisyllabic propers

* **LEXICON DenominalAdjsC2** +CmpN/SgN +CmpN/SgG +CmpN/PlG	!from Propernames

* **LEXICON DenominalAdjsC2case** from trisyllabic propers

* **LEXICON DenominalAdjsV4** +CmpN/SgN +CmpN/SgG +CmpN/PlG  from Propernames

* **LEXICON DenominalAdjsV4case** from bisyllabic propers (subbed)

* **LEXICON DenominalAdjsC3** +CmpN/SgN +CmpN/SgG +CmpN/PlG	 !from Propernames

* **LEXICON DenominalAdjsC3case** from trisyllabic propers (subbed)

* **LEXICON LASJOBL**

* **LEXICON HEAPMIOBL** sublexicon not only for caritives on -heapmi/-heapme

## Adverbs from adjectives

* **LEXICON ADVV** adverb from bilysll stems

* **LEXICON ADVC** adverb from trilysll stems

## Adjectives from nouns

* **LEXICON AGAdj**  mostly words like guovttejagat, allajoccat etc

* **LEXICON AGAdjINFL**

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/adjectives.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/adjectives.lexc)</small>

---

Divvun & Giellatekno - open source grammars for Sámi and other languages

# North Saami noun declension

Bisyllabic nouns

* **LEXICON GOAHTI-A** divided into a-i-u due to errortag-branch

* **LEXICON GOAHTI-I** divided into a-i-u due to errortag-branch

* **LEXICON GOAHTI-U** divided into a-i-u due to errortag-branch

* **LEXICON GOAHTI** Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen

* **LEXICON GOAHTI-IU** Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen

* **LEXICON GOAHTILONG** Long nom-compound-forms, long gen

* **LEXICON GOAHTILONGSHORT** Sometimes long nom-compound-forms, long gen

* **LEXICON ALBMI** Bisyll. V-Nouns. Short nom-compound-forms, long gen.

* **LEXICON ALBMILONG** Bisyll. V-Nouns. Long nom-compound-forms, long gen.

* **LEXICON GOAHTI_CGforms** Bisyll. V-Nouns. Forms that usually get CG. This lexicon is mostly meant for adding Err/Orth forms wihout CG to lemmas, which should have CG, like reabbá:reabbáid

* **LEXICON ALBMILONGSHORT** Bisyll. V-Nouns. Long/SHORT nom-compound-forms, long gen.

* **LEXICON AIGI** Bisyll. V-Nouns. Short nom-compound-forms, short gen.

* **LEXICON STAHTA** Bisyll. Non-Gradating a-Nouns; i-Illative

it does not have the Prop tag.

Bisyllabic nouns
2f. Actor lexicas

* **LEXICON IIJA** loan words ending -iija; also with only -i as Err/Orth, like galleri

* **LEXICON ESSEIJA** loan words ending -ija; Illative -ijai as well -ijii: kopiijai, kopiijii

* **LEXICON IIVA** -iivva loan words.

* **LEXICON PROFIILA**  -iila Loan words.

* **LEXICON STRUKTUR** Recent loanwords on -vra with short cmp-form: struktur-

* **LEXICON KULTUR** -kultuvra, compound forms: kultur-, kulttor-

* **LEXICON KANTUR_N** word with many forms

* **LEXICON MAŠIIDNA** mašiidna with short cmp-forms as well

* **LEXICON BENSIN** bensiidna with short cmp-forms as well

* **LEXICON ADRENALIN** Recent loanwords on -iidna with short cmp-form as well

* **LEXICON TELEFON** Recent loanwords on -vdna with short cmp-form as well

* **LEXICON AKTION** akšuvdna with cmp form ákšun- as well

* **LEXICON NATION** naššuvdna with short cmp form náššon as well

* **LEXICON KANON** kanovdna with short cmp form kánon/kánun as well

* **LEXICON SOSIAL** Recent loanwords on -ála with both short and long cmp-form

* **LEXICON GARGIA**  Vowel-final loan words without Gradation and Ill ^change

* **LEXICON MEDIA**  Vowel-final loan words without Gradation and Ill ^change, with -i(i)ja Err/Orth

* **LEXICON OBOE**  oe-final loan words without Gradation and Ill ^change

* **LEXICON BUFFALO** consonant fin loanwords, some vow fin like revya

* **LEXICON ESSAYA** recent loanwords on vow+a

* **LEXICON MASAI** only masai

* **LEXICON BASSI** words on -bassi. Long nom-compound-forms, short gen, long heapmi-caritive

* **LEXICON MUOHTU** words on -muohtu. Short nom-compound-forms, short gen, long heapmi-caritive

* **LEXICON EADNI** eadni, gudni, ádnu. Short nom-compound-forms, long gen, short caritive

* **LEXICON VALDI** words on -váldi. Short nom-compound-forms, long gen, short caritive, away with Px "váldán"

* **LEXICON RAFI** words on -ráfi. Long nom-compound-forms, long gen. short heapmi-caritive

* **LEXICON LOTLOHKU** words on -lotlohku. Long/SHORT nom-compound-forms, long gen.

* **LEXICON SAPMI** Bisyll. V-Nouns. No nom-compounding, short gen.

* **LEXICON XGIELLA** Bisyll. V-Nouns. No nom-compounding, short gen.

* **LEXICON BEALLE** words ending -bealle. Short nom-compound-forms, short gen.

* **LEXICON TAXI** dákse and tákse

* **LEXICON LUONDU** this word (+vuohta) because of behavior in compounds, where it is normally in SgGen: luonddubiebmu

* **LEXICON GOADA-LUONDU**

* **LEXICON NPx2V-LUONDU**

* **LEXICON RUOKTU** only this word because of its behavior in compounds, where it is normally in SgGen: ruovttu-/ruovtto-

* **LEXICON MADIDJA** máđi and cmp

* **LEXICON GENTLEMAN**  gentleman (stem mana-)

* **LEXICON DUOHKI** *duohki* and compounds, for disamb. reasons

* **LEXICON BUDEITA** Rather special word: buđeita

* **LEXICON MANNI** words on -mánni. Long/SHORT nom-compound-forms, long gen.ILL:mánnii/mánnái

* **LEXICON MANNI-INFL**

* **LEXICON OLLUVUOHTA** Exceptional vuohta-Noun

* **LEXICON LEXMUSH** derived verbs on -muš

* **LEXICON OLGU** only olgu. Short nom-compound-form, short gen. Incomplete paradigm

* **LEXICON MIEHTI** nuorta, nuorti, oarji, miehti. Short nom-compound-forms, long gen. Incomplete paradigm

* **LEXICON LULLI** lulli and davvi. Long/SHORT nom-compound-forms, long gen. Incomplete paradigm

* **LEXICON GADDI** Bisyll. V-Nouns with Comparative Forms.  Short nom-compound-forms, long gen.

* **LEXICON GADDILONG** long compound forms, short -heapme

* **LEXICON GADDILONGSHORT** NB! No SgIll and SgLoc (not directed to GOADI-, GODII- or GOAHTAI) because *davvi* is the only word this far Bisyll. V-Nouns with Comp. Forms, long-short nomcmp, long gencmp

* **LEXICON GADDISHORT** Bisyll. V-Nouns with Comparative Forms.  Short nom-compound-forms, SHORT gen.

* **LEXICON OARJI** máddi, nuorti, nuorta, oarji. Comparative Forms.  Short nom-compound-forms, long gen. Incomplete paradigms

* **LEXICON LULLILONG** long compound forms

* **LEXICON VARRA**  varra and uvdna. No -laš, to get rid of varalaš and uvnnalaš from speller

* **LEXICON LASSA**  want this without essive Px: *lassanan, *lassanat, *lassaneame

* **LEXICON AKCU**  No -heapme, no wg+Foc/han (thereby avoiding ávččuhit, ávččuhan, ávččuhat in speller) Short nom-compound-form ákčo-,long/short gen

* **LEXICON JAHKI** Bisyll. V-Nouns. Short nom-compound-forms, long gen. to avoid jahkán, jagát

* **LEXICON OAHPPA** Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen, to avoid oahppasat

* **LEXICON NPxC-OAHPPA**

* **LEXICON BLV** Bisyll. V-Nouns. Long nom-compound-forms, long gen., to avoid bálvát, Bihttánis

* **LEXICON NPx2V-BLV**

* **LEXICON NPxC-BLV**

* **LEXICON Px2V-BLV** for second person vowel stems

* **LEXICON SOABBI** Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen, to avoid SOABBÁT, gáldot, searván, laktasan

* **LEXICON NPx1V-SOABBI**

* **LEXICON NPxC-SOABBI**

* **LEXICON IVDNI** Bisyll. V-Nouns. Short nom-compound-forms, short gen. preventing ivnnát, rivgot

* **LEXICON NPx2V-IVDNI**

* **LEXICON Px2V-IVDNI** for second person vowel stems

* **LEXICON DAHKU** Like ALBMILONG Bisyll. V-Nouns. Long nom-compound-forms, long gen. Without +Sg+Nom/Gen/Acc+PxSg1 to avoid "dahkon"

* **LEXICON SADJA** Bisyll. V-Nouns. Long nom-compound-forms, long gen. TO AVOID SÁDJÁI

* **LEXICON DAHPPA** dahpa, dáhpa and dáhppa. to avoid dáhpahuvvat, dahpahuvvat etc in speller

* **LEXICON LAHKI** the words on -láhki. Because in speller we want to aviod boasttoláhkái, borranláhki etc. (borran láhkai)

* **LEXICON NPxC-LAHKI**

* **LEXICON BEARRI**  to avoid unfortunate diminutives like bearáš and salaš in speller (bearaš, sálaš) +  "beassán" = beassi+Sg+Nom/Gen/Acc+PxSg1

* **LEXICON ACTORGEAHCCI** +CmpN/SgN +CmpN/SgG +CmpN/PlG

* **LEXICON ACTORGEAHCCICT**  Actors, to avoid geahččán, jábmán, geahččát, jábmát

* **LEXICON ACTORVALDI** lexicalized actors because we have restricted verb derivation for speller. Long compound-forms, without "váldán"

2f. Actor lexicas

* **LEXICON ACTOR** +CmpN/SgN +CmpN/SgG +CmpN/PlG

* **LEXICON ACTORCT** nowadays tagged NomAg. Long compound-forms

* **LEXICON ACTOR-PL** Plurals

* **LEXICON EADDJI-NomAg** +CmpN/SgN +CmpN/SgG +CmpN/PlG  tagged NomAg. Sometimes long compound-forms

* **LEXICON ACTORLONGSHORT** +CmpN/SgN +CmpN/SgG +CmpN/PlG

* **LEXICON ACTORLONGSHORTCT-nomag** adds +NomAg

* **LEXICON ACTORLONGSHORTCT** nowadays tagged NomAg. Sometimes long compound-forms

* **LEXICON ACTORSHORT** +CmpN/SgN +CmpN/SgG +CmpN/PlG

* **LEXICON ACTORSHORTCT** nowadays tagged NomAg. Short compound-forms

+Use/NG:%> GOAHTAI ; ! Ill sublexicon     no dipth simpl

* **LEXICON BOAHTALADDAN**  Intransitiv Action nouns from deverbal verbs

* **LEXICON IHTALUDDAMAT**  ihtaluddamat, plural

* **LEXICON UPMI** action noun, from passive verb

* **LEXICON EGEZHAGAT**  reciprocals like verddežagat, jumežagat etc

* **LEXICON BUVSSAT** Pl. bisyll vow-fin. Short cmp-forms

* **LEXICON BUVSSATLONG** Pl. bisyll vow-fin. Short cmp-forms

* **LEXICON MUODUT** muođut only, plural

* **LEXICON DEAHKIT** like AIGI but plural only

* **LEXICON DIEDUT** like ALBMI but plural only

* **LEXICON BORALMASAT** like JOHTOLAT but plural only

* **LEXICON DURVAT** like LASIS but pl. only

Trisyllabic nouns

* **LEXICON MATTAR** Short compound-forms Tris. Anim. Gradating C-Nouns

* **LEXICON MALIS** Short compound-forms Tris. Inanim. Gradating C-Nouns

* **LEXICON MALIS_CGforms**  Long compound-forms Tris. Inanim. Gradating C-Nouns

* **LEXICON MALISLONG**  Long compound-forms Tris. Inanim. Gradating C-Nouns

* **LEXICON MALISLONGSHORT**  Long and short compound-forms. Tris. Inanim. Gradating C-Nouns

* **LEXICON BEANA** Short compound-forms. Trisyll. Anim. Gradating 0-Nouns

* **LEXICON SEAMU** Short compound-forms. Trisyll. Inanim. Gradating 0-Nouns

* **LEXICON SEAMU_CGforms** Short compound-forms. Trisyll. Inanim. Gradating 0-Nouns

* **LEXICON SEAMULONG** Long compound-forms. Trisyll. Inanim. Gradating 0-Nouns

* **LEXICON GAHPIR** Short compound-forms. Trisyll. Non-Gradating C-Nouns

* **LEXICON GAHPIRLONGSHORT** Long and short compound-forms. Trisyll. Non-Gradating C-Nouns

* **LEXICON GAHPIRLONG** Long compound-forms. Trisyll. Non-Gradating C-Nouns

Trisyllabic nouns

* **LEXICON EANA** eana, eanan, eatnan

* **LEXICON DOAVTTIR** only doavttir. Short compound-forms

* **LEXICON OVCCIS_N**  Collective numerals gallis, moattes, moattis, máŋggas

* **LEXICON DAIVVAS** Tris. Gradating C-Nouns, The Troms declension: dáivvaš:dáivaha, bearaš:bearraha, njunuš:njunnoha

* **LEXICON BOADA** Short compound-forms. Trisyll. Inanim. Gradating 0-Nouns  TO AVOID BOAĐAN

* **LEXICON DAHPPAGA**  the dáhpahuvvá fix nr2. to avoid dahpahuvvat in speller

* **LEXICON ENGEL** Restricted denominals for speller   -eŋgel

* **LEXICON MAGASH** reciprocals like verddežat, jumežat etc

* **LEXICON BADJOSAT** Pl. bajus:badjosat, short cmp-form

* **LEXICON BADJOSATLONG** Pl. bajus:badjosat, long cmp-form

* **LEXICON ALIMAT** Pl. alin:alimat, like GAHPIR but pl only

* **LEXICON CEAKCAGAT** Like seamu but plural only

* **LEXICON VUOIGNAHAT** LikeDAIVVAS but only Pl. vuoiŋŋaš:vuoigŋahat

* **LEXICON EAMOSH** váikkuheamoš, deverbals

* **LEXICON AMOSH** váikkuhamoš, deverbals

* **LEXICON BOAHTINLONGSHORT**  Intransitiv action nouns from bisyll verbs, long and short cmp-form

* **LEXICON BOAHTIN**  Intransitiv action nouns from bisyll verbs, long cmp-form

* **LEXICON PRE_BOAHTIN**  Intransitiv action nouns from bisyll verbs, long cmp-form

* **LEXICON BOAHTINsemact**  adds Sem/Act

* **LEXICON BOAHTINSHORT** Intransitiv action nouns from bisyll verbs, short cmp-form

* **LEXICON IHTAMAT** Plural action nouns, from bisyllabic verbs

* **LEXICON LEXDIMINC** diminutives, these comes from noun stems file, from trisyll nouns

Contracted nouns

* **LEXICON BOAZU** Anim. Contracted 0-Nouns. Short compound-forms.

* **LEXICON SUOLU** Inanim. Contracted 0-Nouns. Short compound-forms.

* **LEXICON SUOLULONG** Inanim. Contracted 0-Nouns. Long compound-forms.

* **LEXICON FALIS** Contracted Anim. C-Nouns.  Short compound-forms.

* **LEXICON LASIS** Contracted Inanim. C-Nouns.  Short compound-forms.

Contracted nouns

* **LEXICON GISTTA** The Noun gistta, gist -

* **LEXICON CEAHKES** only -ceahkes

* **LEXICON ALLGUOVT** guovttos guovttis

* **LEXICON GUOVTTIS_N**  only -guovttis

* **LEXICON GUOVTTU** only -guovttos

* **LEXICON GIRKOSADDOT** LIKE SATTU but pl, only

# Sublexica for nominal stems

## Declension

### Noun declension

* **LEXICON GOAHTI-NE** Bisyll. V-Nouns; Nominative Sg. and Essive

* **LEXICON NomV**

* **LEXICON EssV**

* **LEXICON GOAHTI-OBL**

* **LEXICON GOAHTI-IU-OBL**

## Px lexica

* **LEXICON NPx3Vflag**

* **LEXICON NPx3Vvowchflag**

* **LEXICON NPx12A** For loan word ending -a

* **LEXICON NPx3A** For loan word ending -a

* **LEXICON NPxA** For loan word ending -a

* **LEXICON NPxPlComC**

* **LEXICON NPxVvowch** for vowel stems, with X2, X1 with stem vowel change,

* **LEXICON NPx12Vvowch** for vowel stems, with X2, X1 with stem vowel change, 1. and 2. p

* **LEXICON NPx1Vvowch** for vowel stems, with X2, X1 with stem vowel change, 1. p

* **LEXICON NPx3Vvowch** for vowel stems, with X2, X1 with stem vowel change,  3. pers

* **LEXICON NPxV**

* **LEXICON NPx1V**

* **LEXICON NPx2V**

* **LEXICON NPx3V**

* **LEXICON NPxC**

* **LEXICON NPx1C**

* **LEXICON NPx12C**

* **LEXICON NPx3C**

* **LEXICON NPxPlComV1**

## Some GOAHTE-type lexica...

* **LEXICON GOAHTE-** compound lexicon

* **LEXICON GOAHTICMP** compound lexicon, vowel shortening

* **LEXICON GOAHTILONGCMP** compound lexicon, no vowel shortening

* **LEXICON GOAHTILONGSHORTCMP** compound lexicon, with and without vowel shortening

* **LEXICON GOADE-** genitiv

* **LEXICON GOADE-IU-** genitiv

* **LEXICON GOAHTA-** Lexicon for giving Px 1. and 2. p., pluss illativ

* **LEXICON GOAHTAI** illative

* **LEXICON GOADI-** weak grade

* **LEXICON GOADI-_notCmp**

* **LEXICON GODII-** diphthong simplification

* **LEXICON GOADA-**

## Other lexica

* **LEXICON STAHTACASE** for no cons grad

* **LEXICON EGEZHAHKII**

* **LEXICON MALIS0** as GAPPUS0. MALIS0 has no VUOHTA, GAPPUS0 has no Px Ess

* **LEXICON MALLAS-**

* **LEXICON MALLASI-/NUORABU-** joint cont. lexicon

* **LEXICON MALLASI-/NUORABUj-** joint cont. lexicon

* **LEXICON MUSHcase** Deverbal nouns

* **LEXICON MUSSHA**

* **LEXICON EAMOSHcase**  Deverbal nouns

* **LEXICON AMOSHcase**

* **LEXICON BOAHTINcase**  Long compound-forms

* **LEXICON BOAHTINLONGSHORTTV**  Transitiv Action nouns. Both long and short compound forms

* **LEXICON BOAHTINLONGSHORTTVcase** +CmpN/Sg +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON BOAHTINTV**  Transitiv Action nouns. Long compound forms

* **LEXICON BOAHTINTVcase** +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON BOAHTINTVCT**

* **LEXICON BOAHTINSHORTTV**  Transitiv Action nouns. Short compound forms

* **LEXICON BOAHTINSHORTTVcase** +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON BOAHTINSHORTTVCT**

* **LEXICON BOAHTALADDANTV**  Transitiv Action nouns from deverbal verbs

* **LEXICON BOAHTALADDANTVcase** +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON BOAHTALADDANTVCT**

* **LEXICON FALLA-**

* **LEXICON BOAZU-NE**

* **LEXICON BOHCCO**

* **LEXICON BOHCCU**

* **LEXICON KEAHTTA** Derivation keahttá/keahtes

* **LEXICON KEAHTTA-PRED** Der/keahtta - only predforms

* **LEXICON DIMINC** diminutives, these comes from noun affix file,  from trisyll nouns

* **LEXICON GUOVDDAZI-** joint cont. lexicon

* **LEXICON JOHTOLAT0**

* **LEXICON JOHTOLAHKA-**

* **LEXICON DenominalNounsV** diminutives from bisyllabic nouns

* **LEXICON DenominalNounsC** diminutives from trisyllabic nouns

* **LEXICON MUITTASJEAPMI** action noun, from trisyll intransitive verb

* **LEXICON EAPMITV** +CmpN/Sg +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON EAPMITVCT** action noun, from bisyll transitive verb

* **LEXICON EAPMITVCTcase**

* **LEXICON MUITTASJEAPMITV** +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON MUITTASJEAPMITVCT** action noun, from trisyll intransitive verb

* **LEXICON VUONAT** +CmpN/SgN +CmpN/SgG +CmpN/PlG

* **LEXICON VUONATCT** derivated nouns, from propers: guovdageainnut, divttasvuonat etc.

* **LEXICON ACTORder** +CmpN/SgN +CmpN/SgG +CmpN/PlG

* **LEXICON ACTORderCT** Tagged NomAg nowadays, Long compound-forms, from intransitive verbs

* **LEXICON ACTORderCTcase** Tagged NomAg nowadays, Long compound-forms, from intransitive verbs

+Use/NG: GOAHTAI ; ! Ill sublexicon

* **LEXICON ACTORTVder** +CmpN/SgN +CmpN/SgG +CmpN/PlG +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

* **LEXICON ACTORTVderCT** Tagged NomAg nowadays, Long compound-forms, from transitive verbs

* **LEXICON ACTORSHORTTVder** Tagged NomAg nowadays, Short compound-forms, from transitive verbs

* **LEXICON DIMINV** diminutives, these comes from bisyll nouns

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/nouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/nouns.lexc)</small>

---


# North Saami numerals

* **LEXICON OKTA** Case forms of the basic digits

* **LEXICON BEALOKTA** Case forms of the basic digits, only sg

* **LEXICON BARE-LOHKAI**

* **LEXICON OKTANUPPELOHKAI**

* **LEXICON BEALOKTANUPPELOHKAI** only sg

* **LEXICON OKTAGOALMMATLOHKAI**

* **LEXICON OKTANJEALJATLOHKAI**

* **LEXICON OKTAVIDATLOHKAI**

* **LEXICON OKTAGUDATLOHKAI**

* **LEXICON OKTACIHCCETLOHKAI**

* **LEXICON OKTAGAVCCATLOHKAI**

* **LEXICON OKTAOVCCATLOHKAI**

* **LEXICON OKTALOGATLOHKAI**

* **LEXICON OKTALOHKI**

* **LEXICON GUOKTE**

* **LEXICON GUOKTE-pure** Case forms of the basic digits

* **LEXICON BEALGUOKTE**

* **LEXICON BEALGUOKTE-pure** Case forms of the basic digits, only sg

* **LEXICON GUOKTENUPPELOHKAI**

* **LEXICON BEALGUOKTENUPPELOHKAI**, only sg

* **LEXICON GUOKTEGOALMMATLOHKAI**

* **LEXICON GUOKTENJEALJATLOHKAI**

* **LEXICON GUOKTEVIDATLOHKAI**

* **LEXICON GUOKTEGUDATLOHKAI**

* **LEXICON GUOKTECIHCCETLOHKAI**

* **LEXICON GUOKTEGAVCCATLOHKAI**

* **LEXICON GUOKTEOVCCATLOHKAI**

* **LEXICON GUOKTELOGATLOHKAI**

* **LEXICON GUOKTELOGI**

* **LEXICON NUBBENUPPELOHKAI**

* **LEXICON NUBBEGOALMMATLOHKAI**

* **LEXICON NUBBENJEALJATLOHKAI**

* **LEXICON NUBBEVIDATLOHKAI**

* **LEXICON NUBBEGUDATLOHKAI**

* **LEXICON NUBBECIHCCETLOHKAI**

* **LEXICON NUBBEGAVCCATLOHKAI**

* **LEXICON NUBBEOVCCATLOHKAI**

* **LEXICON NUBBELOGATLOHKAI**

* **LEXICON NUBBELOGI**

* **LEXICON GOLBMA**  Case forms of the basic digits

* **LEXICON BEALGOLBMA**  Case forms of the basic digits, only sg

* **LEXICON NOLLA**  Case forms of nolla/nulla, as GOLBMA, but only Sg, no Cmp

* **LEXICON GOLBMANUPPELOHKAI**

* **LEXICON GOLBMAGOALMMATLOHKAI**

* **LEXICON GOLBMANJEALJATLOHKAI**

* **LEXICON GOLBMAVIDATLOHKAI**

* **LEXICON GOLBMAGUDATLOHKAI**

* **LEXICON GOLBMACIHCCETLOHKAI**

* **LEXICON GOLBMAGAVCCATLOHKAI**

* **LEXICON GOLBMAOVCCATLOHKAI**

* **LEXICON GOLBMALOGATLOHKAI**

* **LEXICON GOLBMALOGI**

* **LEXICON VIHTTA** Case forms of the basic digits

* **LEXICON BEALVIHTTA** Case forms of the basic digits, only sg

* **LEXICON VIHTTANUPPELOHKAI**

* **LEXICON VIHTTAGOALMMATLOHKAI**

* **LEXICON VIHTTANJEALJATLOHKAI**

* **LEXICON VIHTTAVIDATLOHKAI**

* **LEXICON VIHTTAGUDATLOHKAI**

* **LEXICON VIHTTACIHCCETLOHKAI**

* **LEXICON VIHTTAGAVCCATLOHKAI**

* **LEXICON VIHTTAOVCCATLOHKAI**

* **LEXICON VIHTTALOGATLOHKAI**

* **LEXICON VIHTTALOGI**

* **LEXICON CIEZA** Case forms of the basic digits

* **LEXICON BEALCIEZA** Case forms of the basic digits, only sg

* **LEXICON CIEZANUPPELOHKAI**

* **LEXICON CIEZAGOALMMATLOHKAI**

* **LEXICON CIEZANJEALJATLOHKAI**

* **LEXICON CIEZAVIDATLOHKAI**

* **LEXICON CIEZAGUDATLOHKAI**

* **LEXICON CIEZACIHCCETLOHKAI**

* **LEXICON CIEZAGAVCCATLOHKAI**

* **LEXICON CIEZAOVCCATLOHKAI**

* **LEXICON CIEZALOGATLOHKAI**

* **LEXICON CIEZALOGI**

* **LEXICON GAVCCI** Case forms of the basic digits

* **LEXICON BEALGAVCCI** Case forms of the basic digits, only sg

* **LEXICON GAVCCINUPPELOHKAI**

* **LEXICON GAVCCIGOALMMATLOHKAI**

* **LEXICON GAVCCINJEALJATLOHKAI**

* **LEXICON GAVCCIVIDATLOHKAI**

* **LEXICON GAVCCIGUDATLOHKAI**

* **LEXICON GAVCCICIHCCETLOHKAI**

* **LEXICON GAVCCIGAVCCATLOHKAI**

* **LEXICON GAVCCIOVCCATLOHKAI**

* **LEXICON GAVCCILOGATLOHKAI**

* **LEXICON GAVCCILOGI**

* **LEXICON LOGI**

* **LEXICON BEALLOGI** only sg

* **LEXICON CUODICASE**

* **LEXICON OKTACUOHTI**

* **LEXICON GUOKTECUODI**

* **LEXICON NUBBECUOHTI**

* **LEXICON GOLBMACUODI**

* **LEXICON VIHTTACUODI**

* **LEXICON CIEZACUODI**

* **LEXICON GAVCCICUODI**

* **LEXICON DUHAHAT**

* **LEXICON DUHATCASE**

* **LEXICON OKTADUHAT**

* **LEXICON GUOKTEDUHAT**

* **LEXICON NUBBEDUHAT**

* **LEXICON GOLBMADUHAT**

* **LEXICON VIHTTADUHAT**

* **LEXICON CIEZADUHAT**

* **LEXICON GAVCCIDUHAT**

* **LEXICON CIEZAS_N**  Collective numerals

* **LEXICON VIDAS_N**  Collective numerals

* **LEXICON BEANNOT** one and a half

* **LEXICON ARABICCASES**  adds +Arab

* **LEXICON ARABICCASE**  adds +Arab

* **LEXICON ARABICCASE0**  adds +Arab

* **LEXICON DIGITCASES**  to distinguish between 0 and oblique

* **LEXICON DIGITCASE0**

* **LEXICON DIGITCASE**

* **LEXICON ARABICCASEORD** ordinals

* **LEXICON ARABICCASEORD-ERR** ordinal inflection when preceded
by .:, and with reduced case forms. The Err/Orth tag is added in the calling lexicon.

* **LEXICON ARABICCASECOLL** collectives

* **LEXICON ROMNUMTAGOBL**

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/numerals.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/numerals.lexc)</small>

---

Divvun & Giellatekno - open source grammars for Sámi and other languages

# North Saami Possessive suffixes

* **LEXICON PxVvowch** for vowel stems, with X2, X1 with stem vowel change

* **LEXICON Px1Vvowch** for vowel stems with stem vowel change, 1. p

* **LEXICON Px2Vvowch** for vowel stems with stem vowel change, 1. and 2. p

* **LEXICON Px3Vvowch** for vowel stems with stem vowel change, 3. p

* **LEXICON PxV** for vowel stems, without stem vowel change

* **LEXICON Px1V** for first person vowel stems

* **LEXICON Px2V** for second person vowel stems

* **LEXICON Px3V** for third person vowel stems

* **LEXICON PxA** for a-stems

* **LEXICON Px1A** for a-stems

* **LEXICON Px2A** for a-stems

* **LEXICON Px3A** for a-stems

* **LEXICON PxC** for consonant stems

* **LEXICON Px1C** for consonant stems

* **LEXICON Px2C** for consonant stems

* **LEXICON Px3C** for consonant stems

* **LEXICON PxPlComC** for plural comitative forms of consonant stems

* **LEXICON PxPlComV1** for first person vowel stems with vow change, directing onw

* **LEXICON PxPlCom12V** for first, second person comitative Px

* **LEXICON PxPlCom3V** for third person comitative Px

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/possessive-suffixes.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/possessive-suffixes.lexc)</small>

---



* **LEXICON GALLE** Case forms of galle

* **LEXICON MANGA**  Case forms of máŋga

some multiword prons, according to Nickel

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/pronouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/pronouns.lexc)</small>

---



Different lexicon for female persons and place names.

Different lexicon for personal surnames. Blind

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/propernouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/propernouns.lexc)</small>

---


# Symbol affixes

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/symbols.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/symbols.lexc)</small>

---

Divvun & Giellatekno - open source grammars for Sámi and other languages

# Verb conjugation

## Basic lexica for bisyllabic verbs

### Modals

These are treated separately because
modals do not participate in derivation

* **LEXICON GALGA_IV** only dáidit, galgat

* **LEXICON FERTE_IV**  only fertet and bállet

### Ordinary bisyllabic verbs

* **LEXICON DIEHTI_TV** Bisyllabic i-verbs with Personal Passive

* **LEXICON BORRA_TV** Bisyllabic a- and u-verbs with Personal Passive

* **LEXICON BOAHTI_IV**  Bisyllabic i-verbs without Personal Passive but with Der/NomAg

* **LEXICON DIEVVA_IV**  Bisyllabic a- and u-verbs without Personal Passive but with Der/NomAg

### Bisyllabic verbs

* **LEXICON DEAKCU_TV** as BORRA for u-verbs with dim -astit, and a-verbs with dim -istit that are hardcoded

* **LEXICON BOAZZU_IV** as DIEVVA_IV for u-verbs with dim -astit, and a-verbs with dim -istit that are hardcoded

* **LEXICON BINDU_IV** as DIEVVA (but without short passive) for u-verbs with dim -astit, that are hardcoded

* **LEXICON DAHTU_TV**  As diehti, but -ut verbs, thus without short passive

* **LEXICON BOLTU_TV**  As DAHTU_TV but with dim -astit that are harcoded

* **LEXICON ALLU_IV**  -ut verbs, thus without short passive

* **LEXICON DIEHTALADDA_TV** Already derived words (except words ending -uššat and -httit) - no deverbal verbs

* **LEXICON LAIGOHADDA_TV** láigohaddat. No deverbal nouns for speller reasons. No +Imprt+Pl2: láigohaddit

* **LEXICON HAHTTIT_TV** Four-syll kausatives on -httit

* **LEXICON BOAHTALADDA_IV** Already derived words (except words ending -uššat)

* **LEXICON RAIMMAHALLA_IV** passives on -hallat and INCHOATIVES on -stuvvat

* **LEXICON UVVA_IV** passives -uvvat

* **LEXICON UVVA_IV_NO_ErrOrth_uvvot** passives -uvvat, with no possible -uvvot derived from -it

* **LEXICON SMUVVA_IV** passives -snuvvat, -smuvvat

* **LEXICON DOAROSTUVVA_TV** INCHOATIVES on -stuvvat

* **LEXICON MAHTALADDA_TV** Bisyllabic Already derived words (except words ending -uššat) without Personal Passive but with Acc obj

* **LEXICON ARVI_IV** Bisyllabic Impersonal Verbs

* **LEXICON ARVALADDA_IV** Already derived words (except words ending -uššat)

* **LEXICON MASSI_TV** No Der/NomAg (for speller reasons). Bisyllabic i-verbs with Personal Passive. Otherwise like DIEHTI_TV

* **LEXICON VALDI_TV**  No Der/NomAg (for speller reasons). Bisyllabic i-verbs with Personal Passive. No VGen. Otherwise like DIEHTI_TV

* **LEXICON ASTA_TV** No Der/NomAg (for speller reasons). Bisyllabic a- and u-verbs with Personal Passive. Otherwise like BORRA_TV

* **LEXICON BORGI_IV**  Bisyllabic i-verbs without Personal Passive but without Der/NomAg. No Der/NomAg for speller reasons. Otherwise like BOAHTI_IV

* **LEXICON BEALLJA_IV** No Der/NomAg for speller reasons. Bisyllabic a- and u-verbs without Personal Passive but without Der/NomAg. Otherwise like DIEVVA_IV

* **LEXICON DAVGU_TV**  As DAHTU_TV, No Der/NomAg for speller reasons.

* **LEXICON LEABBU_TV** No Der/NomAg (for speller reasons)- otherwise like DEAKCU_TV

* **LEXICON ALBMU_TV** No Der/NomAg (for speller reasons). As BOLTU_TV otherwise

* **LEXICON BARGU_IV**  no Der/NomAg for speller reasons- Like ALLU_IV

* **LEXICON BORSU_IV** as BINDU. No Der/NomAg

* **LEXICON MUHTTI_TV** No deverbal nouns an ACTIO(for speller reasons). Bisyllabic i-verbs with Personal Passive

* **LEXICON BEAHTTI_TV** Bisyllabic i-verbs with Personal Passive, no Der/alla, no Der/adda, Der/halla  (beahtáhallat, báinnáhallat) for speller

* **LEXICON FAHTE_TV** Contracted Verbs with Personal Passive,  no Der/alla, no Der/adda, Der/halla  (fáhtehallin) for speller

* **LEXICON GILVI_TV** only gilvit, to get rid of gilvohallat (for speller reasons).

* **LEXICON FAHTI_TV** (for speller reasons). no fáhttet (fáhtit+V+TV+Imprt+Pl2) because it get mixed up with fáhtet. No deverbal nouns.

* **LEXICON DAHKA_TV** Like BORRA_TV, but without	dahkat+V+TV+Imprt+Sg1, to get rid of dahkon (for speller reasons)

* **LEXICON FALLA_TV** fállat, njoarrat,  to get rid of fálastallat, njoarastallat (for speller reasons).

* **LEXICON OAHPPA_TV** only oahppat. Like BORRA but without Deverbal verb -stuvva (for speller reasons)

* **LEXICON AKTI_IV**  Bisyllabic i-verbs without Personal Passive but with Der/NomAg - for speller reasons, to prevent:

* **LEXICON GUHKKA_IV** No Imprt+Pl2 on -it, no Imprt+ConNegII and No +Der/NomAg for speller reasons. No Deverbal Verbs either. Bisyllabic a- and u-verbs without Personal Passive

* **LEXICON BARDNA_IV** "bárdnat" ----> potensialis removed; bártnažan, bártnažat, bártnaš, bártnaža. No Der/NomAg for speller reasons. Bisyllabic a- and u-verbs without Personal Passive but without Der/NomAg. Otherwise like DIEVVA_IV

* **LEXICON DUSSA_IV**  Bisyllabic a- and u-verbs without Passive and Der/NomAg, get rid of duššo

* **LEXICON DIEHTISHORT_TV** Short action noun compound-form: neasken-

* **LEXICON DIEHTILONGSHORT_TV** Long and short action noun compound-form, savdnjen-/savdnjin-

* **LEXICON BAHCCI_TV** bahčit. Long and short actio compound-form. No NomAg (Actor) compound, for speller reasons

* **LEXICON BOAHTILONGSHORT_IV** Long and short action noun compound-form

* **LEXICON MAHTI_TV**  Bisyllabic Verbs without Personal Passive but with Acc obj.

## Intermediate lexica for even-syllable verbs

* **LEXICON GOAHTICnj**  for speller reasons to hinder -goahttit, whick is confused with infinitive -goahtit

* **LEXICON RAIMMAHALLACnj**  restricted imperatives

## Basic lexica for contracted verbs

* **LEXICON GILLE_IV**  Contracted Verbs without Personal Passive

* **LEXICON DOHPPE_TV** Contracted Verbs with Personal Passive

###  BAsic lexica for Contracted verbs

* **LEXICON CIRRO_IV**  Inchoatives and essives on -á, -o, -e without Personal Passive

* **LEXICON MUITA_TV**  Inchoatives and essives on -á, -o, -e with Personal Passive

* **LEXICON COHKKA_IV**  Contracted Verbs without Personal Passive - no stit-deverbal

* **LEXICON GARRE_TV**  garret, loget. with Personal Passive. for speller to hinder garrenávnnas, garrenoaivi etc

* **LEXICON ORRO_IV**  orrot. for speller to hinder orronsadji etc

* **LEXICON MAHTA_TV** Contracted Verbs without Personal Passive but with Acc obj.

## Basic lexica for trisyllabic verbs

* **LEXICON MUITAL_TV** Trisyllabic Verbs with Personal Passive

* **LEXICON ALIST_IV** Trisyllabic Verbs without Personal Passive

###  Basic lexica for trisyllabic verbs

* **LEXICON COASKKIT_IV**  Trisyllabic impersonals

* **LEXICON ARVVASJ_IV** impersonals ending -šit, -skit, smit, -idit, -ldit, -git and 5-syllables

* **LEXICON ARVIL_IV** Impersonal Trisyllabic Verbs ending -lit

* **LEXICON MUITTASJ_TV** Words ending -šit, -skit, -ldit - Reciprocals on -dit, Momentatives on -dit, -ádit, -ihit, -e7hit, Frequentatives on -(u)hit, Continuatives on -nit, Inchoatives on -nit

* **LEXICON HALIID_TV** Words ending -smit, -idit, -git

* **LEXICON BONJAT_TV** Cont/Freq on -dit, Continuatives on -(u)hit, Reciprocals, momentatives and frequentatives ending -alit

* **LEXICON VUORDIL_TV** Trisyllabic Verbs ending -lit, -rit with Personal Passive

* **LEXICON BEAGASJ_IV** Words ending -šit, -skit -ldit, essive derivates on -hit -. !Reciprocals on -dit. Momentatives on -dit, -ádit, -ihit, -e7hit. Frequentatives on -(u)hit. Continuatives on -nit. Inchoatives in -nit

* **LEXICON JORGGIID_IV** Words ending -smit, -idit, -git -

* **LEXICON HURAI_IV** Words ending -aidit

* **LEXICON BALAT_IV** !Cont/Freq on -dit, Continuatives on -(u)hit, Reciprocals, momentatives and frequentatives ending -alit

* **LEXICON SUOTNJAL_IV** Trisyllabic Verbs ending -lit, -rit without Personal Passive

* **LEXICON BOTNJAS_IV** Trisyllabic Verbs ending -sit without Personal Passive

* **LEXICON LASSAN_IV** Trisyllabic Verbs ending -nit without Personal Passive IV

* **LEXICON OAHPAHIT_TV** only oahpahit, disamb reasons?

* **LEXICON NUOSKIT_IV** only nuoskidit, for speller, no action noun nuoskideapmi

* **LEXICON HALIHIT_TV** Like MUITTASJ_TV, without COnNeg so we dont get hálit

* **LEXICON LAHKAN_TV** lahkanit, lahkonit, are nowadays used transitively

* **LEXICON GEAGAT_TV**  Trisyllabic Verbs without Personal Passive but with Acc obj.

* **LEXICON BUOVVAL_TV**  buovvalit, guoigalit. Trisyllabic Verbs ending -lit without Personal Passive but with Acc obj.

* **LEXICON MUITALCnj** Substems for Consonantal Verb Stems

* **LEXICON HURAICnj** Substems for  Words ending -aidit

## Finite declension

## Present tense

### Vocalic stems

* **LEXICON PotPrsV** Present Tense in Vocalic Verb Stems

* **LEXICON PrsV** Present Tense in Vocalic Verb Stems

* **LEXICON PrsV1** Present Tense Endings for Vocalic Verb Stems

* **LEXICON PrsV2** Present Tense Endings for Vocalic Verb Stems

* **LEXICON PrsV3** Present Tense Endings for Vocalic Verb Stems

* **LEXICON PrsV4** Present Tense Endings for Vocalic Verb Stems

* **LEXICON PrsV5** Present Tense Endings for Vocalic Verb Stems

### Consonantal stems

* **LEXICON PotC** Present Tense in Consonantal Verb Stems

* **LEXICON PrsC** Present Tense in Consonantal Verb Stems

* **LEXICON PrsC1** Present Tense in Contr/Non-Contr Consonantal Verb Stems

* **LEXICON PotC2** Potential in Non-Contracted Consonantal Verb Stems

* **LEXICON PrsC2** Present Tense in Non-Contracted Consonantal Verb Stems

## Past tense

### Vocalic stems

* **LEXICON PrtV** Preterite Endings for Vocalic Verb Stems

* **LEXICON PrtV1** Preterite Endings for Vocalic Weak Grade Verb Stems

* **LEXICON PrtV2** Preterite Endings for Vocalic Strong Grade Verb Stems

### Consonantal stems

* **LEXICON PrtC** Preterite Endings for Consonantal Verb Stems

* **LEXICON PrtC1** Preterite Endings for Consonantal Contr./Non-Contr. Verb Stems

* **LEXICON PrtC2** Preterite Endings for Consonantal Non-Contr. Verb Stems

* **LEXICON PrtC3** Preterite Endings for Consonantal Contr./Non-Contr. Verb Stems

## Imperative mood

* **LEXICON ImprtVA**  Imperative Forms for Vocalic Verb Stems

* **LEXICON ImprtVB**  Imperative Forms for Vocalic Verb Stems

* **LEXICON ImprtV1**  Imperative Forms for Vocalic Verb Stems

* **LEXICON ImprtV2** Imperative Forms for Vocalic Verb Stems and Substems

* **LEXICON ImprtSg2** Imperative Forms For Consonantal and Contracted Verb Stems

* **LEXICON ImprtC**  Imperative Substems for Consonantal Verb Stems - uneven syll.

* **LEXICON ImprtC2**  Imperative Substems for Consonantal Verb Stems - contracts

# Infinite forms

## V- and C-final

* **LEXICON NominalFormsV**  Vowel-final stems

## Continuation lex

* **LEXICON NominalFormsVC**  for vowel final

* **LEXICON NominalFormsV1**   infinitiv, actio

* **LEXICON NominalFormsV2**  gerund, verbgenitiv, verbabessive

* **LEXICON NominalFormsV3**  ^NG^ gerund

* **LEXICON NominalFormsV4**  perfect participe, preterite negation form

* **LEXICON NominalFormsV5**  negation form

* **LEXICON NominalFormsV6** presence participe

* **LEXICON NominalFormsV8**  gerund, verbabessive

* **LEXICON NominalFormsV9**  supine

* **LEXICON NominalFormsC1**  for cons final stems: infinitive, supine, actio, gerund, perfect participe, preterite negation form

* **LEXICON NominalFormsC2**  for cons final stems: presence participe

# Derivation

* **LEXICON DeverbalNounsC**

* **LEXICON DeverbalNounsCTV**

* **LEXICON DeverbalNounsBOAHTI**

* **LEXICON DeverbalNounsRAIMMAHALLA** no NomAg/actor

* **LEXICON DeverbalNounsBOAHTALADDA**

* **LEXICON DeverbalNounsDIEHTALADDA**

* **LEXICON DeverbalNounsDIEHTI**

* **LEXICON DeverbalNounsDIEHTISHORT**

* **LEXICON DeverbalNounsDIEHTILONGSHORT**

* **LEXICON DeverbalNounsBAHCCI**

* **LEXICON DeverbalNounsDOHPPE-**

* **LEXICON DeverbalNounsGARRE-**

* **LEXICON DeverbalNounsCIRRO-**

* **LEXICON DeverbalNounsORRO-**

* **LEXICON DeverbalNounsCIRROTV-**

* **LEXICON DeverbalNounsDOHPPEJ**

* **LEXICON DeverbalNounsDOHPPEJTV**

* **LEXICON DeverbalNounsMUITALTV**

* **LEXICON DeverbalNounsMUITTASJTV**

* **LEXICON DeverbalNounsMUITAL**

* **LEXICON DeverbalNounsNUOSKIT**

* **LEXICON DeverbalNounsMUITTASJ**

* **LEXICON DeverbalVerbsBOAHTI**

* **LEXICON DeverbalVerbsDIEVVA**

* **LEXICON DeverbalVerbsBINDU**

* **LEXICON DeverbalVerbsBORRA**

* **LEXICON DeverbalVerbsFALLA**

* **LEXICON DeverbalVerbsBOLTU**

* **LEXICON DeverbalVerbsDIEHTI**

* **LEXICON DeverbalVerbsBEAHTTI**

* **LEXICON DeverbalVerbsARVI**

* **LEXICON DeverbalVerbsDOHPPE**

* **LEXICON DeverbalVerbsFAHTE**

* **LEXICON DeverbalVerbsGILLE**

* **LEXICON DeverbalVerbsCOHKKA**

* **LEXICON DeverbalVerbsBORGE**

* **LEXICON DeverbalVerbsMUITAL**

* **LEXICON DeverbalVerbsVUORDIL**

* **LEXICON DeverbalVerbsALIST**

* **LEXICON DeverbalVerbsSUOTNJAL**

* **LEXICON DeverbalVerbsBOTNJAS**

* **LEXICON DeverbalVerbsLASSAN**

* **LEXICON DeverbalVerbsCOASKKIT**

* **LEXICON DeverbalVerbsARVIL**

* LEXICON VGEN flag for VGen

* * *

<small>This (part of) documentation was generated from [src/fst/affixes/verbs.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/affixes/verbs.lexc)</small>

---

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

<small>This (part of) documentation was generated from [src/fst/clitics.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/clitics.lexc)</small>

---

Divvun & Giellatekno - open source grammars for Sámi and other languages

#                    North Sámi compounding

This file governs prefixing and compounding, with the following lexica and pointers. All lexica and lexicon entries are documented.

**LEXICON Prefixes** = lexicon for adding *eahpe and pointing to **N, A, V**

**LEXICON R** = lexicon which is pointed to from affixes files. Here the strings get flags to control compounding (*@P.CmpFrst.FALSE@* etc.) and are redirected to **RAlmostReal**.

**LEXICON RAlmostReal** = lexicon pointed to from R (where flags are added) and pointing to **RrealAfterCmpNFlags** and (with **+Cmp** tag) to **MiddleNouns**.
lexicalising the 3-part compounds, with the tag ShCmp. It has two entries:
* Just pointing directly to *RrealAfterCmpNFlags*
* Adding **+Cmp#:∑# and pointing to **MiddleNouns**.
These nouns should not return to themselves, to avoid -jotjotjot-
They thus point directly to Rreal.

**LEXICON Rreal** = This is the former R lexicon, renamed to avoid the MiddleNouns loop. The string gets flags like for R, and directed to **RrealAfterCmpNFlags**.
* @P.CmpFrst.FALSE@ and other flags to control compounding

**LEXICON RrealAfterCmpNFlags** = This was also part of the former R lexicon, here renamed to avoid the MiddleNouns loop. Here it gets flags ensuring the result is N+N.
* N+N is the normal case.
* N+(V to N) ensured by Flag diacr restricting to V>N.
* N+(A to N) A needs a N tag later in the derivation
* Then 3 cases (points to N, V, A)  add a hyphen, so
Sem-julggaštus and maana-gåetie
are allowed.
* Then 3 cases (to N, V, A) add a SOFT hyphen, to
make it possible to analyse certain texts
from printing houses and newspapers.
* to Acronym,  maana-tv, "lomme-cd-spelar"
* to CmpNumeral, maana-123
* to ProperNoun, as the 2nd part of compounds for non-hyph.
words. viessu-London goes through here.
* To words requiring hyphens, like -tv- and -cd-
* To ENDLEX, to take care of Oahppo- ja dutkandept

**LEXICON RHyph** =  Recursive lexicon from all classes REQUIRING a hyphen to follow.
* Add Flags to control compounding, go to RHyphTags

**LEXICON RHyphTags** = adds +Cmp/Hyph and +Cmp, and then - on lower side.
* To Noun, the normal case.
* To HyphNouns, for nouns requiring hyphens, like -tv- and -cd-
* To Verb via flag diacr declares that the compound
* To A,  needs a N tag later in the derivation
* To Acronym, like  maana-tv, "lomme-cd-spelar"
* to CmpNumeral,  NRK-2 etc.
* Proper nouns as the 2nd part of compounds for hyph-words.
London-Hull is covered here, whereas Hull-viessu
is covered by RHyph + Noun.
* To ENDLEX to take care of Oahpo- ja dutkandept - want this in speller

**LEXICON RNum** =  For Num Cmp Noun, vi vil ikke ha Num Cmp Num
* Gives  +Cmp/Hyph+Cmp and points to Noun

**LEXICON Rnoun** = the lexicon has two entries: 
* either adds > and goes to the compound lexicon Rreal
* or goes to ENDLEX as *Kárášjot*, independent (sub) word, with *+Err/Orth*

**LEXICON RProp** = lexicon pointed to from propernouns, and containing 3 entries
* Flags to control compounding and to **RPropTags**
* nammasaš, points to DER-SAS
* nammasaš, points to AHKASAS, for MT

**LEXICON RPropTags** = A special lexicon for handling proper noun compounding without hyphens. Two entries:
* **@C.CmpHyph@ RHyphTags ;**:  This is the regular case, giving hyphens to compounds
* **@D.CmpHyph.TRUE@@U.CmpHyph.FALSE@+Err/Orth+Cmp/NoHyph+Cmp#:@D.CmpHyph.TRUE@@U.CmpHyph.FALSE@∑# Noun ;**:  This is the special case, going directly to nouns (*not* to NounRoot,
as that would allow compounding with words explicitly coded to disallow
such compounds)

**LEXICON flagON-R** = turns NeedsVowRed on:
* adds @U.NeedsVowRed.ON@ and directs to **R**

**LEXICON flagOFF-R** = turns NeedsVowRed off:
* adds @U.NeedsVowRed.OFF@ and directs to **R**

* * *

<small>This (part of) documentation was generated from [src/fst/compounding.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/compounding.lexc)</small>

---



`º` is for CnsGrad of the `lg:lgg` and `lºl:ll` type
`¤:0` prevents ConsGrad in certain words
`'` is the real apostroph

Remainder! Change all # to (Hyph) #  in order to account for ealáhus- ja ...

* *áj'gi*
* *ái0gi*
* ★*mánnáX5jd* (is not standard language)
* ★*má0ná0jd* (is not standard language)

* *áj'gi*
* *ái0gi*

* *majdege*
* *maidege*

* ★*almmajX4in* (is not standard language)
* ★*almmai0in* (is not standard language)

* *mánnáX5jd*
* *má0ná0id*

* *almmájX4*
* *almmái0*

* *almmájX4X7-#*
* *almmái00-#*

* *almmájX4in*
* *almmáj0in*

* *smirez#*
* *smires#*

* *Troandim#*
* *Troandin#*

* *Troandim-*
* *Troandin-*

* *muhtum#*
* *muhtun#*

* *skoalkkuh#*
* *skoalkkut#*

* *nagod#*
* *nagot#*

* *bávččag#*
* *bávččat#*

* *nuorab#*
* *nuorat#*

* *bávččag#*
* *bávččat#*

* *eamid#*
* *eamit#*

* *alih#*
* *alit#*

* ★*vejolažž#* (is not standard language)
* ★*vejolaž0#* (is not standard language)

* *vejolažž#*
* *vejolaš0#*

* *olmmožX4X7-*
* *olmmoš00-*

* ★*olmmožX7-* (is not standard language)
* ★*olmmoš0-* (is not standard language)

* *olmmožX4*
* *olmmoš0*

* *fijdnisY5t*
* *fiidná00t*

* ★*fijdnisY5t* (is not standard language)
* ★*fiidnás0t* (is not standard language)

* ★*fijdnisY5t* (is not standard language)
* ★*fiidnis0t* (is not standard language)

* *albmájY5*
* *albmá00*

* *olbmožY5*
* *olbmo00*

* *fijdnisY5t-*
* *fiidná00t-*

* *albmájY5-*
* *albmá00-*

* *olbmožY5-*
* *olbmo00-*

* *vuordild#*
* *vuordil0#*

* ★*vuordild#* (is not standard language)
* ★*vuordild#* (is not standard language)

* *attest#*
* *attes0#*

* ★*attest#* (is not standard language)
* ★*attest#* (is not standard language)

* *berošt#*
* *beroš0#*

* *bearjadah'k#*
* *bearjadat00#*

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadat0k#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadat'0#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadah00#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadat'k#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadah0k#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadah'k#* (is not standard language)

* *muitaluss#*
* *muitalus0#*

* ★*vejolažž#* (is not standard language)
* ★*vejolažž#* (is not standard language)

* *vejolažž#*
* *vejolaš0#*

* *joh'kaX4*
* *jo00ga0*

* ★*joh'kaX4* `joh'kaX4` (is not standard language joh'kaX4 joh'kaX4 joh'kaX4 jo0'kaX4)
* ★*joh0ga0* `jo0'ga0` (is not standard language jo00ka0 joh'ga0 joh0ka0 joh0ga0)

* *sápmiX4*
* *sá0mi0*

* ★*sápmiX4* (is not standard language)
* ★*sápmi0* (is not standard language)

* *latnjaX4*
* *la0nja0*

* *vuod'jiQ4n*
* *vuo00já0n*

* *káffeX4s*
* *ká0fe0s*

* *RuottaX4s*
* *Ruo0ta0s*

* *áhkkuX4s*
* *áh0ku0s*

* *vielljaX4*
* *vie0lja0*

* *mannjiX4*
* *ma0nji0*

* *áddjáX4*
* *á0djá0*

* *láj'biX4*
* *láibbi0*

* *seaŋ'gaX4*
* *seaŋgga0*

* *boŋ'kiX4j#*
* *boŋkki0i#*

* *sáf'taX4*
* *sáftta0*

* *oab'naX4*
* *oabnna0*

* *ám'taX4*
* *ámtta0*

* *In'gáX4*
* *Inggá0*

* *gán'daX4*
* *gándda0*

* *konseap'taX4*
* *konseaptta0*

* *áj'ruX4*
* *áirru0*

* *biev'laX4*
* *bievlla0*

* *jar'laX4*
* *jarlla0*

* *ol'juX4*
* *oljju0*

* *mát'kiX4*
* *mátkki0*

* *kreatsaX4*
* *kreatssa0*

* *beas'kaX4*
* *beaskka0*

* *čoav'jiX4*
* *čoavjji0*

* *beaj'viX4*
* *beaivvi0*

* *dujh'miX4*
* *duihmmi0*

* *čuolbmaX4*
* *čuolmma0*

* *DálmaX4*
* *Dálmma0*

* *sávdnjiX4*
* *sávnnji0*

* *čorbmaX4*
* *čorpma0*

* *skurdnjiX4*
* *skurtnji0*

* *návs'tuX4*
* *návsttu0*

* *limš'kiX4*
* *limškki0*

* *uk'saX4*
* *uvssa0*

* *teaks'taX4*
* *teavstta0*

* *spábbaX4*
* *spáppa0*

* ★*Szczecin* (is not standard language)
* ★*Szccecin* (is not standard language)

* *Szczecin*
* *Szczecin*

* *eadniX4*
* *eatni0*

* *boadnjiX4*
* *boatnji0*

* *boah'tiY1*
* *boahtti0*

* *dah'kaY7j*
* *dahkku0i*

* *dapmaY1*
* *dabmi0*

* *bitnjuY1*
* *bidnju0*

* *dad'jaY1*
* *daddji0*

* *joh'kaX4*
* *jo00ga0*

* *gáv'piX7*
* *gáv0pe0*

* *bassiX7*
* *basse0*

* *buorriX7#*
* *buorre0#*

* *buorriX8#*
* *buo0re0#*

* *várriX7gir'ku#*
* *várre0gir0ku#*

* *lijgiX7#ruh'taX4jd#*
* *liige00ru00đa0id#*

* *čuor'vuQ6*
* *čuorvvo0*

* *boah'tiQ6*
* *boa00đe0*

* *láj'kiW1s#*
* *láikke0s#*

* *ál'kiW2s#*
* *ál0ke0s#*

* *váttisW1#*
* *váttes0#*

* *head'jusW1-*
* *hea00jos0-*

* *head'jusW1#*
* *hea00jos0#*

* *váttisW1-*
* *váttes0-*

* *goah'tiX5jd*
* *go000đi0id*

* *vieh'ki¤X5jn*
* *vi0hkki00in*

* *reŋ'koX2jd*
* *reŋ0ku0id*

* *basteX2j*
* *basti0i*

* *asibealle7X2j*
* *asibealli0ide*

* *LineX2j*
* *Lini0i*

* *áhččiX2n*
* *áhččá0n*

* *stahtaX3j*
* *stahti0i*

* *Sij9teW9j*
* *Sijte0i*

* *fijdnisY5t*
* *fiidná00t*

* *oažžuQ8dit*
* *o0ččo0dit*

* *coah'kuX8stit*
* *coa00go0stit*

* *jearraQ1*
* *jearrá0*

* *boah'tiQ1*
* *boah0tá0*

* *jearraQ3n*
* *je0rro0n*

* *jearraQ2t*
* *je0rre0t*

* *boah'tiQ3n*
* *bo0h0to0n*

* *čuor'vuQ3n*
* *ču0r0vo0n*

* *jearraQ2*
* *je0rre0*

* *boah'tiQ2t*
* *bo0h0te0t*

* *čuor'vuQ2*
* *ču0r0vo0*

* *boah'tiQ4n*
* *boa00đá0n*

* *boah'tiQ5lin*
* *boa00đá0lin*

* *jearraY1*
* *jearri0*

* *jearraY2*
* *jearru0*

* *boah'tiY2*
* *boahttu0*

* *jearraQ2t*
* *je0rre0t*

boah'tiY4t ! It seems it should be Q3. ... both?!
* *boah'tiQ3t*
* *bo0h0to0t*

čuor'vuY4t ! Q2, it seems.
* *čuor'vuQ2t*
* *ču0r0vo0t*

* *jearraY7t*
* *je0rro0t*

* *boah'tiY7t*
* *bo0htto0t*

* *čuor'vuY7t*
* *ču0r0vo0t*

* *jearraY7juvvot*
* *je0rro0juvvot*

* *jearraY7j*
* *je0rru0i*

* *dah'kaY7j*
* *dahkku0i*

* *loikaY7j*
* *loiku0i*

* *beatnag8X4*
* *bea0na00*

* *luopmin8X4*
* *luo0mi00*

* *giellum8X4*
* *gie0lu00*

Changed because:we get almmáj- and not almmái-
Postvocalic j surfaces as i
Is this what we want?? without right context??? postvoc j:i <=> Vow: ( :0 ) (Dummy: ) _ ;

* *#hálijd#*
* *0háliit#*

* ★*hálijd#* (is not standard language)
* ★*háliid#* (is not standard language)

* * *

<small>This (part of) documentation was generated from [src/fst/phonology-L2-from-branch.twolc](https://github.com/giellalt/lang-sme/blob/main/src/fst/phonology-L2-from-branch.twolc)</small>

---



`º` is for CnsGrad of the `lg:lgg` and `lºl:ll` type
`¤:0` prevents ConsGrad in certain words
`'` is the real apostroph

Remainder! Change all # to (Hyph) #  in order to account for ealáhus- ja ...

* *áj'gi*
* *ái0gi*
* ★*mánnáX5jd* (is not standard language)
* ★*má0ná0jd* (is not standard language)

* *áj'gi*
* *ái0gi*

* *majdege*
* *maidege*

* ★*almmajX4in* (is not standard language)
* ★*almmai0in* (is not standard language)

* *mánnáX5jd*
* *má0ná0id*

* *almmájX4*
* *almmái0*

* *almmájX4X7-#*
* *almmái00-#*

* *almmájX4in*
* *almmáj0in*

* *smirez#*
* *smires#*

* *Troandim#*
* *Troandin#*

* *Troandim-*
* *Troandin-*

* *muhtum#*
* *muhtun#*

* *skoalkkuh#*
* *skoalkkut#*

* *nagod#*
* *nagot#*

* *bávččag#*
* *bávččat#*

* *nuorab#*
* *nuorat#*

* *bávččag#*
* *bávččat#*

* *eamid#*
* *eamit#*

* *alih#*
* *alit#*

* ★*vejolažž#* (is not standard language)
* ★*vejolaž0#* (is not standard language)

* *vejolažž#*
* *vejolaš0#*

* *olmmožX4X7-*
* *olmmoš00-*

* ★*olmmožX7-* (is not standard language)
* ★*olmmoš0-* (is not standard language)

* *olmmožX4*
* *olmmoš0*

* *fijdnisY5t*
* *fiidná00t*

* ★*fijdnisY5t* (is not standard language)
* ★*fiidnás0t* (is not standard language)

* ★*fijdnisY5t* (is not standard language)
* ★*fiidnis0t* (is not standard language)

* *albmájY5*
* *albmá00*

* *olbmožY5*
* *olbmo00*

* *fijdnisY5t-*
* *fiidná00t-*

* *albmájY5-*
* *albmá00-*

* *olbmožY5-*
* *olbmo00-*

* *vuordild#*
* *vuordil0#*

* ★*vuordild#* (is not standard language)
* ★*vuordild#* (is not standard language)

* *attest#*
* *attes0#*

* ★*attest#* (is not standard language)
* ★*attest#* (is not standard language)

* *berošt#*
* *beroš0#*

* *bearjadah'k#*
* *bearjadat00#*

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadat0k#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadat'0#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadah00#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadat'k#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadah0k#* (is not standard language)

* ★*bearjadah'k#* (is not standard language)
* ★*bearjadah'k#* (is not standard language)

* *muitaluss#*
* *muitalus0#*

* ★*vejolažž#* (is not standard language)
* ★*vejolažž#* (is not standard language)

* *vejolažž#*
* *vejolaš0#*

* *joh'kaX4*
* *jo00ga0*

* ★*joh'kaX4* `joh'kaX4` (is not standard language joh'kaX4 joh'kaX4 joh'kaX4 jo0'kaX4)
* ★*joh0ga0* `jo0'ga0` (is not standard language jo00ka0 joh'ga0 joh0ka0 joh0ga0)

* *sápmiX4*
* *sá0mi0*

* ★*sápmiX4* (is not standard language)
* ★*sápmi0* (is not standard language)

* *latnjaX4*
* *la0nja0*

* *vuod'jiQ4n*
* *vuo00já0n*

* *káffeX4s*
* *ká0fe0s*

* *RuottaX4s*
* *Ruo0ta0s*

* *áhkkuX4s*
* *áh0ku0s*

* *vielljaX4*
* *vie0lja0*

* *mannjiX4*
* *ma0nji0*

* *áddjáX4*
* *á0djá0*

* *láj'biX4*
* *láibbi0*

* *seaŋ'gaX4*
* *seaŋgga0*

* *boŋ'kiX4j#*
* *boŋkki0i#*

* *sáf'taX4*
* *sáftta0*

* *oab'naX4*
* *oabnna0*

* *ám'taX4*
* *ámtta0*

* *In'gáX4*
* *Inggá0*

* *gán'daX4*
* *gándda0*

* *konseap'taX4*
* *konseaptta0*

* *áj'ruX4*
* *áirru0*

* *biev'laX4*
* *bievlla0*

* *jar'laX4*
* *jarlla0*

* *ol'juX4*
* *oljju0*

* *mát'kiX4*
* *mátkki0*

* *kreatsaX4*
* *kreatssa0*

* *beas'kaX4*
* *beaskka0*

* *čoav'jiX4*
* *čoavjji0*

* *beaj'viX4*
* *beaivvi0*

* *dujh'miX4*
* *duihmmi0*

* *čuolbmaX4*
* *čuolmma0*

* *DálmaX4*
* *Dálmma0*

* *sávdnjiX4*
* *sávnnji0*

* *čorbmaX4*
* *čorpma0*

* *skurdnjiX4*
* *skurtnji0*

* *návs'tuX4*
* *návsttu0*

* *limš'kiX4*
* *limškki0*

* *uk'saX4*
* *uvssa0*

* *teaks'taX4*
* *teavstta0*

* *spábbaX4*
* *spáppa0*

* ★*Szczecin* (is not standard language)
* ★*Szccecin* (is not standard language)

* *Szczecin*
* *Szczecin*

* *eadniX4*
* *eatni0*

* *boadnjiX4*
* *boatnji0*

* *boah'tiY1*
* *boahtti0*

* *dah'kaY7j*
* *dahkku0i*

* *dapmaY1*
* *dabmi0*

* *bitnjuY1*
* *bidnju0*

* *dad'jaY1*
* *daddji0*

* *joh'kaX4*
* *jo00ga0*

* *gáv'piX7*
* *gáv0pe0*

* *bassiX7*
* *basse0*

* *buorriX7#*
* *buorre0#*

* *buorriX8#*
* *buo0re0#*

* *várriX7gir'ku#*
* *várre0gir0ku#*

* *lijgiX7#ruh'taX4jd#*
* *liige00ru00đa0id#*

* *čuor'vuQ6*
* *čuorvvo0*

* *boah'tiQ6*
* *boa00đe0*

* *láj'kiW1s#*
* *láikke0s#*

* *ál'kiW2s#*
* *ál0ke0s#*

* *váttisW1#*
* *váttes0#*

* *head'jusW1-*
* *hea00jos0-*

* *head'jusW1#*
* *hea00jos0#*

* *váttisW1-*
* *váttes0-*

* *goah'tiX5jd*
* *go000đi0id*

* *vieh'ki¤X5jn*
* *vi0hkki00in*

* *reŋ'koX2jd*
* *reŋ0ku0id*

* *basteX2j*
* *basti0i*

* *asibealle7X2j*
* *asibealli0ide*

* *LineX2j*
* *Lini0i*

* *áhččiX2n*
* *áhččá0n*

* *stahtaX3j*
* *stahti0i*

* *Sij9teW9j*
* *Sijte0i*

* *fijdnisY5t*
* *fiidná00t*

* *oažžuQ8dit*
* *o0ččo0dit*

* *coah'kuX8stit*
* *coa00go0stit*

* *jearraQ1*
* *jearrá0*

* *boah'tiQ1*
* *boah0tá0*

* *jearraQ3n*
* *je0rro0n*

* *jearraQ2t*
* *je0rre0t*

* *boah'tiQ3n*
* *bo0h0to0n*

* *čuor'vuQ3n*
* *ču0r0vo0n*

* *jearraQ2*
* *je0rre0*

* *boah'tiQ2t*
* *bo0h0te0t*

* *čuor'vuQ2*
* *ču0r0vo0*

* *boah'tiQ4n*
* *boa00đá0n*

* *boah'tiQ5lin*
* *boa00đá0lin*

* *jearraY1*
* *jearri0*

* *jearraY2*
* *jearru0*

* *boah'tiY2*
* *boahttu0*

* *jearraQ2t*
* *je0rre0t*

boah'tiY4t ! It seems it should be Q3. ... both?!
* *boah'tiQ3t*
* *bo0h0to0t*

čuor'vuY4t ! Q2, it seems.
* *čuor'vuQ2t*
* *ču0r0vo0t*

* *jearraY7t*
* *je0rro0t*

* *boah'tiY7t*
* *bo0htto0t*

* *čuor'vuY7t*
* *ču0r0vo0t*

* *jearraY7juvvot*
* *je0rro0juvvot*

* *jearraY7j*
* *je0rru0i*

* *dah'kaY7j*
* *dahkku0i*

* *loikaY7j*
* *loiku0i*

* *beatnag8X4*
* *bea0na00*

* *luopmin8X4*
* *luo0mi00*

* *giellum8X4*
* *gie0lu00*

Changed because:we get almmáj- and not almmái-
Postvocalic j surfaces as i
Is this what we want?? without right context??? postvoc j:i <=> Vow: ( :0 ) (Dummy: ) _ ;

* *#hálijd#*
* *0háliit#*

* ★*hálijd#* (is not standard language)
* ★*háliid#* (is not standard language)

* * *

<small>This (part of) documentation was generated from [src/fst/phonology-L2.twolc](https://github.com/giellalt/lang-sme/blob/main/src/fst/phonology-L2.twolc)</small>

---


North Sámi morphophonological rule set                  

This file documents the [phonology.twolc file](http://github.com/giellalt/lang-sme/blob/main/src/fst/phonology.twolc) 

The file contains the rule set for the non-segmental
North Sámi morphophonological rules

Note that when copied over to newinfra, this file will be labeled sme-phon-L1.twolc.
The file sme-phon-L1.twolc will **not** be the source file to edit, 
rather, the source file will be this file, gt/sme/src/twol-sme.txt. This file (in the old infra)
is the ordinary sme fst file to be edited.
The L2 sme fst, on the other hand, will have lags/sme/src/phonology/sme-phon-L2.twolc
as its sourcefile, the file to be edited.

`º` is for CnsGrad of the `lg:lgg` and `lºl:ll` type
`¤:0` prevents ConsGrad in certain words
`'` is the real apostroph

* *ájºgi*
* *ái0gi*
* ★*mánnáX5jd* (is not standard language)
* ★*má0ná0jd* (is not standard language)

* *ájºgi*
* *ái0gi*

* *majdege*
* *maidege*

* ★*almmajX4in* (is not standard language)
* ★*almmai0in* (is not standard language)

* *mánnáX5jd*
* *má0ná0id*

* *almmájX4#*
* *almmái0#*

* *almmájX4X7-*
* *almmái00-*

* *almmájX4in*
* *almmáj0in*

* *barggož-*
* *barggoš-*

* *smirez-*
* *smires-*

* *Troandim#*
* *Troandin#*

* *Troandim-*
* *Troandin-*

* *muhtum#*
* *muhtun#*

* *skoalkkuh#*
* *skoalkkut#*

* *nagod#*
* *nagot#*

* *bávččag#*
* *bávččat#*

* *nuorab#*
* *nuorat#*

* *bávččag#*
* *bávččat#*

* *eamid#*
* *eamit#*

* *alih#*
* *alit#*

* *olmmož>X4X7-*
* *olmmoš>00-*

* *olmmož>X4#*
* *olmmoš>0#*

* *fijdnisY5t*
* *fiidná00t*

* ★*fijdnisY5t* (is not standard language)
* ★*fiidnás0t* (is not standard language)

* ★*fijdnisY5t* (is not standard language)
* ★*fiidnis0t* (is not standard language)

* *albmájY5*
* *albmá00*

* *olbmožY5*
* *olbmo00*

* *fijdnisY5t-*
* *fiidná00t-*

* *albmájY5-*
* *albmá00-*

* *olbmožY5-*
* *olbmo00-*

* *vuordild-*
* *vuordil0-*

* ★*vuordild-* (is not standard language)
* ★*vuordild-* (is not standard language)

* *attest-*
* *attes0-*

* ★*attest-* (is not standard language)
* ★*attest-* (is not standard language)

* *berošt#*
* *beroš0#*

* *bearjadah%ºk-*
* *bearjadat00-*

* ★*bearjadah%ºk-* (is not standard language)
* ★*bearjadat0k-* (is not standard language)

* ★*bearjadah%ºk-* (is not standard language)
* ★*bearjadah00-* (is not standard language)

* ★*bearjadah%ºk-* (is not standard language)
* ★*bearjadah0k-* (is not standard language)

* *muitaluss#*
* *muitalus0#*

* ★*vejolažž>-* (is not standard language)
* ★*vejolažž>-* (is not standard language)

* *vejolažž>-*
* *vejolaš0>-*

* ★*vejolažž>#* (is not standard language)
* ★*vejolaž0>#* (is not standard language)

* *johºkaX4*
* *jo00ga0*

* ★*johºkaX4* (is not standard language)
* ★*joh0ga0* (is not standard language)

* ★*johºkaX4* (is not standard language)
* ★*jo00ka0* (is not standard language)

* ★*johºkaX4* (is not standard language)
* ★*joh0ka0* (is not standard language)

* *sápmiX4*
* *sá0mi0*

* ★*sápmiX4* (is not standard language)
* ★*sápmi0* (is not standard language)

* *latnjaX4*
* *la0nja0*

* *vuodºjiQ4n*
* *vuo00já0n*

* *káffeX4s*
* *ká0fe0s*

* *RuottaX4s*
* *Ruo0ta0s*

* *áhkkuX4s*
* *áh0ku0s*

* *vielljaX4*
* *vie0lja0*

* *mannjiX4*
* *ma0nji0*

* *áddjáX4*
* *á0djá0*

* *lájºbiX4*
* *láibbi0*

* *seaŋºga>X4*
* *seaŋgga>0*

* *boŋºki>X4j#*
* *boŋkki>0i#*

* *boŋºki>X4jmet#*
* *boŋkki>0imet#*

* *sáfºtaX4*
* *sáftta0*

* *oabºnaX4*
* *oabnna0*

* *ámºtaX4*
* *ámtta0*

* *InºgáX4*
* *Inggá0*

* *gánºdaX4*
* *gándda0*

* *konseapºtaX4*
* *konseaptta0*

* *ájºruX4*
* *áirru0*

* *bievºlaX4*
* *bievlla0*

* *jarºlaX4*
* *jarlla0*

* *olºjuX4*
* *oljju0*

* *mátºkiX4*
* *mátkki0*

* *kreatºsaX4*
* *kreatssa0*

* *korpºsaX4*
* *korpssa0*

* *beasºkaX4*
* *beaskka0*

* *čoavºjiX4*
* *čoavjji0*

* *beajºviX4*
* *beaivvi0*

* *dujhºmiX4*
* *duihmmi0*

* *čuolbmaX4*
* *čuolmma0*

* *DálºmaX4*
* *Dálmma0*

* *sávdnjiX4*
* *sávnnji0*

* *čorbmaX4*
* *čorpma0*

* *skurdnjiX4*
* *skurtnji0*

* *návsºtuX4*
* *návsttu0*

* *boršºtaX4*
* *borštta0*

* *limšºkiX4*
* *limškki0*

* *ukºsaX4*
* *uvssa0*

* *teaksºtaX4*
* *teavstta0*

* *spábbaX4*
* *spáppa0*

* ★*Szczecin* (is not standard language)
* ★*Szccecin* (is not standard language)

* *Szczecin*
* *Szczecin*

* *eadniX4*
* *eatni0*

* *boadnjiX4*
* *boatnji0*

* *boahºtiY1*
* *boahtti0*

* *dahºkaY7j#*
* *dahkku0i#*

* *dahºka>Y7jmet#*
* *dahkku>0imet#*

* *dapmaY1*
* *dabmi0*

* *bitnjuY1*
* *bidnju0*

* *dadºjaY1*
* *daddji0*

* *johºkaX4*
* *jo00ga0*

* *gávºpiX7*
* *gáv0pe0*

* *bassiX7*
* *basse0*

* *buorriX7*
* *buorre0*

* *buorriX8*
* *buo0re0*

* *várriX7girºku*
* *várre0gir0ku*

* *lijgiX7#ruhºtaX4jd*
* *liige0#ru00đa0id*

* *čuorºvuQ6*
* *čuorvvo0*

* *boahºtiQ6*
* *boa00đe0*

* *lájºkiW1s#*
* *láikke0s#*

* *álºkiW2s#*
* *ál0ke0s#*

* *váttisW1*
* *váttes0*

* *headºjusW1-*
* *hea00jos0-*

* *headºjusW1*
* *hea00jos0*

* *váttisW1-*
* *váttes0-*

* *goahºtiX5jd*
* *go000đi0id*

* *viehºki¤X5jn*
* *vi0hkki00in*

* *boahºti>^DISIMPjmet#*
* *bo000đi>0imet#*

* *reŋºko>X2jd#*
* *reŋ0ku>0id#*

* *baste>X2j#*
* *basti>0i#*

* *asi#bealli>^DISIMPjde#*
* *asi#be00li>0ide#*

* *Line>X2j#*
* *Lini>0i#*

* *áhččiX2n*
* *áhččá0n*

* *stahta>X3j#*
* *stahti>0i#*

* *Sij9te>i#*
* *Sijte>i#*

* *fijdnisY5t*
* *fiidná00t*

* *oažžuQ8dit*
* *o0ččo0dit*

* *coahºkuX8stit*
* *coa00go0stit*

* *jearraQ1*
* *jearrá0*

* *boahºtiQ1*
* *boah0tá0*

* *jearraQ3n*
* *je0rro0n*

* *jearraQ2t*
* *je0rre0t*

* *boahºtiQ3n*
* *bo0h0to0n*

* *čuorºvuQ3n*
* *ču0r0vo0n*

* *jearraQ2*
* *je0rre0*

* *boahºtiQ2t*
* *bo0h0te0t*

* *čuorºvuQ2*
* *ču0r0vo0*

* *boahºtiQ4n*
* *boa00đá0n*

* *boahºtiQ5lin*
* *boa00đá0lin*

* *jearraY1*
* *jearri0*

* *jearraY2*
* *jearru0*

* *boahºtiY2*
* *boahttu0*

* *jearraQ2t*
* *je0rre0t*

boahºtiY4t ! It seems it should be Q3. ... both?!
* *boahºtiQ3t*
* *bo0h0to0t*

čuorºvuY4t ! Q2, it seems.
* *čuorºvuQ2t*
* *ču0r0vo0t*

* *jearraY7t#*
* *je0rro0t#*

* *boahºtiY7t#*
* *bo0htto0t#*

* *čuorºvuY7t#*
* *ču0r0vo0t#*

* *jearraY7juvvot#*
* *je0rro0juvvot#*

* *jearraY7j#*
* *je0rru0i#*

* *dahºkaY7j#*
* *dahkku0i#*

* *loikaY7j#*
* *loiku0i#*

* *beatnag8X4*
* *bea0na00*

* *luopmin8X4*
* *luo0mi00*

* *giellum8X4*
* *gie0lu00*

Changed because:we get almmáj- and not almmái-
Postvocalic j surfaces as i
Is this what we want?? without right context??? postvoc j:i <=> Vow: ( :0 ) (Dummy: ) _ ;

* * *

<small>This (part of) documentation was generated from [src/fst/phonology.twolc](https://github.com/giellalt/lang-sme/blob/main/src/fst/phonology.twolc)</small>

---

Divvun & Giellatekno - open source grammars for North Sámi.

# North Sámi morphological analyser

# Multicharacter symbols

## Tags for POS

* **+N** - Noun
* **+A** - Adjective
* **+Adv** - Adverb
* **+V** - Verb
* **+Pron** - Pronoun
* **+CS** - Subjunction
* **+CC** - Conjunction
* **+Adp** - Adposition, ie Post- and Prepostion, NOT IN USE
* **+Po** - Postpostion
* **+Pr** - Preposition
* **+Interj** - Interjection
* **+Pcle** - Particle
* **+Num** - Numeral

## Tags for sub-POS
* **+Prop** - Propernoun
* **+Pers** - Personal Pronoun
* **+Dem** - Demonstrative Pronoun
* **+Interr** - Interrogative Pronoun
* **+Refl** - Reflexive Pronoun
* **+Recipr** - Reciprocal Pronoun
* **+Rel** - Relative Pronoun
* **+Indef** - Indefinitive Pronoun
* **+Coll** - Collective numerals, subtag for +N
* **+Arab** - Arabic numeral, subtag for +Num
* **+Rom** - Roman numeral, subtag for +Num
* **+Pass** - hallat/haddat not in use
* **+Known** - man (different from maid): mii+Pron+Rel+Sg+Acc+Known

# Tags for Inflection

## Tags for Case and Number Inflection
* **+Sg** - Singular
* **+Du** - Dual
* **+Pl** - Plural

* **+Ess** - Essive
* **+Nom** - Nominative
* **+Gen** - Genitive
* **+Acc** - Accusative
* **+Ill** - Illative
* **+Loc** - Locative = Inessive and Ellative
* **+Com** - Comitative
* **+Com/Sh** - Comitative Plural Hyphened Shortform (w/o -guin), ie Beatnagii-, Biillai-, Bohccui- etc.

## Possessive tags

* **+PxSg1**    Singular First Person
* **+PxSg2**    Singular Second Person
* **+PxSg3**    Singular Third Person
* **+PxDu1**    Dual First Person
* **+PxDu2**    Dual Second Person
* **+PxDu3**    Dual Third Person
* **+PxPl1**    Plural First Person
* **+PxPl2**    Plural Second Person
* **+PxPl3**    Plural Third Person

## Adjectival tags
* **+Attr**   Attributive
* **+Card**   Cardinal Number Not in use
* **+Ord**   Ordinal Number

## Moods
* **+Ind** Indicative
* **+Pot** Potential
* **+Cond** Conditional
* **+Imprt** Imperative

## Tenses
* **+Prs** Present Tense
* **+Prt** Past Tense, Preterite

## Verb person-number

* **+Sg1** Singular First Person
* **+Sg2** Singular Second Person
* **+Sg3** Singular Third Person
* **+Du1** Dual First Person
* **+Du2** Dual Second Person
* **+Du3** Dual Third Person
* **+Pl1** Plural First Person
* **+Pl2** Plural Second Person
* **+Pl3** Plural Third Person

## Infinite verb forms

* **+Inf** Infinitive
* **+Ger** Gerund
* **+ConNeg** Negation Form, ie Mana, Doalvvo, Juoge etc
* **+ConNegII** Alternative, Rather Declamatory Negation Form - Infrequent
* **+Neg** Negation Verb, Ii and its forms, ie Ale, Alli, Allot, Ehpet, Eat etc.
* **+ImprtII** Alternative, Rather Declamatory Imperative Form - Infrequent not in use
* **+PrsPrc** Present Participe
* **+PrfPrc** Perfect Participe
* **+Sup** Supine
* **+VGen** VerbGenitive
* **+VAbess** VerbAbbesive
* **+Actio** Action Verb Form

## Other tags
* **+Gram/Comp**   Comparative, adverbs
* **+Gram/Superl**   Superlative, adverbs

* **+ABBR** Abbreviation, subtag for e.g. +N
* **+Symbol** = independent symbols in the text stream, like £, €, ©
* **+ACR**  Acronym, subtag for +N
* **+CLB**  Clause border (full stop, comma..)
* **+PUNCT**  punctuation
* **+LEFT**  left paranthesis
* **+RIGHT**  right paranthesis
* **+Dyn**  Dynamically generated (acronyms) +ACR+Dyn
* **+CLBfinal**  Sentence final abbreviated expression ending in full stop, so that the full stop is ambiguous

* **+TV**    Transitive Verb, +V+TV
* **+IV** Intransitive Verb, +V+IV
* **+G3** Grade 2-3 for homonymies with grade 1-2, +N+G3
* **+G7** Grade 3, no consonant gradation, +N+G7
* **+NomAg** Actor Noun From Verb - Nomen Agentis, +N+NomAg

* **+Gram/TAbbr**:  Transitive abbreviation (it needs an argument)
* **+Gram/NoAbbr**:  Intransitive abbreviations that are homonymous
with more frequent words. They should only be considered
abbreviations in the middle of a sentence.
* **+Gram/TNumAbbr**:  Transitive abbreviation if the following
constituent is numeric
* **+Gram/NumNoAbbr**:  Transitive abbreviations for which numerals
are complements and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentence can be considered as true cases.
* **+Gram/TIAbbr**:  Both transitive and intransitive abbreviation
* **+Gram/IAbbr**:  Intransitive abbreviation (it takes no argument)
* **+Gram/3syll**: trisyllabic verbs

## Question and Focus particles:
* **+Qst**   Question Particle: +Pcle+Qst
* **+Subqst**   Embedded Question Particle: +Adv+Subqst
* **+Foc/naj**	Focus clitic
* **+Foc/Neg-ge**	Focus clitic
* **+Foc/Pos-ge**	Focus clitic
* **+Foc/gen**	Focus clitic
* **+Foc/ges**	Focus clitic
* **+Foc/gis**	Focus clitic
* **+Foc/ba**	Focus clitic
* **+Foc/be**	Focus clitic
* **+Foc/hal**	Focus clitic
* **+Foc/han**	Focus clitic
* **+Foc/bai**	Focus clitic
* **+Foc/bas**	Focus clitic
* **+Foc/bat**	Focus clitic
* **+Foc/ban**	Focus clitic
* **+Foc/son**	Focus clitic
* **+Foc/bahal**	Focus clitic
* **+Foc/behal**	Focus clitic
* **+Foc/bahan**	Focus clitic
* **+Foc/behan**	Focus clitic
* **+Foc/bason**	Focus clitic
* **+Foc/beson**	Focus clitic
* **+Foc/mat**	Focus clitic
* **+Foc/mis**	Focus clitic
* **+Foc/s**	Focus clitic

## Tags distinguishing different versions of the same lemma (before POS)
* +v1
* +v2
* +v3
* +v4
* +v5
* +v6
* +v7
* +v8
* +v9
* +v10
* +v11
* +v12
* +v13
* +v14
* +v15
* +v16
* +v17
* +v18
* +v19
* +v20
* +v21
* +v22
* +v23
* +v24

Note: These high +v... number are in use for one word only:
doavttergrádakursa

## Escaped chars

* ** %        **
* **+Guess** for the name guesser
* ** +MWE     ** - Multi-word expressions treated as such in the preprocessor. To be added as first tag after the lemma

* **+PxCPlComRecipr** used in pronoun-sme-morph.txt

## Error (non-standard language) tags

* **+Err/Orth** substandard, not in normative fst
* **+Err/Orth-a-á** substandard, not in normative fst
* **+Err/Orth-nom-gen** substandard, not in normative fst
* **+Err/Orth-nom-acc** substandard, not in normative fst
* **+Err/Lex** substandard, not in normative fst, no normative lemma
* **+Err/DerSub** substandard for derivation, not in normative fst, no normative lemma
* **+Err/CmpSub** substandard for compounding, not in normative fst (wrong form or POS in first part)
* **+Err/MissingSpace** indicates that there is a missing space, causing an orthographic error
* **+Err/MissingHyph** when there is no hyphen where it should have been
* **+Err/Hyph** when there is a hyphen where none should have been
* **+Err/SpaceCmp** used for compounds written apart - only retained in the HFST Grammar Checker disambiguation analyser
* **+Err/Spellrelax** used to tag spellrelaxed typos (tag is inserted via flag diacritics)
* **+Err/Confused** grammarcheking rela word error confusion pairs
* **+Err/Confused-Ess** grammarcheking rela word error confusion pairs
* **+Err/Confused-ASgNom** grammarcheking rela word error confusion pairs
* **+Err/Confused-DerPassPrsSg3** grammarcheking rela word error confusion pairs
* **+Err/Confused-NSgPxSg1** grammarcheking rela word error confusion pairs
* **+Err/Confused-NomAgIll** grammarcheking rela word error confusion pairs
* **+Err/Confused-ImprtDu1** grammarcheking rela word error confusion pairs
* **+Err/Confused-DerPassPrtSg3** grammarcheking rela word error confusion pairs
* **+Err/Confused-ImprtSg2** grammarcheking rela word error confusion pairs
* **+Err/Confused-ImprtPl2** grammarcheking rela word error confusion pairs

## Usage tags

* **+Use/-Spell** Orthographically correct, typically perifer words, excluded in speller because they cause trouble for frequent words
* **+Use/-PLX** Excluded in PLX-speller
* **+Use/SpellNoSugg** recognized but not suggested in speller
* **+Use/Circ** circular paths (old ^C^)
* **+Use/CircN** circular paths for the numerals (old ^N^)
* **+Use/MT** Generate for MT only, for restricting analyses needed
for MT generation not to pop up elsewhere (NOT IN FUNCTION)
* **+Use/LIA** only for LIA-analyser
* **+Use/NG** not-generate, for ped generation isme-ped.fst and MT
* **+Use/NGminip** Not for miniparadigm in NDS dicts
* **+Use/PMatch** means that the following is only used in the analyser feeding the disambiguator
* **+Use/-PMatch** Do not include in fst's made for hfst-pmatch
* **+Use/GC** – **only** retained in the HFST Grammar Checker disambiguation analyser
* **+Use/-GC** – **never** retained in the HFST Grammar Checker disambiguation analyser
* **+Use/TTS** – **only** retained in the HFST Text-To-Speech disambiguation tokeniser
* **+Use/-TTS** – **never** retained in the HFST Text-To-Speech disambiguation tokeniser
* **+MWESplit** Split point for MWE

## Dialect tags:

* **+Dial/-KJ** forms not in use in KJ (Kárásjohka)
* **+Dial/-GG** forms not in use in GG (Guovdageaidnu)
* **+Dial/-GS** forms not in use in GS (Gárasavvon) NOT IN USE
* **+South** foreløpig lagt til Sg Loc -n, som er en sub-form

## Tags for indicating the orthography used
+Orth/Strd - Standard orthography
+Orth/IPA - IPA transcription

The above should either be used in pairs, or not at all. That is, if a word
doesn't need an IPA stem (because the word in all its inflection can be
converted to IPA by the standard IPA conversion rules), then none of these
tags should be used.
On the other hand, if the word has a spelling that doesn't follow the
orthographic rules, and thus needs an exceptional IPA stem to get it right,
then the exceptional stem must be marked with the `+Orth/IPA`, and the
regular orthography stem must be marked with the tag `+Orth/Strd`. This is
so that we can exclude the one or the other from different fst's, but only
when the oposite stem variant is present.

## Multichars for marking start and end of IPA sequences

<!-- {% raw %} -->
* `%{%<ipa#%}` - ipa text to the left
* `%{#ipa%>%}` - ipa text to the right
* `%<sent%>` - apertium
<!-- {% endraw %} -->

## Compounding tags

The tags are of the following form:
* **+CmpNP/xxx** - Normative (N), Position (P), ie the tag describes what
position the tagged word can be in in a compound
* **+CmpN/xxx**  - Normative (N) **form** ie the tag describes what
form the tagged word should use when making compounds
* **+Cmp/xxx**   - Descriptive compounding tags, ie tags that *describes*
what form a word actually is using in a compound

This entry / word should be in the following position(s):

* **+CmpNP/All** - ... in all positions, **default**, this tag does not have to be written
* **+CmpNP/First** - ... only be first part in a compound or alone
* **+CmpNP/Pref** - ... only **first** part in a compound, NEVER alone
* **+CmpNP/Last** - ... only be last part in a compound or alone
* **+CmpNP/Suff** - ... only **last** part in a compound, NEVER alone
* **+CmpNP/None** - ... does not take part in compounds
* **+CmpNP/Only** - ... only be part of a compound, i.e. can never
be used alone, but can appear in any position

If unmarked, any position goes.

The tagged part of the compound should make a compound using:

* **+CmpN/SgN** Singular Nominative
* **+CmpN/SgG** Singular Genitive
* **+CmpN/PlG** Plural Genitive
* **+CmpN/PlN** Plural Nominative, propers!

Unmarked = Default, ie `+CmpN/SgN` for SME.

The second part of the compound may require that the previous (left part) is:

* **+CmpN/SgNomLeft** Singular Nominative
* **+CmpN/SgGenLeft** Singular Genitive
* **+CmpN/PlGenLeft** Plural Genitive

Tags for descriptive compound analysis - this is what a compound actually is:

* **+Cmp** - Dynamic compound. This tag should always be part
of a dynamic compound. It is important for
Apertium, and useful in other cases as well.
* **+Cmp/Attr** - Attributive
* **+Cmp/SgNom** - Singular Nominative
* **+Cmp/SgGen** - Singular Genitive
* **+Cmp/PlGen** - Plural Genitiv
* **+Cmp/SplitR** - This is a split compound with the other part to
the right: "Arbeids- og inkluderingsdepartementet"
=> Arbeids- = +Cmp/SplitR
* **+Cmp/SplitL** - This is a split compound with the other part to the left
* **+Cmp/Sh** - testing +Cmp/Sh
* **+Cmp/Hyph** - on dynamic compounds that have a hyphen
* **+Cmp/NoHyph** - On compounds that COULD have had a hyphen (and usually have), but doesn't
* **+Cmp/SoftHyph** - Tags compounds containing SOFT HYPHENS (U+00AD)
* **+Cmp/Cit** - Tags citation compounds, which can in principle
cover any word. Requires a hyphen.

## Compounding tag ordering
To ease writing and maintaining regexes etc for manipulating and enforcing
compounding, it is important to keep the tags in a certain order.
The order is:
1. **+CmpN/** tags
1. **+CmpNP/** tags
1. **+Cmp/** tags - this is always true since the descriptive tags are always
part of the continuation lexicons, and will be located after the POS tag.

## Semantic tags to help disambiguation & synt. analysis: (before POS)

* +Sem/Act = Activity
* +Sem/Adr = Webadr
* +Sem/Amount = Amount
* +Sem/Ani = Animate
* +Sem/Aniprod = Animal Product
* +Sem/Body = Bodypart
* +Sem/Body-abstr = siellu, vuoig?a, jierbmi, (noe man kan bruke i fysisk aktivitet som en kroppsdel, f.eks. synet, stemmen, etc.)
* +Sem/Build = Building
* +Sem/Build-room = Room in a building, typically place to be
* +Sem/Buildpart = Part of Bulding, like the wall
* +Sem/Cat = Category
* +Sem/Clth = Clothes
* +Sem/Clth-jewl = Jewelery
* +Sem/Clthpart = part of clothes, boallu, sávdnji...
* +Sem/Ctain = Container
* +Sem/Ctain-abstr = Abstract container like bank account
* +Sem/Ctain-clth = Soft container, like a rucksack
* +Sem/Curr = Currency like dollár, Not Money
* +Sem/Date = Date
* +Sem/Dance = Dance
* +Sem/Dir = Direction like GPS-kursa
* +Sem/Domain = Domain like politics, reindeerherding (a system of actions)
* +Sem/Drink = Drink
* +Sem/Dummytag = Dummytag
* +Sem/Edu = Educational event
* +Sem/Event = Event
* +Sem/Feat = Feature, like Árvu. (noe som man kan ha mye eller lite av, det kan være en skala og som er på en måte karakteriserende. (høyde, vekt, farge, kreativitet etc.)
* +Sem/Feat-phys = Physiological feature, ivdni, fárda
* +Sem/Feat-psych = Psychological feauture
* +Sem/Feat-measr = Psychological feauture
* +Sem/Fem = Female name
* +Sem/Food = Food
* +Sem/Food-med = Medicine
* +Sem/Fruit = Fruits, vegetables, seeds, nuts
* +Sem/Furn = Furniture
* +Sem/Game = Game
* +Sem/Geom = Geometrical object
* +Sem/Group = Animal or Human Group
* +Sem/Hum = Human
* +Sem/Hum-abstr = Human abstract
* +Sem/Hum-prof = Human professional
* +Sem/Ideol = Ideology
* +Sem/ID = ID
* +Sem/Lang = Language
* +Sem/Mal = Male name
* +Sem/Mat = Material for producing things
* +Sem/Measr = Measure
* +Sem/Money = Has to do with money, like wages, not Curr(ency)
* +Sem/Obj = Object
* +Sem/Obj-clo = Cloth
* +Sem/Obj-cogn = Cloth
* +Sem/Obj-el = (Electrical) machine or apparatus
* +Sem/Obj-ling = Object with something written on it
* +Sem/Obj-rope = flexible ropelike object
* +Sem/Obj-surfc = Surface object
* +Sem/Org = Organisation
* +Sem/Part = Feature, oassi, bealli
* Perc = (perception) er noe man kan kjenne i en begrensa periode og som er forårsaka av noe utenifra, f.eks. Mus lea ballu. Mus lea bavččas.
* +Sem/Perc-cogn =
* +Sem/Perc-emo = Emotional perception
* +Sem/Perc-phys = Physical perception
* +Sem/Perc-psych = Psychological perception
* +Sem/Phonenr = Telephone number
* +Sem/Plant = Plant
* +Sem/Plantpart = Plant part
* +Sem/Plc = Place
* +Sem/Plc-abstr = Abstract place
* +Sem/Plc-elevate = Place
* +Sem/Plc-line = Place
* +Sem/Plc-water = Place
* +Sem/Pos = Position (as in social position job)
* +Sem/Process = Process
* +Sem/Prod = Product
* +Sem/Prod-audio = Audio product
* +Sem/Prod-cogn = Cognition product
* +Sem/Prod-ling = Linguistic product
* +Sem/Prod-vis = Visual product
* +Sem/Rel = Relation
* +Sem/Route = Route
* +Sem/Rule = Rule or convention
* +Sem/Semcon = Semantic concept
* +Sem/Sign = Sign (e.g. numbers, punctuation)
* +Sem/Sport = Sport
* +Sem/State =
* +Sem/State-sick = Illness
* +Sem/Substnc = Substance, like Air and Water
* +Sem/Sur = Surname
* +Sem/Symbol = Symbol
* +Sem/Time = Time
* +Sem/Time-clock = Time clock
* +Sem/Tool = Prototypical tool for repairing things
* +Sem/Tool-catch = Tool used for catching (e.g. fish)
* +Sem/Tool-clean = Tool used for cleaning
* +Sem/Tool-it = Tool used in IT
* +Sem/Tool-measr = Tool used for measuring
* +Sem/Tool-music = Music instrument
* +Sem/Tool-write = Writing tool
* +Sem/Txt = Text (girji, lávlla...)
* +Sem/Veh = Vehicle
* +Sem/Wpn = Weapon
* +Sem/Wthr = The Weather or the state of ground
* +Sem/Year - year (i.e. 1000 - 2999), used only for numerals

## Multiple Semantic tags:
* +Sem/Act_Fruit
* +Sem/Act_Group Activity and Group
* +Sem/Act_Hum Activity and Human
* +Sem/Act_Plc   A persons job is an activity, and a place as well
* +Sem/Act_Route Activity and Route, ie johtolat
* +Sem/Act_Tool-it
* **+Sem/Amount_Build**   Amount and Building
* +Sem/Amount_Semcon
* +Sem/Ani_Body-abstr_Hum
* +Sem/Ani_Build
* +Sem/Ani_Buildpart
* +Sem/Ani_Build_Hum_Txt
* +Sem/Ani-fish
* +Sem/Ani_Group
* +Sem/Ani_Group_Hum
* +Sem/Ani_Group_Prod-vis
* +Sem/Ani_Hum
* +Sem/Ani_Hum_Plc
* +Sem/Ani_Hum_Time
* +Sem/Ani_Plc
* +Sem/Ani_Plc_Txt
* +Sem/Ani_Time
* +Sem/Ani_Veh
* +Sem/Aniprod_Hum
* +Sem/Aniprod_Obj-clo
* +Sem/Aniprod_Perc-phys
* +Sem/Aniprod_Plc
* +Sem/Aniprod_Plc_Route
* +Sem/Body-abstr_Feat-psych
* +Sem/Body-abstr_Prod-audio_Semcon
* +Sem/Body_Body-abstr
* +Sem/Body_Clth
* +Sem/Body_Food
* +Sem/Body_Group_Hum
* +Sem/Body_Group_Hum_Time
* +Sem/Body_Hum
* +Sem/Body_Mat
* +Sem/Body_Measr
* +Sem/Body_Obj_Tool-catch
* +Sem/Body_Plc
* +Sem/Body_Plc-elevate
* +Sem/Body_Time
* +Sem/Build_Clthpart
* +Sem/Build_Edu_Org
* +Sem/Build_Event_Org
* +Sem/Build_Obj
* +Sem/Build_Org
* +Sem/Build_Route
* +Sem/Build-room_Cat_Ctain_Mat
* +Sem/Buildpart_Cat
* +Sem/Buildpart_Cat_Ctain
* +Sem/Buildpart_Cat_Ctain_Mat
* +Sem/Buildpart_Ctain
* +Sem/Buildpart_Ctain_Mat
* +Sem/Buildpart_Ctain_Obj
* +Sem/Cat_Group_Hum
* +Sem/Cat_Group_Hum_Plc
* +Sem/Cat_Edu
* +Sem/Cat_Obj
* +Sem/Clth-jewl_Curr
* +Sem/Clth-jewl_Curr_Obj
* +Sem/Clth-jewl_Curr_Obj_Org
* +Sem/Clth-jewl_Fruit
* +Sem/Clth-jewl_Money
* +Sem/Clth-jewl_Plant
* +Sem/Clth_Hum
* +Sem/Clth_Obj-clo
* +Sem/Ctain-abstr_Org
* +Sem/Ctain-clth_Plant
* +Sem/Ctain-clth_Veh
* +Sem/Ctain_Feat-phys
* +Sem/Ctain_Furn
* +Sem/Ctain_Plc
* +Sem/Ctain_Tool
* +Sem/Ctain_Tool-measr
* +Sem/Curr_Org
* +Sem/Dance_Org
* +Sem/Dance_Prod-audio
* +Sem/Domain_Food-med
* +Sem/Domain_Hum
* +Sem/Domain_Prod-audio
* +Sem/Drink_Plant
* +Sem/Edu_Event
* +Sem/Edu_Geom
* +Sem/Edu_Group_Hum
* +Sem/Edu_Hum
* +Sem/Edu_Mat
* +Sem/Edu_Org
* +Sem/Event_Food
* +Sem/Event_Hum
* +Sem/Event_Plc
* +Sem/Event_Plc-elevate
* +Sem/Event_Time
* +Sem/Feat-measr_Plc
* +Sem/Feat-phys_Tool-write
* +Sem/Feat-phys_Veh
* +Sem/Feat-phys_Wthr
* +Sem/Feat-psych_Hum
* +Sem/Feat-psych_Plc
* +Sem/Food_Obj-surfc
* +Sem/Feat_Plant
* +Sem/Food_Perc-phys
* +Sem/Food_Plant
* +Sem/Food_Sign
* +Sem/Fruit_Hum
* +Sem/Game_Obj-play
* +Sem/Geom_Hum_Plc
* +Sem/Geom_Obj
* +Sem/Group_Hum
* +Sem/Group_Hum_Org
* +Sem/Group_Hum_Plc
* +Sem/Group_Hum_Plc-abstr
* +Sem/Group_Hum_Prod-vis
* +Sem/Group_Hum_Time
* +Sem/Group_Org
* +Sem/Group_Prod-vis
* +Sem/Group_Sign
* +Sem/Group_Txt
* +Sem/Hum_Lang
* +Sem/Hum_Lang_Plc
* +Sem/Hum_Lang_Time
* +Sem/Hum_Mat_Tool
* +Sem/Hum_Obj
* +Sem/Hum_Org
* +Sem/Hum_Part
* +Sem/Hum_Plant
* +Sem/Hum_Plc
* +Sem/Hum_Sign
* +Sem/Hum_Tool
* +Sem/Hum_Tool-it = Human
* +Sem/Hum_Veh
* +Sem/Hum_Wthr
* +Sem/Lang_Tool
* +Sem/Mat_Plant
* +Sem/Mat_Txt
* +Sem/Measr_Obj_Time
* +Sem/Measr_Sign = Sign (e.g. numbers, punctuation)
* +Sem/Measr_Time
* +Sem/Money_Obj
* +Sem/Money_Org
* +Sem/Money_Part
* +Sem/Money_Txt
* +Sem/Obj-play
* +Sem/Obj-play_Sport
* +Sem/Obj_Semcon
* +Sem/Obj_Sign
* +Sem/Obj_Veh
* +Sem/Clth-jewl_Org
* +Sem/Obj_Symbol
* +Sem/Org_Rule
* +Sem/Org_Buildpart 
* +Sem/Org_Txt
* +Sem/Org_Veh
* +Sem/Part_Prod-cogn
* +Sem/Part_Substnc
* +Sem/Perc-emo_Wthr
* +Sem/Plant_Plantpart
* +Sem/Plant_Tool
* +Sem/Plant_Tool-measr
* +Sem/Plc-abstr_Rel_State
* +Sem/Plc-abstr_Route
* +Sem/Plc_Pos
* +Sem/Plc_Route
* +Sem/Plc_Semcon
* +Sem/Plc_State
* +Sem/Plc_Substnc
* +Sem/Plc_Substnc_Wthr
* +Sem/Plc_Time
* +Sem/Plc_Tool-catch
* +Sem/Plc_Txt
* +Sem/Plc_Wthr
* +Sem/Prod-audio_Txt
* +Sem/Prod-cogn_Txt
* +Sem/Semcon_Txt
* +Sem/Obj_State
* +Sem/Substnc_Wthr
* +Sem/Plc_Time_Wthr
* +Sem/Time_Wthr
* +Sem/State-sick_Substnc
* +Sem/Obj-ling_Obj-surfc
* +Sem/Org_Prod-audio
* +Sem/Org_Prod-cogn
* +Sem/Org_Prod-vis

* **+Allegro** from LEXICON GOADE-IU-

# Tags for derivation

Explanation:
- Combinations 1, 2, 3, 1+2, 2+3, 1+3, 1+2+3 are ok, all other ones are blocked.
- The suffixes marked as +Der1+Der2 to the right cannot combine with Der2, they
have already "saturated" their Der2-part.
- Phonotactically, Der1 are initial consonants C, Der2 are VCV, and
Der2 are of a different kind, more like compounding.
- This whole Der123 business is to prevent back-derivation of
boahtigoahtijuvvohallat and the like.
- Computationally, the `+Der1` etc tags are replaced with flag diacritics blocking
forbidden combinations.

## Positional derivational tags

| `+Der1` | `+Der2` | `+Der3` | `+Der4` | POS transition | Comments |
|:------- |:------- |:------- |:------- |:--------------:|:-------- |
| `+Der/Dimin` |  |  |  | NN | (was: Der/aš & Der/š)
| `+Der/lasj` |  |  |  | NA | 
| `+Der/meahttun` |  |  |  | VA | 
| `+Der/d` |  |  |  | VV | 
| `+Der/h` |  |  |  | VV | - -hit/Causative
| `+Der/Caus` |  |  |  | VV | - -ahtti/Causative
| `+Der/huhtti` |  |  |  | VV | 
| `+Der/l` |  |  |  | VV | 
| `+Der/st` |  |  |  | VV | 
| `+Der/las` |  |  |  | VA | * +Der1+Der2 - can only combine with Der3
| `+Der/Car` |  |  |  | NA | * +Der1+Der2 - can only combine with Der3
| `+Der/laakan` |  |  |  | AA | * +Der1+Der2 - can only combine with Der3
| `+Der/halla` |  |  |  | VV | * +Der1+Der2 - can only combine with Der3
| `+Der/huvva` |  |  |  | VV | * +Der1+Der2 - can only combine with Der3
| `+Der/stuvva` |  |  |  | VV | * +Der1+Der2 - can only combine with Der3
| `+Der/PassS` |  |  |  | VV | - short passive
|  | `+Der/t` |  |  | NA
|  | `+Der/ár` |  |  | ACRO>N
|  | `+Der/NomAg` |  |  | VN
|  | `+Der/NomAct` |  |  | VN | Der/NomAct har to realisasjonar, med ulike restriksjonar, this is previous Der/eapmi
|  | `+Der/sasj` |  |  | NA
|  | `+Der/adda` |  |  | VV
|  | `+Der/alla` |  |  | VV
|  | `+Der/AAdv` |  |  | QA | check this!
|  | `+Der/easti` |  |  | VV
|  | `+Der/laagasj` |  |  | QA
|  | `+Der/Comp` |  |  | AA
|  | `+Der/Superl` |  |  | AA
|  |  | `+Der/PassL` |  | VV | long passive
|  |  | `+Der/vuota` |  | AN
|  |  |  | `+Der/InchL` | VV
|  |  |  | `+Der/amoš` | VN
|  |  |  | `+Der/eamoš` | VN
|  |  |  | `+Der/geahtes` | VA
|  |  |  | `+Der/keahtta` | VA
|  |  |  | `+Der/muš` | VN
|  |  |  | `+Der/supmi` | VN
|  |  |  | `+Der/upmi` | VN

## Non-positional derivations
All non-positional derivations should be preceded by the following tag, to make it possible
to target regular expressions at all derivations in a language-independent way:
just specify `+Der|+Der1 .. +Der4` and you are set.

| Tag | POS transition | Comment |
|:--- |:--------------:|:------- |
| `+Der` |   n/a   | generic derivation tag used in front of all non-positional derivations.
| `+Der/veara` | NA#     |
| `+Der/viđá` | NA#     |
| `+Der/viđi` | NA#     |
| `+Der/has` | ?       | only one in the code

## Miscellanious list
See lexicons NAMAT and SAS for these:

* **+Der/A** = Adjective derivated from Noun or Verb
* **+Der/Adv** = Adverb derivated from Adjective

# Tags for originating language

The following tags are used to guide conversion to IPA: loan words
and foreign names are usually pronounced (approximately) as in the
originating (majority) language. Instead of trying to identify the
correct pronunciation based on phonotactics (orthotactics actually),
we tag all words that can't be correctly transcribed using the SME
transcriber with source language codes. Once tagged, it is possible
to split the lexical transducer in smaller ones according to langu-
age, and apply different IPA conversion to each of them.
The principle of tagging is that we only tag to the extent needed,
and following a priority:
1. any untagged word is pronounced with SME orthographic conventions
1. NNO and NOB have identical pronunciation, NNO is only used if
different in spelling from NOB
1. SWE has mostly the same pronunciation as NOB, and is only used
if different in spelling from NOB
1. Occasionally even SME (the default) may be tagged, to block other
languages from being specified, mainly during semi-automatic
language tagging sessions
All in all, we want to get as much correctly transcribed to IPA
with as little work as possible. On the other hand, if more words
are tagged than strictly needed, this should pose no problem as
long as the IPA conversion is correct - at least some words will
get the same pronunciation whether read as SME or NOB/NNO/SWE.

* **+OLang/SME** = North Sámi
* **+OLang/SMJ** = Lule Sámi
* **+OLang/SMA** = South Sámi
* **+OLang/FIN** = Finnish
* **+OLang/SWE** = Swedish
* **+OLang/NOB** = Norw. bokmål
* **+OLang/NNO** = Norw. nynorsk
* **+OLang/ENG** = English
* **+OLang/RUS** = Russian
* **+OLang/UND** = Undefined
* **+OLang/PARA** = parallelle navn, navnet skal ikke overføres til andre samisk språk

## Triggers for morphophonological rules

* **X1** = Diphthong Simplification, Metaphony
* **X2** = Diphthong Simplification, Metaphony, Word Final Neutralization of g8, h8, m8
* **X3** = Diphthong Simplification, Metaphony
* **X4** = WeG, Vowel Shortening, Stem vowel alternations, Word Final Deletion of n8 m8 g8 h8
* **X5** = WeG, Diphthong Simplification, Stem vowel alternations
* **X6** = WeG, Diphthong Simplification, Metaphony, Word Final Deletion of n8 m8 g8 h8
* **X7** = Vowel Shortening, Stem vowel alternations, Word Final Neutralization of g8, h8, m8
* **X8** = WeG, Vowel Shortening, Metaphony, Stem Vowel alternations, Word Final Deletion of n8 m8 g8 h8
* **X9** = WeG, Dipthtong simplification, Word Final Deletion of n8 m8 g8 h8
* **Y1** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y2** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y3** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y4** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y5** = Lengthening of Central Consonants, Word Final Consonant Deletion, Diphthong Simplification, Stem vowel alternations
* **Y6** = Lengthening of Central Consonants, Word Final Consonant Deletion, Diphthong Simplification, Stem vowel alternations
* **Y7** = Lengthening of Central Consonants, Diphthong Simplification, Stem vowel alternations
* **Y8** = Not in use
* **Y9** = Lengthening of Central Consonants, Diphthong Simplification
* **Q1** = Stem vowel alternations,
* **Q2** = Diphthong Simplification, Stem vowel alternations,
* **Q3** = Diphthong Simplification, Stem vowel alternations,
* **Q4** = WeG, Stem vowel alternations,
* **Q5** = WeG, Diphthong Simplification, Stem vowel alternations,
* **Q6** = WeG, Vowel shortening,
* **Q7** = WeG, Diphthong Simplification, Metaphony,
* **Q8** = WeG, Diphthong Simplification, Stem vowel alternations,
* **Q9** = Not in use
* **W1** = WeG, Vowel Shortening
* **W2** = Vowel Shortening,
* **W3** = Stem vowel deletion in compounding,
* **W4** = WeG, Word Final Cluster Simplification, Optional vowel-shortening, Word Final Deletion of n8 m8 g8 h8
* **W5** = WeG, Diphthong Simplification, Stem vowel alternations
* **W6** = Stem vowel alternations, WeG,
* **W7** = Stem vowel alternations, WeG
* **W8** = Stem vowel alternations,
* **W9** = Not in use
* **%^DISIMP** = diphthong simpification

## Morphophonemes and Sámi letters

* **b9** = twol rule override, so that b doesn't turn into t infront of hash
* **e7** = shortened i = "e with dot below" from the dictionary
* **e9** = twol rule override, so that e doesn't turn into i infront of j
* **d9** = twol rule override, so that d doesn't turn into t infront of hash
* **g8** = Word Final Neutralization and Deletion
* **g9** = twol rule override, so that g doesn't turn into t infront of hash
* **h7** =
* **h8** = Word Final Neutralization and Deletion
* **h9** = twol rule override, so that h doesn't turn into t infront of hash
* **i7** = twol rule override, so that i doesn't turn into e in certain contextes
* **j9** = twol rule override, so that j doesn't turn into i after i
* **k9** = twol rule override, so that k doesn't turn into t infront of hash
* **m8** = Word Final Neutralization and Deletion
* **m9** = twol rule override, so that m doesn't turn into n infront of hash
* **n8** = Word Final Neutralization and Deletion
* **n9** = twol rule override,
* **o7** = shortened u = "o with dot below" from the dictionary
* **o9** = twol rule override,  so that o doesn't turn into u infront of j
* **p9** = twol rule override, so that p doesn't turn into t infront of hash
* **s9** = twol rule override, so that we can have two ss in front of hash
* **t9** = twol rule override, so that we can have st in front of hash
* **u7** =
* **z9** = twol rule override, to avoid Word Final Consonant Neutralization
* **ž9** = twol rule override, to avoid Word Final Consonant Neutralization
* **š9** = twol rule override, so that we can have two šš in front of hash
* **r9** =
* **æ7** = in smi, for lulesámi
* **u6** = twol rule override, so that u doesn't turn into o in certain contextes
* **æ9** = in smi, for lulesámi

**∑** = a symbol used in front of `#` to block backtracking and
mwe reanalysis in hfst-tokenise (e.g. in dynanic compounds).
Makes it possible to distinguish lexical and dynamic compounds
in rules. It is converted to zero together with `#`.

## Symbols that need to be escaped on the lower side (towards twolc):

* »
* «
* > (escaped with square brackets, to avoid collision with > as morpheme boundary)
* < (escaped with square brackets, to avoid collision with < as morpheme boundary)
* #

# Flag diacritics
We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:

| Flag | Explanation
| ---- | -----------
|  @P.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
|  @D.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
|  @C.NeedNoun@ | (Dis)allow compounds with verbs unless nominalised
|  @P.Vgen.add@ | (Dis)allow VGen
|  @R.Vgen.add@ | (Dis)allow VGen
|  @P.12p.add@ | (Dis)allow 1. and 2. pers forms
|  @R.12p.add@ | (Dis)allow 1. and 2. pers forms
|  @P.Pmatch.Loc@ | Used on multi-token analyses; tell hfst-tokenise/pmatch where in the form/analysis the token should be split.
|  @P.Pmatch.Backtrack@ | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)

| Flag | Explanation
| ---- | -----------
|  @D.ErrOrth.ON@
|  @C.ErrOrth@
|  @P.ErrOrth.ON@
|  @R.ErrOrth.ON@

For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.

| Flag | Explanation
| ---- | -----------
|  @P.CmpFrst.FALSE@ | Require that words tagged as such only appear first
|  @D.CmpPref.TRUE@ | Block such words from entering ENDLEX
|  @P.CmpPref.FALSE@ | Block these words from making further compounds
|  @D.CmpLast.TRUE@ | Block such words from entering R
|  @D.CmpNone.TRUE@ | Combines with the next tag to prohibit compounding
|  @U.CmpNone.FALSE@ | Combines with the prev tag to prohibit compounding
|  @U.CmpNone.TRUE@ | Combines with the two previous ones to block compounding
|  @P.CmpOnly.TRUE@ | Sets a flag to indicate that the word has passed R
|  @D.CmpOnly.FALSE@ | Disallow words coming directly from root.
|  @D.CmpHyph.TRUE@ | Flag to control hyphenated compounds like proper nouns
|  @U.CmpHyph.FALSE@ | Flag to control hyphenated compounds like proper nouns
|  @U.CmpHyph.TRUE@ | Flag to control hyphenated compounds like proper nouns
|  @C.CmpHyph@ | Flag to control hyphenated compounds like proper nouns

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.

| Flag | Explanation
| ---- | -----------
|  @U.Cap.Obl@ | Allowing downcasing of derived names: deatnulasj.
|  @U.Cap.Opt@ | Allowing downcasing of derived names: deatnulasj.

* **@U.NeedsVowRed.OFF@** is used to force hyphenation/non-reduction: samediggi-
* **@U.NeedsVowRed.ON@** is used to force reduction w/o hyphen: samedigge#xxx
* **@C.NeedsVowRed@** Clearing this feature, so that it doesn't interfere with further compounding

* @C.Px@
* @C.Nom3Px@
* @P.Px.add@
* @R.Px.add@
* @P.Px.block@
* @D.Px.block@
* @P.Nom12Px.add@
* @R.Nom12Px.add@
* @P.Nom3Px.add@
* @R.Nom3Px.add@

* **@R.SpellRlx.ON@** Flag used to tag spell-relax-analysed strings (and only those).
* **@D.SpellRlx.ON@** Flag used to tag spell-relax-analysed strings (and only those).
* **@C.SpellRlx@** Flag used to tag spell-relax-analysed strings (and only those).

* **@R.SpaceCmp.ON@** Flag to tag compounds written with a space
* **@D.SpaceCmp.ON@** Flag to tag compounds written with a space
* **@C.SpaceCmp@** Flag to tag compounds written with a space+

# Basic lexica, pointing to the other lexicon files

* **LEXICON Root** is the basic lexicon starting everything

**Abbreviation**

* **LEXICON Acronym**

* **LEXICON ProperNoun**

Lexicon ENDLEX
And this is the ENDLEX of everything:

@D.CmpOnly.FALSE@@D.CmpPref.TRUE@@D.NeedNoun.ON@ ENDLEX2 ;

The `@D.CmpOnly.FALSE@` flag diacritic is used to disallow words tagged
with +CmpNP/Only to end here.
The `@D.NeedNoun.ON@` flag diacritic is used to block illegal compounds.

**ENDLEX2**

**ENDLEX3**

**ENDLEX4**

* * *

<small>This (part of) documentation was generated from [src/fst/root.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/root.lexc)</small>

---


# North Sámi adjective lexicon

* **LEXICON LEXATTR  ** This lexicon is here to give the tags to the compounding

* **LEXICON At    ** gives +A+Attr and directs to K

* **LEXICON PrfPrc ** Gives +A+Attr and Sg/Pl Nom and directs to K

* **LEXICON FINJU- ** compounds only, directs to Rreal and NAMAT

* **LEXICON ALIT ** Both second-part compound and independent adj.
čáhppesalit bábir, alit bábir

* **LEXICON Eahpe_Adjective ** is a long list of lexicalised eahpe-prefixed adjs

* **LEXICON NomActVEARA ** hardcoded postposition frases with veara, for speller

* **LEXICON Adjective ** is the main adjective list

* **LEXICON AdjectivePx ** Px-forms are restricted to this lexicon
Move adjs that may take Px from **Adjective** to this lexicon.

* **LEXICON AdjectiveNoPx ** is the main adjective list, not taking Px

* * *

<small>This (part of) documentation was generated from [src/fst/stems/adjectives.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/adjectives.lexc)</small>

---


North Saami adposition lexicon

First come the 3 continuation lexica, the division is based on Nickel
and should probably be revised. Then comes the adpositions themselves.
The uninflecting ones are pointed to the 3 tag lexica, the Px ones to the
Px lexica in sme-lex.txt and closed-sme-lex.txt.

* **LEXICON Pp   ** gives both +Po and +Pr

* **LEXICON Pp-Err   ** gives both +Po and +Pr

* **LEXICON Postp   ** gives +Po

* **LEXICON Postp-Err   ** gives +Po

* **LEXICON Prep   ** gives +Pr

* **LEXICON Prep-Err   ** gives +Pr

* **LEXICON Adposition   ** is the lexicon with the adpositions

* * *

<small>This (part of) documentation was generated from [src/fst/stems/adpositions.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/adpositions.lexc)</small>

---


# North Saami adverbs

* **LEXICON Adverb   **

First comes some multiword adverbs, declared as MWE in tok.txt
Of these, the ones going to adv are not treated as MWE in
abbr.txt and preprocess, whereas the ones going to
multiadv are treated as one unit in the syntax.
There are only a handful of words in the multiadv lexicon,
they are the ones that are mentioned in sme-dis.rle.
Goal: have mwe adverbs with syntactic behaviour as single
words going to multiadv.

Thereafter comes the ordinary adverb list.

Then comes the gradating advs

* type 1

* type 2a

* type 2b

* 2c

* 2d

* type 3a

* type 3b

* type 3c

Lexica for adverb subtypes

* **LEXICON LADJE     **

* **LEXICON DIHTE     **

* **LEXICON LAGAadv   **

* **LEXICON LAGAIDadv   **

* **LEXICON LEBBUIplc   **

* **LEXICON LEAPPOSplc   **

* **LEXICON gadv   **  adv that can form compounds

* **LEXICON gadv-plc   **  adv that can form compounds

* **LEXICON IL-adv-plc   **

* **LEXICON IL-adv-time   **

* **LEXICON LAS-adv   **

* **LEXICON LAS-adv-plc   **

* **LEXICON LAS-adv-time   **

* **LEXICON adv-plc   **

* **LEXICON adv-time   **

* **LEXICON adv-time-plc   **

* **LEXICON CSadv   **

* **LEXICON CSadvFoc/Neg-ge   **

* **LEXICON adv-subqst   **

* **LEXICON adv-comp   **

* **LEXICON adv-sup   **

* **LEXICON adv-plc-comp   **

* **LEXICON adv-plc-sup   **

* **LEXICON adv-time-comp   **

* **LEXICON adv-time-sup   **

* **LEXICON COMPADV   **

* **LEXICON plc-SUPADVmus   **

* **LEXICON plc-SUPADVmusj   **

The main adverb lexicon
* **LEXICON adv   ** simply gives the tag +Adv and directs to K

* * *

<small>This (part of) documentation was generated from [src/fst/stems/adverbs.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/adverbs.lexc)</small>

---


# North Saami Conjunctions

* **LEXICON Conjunction   ** contains the list of conjunctions

* **LEXICON ConfuseConjunction ** contains conjunctions that are
  homonyms with words in the open POS's

* **LEXICON CleanConjunction ** contains conjunctions that are not
homonymous with any of the open POS's

* **LEXICON Cc-Conf  ** assigns the tag +CC and allows further grammar checker processing for disambiguation against nouns in potential compounds written apart

* * *

<small>This (part of) documentation was generated from [src/fst/stems/conjunctions.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/conjunctions.lexc)</small>

---


# North Saami Interjections

* **LEXICON Ij   ** is the lexicon giving the tag `+Interj` +
the tag `+Err/Lexc`.

* **LEXICON Ij-Norm ** is the lexicon giving the tag `+Interj`

* **LEXICON Interjection ** is the lexicon containing the list

* * *

<small>This (part of) documentation was generated from [src/fst/stems/interjections.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/interjections.lexc)</small>

---


#                     North Sámi noun lexicon                                !

* **LEXICON NounRoot  ** Main lexicon, dividing in HyphNouns and Noun

* **LEXICON MiddleNouns  ** is pointed to from R in compounds.lexc

* **LEXICON HyphNouns  ** is pointed to from NounRoot above

* **LEXICON FirstComponent  ** is pointed to from Noun below

* **LEXICON Eahpe_Noun  **

* **LEXICON NAMATLAGANLAGASCont  ** gives »»» and directs to NAMATCont

* **LEXICON SASCont ** FROM NUMERALS, gives -kilosaš etc.

* **LEXICON DER-SAS ** gets Der/sasj and points to AHKASAS

* **LEXICON Noun  ** dividing in NounNoPx, NounPx (with a P.Px.add flag)  and NounPxKin (with a P.Nom3Px.add flag)
 *                           NounNoPx ;  default nouns, no px 
* @P.Px.add@                NounPx ;  nouns with px 
* @P.Px.add@@P.Nom3Px.add@  NounPxKin ;  kinship nouns with px 

* **LEXICON NounNoPx   ** here goes nouns not taking Px.

* **LEXICON NounPxKin  ** this is the noun lexicon for nouns which can have Px Nom 3. person, mostly kinshipterms

* **LEXICON NounPx  ** this is the main noun lexicon

* * *

<small>This (part of) documentation was generated from [src/fst/stems/nouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/nouns.lexc)</small>

---


# North Saami numerals

## The initial lexica

* **LEXICON Numeral**  initial lexica

The **LEXICON CmpNumeral**  lexicon is the entrance for compounds
with numbers. Introduced to restrict such compounding
to a subgroup of numerals only, mainly to exclude
roman numerals, that turned out to be too problematic.
With this change, roman numerals are only recognised
on their own.

* **LEXICON MILJON**  miljons and miljards

* **LEXICON OVERDUHAT** for the numerals over 1000.

* **LEXICON O-OKTAF** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON O-2TO9F** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON 1TO9DUHAT**

* **LEXICON O-JUSTLOGIF** This lexicon is for the number 10 000 only. it is separated from the rest to avoid forms like *logivihttaduhát, etc.

* **LEXICON O-LOGIF** this lexicon is accessed only via other O-lexica, and not directly from OVERDUHAT. Thus, *logivihttaduhát, etc. is avoided.

* **LEXICON O-2TO9LOG** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON O-NUPPELOT**  Teens of thousands

* **LEXICON O-NL**

* **LEXICON O-NUPPELOHKAI**

* **LEXICON O-CUODI** Hundreds of thousands

* **LEXICON O-2TO9CUO**

* **LEXICON O-GCUO**

* **LEXICON DUHAT**

* **LEXICON JUSTDUHAT** for numerals going via 1000

* **LEXICON OLD** for the old counting thirteen hundred etc.

* **LEXICON NLX**

* **LEXICON NUPPELOHKAICUODI**

* **LEXICON UNDERDUHAT**  the numerals under 1000

* **LEXICON ONLY_CMP**

* **LEXICON OKTAF**

* **LEXICON 2TO9F**

* **LEXICON 11TO99F**

* **LEXICON BARELOGIF**

* **LEXICON LOHKI**

* **LEXICON 2TO9LOG**

* **LEXICON 21TO99**

* **LEXICON 111TO119**

* **LEXICON CUODI**

* **LEXICON 2TO9CUO**

* **LEXICON GCUODI**

* **LEXICON 1TO9CUODI**

* **LEXICON NUPPELOGIS**

* **LEXICON LOHKAI-END**

* **LEXICON ARABICCOMPOUNDS**  ! arabic as first part,

* **LEXICON NUMERALCOMPOUNDS**: numeral as first part: duhatjienat,
logigielat, etc.

* **LEXICON SAS** gives :»»» and goes to SASCont

* **LEXICON num-ordinal** Ordinal numbers

* **LEXICON num-ordinal-1** Ordinal numbers vuosttas, vuosttaš

* **LEXICON num-ordinal-2to9** Ordinal numbers, 2 to 20, even though the name implies differenty

* **LEXICON VUOSTTAS**

* **LEXICON num-collective** Collective numerals

* **LEXICON num-imprecise** Imprecise numbers

# Arabic numerals

Arabic numeral expressions can be classified in at least the following categories:
* **general numeric expressions: 123 456,789 - note**:  space as thousand separator, groups of three digits
* **accounting numeric expressions: 123.456,789 - note**:  full stop as thousands separator, groups of three digits
* **numeric range expressions**:  12-14 - can be dates, times, lengths, masses and other sorts of measurements
* **measurements**:  123 kg
* **dates**:  2.4.1999, 4.5., 7.8.02, 04.10.2016
* **times: 12**: 34
* **money amounts**:  kr 1234,56
* **temperature**:  –8°C, 256°K, 100°F

And for sure more than these. Previously everything has been more or less
lumped together, but to avoid noise and to get better input for grammar
checking the ARABICS section should be rewritten such that each category
gets its own lexicon. That way it is easier to restrict the syntax of
numerical expressions in each category.

* **LEXICON ONLY_OKTA**

* **LEXICON LOGIF**

* **LEXICON NUPPELOHKAI**

* **LEXICON GOLBMALOGIOKTA**

* **LEXICON GAVCCILOGIOKTA**

* **LEXICON GUOKTELOGIOKTA**

* **LEXICON VIHTTALOGIOKTA**

* **LEXICON GOLBMALOGIGUOKTE**

* **LEXICON GAVCCILOGIGUOKTE**

* **LEXICON GUOKTELOGIGUOKTE**

* **LEXICON VIHTTALOGIGUOKTE**

* **LEXICON GOLBMALOGIGOLBMA**

* **LEXICON GAVCCILOGIGOLBMA**

* **LEXICON GUOKTELOGIGOLBMA**

* **LEXICON VIHTTALOGIGOLBMA**

* **LEXICON GOLBMALOGINJEALLJE**

* **LEXICON GAVCCILOGINJEALLJE**

* **LEXICON GUOKTELOGINJEALLJE**

* **LEXICON VIHTTALOGINJEALLJE**

* **LEXICON GOLBMALOGIVIHTTA**

* **LEXICON GAVCCILOGIVIHTTA**

* **LEXICON GUOKTELOGIVIHTTA**

* **LEXICON VIHTTALOGIVIHTTA**

* **LEXICON GOLBMALOGIGUHTTA**

* **LEXICON GAVCCILOGIGUHTTA**

* **LEXICON GUOKTELOGIGUHTTA**

* **LEXICON VIHTTALOGIGUHTTA**

* **LEXICON GOLBMALOGICIEZA**

* **LEXICON GAVCCILOGICIEZA**

* **LEXICON GUOKTELOGICIEZA**

* **LEXICON VIHTTALOGICIEZA**

* **LEXICON GOLBMALOGIGAVCCI**

* **LEXICON GAVCCILOGIGAVCCI**

* **LEXICON GUOKTELOGIGAVCCI**

* **LEXICON VIHTTALOGIGAVCCI**

* **LEXICON GOLBMALOGIOVCCI**

* **LEXICON GAVCCILOGIOVCCI**

* **LEXICON GUOKTELOGIOVCCI**

* **LEXICON VIHTTALOGIOVCCI**

* * *

<small>This (part of) documentation was generated from [src/fst/stems/numerals.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/numerals.lexc)</small>

---


# This file contains the Particles

* **LEXICON Particles   ** gives all particles

* **LEXICON pcle   ** gives the tag +Pcle

* **LEXICON qpcle   ** gives two tags, +Pcle and +Qst

Perhaps this should be opened to  a direction to K
and all the ge versions should be removed.
(i.e. only goit, not goitge). This errouneously
permits gege, goge, etc., though, and we thus leave
things as they are.

* * *

<small>This (part of) documentation was generated from [src/fst/stems/particles.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/particles.lexc)</small>

---


# This file contains the Pronouns

* **LEXICON Pronoun   ** Points to all the pronoun subgrops

* **LEXICON Personal   ** , splitting in 1st, 2nd, 3rd

## Interrogative pronouns

Giving ideosyncratic Sg Nom of gii, mii lexically
Sending the oblique forms of gii, mii to an oblique sublexicon
Giving the stem of guhte, guhtemuš, goabbá

* **LEXICON Interrogative   **

## Relative pronouns

* **LEXICON Relative   **

## Demonstrative pronouns

## Giving baseform + all demonstrative stems
## Pointing to case paradigms

* **LEXICON Demonstrative   **

## Reflexive pronouns

Two nominative reflexives, and pointer to the rest
The Pl one is used for Du as well, here given two entries.
Should one of them be removed?

* **LEXICON Reflexive   **

## Reciprocal pronouns

The first 4 entries handle the first element of the recipr.
The next 12 handle the 2nd part of the non-Px recipr.
The members of the third section  point to Px lexica.

* **LEXICON Reciprocal   **

## Indefinite pronouns

Dividing the indefinites in three groups

* **LEXICON Indefinite   **

Declineable indefinite pronouns with case + clitic

* **LEXICON declindef-cl   **

Declineable indefinites with normal case paradigms

* **LEXICON declindef   **

Separate lexica for exceptional entries

* **LEXICON declindef-idiosync   **
separate lexica for these entries:
oktat

The indeclineable indefinites

* **LEXICON indeclindef   **

* * *

<small>This (part of) documentation was generated from [src/fst/stems/pronouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/pronouns.lexc)</small>

---


# File containing North Saami abbreviations

## Lexica for adding tags and periods

Splitting in 4 + 1 groups, because of the preprocessor

* **LEXICON Abbreviation-sme **
1. The ITRAB ;	   lexicon (intransitive abbrs)
1. The TRNUMAB ;  lexicon (abbrs trans wrt. numberals)
1. The TRAB ;	   lexicon (transitive abbrs)
1. The NOAB ;	   lexicon (not really abbrs)
1. The NUMNOAB ;  lexicon (not behaving as abbr before num)

## The abbreviation lexicon itself

* **LEXICON ITRAB ** are intransitive abbreviations, A.S. etc.

* **LEXICON NOAB ** du, gen, jur

This class contains homonyms, which are both intransitive
abbreviations and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentnece (when next word has small letters) can be
considered as true cases.

* **LEXICON TRNUMAB ** contains abbreviations who are transitive in front of numerals

For abbrs for which numerals are complements, but other
words not necessarily are. This group treats arabic numerals as
if it were transitive but letters as if it were intransitive.

* **LEXICON TRAB ** contains transitive abbreviations

This lexicon is for abbrs that always have a constituent following it.

* **LEXICON NUMNOAB ** su, dii

This class contains homonyms, which are both abbrs for
which numerals are complements and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentence can be considered as true cases.

* * *

<small>This (part of) documentation was generated from [src/fst/stems/sme-abbreviations.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/sme-abbreviations.lexc)</small>

---


# The North Saami proper noun lexicon

* **LEXICON Prefix-Proper   ** for first-part names

* **LEXICON ProperNoun-sme-nocomp   ** for no cmp without hyph

* * *

<small>This (part of) documentation was generated from [src/fst/stems/sme-propernouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/sme-propernouns.lexc)</small>

---


# Punctuation symbols

* **LEXICON Punctuation_SME   ** contains the list
of punctuation symbols that are problematic from a normative
point of view, and only those. Everything else is coming from
the standard Punctuation lexicon.

They are all tagged *+RIGHT* even though the correct quotation
mark is supposed to be used on both sides. This is done to simplify
generation, by keeping the same tagging as the standard analysis.

* * *

<small>This (part of) documentation was generated from [src/fst/stems/sme-punctuation.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/sme-punctuation.lexc)</small>

---


# The North Saami Subjunctions

* **LEXICON Subjunction   ** contains the list of subjunctions.

* **LEXICON ConfuseSubjunction ** contains subjunctions that are
  homonyms with words in the open POS's

* **LEXICON CleanSubjunction ** contains subjunctions that are not
homonymous with any of the open POS's

* **LEXICON Cs-Conf  ** assigns the tag +CC and allows further grammar checker processing for disambiguation against nouns in potential compounds written apart

* * *

<small>This (part of) documentation was generated from [src/fst/stems/subjunctions.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/subjunctions.lexc)</small>

---


# North Saami verbs

## Negative verbs

* **LEXICON Negativeverb  **

* **LEXICON negmood  **

* **LEXICON negind  **

* **LEXICON negimp  **

* **LEXICON negsup  **

## Copula

* **LEXICON Copula   ** Dividing into finite and infinite

* **LEXICON Finitecop   ** (Removed %>, they blocked diphtsim^pl)

* **LEXICON Prscop   **

* **LEXICON Prtcop   **

* **LEXICON Impcop  **

* **LEXICON Infinitecop  **

## Stray forms

* **LEXICON STRAYFORMS  ** (referred to from the main Verb lexicon)

* **LEXICON Eahpe_Verb  **

## Main verbs

Here comes the main list of verbs.

* **LEXICON Humsubj-VerbRoot   **

* * *

<small>This (part of) documentation was generated from [src/fst/stems/verbs.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/stems/verbs.lexc)</small>

---



retroflex plosive, voiceless		t`  ʈ	    0288, 648 (` = ASCII 096)
retroflex plosive, voiced		d`	ɖ		0256, 598
labiodental nasal				F 	ɱ		0271, 625
retroflex nasal					n` 	ɳ		0273, 627
palatal nasal					J 	ɲ		0272, 626
velar nasal						N 	ŋ		014B, 331
uvular nasal						N\	ɴ		0274, 628

bilabial trill					B\ 	ʙ		0299, 665
uvular trill						R\ 	ʀ		0280, 640
alveolar tap						4	ɾ		027E, 638
retroflex flap					r` 	ɽ		027D, 637
bilabial fricative, voiceless	p\ 	ɸ		0278, 632
bilabial fricative, voiced		B 	β		03B2, 946
dental fricative, voiceless		T 	θ		03B8, 952
dental fricative, voiced			D 	ð		00F0, 240
postalveolar fricative, voiceless	S	ʃ		0283, 643
postalveolar fricative, voiced		Z 	ʒ		0292, 658
retroflex fricative, voiceless		s` 	ʂ		0282, 642
retroflex fricative, voiced			z` 	ʐ		0290, 656
palatal fricative, voiceless			C 	ç		00E7, 231
palatal fricative, voiced			j\ 	ʝ		029D, 669
velar fricative, voiced	        	G 	ɣ		0263, 611
uvular fricative, voiceless			X	χ		03C7, 967
uvular fricative, voiced				R 	ʁ		0281, 641
pharyngeal fricative, voiceless		X\ 	ħ		0127, 295
pharyngeal fricative, voiced			?\ 	ʕ		0295, 661
glottal fricative, voiced			h\	ɦ		0266, 614

alveolar lateral fricative, vl.		K 
alveolar lateral fricative, vd.		K\

labiodental approximant				P (or v\) 
alveolar approximant					r\ 
retroflex approximant				r\` 
velar approximant					M\

retroflex lateral approximant		l` 
palatal lateral approximant			L 
velar lateral approximant			L\
Clicks

bilabial								O\	(O = capital letter) 
dental								|\
(post)alveolar						!\ 
palatoalveolar						=\ 
alveolar lateral						|\|\
Ejectives, implosives

ejective								_>	e.g. ejective p		p_>
implosive							_<	e.g. implosive b	b_<
Vowels

close back unrounded					M
close central unrounded 				1 
close central rounded				} 
lax i								I 
lax y								Y 
lax u								U

close-mid front rounded				2 
close-mid central unrounded			@\ 
close-mid central rounded			8 
close-mid back unrounded				7

schwa								@

open-mid front unrounded				E 
open-mid front rounded				9
open-mid central unrounded			3 
open-mid central rounded				3\ 
open-mid back unrounded				V 
open-mid back rounded				O

ash (ae digraph)						{ 
open schwa (turned a)				6

open front rounded					& 
open back unrounded	        		A 
open back rounded					Q
Other symbols

voiceless labial-velar fricative		W 
voiced labial-palatal approx.		H 
voiceless epiglottal fricative		H\ 
voiced epiglottal fricative			<\ 
epiglottal plosive					>\

alveolo-palatal fricative, vl. 		s\ 
alveolo-palatal fricative, voiced	z\ 
alveolar lateral flap				l\ 
simultaneous S and x					x\ 
tie bar								_
Suprasegmentals

primary stress						" 
secondary stress						% 
long									: 
half-long							:\ 
extra-short							_X 
linking mark							-\
Tones and word accents

level extra high						_T 
level high							_H
level mid							_M 
level low							_L 
level extra low						_B
downstep								! 
upstep								^	(caret, circumflex)

contour, rising						 
contour, falling						_F 
contour, high rising					_H_T 
contour, low rising					_B_L 

contour, rising-falling				_R_F 
(NB Instead of being written as diacritics with _, all prosodic marks can alternatively be placed in a separate tier, set off by < >, as recommended for the next two symbols.)
global rise				<R> 
global fall				<F>
Diacritics

voiceless				_0	(0 = figure), e.g. n_0
voiced					_v 
aspirated				_h 
more rounded				_O	(O = letter) 
less rounded				_c 
advanced					_+
retracted				_-
centralized				_" 
syllabic					=	(or _=) e.g. n= (or n_=) 
non-syllabic				_^ 
rhoticity				`

breathy voiced			_t 
creaky voiced			_k
linguolabial				_N 
labialized				_w 
palatalized				'	(or _j) e.g. t' (or t_j) 
velarized				_G 
pharyngealized			_?\

dental					_d 
apical					_a 
laminal					_m
nasalized				~	(or _~) e.g. A~ (or A_~) 
nasal release			_n
lateral release			_l 
no audible release		_}

velarized or pharyngealized		_e 
velarized l, alternatively		5 
raised							_r 
lowered							_o 
advanced tongue root				_A 
retracted tongue root			_q

* * *

<small>This (part of) documentation was generated from [src/phonetics/text2tts-fin.xfscript](https://github.com/giellalt/lang-sme/blob/main/src/phonetics/text2tts-fin.xfscript)</small>

---



retroflex plosive, voiceless		t`  ʈ	    0288, 648 (` = ASCII 096)
retroflex plosive, voiced		d`	ɖ		0256, 598
labiodental nasal				F 	ɱ		0271, 625
retroflex nasal					n` 	ɳ		0273, 627
palatal nasal					J 	ɲ		0272, 626
velar nasal						N 	ŋ		014B, 331
uvular nasal						N\	ɴ		0274, 628

bilabial trill					B\ 	ʙ		0299, 665
uvular trill						R\ 	ʀ		0280, 640
alveolar tap						4	ɾ		027E, 638
retroflex flap					r` 	ɽ		027D, 637
bilabial fricative, voiceless	p\ 	ɸ		0278, 632
bilabial fricative, voiced		B 	β		03B2, 946
dental fricative, voiceless		T 	θ		03B8, 952
dental fricative, voiced			D 	ð		00F0, 240
postalveolar fricative, voiceless	S	ʃ		0283, 643
postalveolar fricative, voiced		Z 	ʒ		0292, 658
retroflex fricative, voiceless		s` 	ʂ		0282, 642
retroflex fricative, voiced			z` 	ʐ		0290, 656
palatal fricative, voiceless			C 	ç		00E7, 231
palatal fricative, voiced			j\ 	ʝ		029D, 669
velar fricative, voiced	        	G 	ɣ		0263, 611
uvular fricative, voiceless			X	χ		03C7, 967
uvular fricative, voiced				R 	ʁ		0281, 641
pharyngeal fricative, voiceless		X\ 	ħ		0127, 295
pharyngeal fricative, voiced			?\ 	ʕ		0295, 661
glottal fricative, voiced			h\	ɦ		0266, 614

alveolar lateral fricative, vl.		K 
alveolar lateral fricative, vd.		K\

labiodental approximant				P (or v\) 
alveolar approximant					r\ 
retroflex approximant				r\` 
velar approximant					M\

retroflex lateral approximant		l` 
palatal lateral approximant			L 
velar lateral approximant			L\
Clicks

bilabial								O\	(O = capital letter) 
dental								|\
(post)alveolar						!\ 
palatoalveolar						=\ 
alveolar lateral						|\|\
Ejectives, implosives

ejective								_>	e.g. ejective p		p_>
implosive							_<	e.g. implosive b	b_<
Vowels

close back unrounded					M
close central unrounded 				1 
close central rounded				} 
lax i								I 
lax y								Y 
lax u								U

close-mid front rounded				2 
close-mid central unrounded			@\ 
close-mid central rounded			8 
close-mid back unrounded				7

schwa								@

open-mid front unrounded				E 
open-mid front rounded				9
open-mid central unrounded			3 
open-mid central rounded				3\ 
open-mid back unrounded				V 
open-mid back rounded				O

ash (ae digraph)						{ 
open schwa (turned a)				6

open front rounded					& 
open back unrounded	        		A 
open back rounded					Q
Other symbols

voiceless labial-velar fricative		W 
voiced labial-palatal approx.		H 
voiceless epiglottal fricative		H\ 
voiced epiglottal fricative			<\ 
epiglottal plosive					>\

alveolo-palatal fricative, vl. 		s\ 
alveolo-palatal fricative, voiced	z\ 
alveolar lateral flap				l\ 
simultaneous S and x					x\ 
tie bar								_
Suprasegmentals

primary stress						" 
secondary stress						% 
long									: 
half-long							:\ 
extra-short							_X 
linking mark							-\
Tones and word accents

level extra high						_T 
level high							_H
level mid							_M 
level low							_L 
level extra low						_B
downstep								! 
upstep								^	(caret, circumflex)

contour, rising						 
contour, falling						_F 
contour, high rising					_H_T 
contour, low rising					_B_L 

contour, rising-falling				_R_F 
(NB Instead of being written as diacritics with _, all prosodic marks can alternatively be placed in a separate tier, set off by < >, as recommended for the next two symbols.)
global rise				<R> 
global fall				<F>
Diacritics

voiceless				_0	(0 = figure), e.g. n_0
voiced					_v 
aspirated				_h 
more rounded				_O	(O = letter) 
less rounded				_c 
advanced					_+
retracted				_-
centralized				_" 
syllabic					=	(or _=) e.g. n= (or n_=) 
non-syllabic				_^ 
rhoticity				`

breathy voiced			_t 
creaky voiced			_k
linguolabial				_N 
labialized				_w 
palatalized				'	(or _j) e.g. t' (or t_j) 
velarized				_G 
pharyngealized			_?\

dental					_d 
apical					_a 
laminal					_m
nasalized				~	(or _~) e.g. A~ (or A_~) 
nasal release			_n
lateral release			_l 
no audible release		_}

velarized or pharyngealized		_e 
velarized l, alternatively		5 
raised							_r 
lowered							_o 
advanced tongue root				_A 
retracted tongue root			_q

* * *

<small>This (part of) documentation was generated from [src/phonetics/text2tts-nob.xfscript](https://github.com/giellalt/lang-sme/blob/main/src/phonetics/text2tts-nob.xfscript)</small>

---



retroflex plosive, voiceless		t`  ʈ	    0288, 648 (` = ASCII 096)
retroflex plosive, voiced		d`	ɖ		0256, 598
labiodental nasal				F 	ɱ		0271, 625
retroflex nasal					n` 	ɳ		0273, 627
palatal nasal					J 	ɲ		0272, 626
velar nasal						N 	ŋ		014B, 331
uvular nasal						N\	ɴ		0274, 628

bilabial trill					B\ 	ʙ		0299, 665
uvular trill						R\ 	ʀ		0280, 640
alveolar tap						4	ɾ		027E, 638
retroflex flap					r` 	ɽ		027D, 637
bilabial fricative, voiceless	p\ 	ɸ		0278, 632
bilabial fricative, voiced		B 	β		03B2, 946
dental fricative, voiceless		T 	θ		03B8, 952
dental fricative, voiced			D 	ð		00F0, 240
postalveolar fricative, voiceless	S	ʃ		0283, 643
postalveolar fricative, voiced		Z 	ʒ		0292, 658
retroflex fricative, voiceless		s` 	ʂ		0282, 642
retroflex fricative, voiced			z` 	ʐ		0290, 656
palatal fricative, voiceless			C 	ç		00E7, 231
palatal fricative, voiced			j\ 	ʝ		029D, 669
velar fricative, voiced	        	G 	ɣ		0263, 611
uvular fricative, voiceless			X	χ		03C7, 967
uvular fricative, voiced				R 	ʁ		0281, 641
pharyngeal fricative, voiceless		X\ 	ħ		0127, 295
pharyngeal fricative, voiced			?\ 	ʕ		0295, 661
glottal fricative, voiced			h\	ɦ		0266, 614

alveolar lateral fricative, vl.		K 
alveolar lateral fricative, vd.		K\

labiodental approximant				P (or v\) 
alveolar approximant					r\ 
retroflex approximant				r\` 
velar approximant					M\

retroflex lateral approximant		l` 
palatal lateral approximant			L 
velar lateral approximant			L\
Clicks

bilabial								O\	(O = capital letter) 
dental								|\
(post)alveolar						!\ 
palatoalveolar						=\ 
alveolar lateral						|\|\
Ejectives, implosives

ejective								_>	e.g. ejective p		p_>
implosive							_<	e.g. implosive b	b_<
Vowels

close back unrounded					M
close central unrounded 				1 
close central rounded				} 
lax i								I 
lax y								Y 
lax u								U

close-mid front rounded				2 
close-mid central unrounded			@\ 
close-mid central rounded			8 
close-mid back unrounded				7

schwa								@

open-mid front unrounded				E 
open-mid front rounded				9
open-mid central unrounded			3 
open-mid central rounded				3\ 
open-mid back unrounded				V 
open-mid back rounded				O

ash (ae digraph)						{ 
open schwa (turned a)				6

open front rounded					& 
open back unrounded	        		A 
open back rounded					Q
Other symbols

voiceless labial-velar fricative		W 
voiced labial-palatal approx.		H 
voiceless epiglottal fricative		H\ 
voiced epiglottal fricative			<\ 
epiglottal plosive					>\

alveolo-palatal fricative, vl. 		s\ 
alveolo-palatal fricative, voiced	z\ 
alveolar lateral flap				l\ 
simultaneous S and x					x\ 
tie bar								_
Suprasegmentals

primary stress						" 
secondary stress						% 
long									: 
half-long							:\ 
extra-short							_X 
linking mark							-\
Tones and word accents

level extra high						_T 
level high							_H
level mid							_M 
level low							_L 
level extra low						_B
downstep								! 
upstep								^	(caret, circumflex)

contour, rising						 
contour, falling						_F 
contour, high rising					_H_T 
contour, low rising					_B_L 

contour, rising-falling				_R_F 
(NB Instead of being written as diacritics with _, all prosodic marks can alternatively be placed in a separate tier, set off by < >, as recommended for the next two symbols.)
global rise				<R> 
global fall				<F>
Diacritics

voiceless				_0	(0 = figure), e.g. n_0
voiced					_v 
aspirated				_h 
more rounded				_O	(O = letter) 
less rounded				_c 
advanced					_+
retracted				_-
centralized				_" 
syllabic					=	(or _=) e.g. n= (or n_=) 
non-syllabic				_^ 
rhoticity				`

breathy voiced			_t 
creaky voiced			_k
linguolabial				_N 
labialized				_w 
palatalized				'	(or _j) e.g. t' (or t_j) 
velarized				_G 
pharyngealized			_?\

dental					_d 
apical					_a 
laminal					_m
nasalized				~	(or _~) e.g. A~ (or A_~) 
nasal release			_n
lateral release			_l 
no audible release		_}

velarized or pharyngealized		_e 
velarized l, alternatively		5 
raised							_r 
lowered							_o 
advanced tongue root				_A 
retracted tongue root			_q

* * *

<small>This (part of) documentation was generated from [src/phonetics/text2tts-sme.xfscript](https://github.com/giellalt/lang-sme/blob/main/src/phonetics/text2tts-sme.xfscript)</small>

---



retroflex plosive, voiceless		t`  ʈ	    0288, 648 (` = ASCII 096)
retroflex plosive, voiced		d`	ɖ		0256, 598
labiodental nasal				F 	ɱ		0271, 625
retroflex nasal					n` 	ɳ		0273, 627
palatal nasal					J 	ɲ		0272, 626
velar nasal						N 	ŋ		014B, 331
uvular nasal						N\	ɴ		0274, 628

bilabial trill					B\ 	ʙ		0299, 665
uvular trill						R\ 	ʀ		0280, 640
alveolar tap						4	ɾ		027E, 638
retroflex flap					r` 	ɽ		027D, 637
bilabial fricative, voiceless	p\ 	ɸ		0278, 632
bilabial fricative, voiced		B 	β		03B2, 946
dental fricative, voiceless		T 	θ		03B8, 952
dental fricative, voiced			D 	ð		00F0, 240
postalveolar fricative, voiceless	S	ʃ		0283, 643
postalveolar fricative, voiced		Z 	ʒ		0292, 658
retroflex fricative, voiceless		s` 	ʂ		0282, 642
retroflex fricative, voiced			z` 	ʐ		0290, 656
palatal fricative, voiceless			C 	ç		00E7, 231
palatal fricative, voiced			j\ 	ʝ		029D, 669
velar fricative, voiced	        	G 	ɣ		0263, 611
uvular fricative, voiceless			X	χ		03C7, 967
uvular fricative, voiced				R 	ʁ		0281, 641
pharyngeal fricative, voiceless		X\ 	ħ		0127, 295
pharyngeal fricative, voiced			?\ 	ʕ		0295, 661
glottal fricative, voiced			h\	ɦ		0266, 614

alveolar lateral fricative, vl.		K 
alveolar lateral fricative, vd.		K\

labiodental approximant				P (or v\) 
alveolar approximant					r\ 
retroflex approximant				r\` 
velar approximant					M\

retroflex lateral approximant		l` 
palatal lateral approximant			L 
velar lateral approximant			L\
Clicks

bilabial								O\	(O = capital letter) 
dental								|\
(post)alveolar						!\ 
palatoalveolar						=\ 
alveolar lateral						|\|\
Ejectives, implosives

ejective								_>	e.g. ejective p		p_>
implosive							_<	e.g. implosive b	b_<
Vowels

close back unrounded					M
close central unrounded 				1 
close central rounded				} 
lax i								I 
lax y								Y 
lax u								U

close-mid front rounded				2 
close-mid central unrounded			@\ 
close-mid central rounded			8 
close-mid back unrounded				7

schwa								@

open-mid front unrounded				E 
open-mid front rounded				9
open-mid central unrounded			3 
open-mid central rounded				3\ 
open-mid back unrounded				V 
open-mid back rounded				O

ash (ae digraph)						{ 
open schwa (turned a)				6

open front rounded					& 
open back unrounded	        		A 
open back rounded					Q
Other symbols

voiceless labial-velar fricative		W 
voiced labial-palatal approx.		H 
voiceless epiglottal fricative		H\ 
voiced epiglottal fricative			<\ 
epiglottal plosive					>\

alveolo-palatal fricative, vl. 		s\ 
alveolo-palatal fricative, voiced	z\ 
alveolar lateral flap				l\ 
simultaneous S and x					x\ 
tie bar								_
Suprasegmentals

primary stress						" 
secondary stress						% 
long									: 
half-long							:\ 
extra-short							_X 
linking mark							-\
Tones and word accents

level extra high						_T 
level high							_H
level mid							_M 
level low							_L 
level extra low						_B
downstep								! 
upstep								^	(caret, circumflex)

contour, rising						 
contour, falling						_F 
contour, high rising					_H_T 
contour, low rising					_B_L 

contour, rising-falling				_R_F 
(NB Instead of being written as diacritics with _, all prosodic marks can alternatively be placed in a separate tier, set off by < >, as recommended for the next two symbols.)
global rise				<R> 
global fall				<F>
Diacritics

voiceless				_0	(0 = figure), e.g. n_0
voiced					_v 
aspirated				_h 
more rounded				_O	(O = letter) 
less rounded				_c 
advanced					_+
retracted				_-
centralized				_" 
syllabic					=	(or _=) e.g. n= (or n_=) 
non-syllabic				_^ 
rhoticity				`

breathy voiced			_t 
creaky voiced			_k
linguolabial				_N 
labialized				_w 
palatalized				'	(or _j) e.g. t' (or t_j) 
velarized				_G 
pharyngealized			_?\

dental					_d 
apical					_a 
laminal					_m
nasalized				~	(or _~) e.g. A~ (or A_~) 
nasal release			_n
lateral release			_l 
no audible release		_}

velarized or pharyngealized		_e 
velarized l, alternatively		5 
raised							_r 
lowered							_o 
advanced tongue root				_A 
retracted tongue root			_q

* * *

<small>This (part of) documentation was generated from [src/phonetics/txt2ipa.xfscript](https://github.com/giellalt/lang-sme/blob/main/src/phonetics/txt2ipa.xfscript)</small>

---



* * *
<small>This (part of) documentation was generated from [tools/grammarcheckers/grammarchecker-resource.cg3](https://github.com/giellalt/lang-sme/blob/main/tools/grammarcheckers/grammarchecker-resource.cg3)</small>

Comp, both for adverbs and adjectives
Superl, both for adverbs and adjectives

## moadde kerdi > moddii

* * *
<small>This (part of) documentation was generated from [tools/grammarcheckers/grammarchecker.cg3](https://github.com/giellalt/lang-sme/blob/main/tools/grammarcheckers/grammarchecker.cg3)</small>

Comp, both for adverbs and adjectives
Superl, both for adverbs and adjectives

Der/A Der/A* pga av bug i lookup2cg

V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.

- V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.

## Guessing: Rule for adding Sem/Date as a tag to readings which looks like dates

## Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses

* Rule for adding <vdic> to verbs denoting verbal actions like: ... dadjá Aili Kestkitalo.

*Substitute **PlcSur** (Sem/Plc) (Sem/Sur) 

### Some propernouns have two parts and the first is not a genitive. We still have problems with abbr when these propernouns are inflected or are a part of a cmp. The copy rule adds Attr reading to names which not get it in the fst (Soria). The select rule selects Attr when the next word is e.g. Moria.

* **SoriaAttr**  Soria Attr Moria, Harry Attr Potter-girji

* **SoriaMoria**

###  Rules for giving Attr to names, e.g. Ole Attr Kåven.

* **PropAttr** 

Remove unwanted analyses

* **álbmotN**, ii V.

* **headisge**, ii heađisge.

* **loahppa** after TIME Gen.

* __miiPersLeft1, miiPersLeft2, _miiPersRight__ select mii Pers 

* **jusnotN**  

* **jusCS**  

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

* sierra

* surgat

* veara

* **vulitAttr**

* **Comp** rules select Comp A

### Attribute disambiguation

* **AttrVFIN** removes Attr in front of VFIN

* **AttrnotNA** removes Attr when no N or A to the right

* **AttrnotNA** removes Attr when no N or A to the right

* **ANomILLA** selects Nom when ILL-ADJ	

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

* **AdvManimus** 

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

* **PrfPrcCoordA** selects PrfPrc in coordination with an A

* **ACoordPrfPrc** selects A itn coordination with PrfPrc 

* **AAttrContra** selects A itn coordination with PrfPrc 

### Special rules for 'buorre' (the only adjective showing case agreement)

* **-FMAINVInf**  to Inf

* **NPrsPrc1** with 1C N Nom

* **n<titel1** (@N<) for ("jr") or ("sr"); if first one to the left is Prop

* **n<titel2** (@N<) for INITIAL; if first one to the left is a noun, or if to the left of you is a single letter which is part of a noun conjunction *bustávas e ja f gáibiduvvo*

* **n<:com** (@N<) for (Sg Com); if first one to the left is Coll

* **>nAttr** (@>N) for Attr; if there is a noun to your right

* **n>Indef** (Pron Indef Attr); if eará is to the right

* **n>Indef** (Pron Indef Com); if eará is to the right

* **>nNum** (@>N) for numerals if; there is a noun to your right. You are not allowed to be (Sg Nom), (Sg Acc) or (Sem/Date)

* **noun>n** (@>N) for Gen; if there is a noun to your right. Restrictions: Not if you are: a time related word. Not if you are OKTA with Pl Loc to your right. Not if CC is to your right followed by another Gen and then Po. Not if you are HUMAN and to your right is Actio Nom folloed by a noun.

* **>nTime** (@>N) for Gen TIME-N; if timenoun to your right. Restrictions: Not if you are a OKTA Nom with Pl Loc to your right. Not if CC followed by Gen, followed by Po to your right. Not if COMMA to your right

* **>ntittel** (@>N) for (Sg Nom TIME-N) or (Nom Der/NomAg); if to your right is Sem/Mal, Sem/Fem, Sem/Sur

* **>nplc** (@>N) for (Sg Nom Prop Sem/Plc), if to your right is Sem/Plc

* **>nALU** (@>N) for Sg Acc numerals; when a measure-noun to the right

* **>NTime** (@>N) for Gen; if you are TIME-N with BOC to your left, and PREGEN to your right

* * *
<small>This (part of) documentation was generated from [tools/grammarcheckers/grc-disambiguator.cg3](https://github.com/giellalt/lang-sme/blob/main/tools/grammarcheckers/grc-disambiguator.cg3)</small>

- V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.

* * *
<small>This (part of) documentation was generated from [tools/grammarcheckers/spellchecker.cg3](https://github.com/giellalt/lang-sme/blob/main/tools/grammarcheckers/spellchecker.cg3)</small># Tokeniser for sme

Usage:
```
$ make
$ echo "ja, ja" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "Juos gorreválggain lea (dárbbašlaš) deavdit gáibádusa boasttu olmmoš, man mielde lahtuid." | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "(gáfe) 'ja' ja 3. ja? ц jaja ukjend \"ukjend\"" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "márffibiillagáffe" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

Pmatch documentation:
<https://github.com/hfst/hfst/wiki/HfstPmatch>

Characters which have analyses in the lexicon, but can appear without spaces
before/after, that is, with no context conditions, and adjacent to words:
* Punct contains ASCII punctuation marks
* The symbol after m-dash is soft-hyphen `U+00AD`
* The symbol following {•} is byte-order-mark / zero-width no-break space
`U+FEFF`.

Whitespace contains ASCII white space and
the List contains some unicode white space characters
* En Quad U+2000 to Zero-Width Joiner U+200d'
* Narrow No-Break Space U+202F
* Medium Mathematical Space U+205F
* Word joiner U+2060

Apart from what's in our morphology, there are
1. unknown word-like forms, and
2. unmatched strings
We want to give 1) a match, but let 2) be treated specially by
`hfst-tokenise -a`
Unknowns are made of:
* lower-case ASCII
* upper-case ASCII
* select extended latin symbols
ASCII digits
* select symbols
* Combining diacritics as individual symbols,
* various symbols from Private area (probably Microsoft),
so far:
* U+F0B7 for "x in box"

## Unknown handling
Unknowns are tagged ?? and treated specially with `hfst-tokenise`
hfst-tokenise --giella-cg will treat such empty analyses as unknowns, and
remove empty analyses from other readings. Empty readings are also
legal in CG, they get a default baseform equal to the wordform, but
no tag to check, so it's safer to let hfst-tokenise handle them.

Finally we mark as a token any sequence making up a:
* known word in context
* unknown (OOV) token in context
* sequence of word and punctuation
* URL in context

* * *

<small>This (part of) documentation was generated from [tools/tokenisers/tokeniser-disamb-gt-desc.pmscript](https://github.com/giellalt/lang-sme/blob/main/tools/tokenisers/tokeniser-disamb-gt-desc.pmscript)</small>

---

# Grammar checker tokenisation for sme

Requires a recent version of HFST (3.10.0 / git revision>=3aecdbc)
Then just:
```
$ make
$ echo "ja, ja" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

More usage examples:
```
$ echo "Juos gorreválggain lea (dárbbašlaš) deavdit gáibádusa boasttu olmmoš, man mielde lahtuid." | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "(gáfe) 'ja' ja 3. ja? ц jaja ukjend \"ukjend\"" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "márffibiillagáffe" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

Pmatch documentation:
<https://github.com/hfst/hfst/wiki/HfstPmatch>

Characters which have analyses in the lexicon, but can appear without spaces
before/after, that is, with no context conditions, and adjacent to words:
* Punct contains ASCII punctuation marks
* The symbol after m-dash is soft-hyphen `U+00AD`
* The symbol following {•} is byte-order-mark / zero-width no-break space
`U+FEFF`.

Whitespace contains ASCII white space and
the List contains some unicode white space characters
* En Quad U+2000 to Zero-Width Joiner U+200d'
* Narrow No-Break Space U+202F
* Medium Mathematical Space U+205F
* Word joiner U+2060

Apart from what's in our morphology, there are
1) unknown word-like forms, and
2) unmatched strings
We want to give 1) a match, but let 2) be treated specially by hfst-tokenise -a
* select extended latin symbols
* select symbols
* various symbols from Private area (probably Microsoft),
so far:
* U+F0B7 for "x in box"

TODO: Could use something like this, but built-in's don't include šžđčŋ:

Simply give an empty reading when something is unknown:
hfst-tokenise --giella-cg will treat such empty analyses as unknowns, and
remove empty analyses from other readings. Empty readings are also
legal in CG, they get a default baseform equal to the wordform, but
no tag to check, so it's safer to let hfst-tokenise handle them.

Finally we mark as a token any sequence making up a:
* known word in context
* unknown (OOV) token in context
* sequence of word and punctuation
* URL in context

* * *

<small>This (part of) documentation was generated from [tools/tokenisers/tokeniser-gramcheck-gt-desc.pmscript](https://github.com/giellalt/lang-sme/blob/main/tools/tokenisers/tokeniser-gramcheck-gt-desc.pmscript)</small>

---

# TTS tokenisation for smj

Requires a recent version of HFST (3.10.0 / git revision>=3aecdbc)
Then just:
```sh
make
echo "ja, ja" \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

More usage examples:
```sh
echo "Juos gorreválggain lea (dárbbašlaš) deavdit gáibádusa \
boasttu olmmoš, man mielde lahtuid." \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
echo "(gáfe) 'ja' ja 3. ja? ц jaja ukjend \"ukjend\"" \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
echo "márffibiillagáffe" \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

Pmatch documentation:
<https://kitwiki.csc.fi/twiki/bin/view/KitWiki/HfstPmatch>

Characters which have analyses in the lexicon, but can appear without spaces
before/after, that is, with no context conditions, and adjacent to words:
* Punct contains ASCII punctuation marks
* The symbol after m-dash is soft-hyphen `U+00AD`
* The symbol following {•} is byte-order-mark / zero-width no-break space
`U+FEFF`.

Whitespace contains ASCII white space and
the List contains some unicode white space characters
* En Quad U+2000 to Zero-Width Joiner U+200d'
* Narrow No-Break Space U+202F
* Medium Mathematical Space U+205F
* Word joiner U+2060

Apart from what's in our morphology, there are
1) unknown word-like forms, and
2) unmatched strings
We want to give 1) a match, but let 2) be treated specially by hfst-tokenise -a
* select extended latin symbols
* select symbols
* various symbols from Private area (probably Microsoft),
so far:
* U+F0B7 for "x in box"

TODO: Could use something like this, but built-in's don't include šžđčŋ:

Simply give an empty reading when something is unknown:
hfst-tokenise --giella-cg will treat such empty analyses as unknowns, and
remove empty analyses from other readings. Empty readings are also
legal in CG, they get a default baseform equal to the wordform, but
no tag to check, so it's safer to let hfst-tokenise handle them.

Needs hfst-tokenise to output things differently depending on the tag they get

* * *

<small>This (part of) documentation was generated from [tools/tokenisers/tokeniser-tts-cggt-desc.pmscript](https://github.com/giellalt/lang-sme/blob/main/tools/tokenisers/tokeniser-tts-cggt-desc.pmscript)</small>

---

