Divvun & Giellatekno - open source grammars for North Sámi.

# North Sámi morphological analyser

## Multicharacter symbols



### Tags for POS

* **+NNoun** - Noun
* **+AAdjective** - Adjective
* **+AdvAdverb** - Adverb
* **+VVerb** - Verb
* **+PronPronoun** - Pronoun
* **+CSSubjunction** - Subjunction
* **+CCConjunction** - Conjunction
* **+AdpUSE** - Adposition, ie Post- and Prepostion, NOT IN USE
* **+PoPostpostion** - Postpostion
* **+PrPreposition** - Preposition
* **+InterjInterjection** - Interjection
* **+PcleParticle** - Particle
* **+NumNumeral** - Numeral

### Tags for sub-POS
* **+PropPropernoun** - Propernoun
* **+PersPronoun** - Personal Pronoun
* **+DemPronoun** - Demonstrative Pronoun
* **+InterrPronoun** - Interrogative Pronoun
* **+ReflPronoun** - Reflexive Pronoun
* **+ReciprPronoun** - Reciprocal Pronoun
* **+RelPronoun** - Relative Pronoun
* **+IndefPronoun** - Indefinitive Pronoun
* **+Coll+N** - Collective numerals, subtag for +N
* **+Arab+Num** - Arabic numeral, subtag for +Num
* **+Rom+Num** - Roman numeral, subtag for +Num
* **+Passuse** - hallat/haddat not in use
* **+Knownmii+Pron+Rel+Sg+Acc+Known** - man (different from maid): mii+Pron+Rel+Sg+Acc+Known


## Tags for Inflection

### Tags for Case and Number Inflection
* **+SgSingular** - Singular
* **+DuDual** - Dual
* **+PlPlural** - Plural

* **+EssEssive** - Essive
* **+NomNominative** - Nominative
* **+GenGenitive** - Genitive
* **+AccAccusative** - Accusative
* **+IllIllative** - Illative
* **+LocEllative** - Locative = Inessive and Ellative
* **+ComComitative** - Comitative
* **+Com/Shetc.** - Comitative Plural Hyphened Shortform (w/o -guin), ie Beatnagii-, Biillai-, Bohccui- etc.

### Possessive tags

* **+PxSg1Person**    Singular First Person
* **+PxSg2Person**    Singular Second Person
* **+PxSg3Person**    Singular Third Person
* **+PxDu1Person**    Dual First Person
* **+PxDu2Person**    Dual Second Person
* **+PxDu3Person**    Dual Third Person
* **+PxPl1Person**    Plural First Person
* **+PxPl2Person**    Plural Second Person
* **+PxPl3Person**    Plural Third Person

### Adjectival tags
* **+AttrAttributive**   Attributive
* **+Carduse**   Cardinal Number Not in use
* **+OrdNumber**   Ordinal Number

### Moods
* **+IndIndicative** Indicative
* **+PotPotential** Potential
* **+CondConditional** Conditional
* **+ImprtImperative** Imperative

### Tenses
* **+PrsTense** Present Tense
* **+PrtPreterite** Past Tense, Preterite

### Verb person-number

* **+Sg1Person** Singular First Person
* **+Sg2Person** Singular Second Person
* **+Sg3Person** Singular Third Person
* **+Du1Person** Dual First Person
* **+Du2Person** Dual Second Person
* **+Du3Person** Dual Third Person
* **+Pl1Person** Plural First Person
* **+Pl2Person** Plural Second Person
* **+Pl3Person** Plural Third Person

### Infinite verb forms

* **+InfInfinitive** Infinitive
* **+GerGerund** Gerund
* **+ConNegetc** Negation Form, ie Mana, Doalvvo, Juoge etc
* **+ConNegIIInfrequent** Alternative, Rather Declamatory Negation Form - Infrequent
* **+Negetc.** Negation Verb, Ii and its forms, ie Ale, Alli, Allot, Ehpet, Eat etc.
* **+ImprtIIuse** Alternative, Rather Declamatory Imperative Form - Infrequent not in use
* **+PrsPrcParticipe** Present Participe
* **+PrfPrcParticipe** Perfect Participe
* **+SupSupine** Supine
* **+VGenVerbGenitive** VerbGenitive
* **+VAbessVerbAbbesive** VerbAbbesive
* **+ActioForm** Action Verb Form

### Other tags
* **+Gram/Compadverbs**   Comparative, adverbs
* **+Gram/Superladverbs**   Superlative, adverbs

* **+ABBR+N** Abbreviation, subtag for e.g. +N
* **+Symbol©** = independent symbols in the text stream, like £, €, ©
* **+ACR+N**  Acronym, subtag for +N
* **+CLBcomma..)**  Clause border (full stop, comma..)
* **+PUNCTpunctuation**  punctuation
* **+LEFTparanthesis**  left paranthesis
* **+RIGHTparanthesis**  right paranthesis
* **+Dyn+ACR+Dyn**  Dynamically generated (acronyms) +ACR+Dyn
* **+CLBfinalambiguous**  Sentence final abbreviated expression ending in full stop, so that the full stop is ambiguous

* **+TV+V+TV**    Transitive Verb, +V+TV
* **+IV+V+IV** Intransitive Verb, +V+IV
* **+G3+N+G3** Grade 2-3 for homonymies with grade 1-2, +N+G3
* **+G7+N+G7** Grade 3, no consonant gradation, +N+G7
* **+NomAg+N+NomAg** Actor Noun From Verb - Nomen Agentis, +N+NomAg

