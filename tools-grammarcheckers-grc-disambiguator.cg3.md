

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
