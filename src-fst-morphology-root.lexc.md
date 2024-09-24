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
* +Sem/Build-room_Org
* +Sem/Buildpart_Cat
* +Sem/Buildpart_Cat_Ctain
* +Sem/Buildpart_Cat_Ctain_Mat
* +Sem/Buildpart_Ctain
* +Sem/Buildpart_Ctain_Mat
* +Sem/Buildpart_Ctain_Obj
* +Sem/Buildpart_Org
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
* +Sem/Hum_Org_Pos
* +Sem/Hum_Part
* +Sem/Hum_Plant
* +Sem/Hum_Plc
* +Sem/Hum_Pos
* +Sem/Hum_Prod-vis !ikona
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

<small>This (part of) documentation was generated from [src/fst/morphology/root.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/root.lexc)</small>