* **+Gram/TAbbrargument)**:  Transitive abbreviation (it needs an argument)
* **+Gram/NoAbbrhomonymous**:  Intransitive abbreviations that are homonymous
with more frequent words. They should only be considered
abbreviations in the middle of a sentence.
* **+Gram/TNumAbbrfollowing**:  Transitive abbreviation if the following
constituent is numeric
* **+Gram/NumNoAbbrnumerals**:  Transitive abbreviations for which numerals
are complements and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentence can be considered as true cases.
* **+Gram/TIAbbrabbreviation**:  Both transitive and intransitive abbreviation
* **+Gram/IAbbrargument)**:  Intransitive abbreviation (it takes no argument)
* **+Gram/3syllverbs**: trisyllabic verbs
; +Gram/Superl@CODE@
; +Gram/Comp@CODE@


### Question and Focus particles:
* **+Qst+Pcle+Qst**   Question Particle: +Pcle+Qst
* **+Subqst+Adv+Subqst**   Embedded Question Particle: +Adv+Subqst
* **+Foc/najclitic**	Focus clitic
* **+Foc/Neg-geclitic**	Focus clitic
* **+Foc/Pos-geclitic**	Focus clitic
* **+Foc/genclitic**	Focus clitic
* **+Foc/gesclitic**	Focus clitic
* **+Foc/gisclitic**	Focus clitic
* **+Foc/baclitic**	Focus clitic
* **+Foc/beclitic**	Focus clitic
* **+Foc/halclitic**	Focus clitic
* **+Foc/hanclitic**	Focus clitic
* **+Foc/baiclitic**	Focus clitic
* **+Foc/basclitic**	Focus clitic
* **+Foc/batclitic**	Focus clitic
* **+Foc/banclitic**	Focus clitic
* **+Foc/sonclitic**	Focus clitic
* **+Foc/bahalclitic**	Focus clitic
* **+Foc/behalclitic**	Focus clitic
* **+Foc/bahanclitic**	Focus clitic
* **+Foc/behanclitic**	Focus clitic
* **+Foc/basonclitic**	Focus clitic
* **+Foc/besonclitic**	Focus clitic
* **+Foc/matclitic**	Focus clitic
* **+Foc/misclitic**	Focus clitic
* **+Foc/sclitic**	Focus clitic



### Tags distinguishing different versions of the same lemma (before POS)
* +v1@CODE@
* +v2@CODE@
* +v3@CODE@
* +v4@CODE@
* +v5@CODE@
* +v6@CODE@
* +v7@CODE@
* +v8@CODE@
* +v9@CODE@
* +v10@CODE@
* +v11@CODE@
* +v12@CODE@
* +v13@CODE@
* +v14@CODE@
* +v15@CODE@
* +v16@CODE@
* +v17@CODE@
* +v18@CODE@
* +v19@CODE@
* +v20@CODE@
* +v21@CODE@
* +v22@CODE@
* +v23@CODE@
* +v24@CODE@

Note: These high +v... number are in use for one word only:
doavttergrádakursa

### Escaped chars

 * ** %        **
* **+Guessguesser** for the name guesser
 * ** +MWE     ** - Multi-word expressions treated as such in the preprocessor. To be added as first tag after the lemma

* **+PxCPlComReciprpronoun-sme-morph.txt** used in pronoun-sme-morph.txt


### Error (non-standard language) tags

* **+Err/Orthfst** substandard, not in normative fst
* **+Err/Orth-a-áfst** substandard, not in normative fst
* **+Err/Orth-nom-genfst** substandard, not in normative fst
* **+Err/Orth-nom-accfst** substandard, not in normative fst
* **+Err/Lexlemma** substandard, not in normative fst, no normative lemma
* **+Err/DerSublemma** substandard for derivation, not in normative fst, no normative lemma
* **+Err/CmpSubpart)** substandard for compounding, not in normative fst (wrong form or POS in first part)
* **+Err/MissingSpaceerror** indicates that there is a missing space, causing an orthographic error
* **+Err/MissingHyphbeen** when there is no hyphen where it should have been
* **+Err/Hyphbeen** when there is a hyphen where none should have been
* **+Err/SpaceCmpanalyser** used for compounds written apart - only retained in the HFST Grammar Checker disambiguation analyser
* **+Err/Spellrelaxdiacritics)** used to tag spellrelaxed typos (tag is inserted via flag diacritics)
* **+Err/Confusedpairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-Esspairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-ASgNompairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-DerPassPrsSg3pairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-NSgPxSg1pairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-NomAgIllpairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-ImprtDu1pairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-DerPassPrtSg3pairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-ImprtSg2pairs** grammarcheking rela word error confusion pairs
* **+Err/Confused-ImprtPl2pairs** grammarcheking rela word error confusion pairs


### Usage tags

* **+Use/-Spellwords** Orthographically correct, typically perifer words, excluded in speller because they cause trouble for frequent words
* **+Use/-PLXPLX-speller** Excluded in PLX-speller
* **+Use/SpellNoSuggspeller** recognized but not suggested in speller
* **+Use/Circ^C^)** circular paths (old ^C^)
* **+Use/CircN^N^)** circular paths for the numerals (old ^N^)
* **+Use/MTneeded** Generate for MT only, for restricting analyses needed
for MT generation not to pop up elsewhere (NOT IN FUNCTION)
* **+Use/LIALIA-analyser** only for LIA-analyser
* **+Use/NGMT** not-generate, for ped generation isme-ped.fst and MT
* **+Use/NGminipdicts** Not for miniparadigm in NDS dicts
* **+Use/PMatchdisambiguator** means that the following is only used in the analyser feeding the disambiguator
* **+Use/-PMatchhfst-pmatch** Do not include in fst's made for hfst-pmatch
* **+Use/GCanalyser** only retained in the HFST Grammar Checker disambiguation analyser
* **+Use/-GCanalyser** never retained in the HFST Grammar Checker disambiguation analyser
* **+MWESplitMWE** Split point for MWE

### Dialect tags:

* **+Dial/-KJ(Kárásjohka)** forms not in use in KJ (Kárásjohka)
* **+Dial/-GG(Guovdageaidnu)** forms not in use in GG (Guovdageaidnu)
* **+Dial/-GSUSE** forms not in use in GS (Gárasavvon) NOT IN USE
* **+Southsub-form** foreløpig lagt til Sg Loc -n, som er en sub-form

### Tags for indicating the orthography used
+Orth/Strdorthography - Standard orthography
+Orth/IPAtranscription - IPA transcription

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

### Multichars for marking start and end of IPA sequences

<!-- {% raw %} -->
* `%{%<ipa#%}left` - ipa text to the left
* `%{#ipa%>%}right` - ipa text to the right
* `%<sent%>apertium` - apertium
<!-- {% endraw %} -->

### Compounding tags

The tags are of the following form:
* **+CmpNP/xxx** - Normative (N), Position (P), ie the tag describes what
position the tagged word can be in in a compound
* **+CmpN/xxx**  - Normative (N) **form** ie the tag describes what
form the tagged word should use when making compounds
* **+Cmp/xxx**   - Descriptive compounding tags, ie tags that *describes*
what form a word actually is using in a compound

This entry / word should be in the following position(s):

* **+CmpNP/Allwritten** - ... in all positions, **default**, this tag does not have to be written
* **+CmpNP/Firstalone** - ... only be first part in a compound or alone
* **+CmpNP/Prefalone** - ... only **first** part in a compound, NEVER alone
* **+CmpNP/Lastalone** - ... only be last part in a compound or alone
* **+CmpNP/Suffalone** - ... only **last** part in a compound, NEVER alone
* **+CmpNP/Nonecompounds** - ... does not take part in compounds
* **+CmpNP/Onlynever** - ... only be part of a compound, i.e. can never
be used alone, but can appear in any position

If unmarked, any position goes.

The tagged part of the compound should make a compound using:

* **+CmpN/SgNNominative** Singular Nominative
* **+CmpN/SgGGenitive** Singular Genitive
* **+CmpN/PlGGenitive** Plural Genitive
* **+CmpN/PlNpropers!** Plural Nominative, propers!

Unmarked = Default, ie `+CmpN/SgN` for SME.

The second part of the compound may require that the previous (left part) is:

* **+CmpN/SgNomLeftNominative** Singular Nominative
* **+CmpN/SgGenLeftGenitive** Singular Genitive
* **+CmpN/PlGenLeftGenitive** Plural Genitive


Tags for descriptive compound analysis - this is what a compound actually is:

* **+Cmppart** - Dynamic compound. This tag should always be part
           of a dynamic compound. It is important for
           Apertium, and useful in other cases as well.
* **+Cmp/AttrAttributive** - Attributive
* **+Cmp/SgNomNominative** - Singular Nominative
* **+Cmp/SgGenGenitive** - Singular Genitive
* **+Cmp/PlGenGenitiv** - Plural Genitiv
* **+Cmp/SplitRto** - This is a split compound with the other part to
           the right: "Arbeids- og inkluderingsdepartementet"
           => Arbeids- = +Cmp/SplitR
* **+Cmp/SplitLleft** - This is a split compound with the other part to the left
* **+Cmp/Sh+Cmp/Sh** - testing +Cmp/Sh
* **+Cmp/Hyphhyphen** - on dynamic compounds that have a hyphen
* **+Cmp/NoHyphdoesn't** - On compounds that COULD have had a hyphen (and usually have), but doesn't
* **+Cmp/SoftHyph(U+00AD)** - Tags compounds containing SOFT HYPHENS (U+00AD)
* **+Cmp/Citprinciple** - Tags citation compounds, which can in principle
cover any word. Requires a hyphen.

### Compounding tag ordering
To ease writing and maintaining regexes etc for manipulating and enforcing
compounding, it is important to keep the tags in a certain order.
The order is:
1. **+CmpN/** tags
1. **+CmpNP/** tags
1. **+Cmp/** tags - this is always true since the descriptive tags are always
part of the continuation lexicons, and will be located after the POS tag.





### Semantic tags to help disambiguation & synt. analysis: (before POS)

* +Sem/ActActivity = Activity
* +Sem/AdrWebadr = Webadr
* +Sem/AmountAmount = Amount
* +Sem/AniAnimate = Animate
* +Sem/AniprodProduct = Animal Product
* +Sem/BodyBodypart = Bodypart
* +Sem/Body-abstretc.) = siellu, vuoig?a, jierbmi, (noe man kan bruke i fysisk aktivitet som en kroppsdel, f.eks. synet, stemmen, etc.)
* +Sem/BuildBuilding = Building
* +Sem/Build-roombe = Room in a building, typically place to be
* +Sem/Buildpartwall = Part of Bulding, like the wall
* +Sem/CatCategory = Category
* +Sem/ClthClothes = Clothes
* +Sem/Clth-jewlJewelery = Jewelery
* +Sem/Clthpartsávdnji... = part of clothes, boallu, sávdnji...
* +Sem/CtainContainer = Container
* +Sem/Ctain-abstraccount = Abstract container like bank account
* +Sem/Ctain-clthrucksack = Soft container, like a rucksack
* +Sem/CurrMoney = Currency like dollár, Not Money
* +Sem/DateDate = Date
* +Sem/DanceDance = Dance
* +Sem/DirGPS-kursa = Direction like GPS-kursa
* +Sem/Domainactions) = Domain like politics, reindeerherding (a system of actions)
* +Sem/DrinkDrink = Drink
* +Sem/DummytagDummytag = Dummytag
* +Sem/Eduevent = Educational event
* +Sem/EventEvent = Event
* +Sem/Featetc.) = Feature, like Árvu. (noe som man kan ha mye eller lite av, det kan være en skala og som er på en måte karakteriserende. (høyde, vekt, farge, kreativitet etc.)
* +Sem/Feat-physfárda = Physiological feature, ivdni, fárda
* +Sem/Feat-psychfeauture = Psychological feauture
* +Sem/Feat-measrfeauture = Psychological feauture
* +Sem/Femname = Female name
* +Sem/FoodFood = Food
* +Sem/Food-medMedicine = Medicine
* +Sem/Fruitnuts = Fruits, vegetables, seeds, nuts
* +Sem/FurnFurniture = Furniture
* +Sem/GameGame = Game
* +Sem/Geomobject = Geometrical object
* +Sem/GroupGroup = Animal or Human Group
* +Sem/HumHuman = Human
* +Sem/Hum-abstrabstract = Human abstract
* +Sem/Hum-profprofessional = Human professional
* +Sem/IdeolIdeology = Ideology
* +Sem/IDID = ID
* +Sem/LangLanguage = Language
* +Sem/Malname = Male name
* +Sem/Matthings = Material for producing things
* +Sem/MeasrMeasure = Measure
* +Sem/MoneyCurr(ency) = Has to do with money, like wages, not Curr(ency)
* +Sem/ObjObject = Object
* +Sem/Obj-cloCloth = Cloth
* +Sem/Obj-cognCloth = Cloth
* +Sem/Obj-elapparatus = (Electrical) machine or apparatus
* +Sem/Obj-lingit = Object with something written on it
* +Sem/Obj-ropeobject = flexible ropelike object
* +Sem/Obj-surfcobject = Surface object
* +Sem/OrgOrganisation = Organisation
* +Sem/Partbealli = Feature, oassi, bealli
* Perc = (perception) er noe man kan kjenne i en begrensa periode og som er forårsaka av noe utenifra, f.eks. Mus lea ballu. Mus lea bavččas.
* +Sem/Perc-cogn= =
* +Sem/Perc-emoperception = Emotional perception
* +Sem/Perc-physperception = Physical perception
* +Sem/Perc-psychperception = Psychological perception
* +Sem/Phonenrnumber = Telephone number
* +Sem/PlantPlant = Plant
* +Sem/Plantpartpart = Plant part
* +Sem/PlcPlace = Place
* +Sem/Plc-abstrplace = Abstract place
* +Sem/Plc-elevatePlace = Place
* +Sem/Plc-linePlace = Place
* +Sem/Plc-waterPlace = Place
* +Sem/Posjob) = Position (as in social position job)
* +Sem/ProcessProcess = Process
* +Sem/ProdProduct = Product
* +Sem/Prod-audioproduct = Audio product
* +Sem/Prod-cognproduct = Cognition product
* +Sem/Prod-lingproduct = Linguistic product
* +Sem/Prod-visproduct = Visual product
* +Sem/RelRelation = Relation
* +Sem/RouteRoute = Route
* +Sem/Ruleconvention = Rule or convention
* +Sem/Semconconcept = Semantic concept
* +Sem/Signpunctuation) = Sign (e.g. numbers, punctuation)
* +Sem/SportSport = Sport
* +Sem/State= =
* +Sem/State-sickIllness = Illness
* +Sem/SubstncWater = Substance, like Air and Water
* +Sem/SurSurname = Surname
* +Sem/SymbolSymbol = Symbol
* +Sem/TimeTime = Time
* +Sem/Time-clockclock = Time clock
* +Sem/Toolthings = Prototypical tool for repairing things
* +Sem/Tool-catchfish) = Tool used for catching (e.g. fish)
* +Sem/Tool-cleancleaning = Tool used for cleaning
* +Sem/Tool-itIT = Tool used in IT
* +Sem/Tool-measrmeasuring = Tool used for measuring
* +Sem/Tool-musicinstrument = Music instrument
* +Sem/Tool-writetool = Writing tool
* +Sem/Txtlávlla...) = Text (girji, lávlla...)
* +Sem/VehVehicle = Vehicle
* +Sem/WpnWeapon = Weapon
* +Sem/Wthrground = The Weather or the state of ground
* +Sem/Yearnumerals - year (i.e. 1000 - 2999), used only for numerals



### Multiple Semantic tags:
* +Sem/Act_Fruit@CODE@
* +Sem/Act_GroupGroup Activity and Group
* +Sem/Act_HumHuman Activity and Human
* +Sem/Act_Plcwell   A persons job is an activity, and a place as well
* +Sem/Act_Routejohtolat Activity and Route, ie johtolat
* +Sem/Act_Tool-it@CODE@
* **+Sem/Amount_BuildBuilding**   Amount and Building
* +Sem/Amount_Semcon@CODE@
* +Sem/Ani_Body-abstr_Hum@CODE@
* +Sem/Ani_Build@CODE@
* +Sem/Ani_Buildpart@CODE@
* +Sem/Ani_Build_Hum_Txt@CODE@
* +Sem/Ani-fish@CODE@
* +Sem/Ani_Group@CODE@
* +Sem/Ani_Group_Hum@CODE@
* +Sem/Ani_Group_Prod-vis@CODE@
* +Sem/Ani_Hum@CODE@
* +Sem/Ani_Hum_Plc@CODE@
* +Sem/Ani_Hum_Time@CODE@
* +Sem/Ani_Plc@CODE@
* +Sem/Ani_Plc_Txt@CODE@
* +Sem/Ani_Time@CODE@
* +Sem/Ani_Veh@CODE@
* +Sem/Aniprod_Hum@CODE@
* +Sem/Aniprod_Obj-clo@CODE@
* +Sem/Aniprod_Perc-phys@CODE@
* +Sem/Aniprod_Plc@CODE@
* +Sem/Aniprod_Plc_Route@CODE@
* +Sem/Body-abstr_Feat-psych@CODE@
* +Sem/Body-abstr_Prod-audio_Semcon@CODE@
* +Sem/Body_Body-abstr@CODE@
* +Sem/Body_Clth@CODE@
* +Sem/Body_Food@CODE@
* +Sem/Body_Group_Hum@CODE@
* +Sem/Body_Group_Hum_Time@CODE@
* +Sem/Body_Hum@CODE@
* +Sem/Body_Mat@CODE@
* +Sem/Body_Measr@CODE@
* +Sem/Body_Obj_Tool-catch@CODE@
* +Sem/Body_Plc@CODE@
* +Sem/Body_Plc-elevate@CODE@
* +Sem/Body_Time@CODE@
* +Sem/Build_Clthpart@CODE@
* +Sem/Build_Edu_Org@CODE@
* +Sem/Build_Event_Org@CODE@
* +Sem/Build_Obj@CODE@
* +Sem/Build_Org@CODE@
* +Sem/Build_Route@CODE@
* +Sem/Build-room_Cat_Ctain_Mat@CODE@
* +Sem/Buildpart_Cat@CODE@
* +Sem/Buildpart_Cat_Ctain@CODE@
* +Sem/Buildpart_Cat_Ctain_Mat@CODE@
* +Sem/Buildpart_Ctain@CODE@
* +Sem/Buildpart_Ctain_Mat@CODE@
* +Sem/Buildpart_Ctain_Obj@CODE@
* +Sem/Cat_Group_Hum@CODE@
* +Sem/Cat_Group_Hum_Plc@CODE@
* +Sem/Cat_Edu@CODE@
* +Sem/Cat_Obj@CODE@
* +Sem/Clth-jewl_Curr@CODE@
* +Sem/Clth-jewl_Curr_Obj@CODE@
* +Sem/Clth-jewl_Curr_Obj_Org@CODE@
* +Sem/Clth-jewl_Fruit@CODE@
* +Sem/Clth-jewl_Money@CODE@
* +Sem/Clth-jewl_Plant@CODE@
* +Sem/Clth_Hum@CODE@
* +Sem/Clth_Obj-clo@CODE@
* +Sem/Ctain-abstr_Org@CODE@
* +Sem/Ctain-clth_Plant@CODE@
* +Sem/Ctain-clth_Veh@CODE@
* +Sem/Ctain_Feat-phys@CODE@
* +Sem/Ctain_Furn@CODE@
* +Sem/Ctain_Plc@CODE@
* +Sem/Ctain_Tool@CODE@
* +Sem/Ctain_Tool-measr@CODE@
* +Sem/Curr_Org@CODE@
* +Sem/Dance_Org@CODE@
* +Sem/Dance_Prod-audio@CODE@
* +Sem/Domain_Food-med@CODE@
* +Sem/Domain_Hum@CODE@
* +Sem/Domain_Prod-audio@CODE@
* +Sem/Drink_Plant@CODE@
* +Sem/Edu_Event@CODE@
* +Sem/Edu_Geom@CODE@
* +Sem/Edu_Group_Hum@CODE@
* +Sem/Edu_Hum@CODE@
* +Sem/Edu_Mat@CODE@
* +Sem/Edu_Org@CODE@
* +Sem/Event_Food@CODE@
* +Sem/Event_Hum@CODE@
* +Sem/Event_Plc@CODE@
* +Sem/Event_Plc-elevate@CODE@
* +Sem/Event_Time@CODE@
* +Sem/Feat-measr_Plc@CODE@
* +Sem/Feat-phys_Tool-write@CODE@
* +Sem/Feat-phys_Veh@CODE@
* +Sem/Feat-phys_Wthr@CODE@
* +Sem/Feat-psych_Hum@CODE@
* +Sem/Feat-psych_Plc@CODE@
* +Sem/Food_Obj-surfc@CODE@
* +Sem/Feat_Plant@CODE@
* +Sem/Food_Perc-phys@CODE@
* +Sem/Food_Plant@CODE@
* +Sem/Food_Sign@CODE@
* +Sem/Fruit_Hum@CODE@
* +Sem/Game_Obj-play@CODE@
* +Sem/Geom_Hum_Plc@CODE@
* +Sem/Geom_Obj@CODE@
* +Sem/Group_Hum@CODE@
* +Sem/Group_Hum_Org@CODE@
* +Sem/Group_Hum_Plc@CODE@
* +Sem/Group_Hum_Plc-abstr@CODE@
* +Sem/Group_Hum_Prod-vis@CODE@
* +Sem/Group_Hum_Time@CODE@
* +Sem/Group_Org@CODE@
* +Sem/Group_Prod-vis@CODE@
* +Sem/Group_Sign@CODE@
* +Sem/Group_Txt@CODE@
* +Sem/Hum_Lang@CODE@
* +Sem/Hum_Lang_Plc@CODE@
* +Sem/Hum_Lang_Time@CODE@
* +Sem/Hum_Mat_Tool@CODE@
* +Sem/Hum_Obj@CODE@
* +Sem/Hum_Org@CODE@
* +Sem/Hum_Sign@CODE@
* +Sem/Hum_Part@CODE@
* +Sem/Hum_Plant@CODE@
* +Sem/Hum_Plc@CODE@
* +Sem/Hum_Sign@CODE@
* +Sem/Hum_Tool@CODE@
* +Sem/Hum_Tool-itHuman = Human
* +Sem/Hum_Veh@CODE@
* +Sem/Hum_Wthr@CODE@
* +Sem/Lang_Tool@CODE@
* +Sem/Mat_Plant@CODE@
* +Sem/Mat_Txt@CODE@
* +Sem/Measr_Obj_Time@CODE@
* +Sem/Measr_Signpunctuation) = Sign (e.g. numbers, punctuation)
* +Sem/Measr_Time@CODE@
* +Sem/Money_Obj@CODE@
* +Sem/Money_Org@CODE@
* +Sem/Money_Part@CODE@
* +Sem/Money_Txt@CODE@
* +Sem/Obj-play@CODE@
* +Sem/Obj-play_Sport@CODE@
* +Sem/Obj_Semcon@CODE@
* +Sem/Obj_Sign@CODE@
* +Sem/Obj_Veh@CODE@
* +Sem/Clth-jewl_Org@CODE@
* +Sem/Obj_Symbol@CODE@
* +Sem/Org_Rule@CODE@
* +Sem/Org_Buildpart 
* +Sem/Org_Txt@CODE@
* +Sem/Org_Veh@CODE@
* +Sem/Part_Prod-cogn@CODE@
* +Sem/Part_Substnc@CODE@
* +Sem/Perc-emo_Wthr@CODE@
* +Sem/Plant_Plantpart@CODE@
* +Sem/Plant_Tool@CODE@
* +Sem/Plant_Tool-measr@CODE@
* +Sem/Plc-abstr_Rel_State@CODE@
* +Sem/Plc-abstr_Route@CODE@
* +Sem/Plc_Pos@CODE@
* +Sem/Plc_Route@CODE@
* +Sem/Plc_Semcon@CODE@
* +Sem/Plc_State@CODE@
* +Sem/Plc_Substnc@CODE@
* +Sem/Plc_Substnc_Wthr@CODE@
* +Sem/Plc_Time@CODE@
* +Sem/Plc_Tool-catch@CODE@
* +Sem/Plc_Txt@CODE@
* +Sem/Plc_Wthr@CODE@
* +Sem/Prod-audio_Txt@CODE@
* +Sem/Prod-cogn_Txt@CODE@
* +Sem/Semcon_Txt@CODE@
* +Sem/Obj_State@CODE@
* +Sem/Substnc_Wthr@CODE@
* +Sem/Plc_Time_Wthr@CODE@
* +Sem/Time_Wthr@CODE@
* +Sem/State-sick_Substnc@CODE@
* +Sem/Obj-ling_Obj-surfc@CODE@
* +Sem/Org_Prod-audio@CODE@
* +Sem/Org_Prod-cogn@CODE@
* +Sem/Org_Prod-vis@CODE@




* **+AllegroGOADE-IU-** from LEXICON GOADE-IU-





Explanation:
Combinations 1, 2, 3, 12, 23, 13, 123 are ok, all other ones are blocked.
The suffixes marked as +Der1+Der2 to the right cannot combine with Der2, they
have already "saturated" their Der2-part.
Phonotactically, Der1 are initial consonants C, Der2 are VCV, and
Der2 are of a different kind, more like compounding.
This whole Der123 business is to prevent back-derivation of
boahtigoahtijuvvohallat and the like.
Computationally, this is done as a filter composed on top of sme.save.



--------------------------------








All non-positional derivations should be preceded by this tag, to make it possible
to target regular expressions at all derivations in a language-independent way:
just specify +Der|+Der1 .. +Der5 and you are set.

* **+Der=** =

### Other/unclassified derivations, can appear in all positions:

* **+Der/vearaNA#** = NA#
* **+Der/viđáNA#** = NA#
* **+Der/viđiNA#** = NA#
* **+Der/hascode** = only one in the code


### Miscellanious list

* **+Der/AVerb** = Adjective derivated from Noun or Verb
* **+Der/AdvAdjective** = Adverb derivated from Adjective

## Tags for originating language

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

* **+OLang/SMESámi** = North Sámi
* **+OLang/SMJSámi** = Lule Sámi
* **+OLang/SMASámi** = South Sámi
* **+OLang/FINFinnish** = Finnish
* **+OLang/SWESwedish** = Swedish
* **+OLang/NOBbokmål** = Norw. bokmål
* **+OLang/NNOnynorsk** = Norw. nynorsk
* **+OLang/ENGEnglish** = English
* **+OLang/RUSRussian** = Russian
* **+OLang/UNDUndefined** = Undefined


### Triggers for morphophonological rules

* **X1Metaphony** = Diphthong Simplification, Metaphony
* **X2m8** = Diphthong Simplification, Metaphony, Word Final Neutralization of g8, h8, m8
* **X3Metaphony** = Diphthong Simplification, Metaphony
* **X4h8** = WeG, Vowel Shortening, Stem vowel alternations, Word Final Deletion of n8 m8 g8 h8
* **X5alternations** = WeG, Diphthong Simplification, Stem vowel alternations
* **X6h8** = WeG, Diphthong Simplification, Metaphony, Word Final Deletion of n8 m8 g8 h8
* **X7m8** = Vowel Shortening, Stem vowel alternations, Word Final Neutralization of g8, h8, m8
* **X8h8** = WeG, Vowel Shortening, Metaphony, Stem Vowel alternations, Word Final Deletion of n8 m8 g8 h8
* **X9h8** = WeG, Dipthtong simplification, Word Final Deletion of n8 m8 g8 h8
* **Y1alternations,** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y2alternations,** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y3alternations,** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y4alternations,** = Lengthening of Central Consonants, Stem Vowel alternations,
* **Y5alternations** = Lengthening of Central Consonants, Word Final Consonant Deletion, Diphthong Simplification, Stem vowel alternations
* **Y6alternations** = Lengthening of Central Consonants, Word Final Consonant Deletion, Diphthong Simplification, Stem vowel alternations
* **Y7alternations** = Lengthening of Central Consonants, Diphthong Simplification, Stem vowel alternations
* **Y8use** = Not in use
* **Y9Simplification** = Lengthening of Central Consonants, Diphthong Simplification
* **Q1alternations,** = Stem vowel alternations,
* **Q2alternations,** = Diphthong Simplification, Stem vowel alternations,
* **Q3alternations,** = Diphthong Simplification, Stem vowel alternations,
* **Q4alternations,** = WeG, Stem vowel alternations,
* **Q5alternations,** = WeG, Diphthong Simplification, Stem vowel alternations,
* **Q6shortening,** = WeG, Vowel shortening,
* **Q7Metaphony,** = WeG, Diphthong Simplification, Metaphony,
* **Q8alternations,** = WeG, Diphthong Simplification, Stem vowel alternations,
* **Q9use** = Not in use
* **W1Shortening** = WeG, Vowel Shortening
* **W2Shortening,** = Vowel Shortening,
* **W3compounding,** = Stem vowel deletion in compounding,
* **W4h8** = WeG, Word Final Cluster Simplification, Optional vowel-shortening, Word Final Deletion of n8 m8 g8 h8
* **W5alternations** = WeG, Diphthong Simplification, Stem vowel alternations
* **W6WeG,** = Stem vowel alternations, WeG,
* **W7WeG** = Stem vowel alternations, WeG
* **W8alternations,** = Stem vowel alternations,
* **W9use** = Not in use
* **%^DISIMPsimpification** = diphthong simpification

### Morphophonemes and Sámi letters

* **b9hash** = twol rule override, so that b doesn't turn into t infront of hash
* **e7dictionary** = shortened i = "e with dot below" from the dictionary
* **e9j** = twol rule override, so that e doesn't turn into i infront of j
* **d9hash** = twol rule override, so that d doesn't turn into t infront of hash
* **g8Deletion** = Word Final Neutralization and Deletion
* **g9hash** = twol rule override, so that g doesn't turn into t infront of hash
* **h7=** =
* **h8Deletion** = Word Final Neutralization and Deletion
* **h9hash** = twol rule override, so that h doesn't turn into t infront of hash
* **i7contextes** = twol rule override, so that i doesn't turn into e in certain contextes
* **j9i** = twol rule override, so that j doesn't turn into i after i
* **k9hash** = twol rule override, so that k doesn't turn into t infront of hash
* **m8Deletion** = Word Final Neutralization and Deletion
* **m9hash** = twol rule override, so that m doesn't turn into n infront of hash
* **n8Deletion** = Word Final Neutralization and Deletion
* **n9override,** = twol rule override,
* **o7dictionary** = shortened u = "o with dot below" from the dictionary
* **o9j** = twol rule override,  so that o doesn't turn into u infront of j
* **p9hash** = twol rule override, so that p doesn't turn into t infront of hash
* **s9hash** = twol rule override, so that we can have two ss in front of hash
* **t9hash** = twol rule override, so that we can have st in front of hash
* **u7=** =
* **z9Neutralization** = twol rule override, to avoid Word Final Consonant Neutralization
* **ž9Neutralization** = twol rule override, to avoid Word Final Consonant Neutralization
* **š9hash** = twol rule override, so that we can have two šš in front of hash
* **r9=** =
* **æ7lulesámi** = in smi, for lulesámi
* **u6contextes** = twol rule override, so that u doesn't turn into o in certain contextes
* **æ9lulesámi** = in smi, for lulesámi


**∑and** = a symbol used in front of `#` to block backtracking and
mwe reanalysis in hfst-tokenise (e.g. in dynanic compounds).
Makes it possible to distinguish lexical and dynamic compounds
in rules. It is converted to zero together with `#`.

### Symbols that need to be escaped on the lower side (towards twolc):

* »
* «
* > (escaped with square brackets, to avoid collision with > as morpheme boundary)
* < (escaped with square brackets, to avoid collision with < as morpheme boundary)
* #


## Flag diacritics
We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:

| Flag | Explanation
| ---- | -----------
|  @P.NeedNoun.ON@nominalised | (Dis)allow compounds with verbs unless nominalised
|  @D.NeedNoun.ON@nominalised | (Dis)allow compounds with verbs unless nominalised
|  @C.NeedNoun@nominalised | (Dis)allow compounds with verbs unless nominalised
|  @P.Vgen.add@VGen | (Dis)allow VGen
|  @R.Vgen.add@VGen | (Dis)allow VGen
|  @P.12p.add@forms | (Dis)allow 1. and 2. pers forms
|  @R.12p.add@forms | (Dis)allow 1. and 2. pers forms
|  @P.Pmatch.Loc@split. | Used on multi-token analyses; tell hfst-tokenise/pmatch where in the form/analysis the token should be split.
|  @P.Pmatch.Backtrack@missed) | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)



| Flag | Explanation
| ---- | -----------
|  @D.ErrOrth.ON@@CODE@
|  @C.ErrOrth@@CODE@
|  @P.ErrOrth.ON@@CODE@
|  @R.ErrOrth.ON@@CODE@

For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.

| Flag | Explanation
| ---- | -----------
|  @P.CmpFrst.FALSE@first | Require that words tagged as such only appear first
|  @D.CmpPref.TRUE@ENDLEX | Block such words from entering ENDLEX
|  @P.CmpPref.FALSE@compounds | Block these words from making further compounds
|  @D.CmpLast.TRUE@R | Block such words from entering R
|  @D.CmpNone.TRUE@compounding | Combines with the next tag to prohibit compounding
|  @U.CmpNone.FALSE@compounding | Combines with the prev tag to prohibit compounding
|  @U.CmpNone.TRUE@compounding | Combines with the two previous ones to block compounding
|  @P.CmpOnly.TRUE@R | Sets a flag to indicate that the word has passed R
|  @D.CmpOnly.FALSE@root. | Disallow words coming directly from root.
|  @D.CmpHyph.TRUE@nouns | Flag to control hyphenated compounds like proper nouns
|  @U.CmpHyph.FALSE@nouns | Flag to control hyphenated compounds like proper nouns
|  @U.CmpHyph.TRUE@nouns | Flag to control hyphenated compounds like proper nouns
|  @C.CmpHyph@nouns | Flag to control hyphenated compounds like proper nouns

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.

| Flag | Explanation
| ---- | -----------
|  @U.Cap.Obl@deatnulasj. | Allowing downcasing of derived names: deatnulasj.
|  @U.Cap.Opt@deatnulasj. | Allowing downcasing of derived names: deatnulasj.


* **@U.NeedsVowRed.OFF@samediggi-** is used to force hyphenation/non-reduction: samediggi-
* **@U.NeedsVowRed.ON@samedigge#xxx** is used to force reduction w/o hyphen: samedigge#xxx
* **@C.NeedsVowRed@compounding** Clearing this feature, so that it doesn't interfere with further compounding

* @C.Px@@CODE@
* @C.Nom3Px@@CODE@
* @P.Px.add@@CODE@
* @R.Px.add@@CODE@
* @P.Px.block@@CODE@
* @D.Px.block@@CODE@
* @P.Nom12Px.add@@CODE@
* @R.Nom12Px.add@@CODE@
* @P.Nom3Px.add@@CODE@
* @R.Nom3Px.add@@CODE@

* **@R.SpellRlx.ON@those).** Flag used to tag spell-relax-analysed strings (and only those).
* **@D.SpellRlx.ON@those).** Flag used to tag spell-relax-analysed strings (and only those).
* **@C.SpellRlx@those).** Flag used to tag spell-relax-analysed strings (and only those).

* **@R.SpaceCmp.ON@space** Flag to tag compounds written with a space
* **@D.SpaceCmp.ON@space** Flag to tag compounds written with a space
* **@C.SpaceCmp@space+** Flag to tag compounds written with a space+



## Basic lexica, pointing to the other lexicon files


* **LEXICON Rooteverything** is the basic lexicon starting everything

**Abbreviation**


* **LEXICON Acronym**@CODE@****


* **LEXICON ProperNoun**@CODE@****


Lexicon ENDLEX
And this is the ENDLEX of everything:

@D.CmpOnly.FALSE@@D.CmpPref.TRUE@@D.NeedNoun.ON@ ENDLEX2 ;@CODE@

The `@D.CmpOnly.FALSE@` flag diacritic is used to disallow words tagged
with +CmpNP/Only to end here.
The `@D.NeedNoun.ON@` flag diacritic is used to block illegal compounds.

**ENDLEX2**

**ENDLEX3**

**ENDLEX4**
* * *
<small>This (part of) documentation was generated from [../src/fst/root.lexc](http://github.com/giellalt/lang-sme/blob/main/../src/fst/root.lexc)</small>