!!!Free and Open source Northern Sami analyser giella-sme

;Authors: Divvun and Giellatekno teams, community members
;Software version: 2012
;Documentation license: GNU GFDL
;SVN Revision: $Revision: 68217 $
;SVN Date: $Date: 2013-01-16 11:31:33 +0200 (Wed, 16 Jan 2013) $

!!!giella-sme

This is free and open source Northern Sami morphology.
Divvun & Giellatekno - open source grammars for North Sámi.

                    !!!North Sámi morphological analyser


!!Multicharacter symbols



!Tags for POS

 * __+Ex/N	__ - This tag is not added in lexc. The POS tag before derivation is converted into this tag when compiling FST for disambiguation.
 * __+Ex/A	__ - This tag is not added in lexc. The POS tag before derivation is converted into this tag when compiling FST for disambiguation.
 * __+Ex/V	__ - This tag is not added in lexc. The POS tag before derivation is converted into this tag when compiling FST for disambiguation.

 * __ +N       __ - Noun
 * __ +A       __ - Adjective
 * __ +Adv     __ - Adverb
 * __ +V       __ - Verb
 * __ +Pron    __ - Pronoun
 * __ +CS      __ - Subjunction
 * __ +CC      __ - Conjunction
 * __ +Adp     __ - Adposition, ie Post- and Prepostion, NOT IN USE
 * __ +Po      __ - Postpostion
 * __ +Pr      __ - Preposition
 * __ +Interj  __ - Interjection
 * __ +Pcle    __ - Particle
 * __ +Num     __ - Numeral

!Tags for sub-POS
 * __ +Prop      __ - Propernoun
 * __ +Pers      __ - Personal Pronoun
 * __ +Dem       __ - Demonstrative Pronoun
 * __ +Interr    __ - Interrogative Pronoun
 * __ +Refl      __ - Reflexive Pronoun
 * __ +Recipr    __ - Reciprocal Pronoun
 * __ +Rel       __ - Relative Pronoun
 * __ +Indef     __ - Indefinitive Pronoun
 * __ +Coll      __ - Collective numerals, subtag for +N
 * __ +Arab      __ - Arabic numeral, subtag for +Num
 * __ +Rom       __ - Roman numeral, subtag for +Num
 * __ +Pass      __ - hallat/haddat not in use
 * __ +Known     __ - man (different from maid): mii+Pron+Rel+Sg+Acc+Known


!!Tags for Inflection

!Tags for Case and Number Inflection
 * __+Sg__ - Singular
 * __+Du__ - Dual
 * __+Pl__ - Plural

 * __+Ess__ - Essive
 * __+Nom__ - Nominative
 * __+Gen__ - Genitive
 * __+Acc__ - Accusative
 * __+Ill__ - Illative
 * __+Loc__ - Locative = Inessive and Ellative
 * __+Com__ - Comitative
 * __+Com/Sh__ - Comitative Plural Hyphened Shortform (w/o -guin), ie Beatnagii-, Biillai-, Bohccui- etc.

!Possessive tags

 * __+PxSg1__    Singular First Person
 * __+PxSg2__    Singular Second Person
 * __+PxSg3__    Singular Third Person
 * __+PxDu1__    Dual First Person
 * __+PxDu2__    Dual Second Person
 * __+PxDu3__    Dual Third Person
 * __+PxPl1__    Plural First Person
 * __+PxPl2__    Plural Second Person
 * __+PxPl3__    Plural Third Person

!Adjectival tags
 * __+Comp__   Comparative
 * __+Superl__   Superlative
 * __+Attr__   Attributive
 * __+Card__   Cardinal Number Not in use
 * __+Ord__   Ordinal Number

!Moods
 * __+Ind__ Indicative
 * __+Pot__ Potential
 * __+Cond__ Conditional
 * __+Imprt__ Imperative

!Tenses
 * __+Prs__ Present Tense
 * __+Prt__ Past Tense, Preterite

!Verb person-number

 * __+Sg1__ Singular First Person
 * __+Sg2__ Singular Second Person
 * __+Sg3__ Singular Third Person
 * __+Du1__ Dual First Person
 * __+Du2__ Dual Second Person
 * __+Du3__ Dual Third Person
 * __+Pl1__ Plural First Person
 * __+Pl2__ Plural Second Person
 * __+Pl3__ Plural Third Person

!Infinite verb forms

 * __+Inf__ Infinitive
 * __+Ger__ Gerund
 * __+ConNeg__ Negation Form, ie Mana, Doalvvo, Juoge etc
 * __+ConNegII__ Alternative, Rather Declamatory Negation Form - Infrequent
 * __+Neg__ Negation Verb, Ii and its forms, ie Ale, Alli, Allot, Ehpet, Eat etc.
 * __+ImprtII__ Alternative, Rather Declamatory Imperative Form - Infrequent not in use
 * __+PrsPrc__ Present Participe
 * __+PrfPrc__ Perfect Participe
 * __+Sup__ Supine
 * __+VGen__ VerbGenitive
 * __+VAbess__ VerbAbbesive
 * __+Actio__ Action Verb Form

!Other tags

 * __+ABBR__ Abbreviation, subtag for e.g. +N
 * +Symbol = independent symbols in the text stream, like £, €, ©
 * __+ACR__  Acronym, subtag for +N
 * __+CLB__  Clause border (full stop, comma..)
 * __+PUNCT__  punctuation
 * __+LEFT__  left paranthesis
 * __+RIGHT__  right paranthesis
 * __+Dyn__  Dynamically generated (acronyms) +ACR+Dyn
 * __+CLBfinal__  Sentence final abbreviated expression ending in full stop, so that the full stop is ambiguous

 * __+TV__    Transitive Verb, +V+TV
 * __+IV__ Intransitive Verb, +V+IV
 * __+G3__ Grade 2-3 for homonymies with grade 1-2, +N+G3
 * __+G7__ Grade 3, no consonant gradation, +N+G7
 * __+NomAg__ Actor Noun From Verb - Nomen Agentis, +N+NomAg

 ; +Gram/TAbbr : Transitive abbreviation (it needs an argument)
 ; +Gram/NoAbbr : Intransitive abbreviations that are homonymous
   with more frequent words. They should only be considered
   abbreviations in the middle of a sentence.
 ; +Gram/TNumAbbr : Transitive abbreviation if the following
            constituent is numeric
 ; +Gram/NumNoAbbr : Transitive abbreviations for which numerals
are complements and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentence can be considered as true cases.
 ; +Gram/TIAbbr : Both transitive and intransitive abbreviation
 ; +Gram/IAbbr : Intransitive abbreviation (it takes no argument)
 ; +Gram/3syll :trisyllabic verbs
 ; +Gram/Superl 
 ; +Gram/Comp 


!Question and Focus particles:
 * __+Qst__   Question Particle: +Pcle+Qst
 * __+Subqst__   Embedded Question Particle: +Adv+Subqst
 * __+Foc/naj__	Focus clitic
 * __+Foc/Neg-ge__	Focus clitic
 * __+Foc/Pos-ge__	Focus clitic
 * __+Foc/gen__	Focus clitic
 * __+Foc/ges__	Focus clitic
 * __+Foc/gis__	Focus clitic
 * __+Foc/ba__	Focus clitic
 * __+Foc/be__	Focus clitic
 * __+Foc/hal__	Focus clitic
 * __+Foc/han__	Focus clitic
 * __+Foc/bai__	Focus clitic
 * __+Foc/bas__	Focus clitic
 * __+Foc/bat__	Focus clitic
 * __+Foc/ban__	Focus clitic
 * __+Foc/son__	Focus clitic
 * __+Foc/bahal__	Focus clitic
 * __+Foc/behal__	Focus clitic
 * __+Foc/bahan__	Focus clitic
 * __+Foc/behan__	Focus clitic
 * __+Foc/bason__	Focus clitic
 * __+Foc/beson__	Focus clitic
 * __+Foc/mat__	Focus clitic
 * __+Foc/mis__	Focus clitic
 * __+Foc/s__	Focus clitic



!Tags distinguishing different versions of the same lemma (before POS)
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

!Escaped chars

 * __ %        __
 * +Guess for the name guesser
 * __ +MWE     __ - Multi-word expressions treated as such in the preprocessor. To be added as first tag after the lemma

 * +PxCPlComRecipr used in pronoun-sme-morph.txt


!Error (non-standard language) tags

 * __+Err/Orth__ substandard, not in normative fst
 * __+Err/Orth-a-á__ substandard, not in normative fst
 * __+Err/Orth-nom-gen__ substandard, not in normative fst
 * __+Err/Orth-nom-acc__ substandard, not in normative fst
 * __+Err/Lex__ substandard, not in normative fst, no normative lemma
 * __+Err/DerSub__ substandard for derivation, not in normative fst, no normative lemma
 * __+Err/CmpSub__ substandard for compounding, not in normative fst (wrong form or POS in first part)
 * __+Err/MissingSpace__ indicates that there is a missing space, causing an orthographic error
 * __+Err/MissingHyph__ when there is no hyphen where it should have been
 * __+Err/Hyph__ when there is a hyphen where none should have been
 * __+Err/SpaceCmp__ used for compounds written apart - only retained in the HFST Grammar Checker disambiguation analyser
 * __+Err/Spellrelax__ used to tag spellrelaxed typos (tag is inserted via flag diacritics)
 * __+Err/Confused__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-Ess__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-ASgNom__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-DerPassPrsSg3__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-NSgPxSg1__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-NomAgIll__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-ImprtDu1__ grammarcheking rela word error confusion pairs
 * __+Err/Confused-Der/PassPrtSg3__ grammarcheking rela word error confusion pairs


!Usage tags

 * __+Use/-Spell__ Orthographically correct, typically perifer words, excluded in speller because they cause trouble for frequent words
 * __+Use/-PLX__ Excluded in PLX-speller
 * __+Use/SpellNoSugg__ recognized but not suggested in speller
 * __+Use/Circ__ circular paths (old ^C^)
 * __+Use/CircN__ circular paths for the numerals (old ^N^)
 * __+Use/MT__ Generate for MT only, for restricting analyses needed
              for MT generation not to pop up elsewhere (NOT IN FUNCTION)
 * __+Use/LIA__ only for LIA-analyser
 * __+Use/NG__ not-generate, for ped generation isme-ped.fst and MT
 * __+Use/NGminip__ Not for miniparadigm in NDS dicts
 * __+Use/PMatch__ means that the following is only used in the analyser feeding the disambiguator
 * __+Use/-PMatch__ Do not include in fst's made for hfst-pmatch
 * __+Use/GC__ only retained in the HFST Grammar Checker disambiguation analyser
 * __+Use/-GC__ never retained in the HFST Grammar Checker disambiguation analyser
 * __+MWESplit__ Split point for MWE

!Dialect tags:

 * __ +Dial/-KJ  __ forms not in use in KJ (Kárásjohka)
 * __ +Dial/-GG  __ forms not in use in GG (Guovdageaidnu)
 * __ +Dial/-GS  __ forms not in use in GS (Gárasavvon) NOT IN USE
 * __ +South     __ foreløpig lagt til Sg Loc -n, som er en sub-form

!Tags for indicating the orthography used
 +Orth/Strd - Standard orthography
 +Orth/IPA - IPA transcription

The above should either be used in pairs, or not at all. That is, if a word
doesn't need an IPA stem (because the word in all its inflection can be
converted to IPA by the standard IPA conversion rules), then none of these
tags should be used.
On the other hand, if the word has a spelling that doesn't follow the
orthographic rules, and thus needs an exceptional IPA stem to get it right,
then the exceptional stem must be marked with the {{+Orth/IPA}}, and the
regular orthography stem must be marked with the tag {{+Orth/Strd}}. This is
so that we can exclude the one or the other from different fst's, but only
when the oposite stem variant is present.

!Multichars for marking start and end of IPA sequences
 * %{%<ipa#%} - ipa text to the left
 * %{#ipa%>%} - ipa text to the right
 * %<sent%> apertium

!Compounding tags

The tags are of the following form:
* __+CmpNP/xxx__ - Normative (N), Position (P), ie the tag describes what
                   position the tagged word can be in in a compound
* __+CmpN/xxx__  - Normative (N) __form__ ie the tag describes what
                   form the tagged word should use when making compounds
* __+Cmp/xxx__   - Descriptive compounding tags, ie tags that ''describes''
                   what form a word actually is using in a compound

This entry / word should be in the following position(s):

 * __+CmpNP/All__ - ... in all positions, __default__, this tag does not have to be written
 * __+CmpNP/First__ - ... only be first part in a compound or alone
 * __+CmpNP/Pref__ - ... only __first__ part in a compound, NEVER alone
 * __+CmpNP/Last__ - ... only be last part in a compound or alone
 * __+CmpNP/Suff__ - ... only __last__ part in a compound, NEVER alone
 * __+CmpNP/None__ - ... does not take part in compounds
 * __+CmpNP/Only__ - ... only be part of a compound, i.e. can never
                    be used alone, but can appear in any position

If unmarked, any position goes.

The tagged part of the compound should make a compound using:

 * __+CmpN/SgN__ Singular Nominative
 * __+CmpN/SgG__ Singular Genitive
 * __+CmpN/PlG__ Plural Genitive
 * __+CmpN/PlN__ Plural Nominative, propers!

Unmarked = Default, ie {{+CmpN/SgN}} for SME.

The second part of the compound may require that the previous (left part) is:

 * __+CmpN/SgNomLeft__ Singular Nominative
 * __+CmpN/SgGenLeft__ Singular Genitive
 * __+CmpN/PlGenLeft__ Plural Genitive


Tags for descriptive compound analysis - this is what a compound actually is:

 * __+Cmp__ - Dynamic compound. This tag should always be part
                of a dynamic compound. It is important for
                Apertium, and useful in other cases as well.
 * __+Cmp/Attr__ - Attributive
 * __+Cmp/SgNom__ - Singular Nominative
 * __+Cmp/SgGen__ - Singular Genitive
 * __+Cmp/PlGen__ - Plural Genitiv
 * __+Cmp/SplitR__ - This is a split compound with the other part to
                the right: "Arbeids- og inkluderingsdepartementet"
                => Arbeids- = +Cmp/SplitR
 * __+Cmp/SplitL__ - This is a split compound with the other part to the left
 * __+Cmp/Sh__ - testing +Cmp/Sh
 * __+Cmp/Hyph__ - on dynamic compounds that have a hyphen
 * __+Cmp/NoHyph__ - On compounds that COULD have had a hyphen (and usually have), but doesn't
 * __+Cmp/SoftHyph__ - Tags compounds containing SOFT HYPHENS (U+00AD)
 * __+Cmp/Cit__ - Tags citation compounds, which can in principle
                cover any word. Requires a hyphen.

!Compounding tag ordering
To ease writing and maintaining regexes etc for manipulating and enforcing
compounding, it is important to keep the tags in a certain order.
The order is:
# __+CmpN/__ tags
# __+CmpNP/__ tags
# __+Cmp/__ tags - this is always true since the descriptive tags are always
  part of the continuation lexicons, and will be located after the POS tag.





!Semantic tags to help disambiguation & synt. analysis: (before POS)

 *  +Sem/Act          = Activity
 *  +Sem/Adr          = Webadr
 *  +Sem/Amount       = Amount
 *  +Sem/Ani          = Animate
 *  +Sem/Aniprod      = Animal Product
 *  +Sem/Body         = Bodypart
 *  +Sem/Body-abstr   = siellu, vuoig?a, jierbmi, (noe man kan bruke i fysisk aktivitet som en kroppsdel, f.eks. synet, stemmen, etc.)
 *  +Sem/Build        = Building
 *  +Sem/Build-room   = Room in a building, typically place to be
 *  +Sem/Buildpart   = Part of Bulding, like the wall
 *  +Sem/Cat          = Category
 *  +Sem/Clth         = Clothes
 *  +Sem/Clth-jewl    = Jewelery
 *  +Sem/Clthpart    = part of clothes, boallu, sávdnji...
 *  +Sem/Ctain        = Container
 *  +Sem/Ctain-abstr  = Abstract container like bank account
 *  +Sem/Ctain-clth   = Soft container, like a rucksack
 *  +Sem/Ctain-Obj    = Soft container, like a rucksack
 *  +Sem/Curr         = Currency like dollár, Not Money
 *  +Sem/Date         = Date
 *  +Sem/Dance        = Dance
 *  +Sem/Dir          = Direction like GPS-kursa
 *  +Sem/Domain       = Domain like politics, reindeerherding (a system of actions)
 *  +Sem/Drink        = Drink
 *  +Sem/Dummytag     = Dummytag
 *  +Sem/Edu          = Educational event
 *  +Sem/Event        = Event
 *  +Sem/Feat         = Feature, like Árvu. (noe som man kan ha mye eller lite av, det kan være en skala og som er på en måte karakteriserende. (høyde, vekt, farge, kreativitet etc.)
 *  +Sem/Feat-phys    = Physiological feature, ivdni, fárda
 *  +Sem/Feat-psych   = Psychological feauture
 *  +Sem/Feat-measr   = Psychological feauture
 *  +Sem/Fem          = Female name
 *  +Sem/Food         = Food
 *  +Sem/Food-med     = Medicine
 *  +Sem/Fruit        = Fruits, vegetables, seeds, nuts
 *  +Sem/Furn         = Furniture
 *  +Sem/Game         = Game
 *  +Sem/Geom         = Geometrical object
 *  +Sem/Group        = Animal or Human Group
 *  +Sem/Hum          = Human
 *  +Sem/Hum-abstr    = Human abstract
 *  +Sem/Hum-prof     = Human professional
 *  +Sem/Ideol        = Ideology
 *  +Sem/ID        = ID
 *  +Sem/Lang         = Language
 *  +Sem/Mal          = Male name
 *  +Sem/Mat          = Material for producing things
 *  +Sem/Measr        = Measure
 *  +Sem/Money        = Has to do with money, like wages, not Curr(ency)
 *  +Sem/Obj          = Object
 *  +Sem/Obj-clo      = Cloth
 *  +Sem/Obj-cogn     = Cloth
 *  +Sem/Obj-el       = (Electrical) machine or apparatus
 *  +Sem/Obj-ling     = Object with something written on it
 *  +Sem/Obj-rope     = flexible ropelike object
 *  +Sem/Obj-surfc    = Surface object
 *  +Sem/Org          = Organisation
 *  +Sem/Part         = Feature, oassi, bealli
* Perc = (perception) er noe man kan kjenne i en begrensa periode og som er forårsaka av noe utenifra, f.eks. Mus lea ballu. Mus lea bavččas.
 *  +Sem/Perc-cogn    =  
 *  +Sem/Perc-emo     = Emotional perception
 *  +Sem/Perc-phys    = Physical perception
 *  +Sem/Perc-psych   = Psychological perception
 * +Sem/Phonenr = Telephone number
 *  +Sem/Plant        = Plant
 *  +Sem/Plantpart   = Plant part
 *  +Sem/Plc          = Place
 *  +Sem/Plc-abstr    = Abstract place
 *  +Sem/Plc-elevate  = Place
 *  +Sem/Plc-line     = Place
 *  +Sem/Plc-water    = Place
 *  +Sem/Pos          = Position (as in social position job)
 *  +Sem/Process      = Process
 *  +Sem/Prod         = Product
 *  +Sem/Prod-audio   = Audio product
 *  +Sem/Prod-cogn    = Cognition product
 *  +Sem/Prod-ling    = Linguistic product
 *  +Sem/Prod-vis     = Visual product
 *  +Sem/Rel          = Relation
 *  +Sem/Route        = Route
 *  +Sem/Rule         = Rule or convention
 *  +Sem/Semcon       = Semantic concept
 *  +Sem/Sign         = Sign (e.g. numbers, punctuation)
 *  +Sem/Sport        = Sport
 *  +Sem/State        =
 *  +Sem/State-sick   = Illness
 *  +Sem/Substnc      = Substance, like Air and Water
 *  +Sem/Sur          = Surname
 *  +Sem/Symbol       = Symbol
 *  +Sem/Time         = Time
 *  +Sem/Time-clock   = Time clock
 *  +Sem/Tool         = Prototypical tool for repairing things
 *  +Sem/Tool-catch   = Tool used for catching (e.g. fish)
 *  +Sem/Tool-clean   = Tool used for cleaning
 *  +Sem/Tool-it      = Tool used in IT
 *  +Sem/Tool-measr   = Tool used for measuring
 *  +Sem/Tool-music   = Music instrument
 *  +Sem/Tool-write   = Writing tool
 *  +Sem/Txt          = Text (girji, lávlla...)
 *  +Sem/Veh          = Vehicle
 *  +Sem/Wpn          = Weapon
 *  +Sem/Wthr         = The Weather or the state of ground
 *  +Sem/Year         - year (i.e. 1000 - 2999), used only for numerals



!Multiple Semantic tags:
 * +Sem/Act_Fruit                      
 * +Sem/Act_Group Activity and Group
 * +Sem/Act_Plc   A persons job is an activity, and a place as well
 * +Sem/Act_Route Activity and Route, ie johtolat
 * +Sem/Act_Tool-it
 * +Sem/Amount_Build   Amount and Building
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
 * +Sem/Hum_Sign
 * +Sem/Hum_Plant
 * +Sem/Hum_Plc
 * +Sem/Hum_Tool
 * +Sem/Hum_Tool-it                     = Human
 * +Sem/Hum_Veh
 * +Sem/Hum_Wthr
 * +Sem/Lang_Tool
 * +Sem/Mat_Plant
 * +Sem/Mat_Txt
 * +Sem/Measr_Obj_Time                 
 * +Sem/Measr_Sign                      = Sign (e.g. numbers, punctuation)
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




 * +Allegro from LEXICON GOADE-IU-







{{{



}}}


All non-positional derivations should be preceded by this tag, to make it possible
to target regular expressions at all derivations in a language-independent way:
just specify +Der|+Der1 .. +Der5 and you are set.

 * +Der

!Other/unclassified derivations, can appear in all positions:

 * +Der/veara  NA#
 * +Der/viđá  NA#
 * +Der/viđi  NA#
 * +Der/has  only one in the code


!Miscellanious list

 * +Der/A Adjective derivated from Noun or Verb
 * +Der/Adv Adverb derivated from Adjective

!!Tags for originating language

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
# any untagged word is pronounced with SME orthographic conventions
# NNO and NOB have identical pronunciation, NNO is only used if
  different in spelling from NOB
# SWE has mostly the same pronunciation as NOB, and is only used
  if different in spelling from NOB
# Occasionally even SME (the default) may be tagged, to block other
  languages from being specified, mainly during semi-automatic
  language tagging sessions
All in all, we want to get as much correctly transcribed to IPA
with as little work as possible. On the other hand, if more words
are tagged than strictly needed, this should pose no problem as
long as the IPA conversion is correct - at least some words will
get the same pronunciation whether read as SME or NOB/NNO/SWE.

 * +OLang/SME - North Sámi
 * +OLang/SMJ - Lule Sámi
 * +OLang/SMA - South Sámi
 * +OLang/FIN - Finnish
 * +OLang/SWE - Swedish
 * +OLang/NOB - Norw. bokmål
 * +OLang/NNO - Norw. nynorsk
 * +OLang/ENG - English
 * +OLang/RUS - Russian
 * +OLang/UND - Undefined


!Triggers for morphophonological rules

 * X1  Diphthong Simplification, Metaphony
 * X2  Diphthong Simplification, Metaphony, Word Final Neutralization of g8, h8, m8
 * X3  Diphthong Simplification, Metaphony
 * X4  WeG, Vowel Shortening, Stem vowel alternations, Word Final Deletion of n8 m8 g8 h8
 * X5  WeG, Diphthong Simplification, Stem vowel alternations
 * X6  WeG, Diphthong Simplification, Metaphony, Word Final Deletion of n8 m8 g8 h8
 * X7  Vowel Shortening, Stem vowel alternations, Word Final Neutralization of g8, h8, m8
 * X8  WeG, Vowel Shortening, Metaphony, Stem Vowel alternations, Word Final Deletion of n8 m8 g8 h8
 * X9  WeG, Dipthtong simplification, Word Final Deletion of n8 m8 g8 h8
 * Y1  Lengthening of Central Consonants, Stem Vowel alternations,
 * Y2  Lengthening of Central Consonants, Stem Vowel alternations,
 * Y3  Lengthening of Central Consonants, Stem Vowel alternations,
 * Y4  Lengthening of Central Consonants, Stem Vowel alternations,
 * Y5  Lengthening of Central Consonants, Word Final Consonant Deletion, Diphthong Simplification, Stem vowel alternations
 * Y6  Lengthening of Central Consonants, Word Final Consonant Deletion, Diphthong Simplification, Stem vowel alternations
 * Y7  Lengthening of Central Consonants, Diphthong Simplification, Stem vowel alternations
 * Y8  Not in use
 * Y9  Lengthening of Central Consonants, Diphthong Simplification
 * Q1  Stem vowel alternations,
 * Q2  Diphthong Simplification, Stem vowel alternations,
 * Q3  Diphthong Simplification, Stem vowel alternations,
 * Q4  WeG, Stem vowel alternations,
 * Q5  WeG, Diphthong Simplification, Stem vowel alternations,
 * Q6  WeG, Vowel shortening,
 * Q7  WeG, Diphthong Simplification, Metaphony,
 * Q8  WeG, Diphthong Simplification, Stem vowel alternations,
 * Q9  Not in use
 * W1  WeG, Vowel Shortening
 * W2  Vowel Shortening,
 * W3  Stem vowel deletion in compounding,
 * W4  WeG, Word Final Cluster Simplification, Optional vowel-shortening, Word Final Deletion of n8 m8 g8 h8
 * W5  WeG, Diphthong Simplification, Stem vowel alternations
 * W6  Stem vowel alternations, WeG,
 * W7  Stem vowel alternations, WeG
 * W8  Stem vowel alternations,
 * W9  Not in use
 * %^DISIMP  diphthong simpification

!Morphophonemes and Sámi letters

 * b9  twol rule override, so that b doesn't turn into t infront of hash
 * e7  shortened i = "e with dot below" from the dictionary
 * e9  twol rule override, so that e doesn't turn into i infront of j
 * d9  twol rule override, so that d doesn't turn into t infront of hash
 * g8  Word Final Neutralization and Deletion
 * g9  twol rule override, so that g doesn't turn into t infront of hash
 * h7
 * h8  Word Final Neutralization and Deletion
 * h9  twol rule override, so that h doesn't turn into t infront of hash
 * i7  twol rule override, so that i doesn't turn into e in certain contextes
 * j9  twol rule override, so that j doesn't turn into i after i
 * k9  twol rule override, so that k doesn't turn into t infront of hash
 * m8  Word Final Neutralization and Deletion
 * m9  twol rule override, so that m doesn't turn into n infront of hash
 * n8  Word Final Neutralization and Deletion
 * n9  twol rule override,
 * o7  shortened u = "o with dot below" from the dictionary
 * o9  twol rule override,  so that o doesn't turn into u infront of j
 * p9  twol rule override, so that p doesn't turn into t infront of hash
 * s9  twol rule override, so that we can have two ss in front of hash
 * t9  twol rule override, so that we can have st in front of hash
 * u7
 * z9  twol rule override, to avoid Word Final Consonant Neutralization
 * ž9  twol rule override, to avoid Word Final Consonant Neutralization
 * š9  twol rule override, so that we can have two šš in front of hash
 * r9
 * æ7  in smi, for lulesámi
 * u6  twol rule override, so that u doesn't turn into o in certain contextes
 * æ9  in smi, for lulesámi


 ∑ - a symbol used in front of {{#}} to block backtracking and
          mwe reanalysis in hfst-tokenise (e.g. in dynanic compounds).
          Makes it possible to distinguish lexical and dynamic compounds
          in rules. It is converted to zero together with {{#}}.

!Symbols that need to be escaped on the lower side (towards twolc):

* »
* «
* > (escaped with square brackets, to avoid collision with > as morpheme boundary)
* < (escaped with square brackets, to avoid collision with < as morpheme boundary)


!!Flag diacritics
We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:
 | @P.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
 | @D.NeedNoun.ON@ | (Dis)allow compounds with verbs unless nominalised
 | @C.NeedNoun@ | (Dis)allow compounds with verbs unless nominalised
 | @P.Vgen.add@ | (Dis)allow VGen
 | @R.Vgen.add@ | (Dis)allow VGen
 | @P.12p.add@ | (Dis)allow 1. and 2. pers forms
 | @R.12p.add@ | (Dis)allow 1. and 2. pers forms

 | @P.Pmatch.Loc@ | Used on multi-token analyses; tell hfst-tokenise/pmatch where in the form/analysis the token should be split.
 | @P.Pmatch.Backtrack@ | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)




 | @D.ErrOrth.ON@ 
 | @C.ErrOrth@ 
 | @P.ErrOrth.ON@ 
 | @R.ErrOrth.ON@ 

For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.
 | @P.CmpFrst.FALSE@ | Require that words tagged as such only appear first
 | @D.CmpPref.TRUE@ | Block such words from entering ENDLEX
 | @P.CmpPref.FALSE@ | Block these words from making further compounds
 | @D.CmpLast.TRUE@ | Block such words from entering R
 | @D.CmpNone.TRUE@ | Combines with the next tag to prohibit compounding
 | @U.CmpNone.FALSE@ | Combines with the prev tag to prohibit compounding
 | @U.CmpNone.TRUE@ | Combines with the two previous ones to block compounding
 | @P.CmpOnly.TRUE@ | Sets a flag to indicate that the word has passed R
 | @D.CmpOnly.FALSE@ | Disallow words coming directly from root.
 | @D.CmpHyph.TRUE@ | Flag to control hyphenated compounds like proper nouns
 | @U.CmpHyph.FALSE@ | Flag to control hyphenated compounds like proper nouns
 | @U.CmpHyph.TRUE@ | Flag to control hyphenated compounds like proper nouns
 | @C.CmpHyph@ | Flag to control hyphenated compounds like proper nouns
Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.
 | @U.Cap.Obl@ | Allowing downcasing of derived names: deatnulasj.
 | @U.Cap.Opt@ | Allowing downcasing of derived names: deatnulasj.


 * @U.NeedsVowRed.OFF@ is used to force hyphenation/non-reduction: samediggi-
 * @U.NeedsVowRed.ON@ is used to force reduction w/o hyphen: samedigge#xxx
 * @C.NeedsVowRed@ Clearing this feature, so that it doesn't interfere with further compounding

 * @C.Px@
 * @C.Nom3Px@
 * @P.Px.add@
 * @R.Px.add@
 * @P.Px.block@
 * @D.Px.block@

 * @R.SpellRlx.ON@ Flag used to tag spell-relax-analysed strings (and only those).
 * @D.SpellRlx.ON@ Flag used to tag spell-relax-analysed strings (and only those).
 * @C.SpellRlx@ Flag used to tag spell-relax-analysed strings (and only those).

 * @R.SpaceCmp.ON@ Flag to tag compounds written with a space
 * @D.SpaceCmp.ON@ Flag to tag compounds written with a space
 * @C.SpaceCmp@ Flag to tag compounds written with a space+



!!Basic lexica, pointing to the other lexicon files


 * __LEXICON Root__ is the basic lexicon starting everything



 * __LEXICON Acronym   __


 * __LEXICON ProperNoun   __


!!!Lexicon ENDLEX
And this is the ENDLEX of everything:
{{{
 @D.CmpOnly.FALSE@@D.CmpPref.TRUE@@D.NeedNoun.ON@ ENDLEX2 ;
}}}
The {{@D.CmpOnly.FALSE@}} flag diacritic is ued to disallow words tagged
with +CmpNP/Only to end here.
The {{@D.NeedNoun.ON@}} flag diacritic is used to block illegal compounds.



Divvun & Giellatekno - open source grammars for Sámi and other languages

              !!!North Saami adjective declension file



!!Bisyllabic adjectives



 * __LEXICON BUORRE  __  For this adj only



 * __LEXICON BUOROT  __ SUB, Southern dialect



 * __LEXICON ALKI  __  Bisyll V-Adj, -es-Attr, no WeG.

 * __LEXICON SEARRA  __ Bisyll. V-Adj's with s-Attr in WeG.

 * __LEXICON HOHPI  __ Bisyll. V-Adj's with s-Attr. in WeG & Adv.

 * __LEXICON LAIKI  __ Bisyll. V-Adj's with es-Attr. in WeG & Adv.

 * __LEXICON LODJI  __ bisyll V-Adj with -es and -is Attr in WeG


 * __LEXICON JUHKKIS  __ Bisyll. V-Adj. with s-Attr; no Adv.


 * __LEXICON HAHTTI  __ Bisyll. V-Adj. no Adv. !sponsors wants comparatives for these!



 * __LEXICON EADDJI  __ Bisyll. V-Adj. no Adv.


 * __LEXICON NUORRA  __ Bisyll. V-Adj. w/CG, w/o Sep. Attr; no Adv.

 * __LEXICON RIEKTA  __  Bisyll adj w/o obl sg forms, WeG Attr



 * __LEXICON VIELG  __  adj with -es -attrib. (cns final adj)

 * __LEXICON VIELGAT __  just a sublexicon to VIELG

 * __LEXICON VIELG_NOCOMP  __  adj with -es -attrib. (cns final adj)

 * __LEXICON VIELGAT_NOCOMP __  just a sublexicon to VIELG_NOCOMP


 * __LEXICON CAHKK __  -at final adj with attr -es and -dis

 * __LEXICON JALGAT __  only jalgat, attr jalga and jalges

 * __LEXICON UHCC __  uhcci, unni, seaggi, attr uhca, unna, seakka

 * __LEXICON JEAGOHEAPMI __  caritives

 * __LEXICON BIVNNUHEAPME  __  no bivnnuhis here, special, beacause popular and unpopular collide in attribute form :)

 * __LEXICON JEAGOHEAPMI_NOCOMP __  caritives, no comparative

 * __LEXICON OATNI  __  only this adj, no attr


!!Consonant-final even-syllabic adjectives

 * __LEXICON TUVRRAHAS  __  

 * __LEXICON ISSORAS  __  issoras and certain as-adj. also derivations, final -s

 * __LEXICON IHKALAS-DABALAS __ loan adjectives ending on -ihkalaš - kritihkalaš etc

 * __LEXICON IIVVAL-DABALAS __ loan adjectives ending on -iivvalaš


 * __LEXICON ISTTALAS __ loan adjectives ending on -ihkalaš


 * __LEXICON DABALAS  __   -laš adjectives with short Attr and SgNom Comp forms - dábálet, dábálut etc

 * __LEXICON NVDCompAttr_ISSORASSA-  __  sublexicon to DABALAS



 * __LEXICON DEARVVASLAS  __  -laš adjectives without short Attr and SgNom Comp forms. The word dearvvaslaš/dearvvašlaš is not directed here, but to DABALAS


 * __LEXICON DEARVVASLAS2  __  only to lift out ISSORASSA-, see DEARVVASLAS

 * __LEXICON STUORIBUS  __  -buš comparatives


 * __LEXICON ASEHAS __  5 words with -is attr: asehis, asihis, oanehis, vuollegis, vuolligis

 * __LEXICON UNOHAS   __  for this word only

 * __LEXICON IPMAHA  __ Tris. Gradating C-adj:s, The Troms declension: imaš:ipmaha, gáđaš:gáhtaha



!!Trisyllabic adjectives

 * __LEXICON MEAHTTUS  __  meahttun-adj. with comp. and superl. forms -seabbo, -seamos etc.

 * __LEXICON BEAKKAN  __ Trisyll. Non-gradating C-Adj. without Separate Attr.

 * __LEXICON BEAKKAN_NOCOMP  __ Trisyll. Non-gradating C-Adj. without Separate Attr. No comparatives

 * __LEXICON GEARDAN  __ Trisyll. Non-gradating C-Adj. without Separate Attr.

 * __LEXICON JOHTIL  __ Trisyll. Non-gradating C-Adj. with is-Attr.


 * __LEXICON RAHKAT  __ Trisyll. Non-gradating C-Adj. with is-Attr. TO AVOID RAHKADIT


 * __LEXICON HEITTOHA  __ Trisyll. Non-gradating C-Adj. with is-Attr.

 * __LEXICON GUOHCA  __ Trisyll. Gradating V-Adj., no sep. Attr.

 * __LEXICON GARAS  __ Trisyll. Gradating C-Adj. with Bisyll. a-Attr. and final s Pred

 * __LEXICON LINIS  __ Trisyll. Gradating C-Adj. with Bisyll. a-Attr. and final s Pred

 * __LEXICON SUVRRIS   __ Trisyll. Gradating C-Adj. with Bisyll. weak grade a-Attr. and final s Pred

 * __LEXICON NANUS   __ Trisyll. Gradating C-Adj. with Bisyll. weak grade u-Attr. and final s Pred

 * __LEXICON LOSSAT  __ Trisyll. Gradating C-Adj. with Bisyll. a-Attr. and final t  Pred. geahppat and lossat, words with bisyllable form comparatives in addition to trisyllable form: geahpit, losit


 * __LEXICON CAVGAT  __ Trisyll. Gradating C-Adj. with Bisyll. a/es-Attr. and final t Pred, both -but and -eappot comparatives

 * __LEXICON CIENAL  __ Trisyll. Gradating C-Adj. with Strong Grade is-Attr.

 * __LEXICON NJUORAS  __ Trisyll. Gradating C-Adj., with Strong Grade a-Attr.

 * __LEXICON DILDDAS  __  ,-ld-(#=is) Trisyll Grad., facult is-Attr.

 * __LEXICON VUOGAS  __  Trisyll. adj. with gradation I-III and no sep. attr. only this word, vuogas, vuohkkasat

 * __LEXICON HEAHKAS  __  ,-hkk-#=is heahkka Trisyll Grad., is-Attr & heahkka

 * __LEXICON EATTAS  __  ,-dd-#=is Trisyll. Grad. C-Adj. with WeG -is Attr.

 * __LEXICON BOAKKAS  __  ,-gg-#boagge9- Trisyll no attr


 * __LEXICON FARGAT  __  :d#Ø Trisyll no attr


 * __LEXICON GAPPUS  __  -bbo- Trisyll, attr same as pred

 * __LEXICON VATTIS  __  Trisyll CG, -es/-is Attr

 * __LEXICON BIEKKUS  __  ,-iggo-#=is Trisyll Grad, is-Attr,

 * __LEXICON LIEKKUS  __  ,-iggo-(#=is) Trisyll Grad,  attr same as pred

 * __LEXICON GUOROS __  guoros and luovos, Trisyll Grad,  attr same as pred


 * __LEXICON NUOLUS  __  ,-u8llo-(#nuolo9s)


 * __LEXICON GEARGGUS  __  ,-ergo-#gearggo9s

 * __LEXICON VUDDJII__  

 * __LEXICON VUDDJII_DECLINED  __ misses most cases


 * __ LEXICON JIEDNAI __  

 * __ LEXICON JIEDNAI_DECLINED  __ misses most cases

 * __LEXICON BOARIS  __  As GAPPUS, but with different attr.

 * __LEXICON BOARIS_NOCOMP __ 


 * __LEXICON IIVA_NOCOMP  __  IIVA_A without comparatives


 * __LEXICON IIVA_A  __  loans ending with -a, same attr as pred


 * __LEXICON FRIIJA  __  loans ending with -a, same attr as pred



 * __LEXICON BOREALA  __ FRIIJA without comparatives

 * __LEXICON SPANSKA __ spánska, dánska, fránska, ránska. WeG attr


 * __LEXICON ALLAT __ allat, gassat, govdat, attr: alla, gassa, govda. Trisyllables with Bisyllable compforms: alit, gasit, govddit


 * __LEXICON ALLAGA __ sublexicon to ALLAT and word árrat





!!Contracted adjectives

 * __LEXICON FIINNIS  __  ,-dná-(:Ø)#fiinna, western comp: fiidnát, eastern comp: fiidnásabbo/-sut/-sat


 * __ LEXICON DEAHTIS  __  as fiinnis, but with StrGr in Attr

 * __LEXICON SMAVIS  __  as deahtis, but with even more Attr forms and comparative smávit in addition

 * __LEXICON STUORIS  __  As fiinnis, but with different comparation

 * __LEXICON NJALGGAT __ Comp+Sg+Nom: njálgát, njálgásut/-sit/-sut/-sat, njálgáseabbo/-sabbo 

 * __LEXICON CAPPIS __  western comp: čábbát, eastern comp: čábbásabbo/-sut/-sat 


 * __LEXICON VIISSIS   __  Contr, CG and -is -> -á, attr -es/-is, western and eastern comp forms

 * __LEXICON RAHPIS   __  Contr, CG and -is -> -á, attr -es, with long and short comp forms

 * __LEXICON HARVVIS   __  Contr, CG and -is -> -á, attr -e, short comp forms

 * __LEXICON MALLASadj- __

 * __LEXICON MALLASadj-_MINIP __  for giving Use/NGminip-tags


 * __LEXICON MALLASI-/NUORABUadj- __

 * LEXICON DEVNVCASE    bisyllabic nominal declension

 * LEXICON GOAHTI-OBLadj    

 * __LEXICON GOAHTI-NEadj __

 * __LEXICON GODIIadj- __

 * __LEXICON GOADIadj- __


 * __LEXICON NomVadj  __


 * __LEXICON EssVadj __



!!Special cases

 * __LEXICON VEARATAG __

 * __LEXICON VEARA __



!!Final note on the adjective sublexica

todo: Rewrite the adj lexica so that the attr variation is kept separate
from the otherwise uniform declension.



 * __LEXICON VUDDJI- __

 * __LEXICON BOHCCOadj __

 * __LEXICON BOHCCUadj __






!!!Adjective declension

 * __LEXICON ATTR  __  This is the normal lexicon for ATTR forms

 * __LEXICON ATTRCONT  __  This lexicon is for forms with non-sub Attr, where we sub the rest.


 * __LEXICON LAIKI0     __  Directing adjectives ...





 * __LEXICON ISSORASSA- __


 * __LEXICON EABBO/EAMOS __ comparision for trisyllable adjectives

 * __LEXICON EABBO/EAMOS_MINIP __  for giving Use/NGminip-tags


 * __LEXICON EABBO/EAMOS_CONT __

 * __LEXICON EABBO/EAMOS_CONT_MINIP __ for giving Use/NGminip-tags


 * __LEXICON EAMOS_MINIP __  for giving Use/NGminip-tags



 * __LEXICON EABBO/EAMOS_CONT-contracted  __ for certain contracted adjectives, divided dialectwise

 * __LEXICON SHORTCOMP __

 * __LEXICON SHORTCOMP_MINIP __  for giving Use/NGminip-tags

 * __LEXICON SHORTCOMP_PRED_MINIP __  for giving Use/NGminip-tags


 * __LEXICON EABBU __ eastern form -abbo as well

 * __LEXICON EABBUCASE1 __

 * __LEXICON EABBUCASE2 __

 * __LEXICON EABBU_MINIP __  for giving Use/NGminip-tags

 * __LEXICON EABBUCASE1_MINIP __  for giving Use/NGminip-tags

 * __LEXICON EABBUCASE2_MINIP __  for giving Use/NGminip-tags


 * __LEXICON BU/MUS __  Bisyllabic adjectives comparision


 * __LEXICON BUStem __


 * __LEXICON EAMOS __ eastern form -amos as well



 * __LEXICON GAPPUS0 __ Almost id. to MALIS0. MALIS0 has no VUOHTA, GAPPUS0 has no Px Ess., and shouldn't have either.


 * __LEXICON GAPPUS- __

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

 * __LEXICON MEAHTTUN   __ Deverbal adjectives.


 * __LEXICON LEXATTR_GEAHTES __ trisyllabic stems: geahtes for trisyll, heapmi for bisyll

 * __LEXICON GEAHTES __  geahtes for trisyll, heapmi for bisyll

 * __LEXICON OVDDIT  __ Inherently comparative adjectives, bisyll

 * __LEXICON MADDELEABBO  __ Inherently comparative adjectives, trisyll







!!!Nominal derivation

!!Noun derivation


 * __LEXICON VUOHTA  __ +CmpN/SgG


 * __LEXICON VUOHTAMORPH __








!!!Adjective derivation


 * __LEXICON LAS __ from verbs: čirrolas, bealkálas etc


 * __LEXICON BUOREMUSS __ superlatives, from bisyll adjectives

 * __LEXICON BUOREMUS __

 * __LEXICON BUOREMUSSA- __




 * __LEXICON HEAPMI __ caritives

 * __LEXICON LAGAN __ lágan, lágán and subform lagan as well

 * __LEXICON LAGAS __ lágaš, lágáš and subform lagaš as well


 * __LEXICON LAGAN_LAGAS __


 * __LEXICON AHKASAS __ derived words on -saš, -haš, -laš

 * __LEXICON AHKASAS_PL __  derived words on -saš, -haš, -laš, only plural, 














 * __LEXICON SISKKALDAS __ olgguldas, siskkáldas, siskkildas, nuppáldas, that's all



 * __LEXICON DenominalAdjsV1 __ caritives and their derivatives (huvva, huhtti), from bisyll nouns

 * __LEXICON DenominalAdjsV1Long __ caritives and their derivatives (huvva, huhtti), from bisyll nouns without vowel shortening

 * __LEXICON DenominalAdjsV1Short __ caritives and their derivatives (huvva, huhtti), from bisyll nouns with vowel shortening




 * __LEXICON DenominalAdjsV2 __ from bisyllables, muoralaš, gieđalaš etc

 * __LEXICON DenominalAdjsV2_lasj __ from bisyllables, muoralaš, gieđalaš etc


 * __LEXICON DenominalAdjsC __ from trisyllables, -laš and caritives on -heapme



 * __LEXICON DenominalAdjsCLong __ from trisyllables, -laš and caritives on -heapme



 * __LEXICON DenominalAdjsCShort __ from trisyllables, -laš and caritives on -heapme




 * __LEXICON DenominalAdjsV3  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG !from Propernames

 * __LEXICON DenominalAdjsV3case  __ from bisyllabic propers


 * __LEXICON DenominalAdjsC2  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG	!from Propernames

 * __LEXICON DenominalAdjsC2case  __ from trisyllabic propers

 * __LEXICON DenominalAdjsV4  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG  from Propernames

 * __LEXICON DenominalAdjsV4case  __ from bisyllabic propers (subbed)

 * __LEXICON DenominalAdjsC3  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG	 !from Propernames

 * __LEXICON DenominalAdjsC3case  __ from trisyllabic propers (subbed)

 * __LEXICON LASJOBL __

 * __LEXICON HEAPMIOBL __ sublexicon not only for caritives on -heapmi/-heapme



!!Adverbs from adjectives

 * __LEXICON ADVV  __ adverb from bilysll stems

 * __LEXICON ADVC  __ adverb from trilysll stems




!!Adjectives from nouns

 * __LEXICON AGAdj  __  mostly words like guovttejagat, allajoccat etc

 * __LEXICON AGAdjINFL __

Divvun & Giellatekno - open source grammars for Sámi and other languages


              !!!North Saami noun declension





   Bisyllabic nouns



 * __LEXICON GOAHTI-A __ divided into a-i-u due to errortag-branch

 * __LEXICON GOAHTI-I  __ divided into a-i-u due to errortag-branch


 * __LEXICON GOAHTI-U  __ divided into a-i-u due to errortag-branch



 * __LEXICON GOAHTI __ Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen


 * __LEXICON GOAHTI-IU __ Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen


 * __LEXICON GOAHTILONG __ Long nom-compound-forms, long gen

 * __LEXICON GOAHTILONGSHORT __ Sometimes long nom-compound-forms, long gen

 * __LEXICON ALBMI __ Bisyll. V-Nouns. Short nom-compound-forms, long gen.


 * __LEXICON ALBMILONG __ Bisyll. V-Nouns. Long nom-compound-forms, long gen.


 * __LEXICON ALBMILONGSHORT __ Bisyll. V-Nouns. Long/SHORT nom-compound-forms, long gen.

 * __LEXICON AIGI __ Bisyll. V-Nouns. Short nom-compound-forms, short gen.


 * __LEXICON STAHTA __ Bisyll. Non-Gradating a-Nouns; i-Illative

it does not have the Prop tag.









  Bisyllabic nouns
  2f. Actor lexicas






 * __LEXICON IIJA __ loan words ending -iija; also with only -i as Err/Orth, like galleri

 * __LEXICON ESSEIJA __ loan words ending -iija; Illative -iijai as well -iijii: kopiijai, kopiijii


 * __LEXICON IIVA __ -iivva loan words. 

 * __LEXICON PROFIILA __  -iila Loan words.



 * __LEXICON STRUKTUR __ Recent loanwords on -vra with short cmp-form: struktur-

 * __LEXICON KULTUR __ -kultuvra, compound forms: kultur-, kulttor-

 * __LEXICON KANTUR_N __ word with many forms

 * __LEXICON MAŠIIDNA __ mašiidna with short cmp-forms as well

 * __LEXICON BENSIN __ bensiidna with short cmp-forms as well

 * __LEXICON ADRENALIN __ Recent loanwords on -iidna with short cmp-form as well


 * __LEXICON TELEFON __ Recent loanwords on -vdna with short cmp-form as well

 * __LEXICON AKTION __ akšuvdna with cmp form ákšun- as well

 * __LEXICON NATION __ naššuvdna with short cmp form náššon as well


 * __LEXICON KANON __ kanovdna with short cmp form kánon/kánun as well


 * __LEXICON SOSIAL __ Recent loanwords on -ála with both short and long cmp-form

 * __LEXICON GARGIA __  Vowel-final loan words without Gradation and Ill ^change

 * __LEXICON OBOE __  oe-final loan words without Gradation and Ill ^change


 * __LEXICON BUFFALO __ consonant fin loanwords, some vow fin like revya

 * __LEXICON ESSAYA __ recent loanwords on vow+a

 * __LEXICON IDEA __ restricted Px for speller recent loanwords on vow+a, only idea this far


 * __LEXICON MASAI __ only masai





 * __LEXICON BASSI __ words on -bassi. Long nom-compound-forms, short gen, long heapmi-caritive

 * __LEXICON MUOHTU __ words on -muohtu. Short nom-compound-forms, short gen, long heapmi-caritive

 * __LEXICON EADNI __ eadni, gudni, ádnu. Short nom-compound-forms, long gen, short caritive



 * __LEXICON VALDI __ words on -váldi. Short nom-compound-forms, long gen, short caritive, away with Px "váldán"


 * __LEXICON RAFI __ words on -ráfi. Long nom-compound-forms, long gen. short heapmi-caritive


 * __LEXICON LOTLOHKU __ words on -lotlohku. Long/SHORT nom-compound-forms, long gen.

 * __LEXICON SAPMI __ Bisyll. V-Nouns. No nom-compounding, short gen.

 * __LEXICON XGIELLA __ Bisyll. V-Nouns. No nom-compounding, short gen.


 * __LEXICON BEALLE __ words ending -bealle. Short nom-compound-forms, short gen.


 * __LEXICON TAXI __ dákse and tákse


 * __LEXICON LUONDU __ this word (+vuohta) because of behavior in compounds, where it is normally in SgGen: luonddubiebmu


 * __LEXICON GOADA-LUONDU __

 * __LEXICON NPx2V-LUONDU __


 * __LEXICON RUOKTU __ only this word because of its behavior in compounds, where it is normally in SgGen: ruovttu-/ruovtto-



 * __LEXICON MADIDJA __ máđi and cmp



 * __LEXICON GENTLEMAN __  gentleman (stem mana-)

 * __LEXICON DUOHKI __ ''duohki'' and compounds, for disamb. reasons




 * __LEXICON BUDEITA __ Rather special word: buđeita

 * __LEXICON MANNI __ words on -mánni. Long/SHORT nom-compound-forms, long gen.ILL:mánnii/mánnái


 * __LEXICON MANNI-INFL __


 * __LEXICON OLLUVUOHTA __ Exceptional vuohta-Noun


 * __LEXICON LEXMUSH __ derived verbs on -muš






 * __LEXICON OLGU __ only olgu. Short nom-compound-form, short gen. Incomplete paradigm

 * __LEXICON MIEHTI __ nuorta, nuorti, oarji, miehti. Short nom-compound-forms, long gen. Incomplete paradigm

 * __LEXICON LULLI __ lulli and davvi. Long/SHORT nom-compound-forms, long gen. Incomplete paradigm




 * __LEXICON GADDI __ Bisyll. V-Nouns with Comparative Forms.  Short nom-compound-forms, long gen.

 * __LEXICON GADDILONG __ long compound forms, short -heapme

 * __LEXICON GADDILONGSHORT __ NB! No SgIll and SgLoc (not directed to GOADI-, GODII- or GOAHTAI) because ''davvi'' is the only word this far Bisyll. V-Nouns with Comp. Forms, long-short nomcmp, long gencmp


 * __LEXICON GADDISHORT __ Bisyll. V-Nouns with Comparative Forms.  Short nom-compound-forms, SHORT gen.

 * __LEXICON OARJI __ máddi, nuorti, nuorta, oarji. Comparative Forms.  Short nom-compound-forms, long gen. Incomplete paradigms

 * __LEXICON LULLILONG __ long compound forms







 * __LEXICON VARRA __  varra and uvdna. No -laš, to get rid of varalaš and uvnnalaš from speller

 * __LEXICON LASSA __  want this without essive Px: *lassanan, *lassanat, *lassaneame

 * __LEXICON AKCU __  No -heapme, no wg+Foc/han (thereby avoiding ávččuhit, ávččuhan, ávččuhat in speller) Short nom-compound-form ákčo-,long/short gen

 * __LEXICON JAHKI __ Bisyll. V-Nouns. Short nom-compound-forms, long gen. to avoid jahkán, jagát

 * __LEXICON OAHPPA __ Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen, to avoid oahppasat


 * __LEXICON NPxC-OAHPPA __




 * __LEXICON BLV __ Bisyll. V-Nouns. Long nom-compound-forms, long gen., to avoid bálvát, Bihttánis


 * __LEXICON NPx2V-BLV __

 * __LEXICON NPxC-BLV __



 * __LEXICON Px2V-BLV   __ for second person vowel stems

 * __LEXICON SOABBI __ Bisyll. V-Nouns. Short nom-compound-forms goahte-,long/short gen, to avoid SOABBÁT, gáldot, searván, laktasan




 * __LEXICON NPx1V-SOABBI __


 * __LEXICON NPxC-SOABBI __


 * __LEXICON IVDNI __ Bisyll. V-Nouns. Short nom-compound-forms, short gen. preventing ivnnát, rivgot



 * __LEXICON NPx2V-IVDNI __

 * __LEXICON Px2V-IVDNI   __ for second person vowel stems


 * __LEXICON DAHKU __ Like ALBMILONG Bisyll. V-Nouns. Long nom-compound-forms, long gen. Without +Sg+Nom/Gen/Acc+PxSg1 to avoid "dahkon"


 * __LEXICON SADJA __ Bisyll. V-Nouns. Long nom-compound-forms, long gen. TO AVOID SÁDJÁI


 * __LEXICON DAHPPA __ dahpa, dáhpa and dáhppa. to avoid dáhpahuvvat, dahpahuvvat etc in speller

 * __LEXICON LAHKI  __ the words on -láhki. Because in speller we want to aviod boasttoláhkái, borranláhki etc. (borran láhkai)




 * __LEXICON NPxC-LAHKI __



 * __LEXICON BEARRI __  to avoid unfortunate diminutives like bearáš and salaš in speller (bearaš, sálaš) +  "beassán" = beassi+Sg+Nom/Gen/Acc+PxSg1



 * __LEXICON GEAHCCI __ +CmpN/SgN +CmpN/SgG +CmpN/PlG 

 * __LEXICON GEAHCCICT __  Actors, to avoid geahččán, jábmán, geahččát, jábmát

 * __LEXICON ACTORVALDI __ lexicalized actors because we have restricted verb derivation for speller. Long compound-forms, without "váldán"


2f. Actor lexicas


 * __LEXICON ACTOR __ +CmpN/SgN +CmpN/SgG +CmpN/PlG 

 * __LEXICON ACTORCT __ nowadays tagged NomAg. Long compound-forms


 * __LEXICON ACTOR-PL __ Plurals



 * __LEXICON EADDJI-NomAg __ +CmpN/SgN +CmpN/SgG +CmpN/PlG  tagged NomAg. Sometimes long compound-forms


 * __LEXICON ACTORLONGSHORT __ +CmpN/SgN +CmpN/SgG +CmpN/PlG 


 * __LEXICON ACTORLONGSHORTCT-nomag __ adds +NomAg

 * __LEXICON ACTORLONGSHORTCT __ nowadays tagged NomAg. Sometimes long compound-forms

 * __LEXICON ACTORSHORT __ +CmpN/SgN +CmpN/SgG +CmpN/PlG 

 * __LEXICON ACTORSHORTCT __ nowadays tagged NomAg. Short compound-forms

+Use/NG:%> GOAHTAI ; ! Ill sublexicon     no dipth simpl






 * __LEXICON BOAHTALADDAN   __  Intransitiv Action nouns from deverbal verbs




 * __LEXICON IHTALUDDAMAT   __  ihtaluddamat, plural





 * __LEXICON UPMI __ action noun, from passive verb








 * __LEXICON EGEZHAGAT __  reciprocals like verddežagat, jumežagat etc


 * __LEXICON BUVSSAT  __ Pl. bisyll vow-fin. Short cmp-forms


 * __LEXICON BUVSSATLONG  __ Pl. bisyll vow-fin. Short cmp-forms

 * __LEXICON MUODUT __ muođut only, plural

 * __LEXICON DEAHKIT __ like AIGI but plural only

 * __LEXICON DIEDUT __ like ALBMI but plural only


 * __LEXICON BORALMASAT __ like JOHTOLAT but plural only

 * __LEXICON DURVAT __ like LASIS but pl. only






Trisyllabic nouns



 * __LEXICON MATTAR __ Short compound-forms Tris. Anim. Gradating C-Nouns

 * __LEXICON MALIS __ Short compound-forms Tris. Inanim. Gradating C-Nouns



 * __LEXICON MALISLONG __  Long compound-forms Tris. Inanim. Gradating C-Nouns

 * __LEXICON MALISLONGSHORT __  Long and short compound-forms. Tris. Inanim. Gradating C-Nouns



 * __LEXICON BEANA __ Short compound-forms. Trisyll. Anim. Gradating 0-Nouns

 * __LEXICON SEAMU __ Short compound-forms. Trisyll. Inanim. Gradating 0-Nouns

 * __LEXICON SEAMULONG __ Long compound-forms. Trisyll. Inanim. Gradating 0-Nouns


 * __LEXICON GAHPIR __ Short compound-forms. Trisyll. Non-Gradating C-Nouns


 * __LEXICON GAHPIRLONGSHORT __ Long and short compound-forms. Trisyll. Non-Gradating C-Nouns


 * __LEXICON GAHPIRLONG __ Long compound-forms. Trisyll. Non-Gradating C-Nouns




  Trisyllabic nouns






 * __LEXICON EANA __ eana, eanan, eatnan


 * __LEXICON DOAVTTIR __ only doavttir. Short compound-forms 


 * __LEXICON OVCCIS_N __  Collective numerals gallis, moattes, moattis, máŋggas


 * __LEXICON DAIVVAS __ Tris. Gradating C-Nouns, The Troms declension: dáivvaš:dáivaha, bearaš:bearraha, njunuš:njunnoha





 * __LEXICON BOADA __ Short compound-forms. Trisyll. Inanim. Gradating 0-Nouns  TO AVOID BOAĐAN


 * __LEXICON DAHPPAGA __  the dáhpahuvvá fix nr2. to avoid dahpahuvvat in speller


 * __LEXICON ENGEL __ Restricted denominals for speller   -eŋgel





 * __LEXICON MAGASH __ reciprocals like verddežat, jumežat etc




 * __LEXICON BADJOSAT   __ Pl. bajus:badjosat, short cmp-form

 * __LEXICON BADJOSATLONG   __ Pl. bajus:badjosat, long cmp-form



 * __LEXICON ALIMAT   __ Pl. alin:alimat, like GAHPIR but pl only


 * __LEXICON CEAKCAGAT __ Like seamu but plural only


 * __LEXICON VUOIGNAHAT   __ LikeDAIVVAS but only Pl. vuoiŋŋaš:vuoigŋahat






 * __LEXICON EAMOSH   __ váikkuheamoš, deverbals


 * __LEXICON AMOSH   __ váikkuhamoš, deverbals



 * __LEXICON BOAHTINLONGSHORT   __  Intransitiv action nouns from bisyll verbs, long and short cmp-form

 * __LEXICON BOAHTIN   __  Intransitiv action nouns from bisyll verbs, long cmp-form

 * __LEXICON PRE_BOAHTIN   __  Intransitiv action nouns from bisyll verbs, long cmp-form




 * __LEXICON BOAHTINSHORT   __ Intransitiv action nouns from bisyll verbs, short cmp-form


 * __LEXICON IHTAMAT   __ Plural action nouns, from bisyllabic verbs




 * __LEXICON LEXDIMINC __ diminutives, these comes from noun stems file, from trisyll nouns






  Contracted nouns

 * __LEXICON BOAZU __ Anim. Contracted 0-Nouns. Short compound-forms.

 * __LEXICON SUOLU __ Inanim. Contracted 0-Nouns. Short compound-forms.

 * __LEXICON SUOLULONG __ Inanim. Contracted 0-Nouns. Long compound-forms.



 * __LEXICON FALIS __ Contracted Anim. C-Nouns.  Short compound-forms.

 * __LEXICON LASIS __ Contracted Inanim. C-Nouns.  Short compound-forms.





  Contracted nouns





 * __LEXICON GISTTA __ The Noun gistta, gist -

 * __LEXICON CEAHKES __ only -ceahkes

 * __LEXICON ALLGUOVT __ guovttos guovttis


 * __LEXICON GUOVTTIS_N __  only -guovttis


 * __LEXICON GUOVTTU __ only -guovttos





 * __LEXICON GIRKOSADDOT __ LIKE SATTU but pl, only







!!!Sublexica for nominal stems



!!Declension


!Noun declension


 * __LEXICON GOAHTI-NE  __ Bisyll. V-Nouns; Nominative Sg. and Essive

 * __LEXICON NomV __


 * __LEXICON EssV __


 * __LEXICON GOAHTI-OBL __


 * __LEXICON GOAHTI-IU-OBL __


!!Px lexica

 * __LEXICON NPx3Vflag __

 * __LEXICON NPx3Vvowchflag __ 


 * __LEXICON NPx12A __ For loan word ending -a

 * __LEXICON NPx3A __ For loan word ending -a

 * __LEXICON NPxA __ For loan word ending -a


 * __LEXICON NPxPlComC __


 * __LEXICON NPxVvowch __ for vowel stems, with X2, X1 with stem vowel change,  

 * __LEXICON NPx12Vvowch __ for vowel stems, with X2, X1 with stem vowel change, 1. and 2. p

 * __LEXICON NPx1Vvowch __ for vowel stems, with X2, X1 with stem vowel change, 1. p


 * __LEXICON NPx3Vvowch __ for vowel stems, with X2, X1 with stem vowel change,  3. pers



 * __LEXICON NPxV __


 * __LEXICON NPx1V __

 * __LEXICON NPx2V __

 * __LEXICON NPx3V __


 * __LEXICON NPxC __

 * __LEXICON NPx1C __


 * __LEXICON NPx12C __

 * __LEXICON NPx3C __

 * __LEXICON NPxPlComV1 __


!!Some GOAHTE-type lexica...

 * __LEXICON GOAHTE- __ compound lexicon

 * __LEXICON GOAHTICMP __ compound lexicon, vowel shortening

 * __LEXICON GOAHTILONGCMP __ compound lexicon, no vowel shortening

 * __LEXICON GOAHTILONGSHORTCMP __ compound lexicon, with and without vowel shortening



 * __LEXICON GOADE- __ genitiv

 * __LEXICON GOADE-IU- __ genitiv


 * __LEXICON GOAHTA- __ Lexicon for giving Px 1. and 2. p., pluss illativ

 * __LEXICON GOAHTAI __ illative

 * __LEXICON GOADI- __ weak grade

 * __LEXICON GOADI-_notCmp __


 * __LEXICON GODII- __ diphthong simplification


 * __LEXICON GOADA- __

!!Other lexica

 * __LEXICON STAHTACASE __ for no cons grad


 * __LEXICON EGEZHAHKII __ 



 * __LEXICON MALIS0 __ as GAPPUS0. MALIS0 has no VUOHTA, GAPPUS0 has no Px Ess

 * __LEXICON MALLAS- __

 * __LEXICON MALLASI-/NUORABU- __ joint cont. lexicon

 * __LEXICON MALLASI-/NUORABUj- __ joint cont. lexicon



 * __LEXICON MUSHcase   __ Deverbal nouns

 * __LEXICON MUSSHA __


 * __LEXICON EAMOSHcase   __  Deverbal nouns


 * __LEXICON AMOSHcase __



 * __LEXICON BOAHTINcase   __  Long compound-forms




 * __LEXICON BOAHTINLONGSHORTTV   __  Transitiv Action nouns. Both long and short compound forms

 * __LEXICON BOAHTINLONGSHORTTVcase    __ +CmpN/Sg +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft




 * __LEXICON BOAHTINTV   __  Transitiv Action nouns. Long compound forms

 * __LEXICON BOAHTINTVcase    __ +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

 * __LEXICON BOAHTINTVCT __

 * __LEXICON BOAHTINSHORTTV   __  Transitiv Action nouns. Short compound forms

 * __LEXICON BOAHTINSHORTTVcase    __ +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

 * __LEXICON BOAHTINSHORTTVCT __

 * __LEXICON BOAHTALADDANTV   __  Transitiv Action nouns from deverbal verbs

 * __LEXICON BOAHTALADDANTVcase   __ +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

 * __LEXICON BOAHTALADDANTVCT __




 * __LEXICON FALLA- __

 * __LEXICON BOAZU-NE __


 * __LEXICON BOHCCO __

 * __LEXICON BOHCCU __


 * __LEXICON KEAHTTA __ Derivation keahttá/keahtes

 * __LEXICON KEAHTTA-PRED __ Der/keahtta - only predforms







 * __LEXICON DIMINC __ diminutives, these comes from noun affix file,  from trisyll nouns

 * __LEXICON GUOVDDAZI- __ joint cont. lexicon


 * __LEXICON JOHTOLAT0 __


 * __LEXICON JOHTOLAHKA- __



 * __LEXICON DenominalNounsV __ diminutives from bisyllabic nouns

 * __LEXICON DenominalNounsC __ diminutives from trisyllabic nouns



 * __LEXICON MUITTASJEAPMI __ action noun, from trisyll intransitive verb





 * __LEXICON EAPMITV   __ +CmpN/Sg +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

 * __LEXICON EAPMITVCT __ action noun, from bisyll transitive verb

 * __LEXICON EAPMITVCTcase __

 * __LEXICON MUITTASJEAPMITV   __ +CmpN/Sg   +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

 * __LEXICON MUITTASJEAPMITVCT __ action noun, from trisyll intransitive verb




 * __LEXICON VUONAT  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG

 * __LEXICON VUONATCT __ derivated nouns, from propers: guovdageainnut, divttasvuonat etc.

 * __LEXICON ACTORder  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG 

 * __LEXICON ACTORderCT  __ Tagged NomAg nowadays, Long compound-forms, from intransitive verbs

 * __LEXICON ACTORderCTcase  __ Tagged NomAg nowadays, Long compound-forms, from intransitive verbs

+Use/NG: GOAHTAI ; ! Ill sublexicon


 * __LEXICON ACTORTVder  __ +CmpN/SgN +CmpN/SgG +CmpN/PlG +CmpN/SgNomLeft +CmpN/SgGenLeft +CmpN/PlGenLeft

 * __LEXICON ACTORTVderCT __ Tagged NomAg nowadays, Long compound-forms, from transitive verbs




 * __LEXICON ACTORSHORTTVder __ Tagged NomAg nowadays, Short compound-forms, from transitive verbs



 * __LEXICON DIMINV __ diminutives, these comes from bisyll nouns
Divvun & Giellatekno - open source grammars for Sámi and other languages



!!!North Saami Possessive suffixes

 * __LEXICON PxVvowch   __ for vowel stems, with X2, X1 with stem vowel change

 * __LEXICON Px1Vvowch   __ for vowel stems with stem vowel change, 1. p

 * __LEXICON Px2Vvowch   __ for vowel stems with stem vowel change, 1. and 2. p

 * __LEXICON Px3Vvowch   __ for vowel stems with stem vowel change, 3. p


 * __LEXICON PxV   __ for vowel stems, without stem vowel change

 * __LEXICON Px1V   __ for first person vowel stems


 * __LEXICON Px2V   __ for second person vowel stems

 * __LEXICON Px3V   __ for third person vowel stems



 * __LEXICON PxA   __ for a-stems


 * __LEXICON Px1A   __ for a-stems


 * __LEXICON Px2A   __ for a-stems

 * __LEXICON Px3A   __ for a-stems


 * __LEXICON PxC   __ for consonant stems

 * __LEXICON Px1C   __ for consonant stems


 * __LEXICON Px2C   __ for consonant stems

 * __LEXICON Px3C   __ for consonant stems


 * __LEXICON PxPlComC   __ for plural comitative forms of consonant stems

 * __LEXICON PxPlComV1   __ for first person vowel stems with vow change, directing onw

 * __LEXICON PxPlCom12V   __ for first, second person comitative Px

 * __LEXICON PxPlCom3V   __ for third person comitative Px

Divvun & Giellatekno - open source grammars for Sámi and other languages






!!!Verb conjugation



!!Basic lexica for bisyllabic verbs


!Modals

These are treated separately because
 modals do not participate in derivation

 * __LEXICON GALGA_IV __ only dáidit, galgat



 * __LEXICON FERTE_IV __  only fertet and bállet



!Ordinary bisyllabic verbs


 * __LEXICON DIEHTI_TV       __ Bisyllabic i-verbs with Personal Passive


 * __LEXICON BORRA_TV       __ Bisyllabic a- and u-verbs with Personal Passive


 * __LEXICON BOAHTI_IV  __  Bisyllabic i-verbs without Personal Passive but with Der/NomAg

 * __LEXICON DIEVVA_IV  __  Bisyllabic a- and u-verbs without Personal Passive but with Der/NomAg






!Bisyllabic verbs




 * __LEXICON DEAKCU_TV   __ as BORRA for u-verbs with dim -astit, and a-verbs with dim -istit that are hardcoded


 * __LEXICON BOAZZU_IV  __ as DIEVVA_IV for u-verbs with dim -astit, and a-verbs with dim -istit that are hardcoded


 * __LEXICON BINDU_IV  __ as DIEVVA (but without short passive) for u-verbs with dim -astit, that are hardcoded

 * __LEXICON DAHTU_TV  __  As diehti, but -ut verbs, thus without short passive

 * __LEXICON BOLTU_TV  __  As DAHTU_TV but with dim -astit that are harcoded

 * __LEXICON ALLU_IV  __  -ut verbs, thus without short passive




 * __LEXICON DIEHTALADDA_TV    __ Already derived words (except words ending -uššat and -httit) - no deverbal verbs

 * __LEXICON LAIGOHADDA_TV   __ láigohaddat. No deverbal nouns for speller reasons. No +Imprt+Pl2: láigohaddit


 * __LEXICON HAHTTIT_TV    __ Four-syll kausatives on -httit

 * __LEXICON BOAHTALADDA_IV  __ Already derived words (except words ending -uššat)

 * __LEXICON RAIMMAHALLA_IV      __ passives on -hallat and INCHOATIVES on -stuvvat

 * __LEXICON UVVA_IV      __ passives -uvvat


 * __LEXICON SMUVVA_IV      __ passives -snuvvat, -smuvvat



 * __LEXICON DOAROSTUVVA_TV      __ INCHOATIVES on -stuvvat


 * __LEXICON MAHTALADDA_TV  __ Bisyllabic Already derived words (except words ending -uššat) without Personal Passive but with Acc obj





 * __LEXICON ARVI_IV  __ Bisyllabic Impersonal Verbs

 * __LEXICON ARVALADDA_IV  __ Already derived words (except words ending -uššat)









 * __LEXICON MASSI_TV       __ No Der/NomAg (for speller reasons). Bisyllabic i-verbs with Personal Passive. Otherwise like DIEHTI_TV

 * __LEXICON VALDI_TV      __  No Der/NomAg (for speller reasons). Bisyllabic i-verbs with Personal Passive. No VGen. Otherwise like DIEHTI_TV


 * __LEXICON ASTA_TV   __ No Der/NomAg (for speller reasons). Bisyllabic a- and u-verbs with Personal Passive. Otherwise like BORRA_TV


 * __LEXICON BORGI_IV  __  Bisyllabic i-verbs without Personal Passive but without Der/NomAg. No Der/NomAg for speller reasons. Otherwise like BOAHTI_IV

 * __LEXICON BEALLJA_IV  __ No Der/NomAg for speller reasons. Bisyllabic a- and u-verbs without Personal Passive but without Der/NomAg. Otherwise like DIEVVA_IV


 * __LEXICON DAVGU_TV  __  As DAHTU_TV, No Der/NomAg for speller reasons.


 * __LEXICON LEABBU_TV    __ No Der/NomAg (for speller reasons)- otherwise like DEAKCU_TV



 * __LEXICON ALBMU_TV   __ No Der/NomAg (for speller reasons). As BOLTU_TV otherwise



 * __LEXICON BARGU_IV  __  no Der/NomAg for speller reasons- Like ALLU_IV


 * __LEXICON BORSU_IV  __ as BINDU. No Der/NomAg




 * __LEXICON MUHTTI_TV       __ No deverbal nouns an ACTIO(for speller reasons). Bisyllabic i-verbs with Personal Passive

 * __LEXICON BEAHTTI_TV       __ Bisyllabic i-verbs with Personal Passive, no Der/alla, no Der/adda, Der/halla  (beahtáhallat, báinnáhallat) for speller

 * __LEXICON FAHTE_TV  __ Contracted Verbs with Personal Passive,  no Der/alla, no Der/adda, Der/halla  (fáhtehallin) for speller


 * __LEXICON GILVI_TV       __ only gilvit, to get rid of gilvohallat (for speller reasons).

 * __LEXICON FAHTI_TV       __ (for speller reasons). no fáhttet (fáhtit+V+TV+Imprt+Pl2) because it get mixed up with fáhtet. No deverbal nouns.


 * __LEXICON DAHKA_TV       __ Like BORRA_TV, but without	dahkat+V+TV+Imprt+Sg1, to get rid of dahkon (for speller reasons)


 * __LEXICON FALLA_TV       __ fállat, njoarrat,  to get rid of fálastallat, njoarastallat (for speller reasons).




 * __LEXICON OAHPPA_TV       __ only oahppat. Like BORRA but without Deverbal verb -stuvva (for speller reasons)





 * __LEXICON AKTI_IV  __  Bisyllabic i-verbs without Personal Passive but with Der/NomAg - for speller reasons, to prevent:



 * __LEXICON GUHKKA_IV  __ No Imprt+Pl2 on -it, no Imprt+ConNegII and No +Der/NomAg for speller reasons. No Deverbal Verbs either. Bisyllabic a- and u-verbs without Personal Passive

 * __LEXICON BARDNA_IV  __ "bárdnat" ----> potensialis removed; bártnažan, bártnažat, bártnaš, bártnaža. No Der/NomAg for speller reasons. Bisyllabic a- and u-verbs without Personal Passive but without Der/NomAg. Otherwise like DIEVVA_IV





 * __LEXICON DIEHTISHORT_TV       __ Short action noun compound-form: neasken- 

 * __LEXICON DIEHTILONGSHORT_TV       __ Long and short action noun compound-form, savdnjen-/savdnjin-

 * __LEXICON BAHCCI_TV       __ bahčit. Long and short actio compound-form. No NomAg (Actor) compound, for speller reasons

 * __LEXICON BOAHTILONGSHORT_IV  __ Long and short action noun compound-form








 * __LEXICON MAHTI_TV  __  Bisyllabic Verbs without Personal Passive but with Acc obj.







!!Intermediate lexica for even-syllable verbs















































 * __LEXICON GOAHTICnj       __  for speller reasons to hinder -goahttit, whick is confused with infinitive -goahtit

 * __LEXICON RAIMMAHALLACnj       __  restricted imperatives







!!Basic lexica for contracted verbs


 * __LEXICON GILLE_IV  __  Contracted Verbs without Personal Passive


 * __LEXICON DOHPPE_TV  __ Contracted Verbs with Personal Passive




! BAsic lexica for Contracted verbs












 * __LEXICON CIRRO_IV  __  Inchoatives and essives on -á, -o, -e without Personal Passive

 * __LEXICON MUITA_TV  __  Inchoatives and essives on -á, -o, -e with Personal Passive







 * __LEXICON COHKKA_IV  __  Contracted Verbs without Personal Passive - no stit-deverbal

 * __LEXICON GARRE_TV  __  garret, loget. with Personal Passive. for speller to hinder garrenávnnas, garrenoaivi etc

 * __LEXICON ORRO_IV  __  orrot. for speller to hinder orronsadji etc




 * __LEXICON MAHTA_TV  __ Contracted Verbs without Personal Passive but with Acc obj.


































!!Basic lexica for trisyllabic verbs


 * __LEXICON MUITAL_TV  __ Trisyllabic Verbs with Personal Passive


 * __LEXICON ALIST_IV  __ Trisyllabic Verbs without Personal Passive







! Basic lexica for trisyllabic verbs




 * __LEXICON COASKKIT_IV   __  Trisyllabic impersonals



 * __LEXICON ARVVASJ_IV   __ impersonals ending -šit, -skit, smit, -idit, -ldit, -git and 5-syllables

 * __LEXICON ARVIL_IV  __ Impersonal Trisyllabic Verbs ending -lit 










 * __LEXICON MUITTASJ_TV  __ Words ending -šit, -skit, -ldit - Reciprocals on -dit, Momentatives on -dit, -ádit, -ihit, -e7hit, Frequentatives on -(u)hit, Continuatives on -nit, Inchoatives on -nit

 * __LEXICON HALIID_TV  __ Words ending -smit, -idit, -git

 * __LEXICON BONJAT_TV  __ Cont/Freq on -dit, Continuatives on -(u)hit, Reciprocals, momentatives and frequentatives ending -alit

 * __LEXICON VUORDIL_TV  __ Trisyllabic Verbs ending -lit, -rit with Personal Passive

 * __LEXICON BEAGASJ_IV  __ Words ending -šit, -skit -ldit, essive derivates on -hit -. !Reciprocals on -dit. Momentatives on -dit, -ádit, -ihit, -e7hit. Frequentatives on -(u)hit. Continuatives on -nit. Inchoatives in -nit

 * __LEXICON JORGGIID_IV  __ Words ending -smit, -idit, -git - 

 * __LEXICON HURAI_IV  __ Words ending -aidit 


 * __LEXICON BALAT_IV  __ !Cont/Freq on -dit, Continuatives on -(u)hit, Reciprocals, momentatives and frequentatives ending -alit

 * __LEXICON SUOTNJAL_IV  __ Trisyllabic Verbs ending -lit, -rit without Personal Passive

 * __LEXICON BOTNJAS_IV  __ Trisyllabic Verbs ending -sit without Personal Passive

 * __LEXICON LASSAN_IV  __ Trisyllabic Verbs ending -nit without Personal Passive IV





 * __LEXICON OAHPAHIT_TV  __ only oahpahit, disamb reasons?

 * __LEXICON NUOSKIT_IV  __ only nuoskidit, for speller, no action noun nuoskideapmi






 * __LEXICON LAHKAN_TV  __ lahkanit, lahkonit, are nowadays used transitively

 * __LEXICON GEAGAT_TV  __  Trisyllabic Verbs without Personal Passive but with Acc obj.

 * __LEXICON BUOVVAL_TV  __  buovvalit, guoigalit. Trisyllabic Verbs ending -lit without Personal Passive but with Acc obj.














 * __LEXICON MUITALCnj  __ Substems for Consonantal Verb Stems


 * __LEXICON HURAICnj  __ Substems for  Words ending -aidit
























!!Finite declension


!!Present tense

!Vocalic stems

 * __LEXICON PotPrsV  __ Present Tense in Vocalic Verb Stems

 * __LEXICON PrsV  __ Present Tense in Vocalic Verb Stems

 * __LEXICON PrsV1  __ Present Tense Endings for Vocalic Verb Stems

 * __LEXICON PrsV2  __ Present Tense Endings for Vocalic Verb Stems

 * __LEXICON PrsV3  __ Present Tense Endings for Vocalic Verb Stems

 * __LEXICON PrsV4  __ Present Tense Endings for Vocalic Verb Stems

 * __LEXICON PrsV5  __ Present Tense Endings for Vocalic Verb Stems




!Consonantal stems

 * __LEXICON PotC  __ Present Tense in Consonantal Verb Stems


 * __LEXICON PrsC  __ Present Tense in Consonantal Verb Stems

 * __LEXICON PrsC1  __ Present Tense in Contr/Non-Contr Consonantal Verb Stems

 * __LEXICON PotC2  __ Potential in Non-Contracted Consonantal Verb Stems


 * __LEXICON PrsC2  __ Present Tense in Non-Contracted Consonantal Verb Stems






!!Past tense

!Vocalic stems


 * __LEXICON PrtV  __ Preterite Endings for Vocalic Verb Stems

 * __LEXICON PrtV1  __ Preterite Endings for Vocalic Weak Grade Verb Stems

 * __LEXICON PrtV2  __ Preterite Endings for Vocalic Strong Grade Verb Stems

!Consonantal stems


 * __LEXICON PrtC  __ Preterite Endings for Consonantal Verb Stems

 * __LEXICON PrtC1  __ Preterite Endings for Consonantal Contr./Non-Contr. Verb Stems

 * __LEXICON PrtC2  __ Preterite Endings for Consonantal Non-Contr. Verb Stems

 * __LEXICON PrtC3  __ Preterite Endings for Consonantal Contr./Non-Contr. Verb Stems


!!Imperative mood

 * __LEXICON ImprtVA          __  Imperative Forms for Vocalic Verb Stems

 * __LEXICON ImprtVB          __  Imperative Forms for Vocalic Verb Stems

 * __LEXICON ImprtV1          __  Imperative Forms for Vocalic Verb Stems

 * __LEXICON ImprtV2  __ Imperative Forms for Vocalic Verb Stems and Substems

 * __LEXICON ImprtSg2  __ Imperative Forms For Consonantal and Contracted Verb Stems


 * __LEXICON ImprtC __  Imperative Substems for Consonantal Verb Stems - uneven syll.

 * __LEXICON ImprtC2 __  Imperative Substems for Consonantal Verb Stems - contracts


!!!Infinite forms


!!V- and C-final

 * __LEXICON NominalFormsV   __  Vowel-final stems



!!Continuation lex

 * __LEXICON NominalFormsVC __  for vowel final

 * __LEXICON NominalFormsV1 __   infinitiv, actio


 * __LEXICON NominalFormsV2 __  gerund, verbgenitiv, verbabessive

 * __LEXICON NominalFormsV3	 __  ^NG^ gerund

 * __LEXICON NominalFormsV4 __  perfect participe, preterite negation form

 * __LEXICON NominalFormsV5 __  negation form

 * __LEXICON NominalFormsV6  __ presence participe


 * __LEXICON NominalFormsV8 __  gerund, verbabessive

 * __LEXICON NominalFormsV9 __  supine

 * __LEXICON NominalFormsC1 __  for cons final stems: infinitive, supine, actio, gerund, perfect participe, preterite negation form

 * __LEXICON NominalFormsC2  __  for cons final stems: presence participe



!!!Derivation



 * __LEXICON DeverbalNounsC __  

 * __LEXICON DeverbalNounsCTV __  

 * __LEXICON DeverbalNounsBOAHTI __  

 * __LEXICON DeverbalNounsRAIMMAHALLA  __ no NomAg/actor

 * __LEXICON DeverbalNounsBOAHTALADDA __  

 * __LEXICON DeverbalNounsDIEHTALADDA __  

 * __LEXICON DeverbalNounsDIEHTI __  


 * __LEXICON DeverbalNounsDIEHTISHORT __  

 * __LEXICON DeverbalNounsDIEHTILONGSHORT __  

 * __LEXICON DeverbalNounsBAHCCI __  

 * __LEXICON DeverbalNounsDOHPPE- __  

 * __LEXICON DeverbalNounsGARRE- __  

 * __LEXICON DeverbalNounsCIRRO- __  

 * __LEXICON DeverbalNounsORRO- __  

 * __LEXICON DeverbalNounsCIRROTV- __  


 * __LEXICON DeverbalNounsDOHPPEJ __  

 * __LEXICON DeverbalNounsDOHPPEJTV __  

 * __LEXICON DeverbalNounsMUITALTV __  

 * __LEXICON DeverbalNounsMUITTASJTV __  

 * __LEXICON DeverbalNounsMUITAL __  

 * __LEXICON DeverbalNounsNUOSKIT __  


 * __LEXICON DeverbalNounsMUITTASJ __  


 * __LEXICON DeverbalVerbsBOAHTI __  

 * __LEXICON DeverbalVerbsDIEVVA __  

 * __LEXICON DeverbalVerbsBINDU __  


 * __LEXICON DeverbalVerbsBORRA __  

 * __LEXICON DeverbalVerbsFALLA __  

 * __LEXICON DeverbalVerbsBOLTU __  


 * __LEXICON DeverbalVerbsDIEHTI __  

 * __LEXICON DeverbalVerbsBEAHTTI __  

 * __LEXICON DeverbalVerbsARVI __  


 * __LEXICON DeverbalVerbsDOHPPE __  

 * __LEXICON DeverbalVerbsFAHTE __  


 * __LEXICON DeverbalVerbsGILLE __  

 * __LEXICON DeverbalVerbsCOHKKA __  

 * __LEXICON DeverbalVerbsBORGE __  



 * __LEXICON DeverbalVerbsMUITAL __  

 * __LEXICON DeverbalVerbsVUORDIL __  


 * __LEXICON DeverbalVerbsALIST __  

 * __LEXICON DeverbalVerbsSUOTNJAL __  

 * __LEXICON DeverbalVerbsBOTNJAS __  

 * __LEXICON DeverbalVerbsLASSAN __  

 * __LEXICON DeverbalVerbsCOASKKIT __  

 * __LEXICON DeverbalVerbsARVIL __  








 * LEXICON VGEN  flag for VGen






!!!File containing North Saami abbreviations 

!!Lexica for adding tags and periods

Splitting in 4 + 1 groups, because of the preprocessor

 * __LEXICON Abbreviation __
 # The ITRAB ;	   lexicon (intransitive abbrs)
 # The TRNUMAB ;  lexicon (abbrs trans wrt. numberals)
 # The TRAB ;	   lexicon (transitive abbrs)
 # The NOAB ;	   lexicon (not really abbrs)
 # The NUMNOAB ;  lexicon (not behaving as abbr before num)


!!The abbreviation lexicon itself



 * __LEXICON ITRAB __ are intransitive abbreviations, A.S. etc.




 * __LEXICON NOAB __ du, gen, jur

This class contains homonyms, which are both intransitive
abbreviations and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentnece (when next word has small letters) can be 
considered as true cases.





 * __LEXICON TRNUMAB __ contains abbreviations who are transitive in front of numerals 

For abbrs for which numerals are complements, but other
words not necessarily are. This group treats arabic numerals as
if it were transitive but letters as if it were intransitive.








 * __LEXICON TRAB __ contains transitive abbreviations

This lexicon is for abbrs that always have a constituent following it.












 * __LEXICON NUMNOAB __ su, dii

This class contains homonyms, which are both abbrs for 
which numerals are complements and normal words. The abbreviation usage
is less common and thus only the occurences in the middle of
the sentence can be considered as true cases.



!!!North Saami acronyms - stems

This file contains a loop for random capital-letter acronyms, 
as well as two lists of common acronyms: letter-number acronyms and 
small-capital letter combinations.

!!The main part

 * __LEXICON Acronym   __ divides the acros in the 3 types just mentioned.

















 * __LEXICON smallacro   __ contains acros with small letters










                    !!!North Sámi adjective lexicon





 * __LEXICON LEXATTR  __ This lexicon is here to give the tags to the compounding

 * __LEXICON At    __ gives +A+Attr and directs to K

 * __LEXICON PrfPrc __ Gives +A+Attr and Sg/Pl Nom and directs to K

 * __LEXICON FINJU- __ compounds only, directs to Rreal and NAMAT

 * __LEXICON ALIT __ Both second-part compound and independent adj.
čáhppesalit bábir, alit bábir


 * __LEXICON Eahpe_Adjective __ is a long list of lexicalised eahpe-prefixed adjs

 * __LEXICON NomActVEARA __ hardcoded postposition frases with veara, for speller



 * __LEXICON Adjective __ is the main adjective list

 * __LEXICON AdjectivePx __ Px-forms are restricted to this lexicon
Move adjs that may take Px from __Adjective__ to this lexicon.


 * __LEXICON AdjectiveNoPx __ is the main adjective list, not taking Px





















North Saami adposition lexicon

First come the 3 continuation lexica, the division is based on Nickel
and should probably be revised. Then comes the adpositions themselves.
The uninflecting ones are pointed to the 3 tag lexica, the Px ones to the
Px lexica in sme-lex.txt and closed-sme-lex.txt.


 * __LEXICON Pp   __ gives both +Po and +Pr

 * __LEXICON Pp-Err   __ gives both +Po and +Pr



 * __LEXICON Postp   __ gives +Po

 * __LEXICON Postp-Err   __ gives +Po


 * __LEXICON Prep   __ gives +Pr

 * __LEXICON Prep-Err   __ gives +Pr


 * __LEXICON Adposition   __ is the lexicon with the adpositions






!!!North Saami adverbs

 * __LEXICON Adverb   __

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

 * __LEXICON LADJE     __                              

 * __LEXICON DIHTE     __                              


 * __LEXICON LAGAadv   __										    

 * __LEXICON LAGAIDadv   __									   

 * __LEXICON LEBBUIplc   __									    


 * __LEXICON LEAPPOSplc   __									    

 * __LEXICON gadv   __  adv that can form compounds			    

 * __LEXICON gadv-plc   __  adv that can form compounds		    

 * __LEXICON adv-plc   __										    

 * __LEXICON adv-time   __										    

 * __LEXICON adv-time-plc   __									    



 * __LEXICON CSadv   __										   

 * __LEXICON CSadvFoc/Neg-ge   __									   

 * __LEXICON adv-subqst   __										    


 * __LEXICON adv-comp   __										    

 * __LEXICON adv-sup   __										    

 * __LEXICON adv-plc-comp   __									    

 * __LEXICON adv-plc-sup   __									    


 * __LEXICON adv-time-comp   __								    

 * __LEXICON adv-time-sup   __									   


 * __LEXICON COMPADV   __										    

 * __LEXICON plc-SUPADVmus   __								    

 * __LEXICON plc-SUPADVmusj   __								    


The main adverb lexicon 											   
 * __LEXICON adv   __ simply gives the tag +Adv and directs to K  


!!!North Saami Conjunctions 





 * __LEXICON Conjunction   __ contains the list of conjunctions

 * __LEXICON ConfuseConjunction __ contains conjunctions that are
                               homonyms with words in the open POS's

 * __LEXICON CleanConjunction __ contains conjunctions that are not
                           homonymous with any of the open POS's



 * __LEXICON Cc-Conf  __ assigns the tag +CC and allows further grammar checker processing for disambiguation against nouns in potential compounds written apart


 * __LEXICON NounRoot  __ Main lexicon, dividing in Noun, FirstComponent, NyphNouns



 * __LEXICON MiddleNouns  __

 * __LEXICON HyphNouns  __



 * __LEXICON FirstComponent  __


 * __LEXICON Eahpe_Noun  __


 * __LEXICON NAMAT __ gives »»» and directs to NAMATCont


 * __LEXICON NAMATCont __ second-part compounds





 * __LEXICON SASCont __ FROM NUMERALS, gives -kilosaš etc.


 * __LEXICON Noun  __ dividing in NounNoPx, NounPx (with a P.Px.add flag)  and NounPxKin (with a P.Nom3Px.add flag)

 * __LEXICON NounNoPx   __ here goes nouns not taking Px.







 * __LEXICON NounPxKin  __ this is the noun lexicon for nouns which can have Px Nom 3. person, mostly kinshipterms

 * __LEXICON NounPx  __ this is the main noun lexicon
























!!!North Saami numerals 





!!The initial lexica

 * __LEXICON Numeral__  initial lexica

 The __LEXICON CmpNumeral__  lexicon is the entrance for compounds
 with numbers. Introduced to restrict such compounding
 to a subgroup of numerals only, mainly to exclude
 roman numerals, that turned out to be too problematic.
 With this change, roman numerals are only recognised
 on their own.




 * __LEXICON MILJON__  miljons and miljards




 * __LEXICON OVERDUHAT__ for the numerals over 1000. 





 * __LEXICON O-OKTAF__ All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.


 * __LEXICON O-2TO9F__ All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

 * __LEXICON 1TO9DUHAT__




 * __LEXICON O-JUSTLOGIF__ This lexicon is for the number 10 000 only. it is separated from the rest to avoid forms like *logivihttaduhát, etc.



 * __LEXICON O-LOGIF__ this lexicon is accessed only via other O-lexica, and not directly from OVERDUHAT. Thus, *logivihttaduhát, etc. is avoided.



 * __LEXICON O-2TO9LOG__ All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.



 * __LEXICON O-NUPPELOT__  Teens of thousands

 * __LEXICON O-NL__

 * __LEXICON O-NUPPELOHKAI__




 * __LEXICON O-CUODI__ Hundreds of thousands

 * __LEXICON O-2TO9CUO__

 * __LEXICON O-GCUO__


 * __LEXICON DUHAT__



 * __LEXICON JUSTDUHAT__ for numerals going via 1000




 * __LEXICON OLD__ for the old counting thirteen hundred etc.

 * __LEXICON NLX__


 * __LEXICON NUPPELOHKAICUODI__




 * __LEXICON UNDERDUHAT__  the numerals under 1000


 * __LEXICON ONLY_CMP__


 * __LEXICON OKTAF__


 * __LEXICON 2TO9F__


 * __LEXICON 11TO99F__



 * __LEXICON BARELOGIF__

 * __LEXICON LOHKI__


 * __LEXICON 2TO9LOG__


 * __LEXICON 21TO99__


 * __LEXICON 111TO119__


 * __LEXICON CUODI__



 * __LEXICON 2TO9CUO__

 * __LEXICON GCUODI__


 * __LEXICON 1TO9CUODI__





 * __LEXICON NUPPELOGIS__


 * __LEXICON LOHKAI-END__

 * __LEXICON ARABICCOMPOUNDS__  ! arabic as first part, 


 * __LEXICON NUMERALCOMPOUNDS__: numeral as first part: duhatjienat,
 logigielat, etc.

 * __LEXICON SAS__ gives :»»» and goes to SASCont







 * __LEXICON num-ordinal__ Ordinal numbers

 * __LEXICON num-ordinal-1__ Ordinal numbers vuosttas, vuosttaš

 * __LEXICON num-ordinal-2to9__ Ordinal numbers, 2 to 20, even though the name implies differenty


 * __LEXICON VUOSTTAS__


 * __LEXICON num-collective__ Collective numerals





 * __LEXICON num-imprecise__ Imprecise numbers



!!!Arabic numerals

Arabic numeral expressions can be classified in at least the following categories:
; general numeric expressions: 123 456,789 - note: space as thousand separator, groups of three digits
; accounting numeric expressions: 123.456,789 - note: full stop as thousands separator, groups of three digits
; numeric range expressions: 12-14 - can be dates, times, lengths, masses and other sorts of measurements
; measurements: 123 kg
; dates: 2.4.1999, 4.5., 7.8.02, 04.10.2016
; times: 12:34
; money amounts: kr 1234,56
; temperature: –8°C, 256°K, 100°F

And for sure more than these. Previously everything has been more or less
lumped together, but to avoid noise and to get better input for grammar
checking the ARABICS section should be rewritten such that each category
gets its own lexicon. That way it is easier to restrict the syntax of
numerical expressions in each category.








 * __LEXICON ONLY_OKTA__


 * __LEXICON LOGIF__


 * __LEXICON NUPPELOHKAI__



 * __LEXICON GOLBMALOGIOKTA__

 * __LEXICON GAVCCILOGIOKTA__


 * __LEXICON GUOKTELOGIOKTA__

 * __LEXICON VIHTTALOGIOKTA__

 * __LEXICON GOLBMALOGIGUOKTE__

 * __LEXICON GAVCCILOGIGUOKTE__


 * __LEXICON GUOKTELOGIGUOKTE__

 * __LEXICON VIHTTALOGIGUOKTE__

 * __LEXICON GOLBMALOGIGOLBMA__

 * __LEXICON GAVCCILOGIGOLBMA__


 * __LEXICON GUOKTELOGIGOLBMA__

 * __LEXICON VIHTTALOGIGOLBMA__

 * __LEXICON GOLBMALOGINJEALLJE__

 * __LEXICON GAVCCILOGINJEALLJE__


 * __LEXICON GUOKTELOGINJEALLJE__

 * __LEXICON VIHTTALOGINJEALLJE__

 * __LEXICON GOLBMALOGIVIHTTA__

 * __LEXICON GAVCCILOGIVIHTTA__


 * __LEXICON GUOKTELOGIVIHTTA__

 * __LEXICON VIHTTALOGIVIHTTA__

 * __LEXICON GOLBMALOGIGUHTTA__

 * __LEXICON GAVCCILOGIGUHTTA__

 * __LEXICON GUOKTELOGIGUHTTA__

 * __LEXICON VIHTTALOGIGUHTTA__

 * __LEXICON GOLBMALOGICIEZA__

 * __LEXICON GAVCCILOGICIEZA__


 * __LEXICON GUOKTELOGICIEZA__

 * __LEXICON VIHTTALOGICIEZA__

 * __LEXICON GOLBMALOGIGAVCCI__

 * __LEXICON GAVCCILOGIGAVCCI__


 * __LEXICON GUOKTELOGIGAVCCI__

 * __LEXICON VIHTTALOGIGAVCCI__

 * __LEXICON GOLBMALOGIOVCCI__

 * __LEXICON GAVCCILOGIOVCCI__

 * __LEXICON GUOKTELOGIOVCCI__

 * __LEXICON VIHTTALOGIOVCCI__




!!!This file contains the Particles 




 * __LEXICON Particles   __ gives all particles


 * __LEXICON pcle   __ gives the tag +Pcle

 * __LEXICON qpcle   __ gives two tags, +Pcle and +Qst

Perhaps this should be opened to  a direction to K
and all the ge versions should be removed.
(i.e. only goit, not goitge). This errouneously
permits gege, goge, etc., though, and we thus leave
things as they are.


!!!This file contains the Pronouns 






 * __LEXICON Pronoun   __ Points to all the pronoun subgrops




 * __LEXICON Personal   __ , splitting in 1st, 2nd, 3rd

!!Interrogative pronouns

Giving ideosyncratic Sg Nom of gii, mii lexically
Sending the oblique forms of gii, mii to an oblique sublexicon
Giving the stem of guhte, guhtemuš, goabbá

 * __LEXICON Interrogative   __




!!Relative pronouns

 * __LEXICON Relative   __


!!Demonstrative pronouns

!!Giving baseform + all demonstrative stems
!!Pointing to case paradigms

 * __LEXICON Demonstrative   __





!!Reflexive pronouns

Two nominative reflexives, and pointer to the rest
The Pl one is used for Du as well, here given two entries.
Should one of them be removed?

 * __LEXICON Reflexive   __

!!Reciprocal pronouns

The first 4 entries handle the first element of the recipr.
The next 12 handle the 2nd part of the non-Px recipr.
The members of the third section  point to Px lexica.

 * __LEXICON Reciprocal   __

!!Indefinite pronouns

Dividing the indefinites in three groups

 * __LEXICON Indefinite   __

Declineable indefinite pronouns with case + clitic

 * __LEXICON declindef-cl   __






Declineable indefinites with normal case paradigms

 * __LEXICON declindef   __

































Separate lexica for exceptional entries

 * __LEXICON declindef-idiosync   __
separate lexica for these entries:
oktat






The indeclineable indefinites

 * __LEXICON indeclindef   __





!!!The North Saami proper noun lexicon


 * __LEXICON Prefix-Proper   __ for first-part names

 * __LEXICON ProperNoun-sme-nocomp   __ for no cmp without hyph







!!!The North Saami Subjunctions 







 * __LEXICON Subjunction   __ contains the list of subjunctions.

 * __LEXICON ConfuseSubjunction __ contains subjunctions that are
                               homonyms with words in the open POS's

 * __LEXICON CleanSubjunction __ contains subjunctions that are not
                           homonymous with any of the open POS's



 * __LEXICON Cs-Conf  __ assigns the tag +CC and allows further grammar checker processing for disambiguation against nouns in potential compounds written apart


!!!North Saami verbs 



!!Negative verbs 

 * __LEXICON Negativeverb  __


 * __LEXICON negmood  __

 * __LEXICON negind  __

 * __LEXICON negimp  __

 * __LEXICON negsup  __

!!Copula 

 * __LEXICON Copula   __ Dividing into finite and infinite


 * __LEXICON Finitecop   __ (Removed %>, they blocked diphtsim^pl)


 * __LEXICON Prscop   __

 * __LEXICON Prtcop   __

 * __LEXICON Impcop  __

 * __LEXICON Infinitecop  __

!!Stray forms 

 * __LEXICON STRAYFORMS  __ (referred to from the main Verb lexicon)



 * __LEXICON Eahpe_Verb  __

!!Main verbs 

Here comes the main list of verbs.








 * __LEXICON Humsubj-VerbRoot   __












!!!Punctuation symbols

 * __LEXICON Punctuation_SME   __ contains the list
of punctuation symbols that are problematic from a normative
point of view, and only those. Everything else is coming from
the standard Punctuation lexicon.

They are all tagged ''+RIGHT'' even though the correct quotation
mark is supposed to be used on both sides. This is done to simplify
generation, by keeping the same tagging as the standard analysis.








!!!DELIMITERS 

Sentence delimiters are the following: <.> <!> <?> <...> <¶>


!!!TAGS AND SETS



!!Tags


This section lists all the tags inherited from the fst, and used as tags
in the syntactic analysis. The next section, __Sets__, contains sets defined
on the basis of the tags listed here, those set names are not visible in the output.




!Beginning and end of sentence
BOS 
EOS



!Parts of speech tags

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




!Tags for POS sub-categories

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


!Tags for morphosyntactic properties

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


Comp, both for adverbs and adjectives
Superl, both for adverbs and adjectives
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



!Tags for clitic particles
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

!Derivation tags

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



!Semantic tags






! Syntactic tags

* @+FAUXV : finite auxiliary verb 
** ferte: Son ferte oaidnit ollislaš gova. - She must see the whole picture.
* @+FMAINV : finite main verb
** oaidná: Son oaidná ollislaš gova. - She sees the whole picture	
* @-FAUXV : infinite auxiliary verb
** sáhte: In sáhte gáhku borrat. - I cannot eat cake.	
* @-FMAINV : infinite main verb
** oaidnit: Son ferte oaidnit ollislaš gova. - She must see the whole picture.
* @-FSUBJ> : Subject of infinite verb outside the verbal.
** mu: Diet dáhpáhuvai mu dieđikeahttá. - It happened without me knowing about it.
* @-F<OBJ : Subject of infinite verb outside the verbal.
** nuppi: Ulbmil lea oažžut nuppi boagustit. - The goal is to get the other one to laugh.
* @-FOBJ> : Object of infinite verb outside the verbal.
** váldovuoittuid: Sii vurde váldovuoittuid fasket. - They waited to grab the main prizes.
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
** Miss Turner : Bures boahtin deike, Miss Turner! - Welcome her, Miss Turner!
* @CVP : Conjunction or subjunction that conjoins finite verb phrases.
** go : Leago guhkes áigi dassá go Máreha oidnet? - Is it a long time since you saw Máret?
* @CNP : Local conjunction or subjunction.
** vai : Leago nieida vai bárdni? - Is it a girl or a boy?
* @X : unknown






!!Sets containing sets of lists and tags

This part of the file lists a large number of sets based partly upon the tags defined above, and 
partly upon lexemes drawn from the lexicon.
See the sourcefile itself to inspect the sets, what follows here is an overview of the set types.



!Sets for Single-word sets

OKTA and go, and the set INITIAL for initial letters 
OKTA
go
INITIAL


!Sets for word or not

WORD
REAL-WORD
REAL-WORD-NOT-ABBR
WORD-NOT-de
NOT-COMMA


!Derivational affixes

DER-V

DER-V


DER-N

DER-A1

DER-A

A-V

A-NOT-V

!Case sets

ADLVCASE


CASE-HALFAGREEMENT
CASE-AGREEMENT
CASE

NOT-NOM
NOT-GEN
NOT-ACC

!Verb sets


NOT-V

!Sets for finiteness and mood

REAL-NEG

MOOD-V

GC

VFIN

VFIN-POS

VFIN-NOT-IMPRT

VFIN-NOT-NEG

NOT-PRFPRC


!Sets for person


















!Sets consisting of forms of "leat" (these ones need to be rewritten)




!Pronoun sets
















!Adjectival sets and their complements









!Adverbial sets and their complements












!Sets for coordinators








!Sets for adverbs that have lookalikes
Here come some adverbs that have identical twins in other POS. 
If these are found in Adv contexts, we treat them as adverbs.















!Sets of elements with common syntactic behaviour


!Sets for verbs


V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.



* The set COPULAS is for predicative constructions















TRANS-V is the set for verbs really taking objects



* Sets for verbs choosing oblique objects or adverbials
* __STVLIST__ is the list of strictly transitive verbs. In the rules, refer not to STVLIST, but to the set STV defined below.



STRICT-TRANS-V is the set for verbs which don't let a GenAcc be a modifier of anything else than an object, e.g. Mun organiseren eatni gievkkanis. - eatni wants to be the object
























!Valency sets






















































* __PLACE-V__ Those get only not locative if the target is a member TOOL, ABSTR-TOOL or ANIMATE or CONCEPT. Selects more locatives than ONLY-PLACE-LOC-V 



















!Adverb sets










!Adjective sets






















!NP sets defined according to their morphosyntactic features










!The PRE-NP-HEAD family of sets

These sets model noun phrases (NPs). The idea is to first define whatever can
occur in front of the head of the NP, and thereafter negate that with the
expression __WORD - premodifiers__.













The set __NOT-NPMOD__ is used to find barriers between NPs.
Typical usage: ... (*1 N BARRIER NPT-NPMOD) ...
meaning: Scan to the first noun, ignoring anything that can be
part of the noun phrase of that noun (i.e., "scan to the next NP head")







!Other negatively defined morphosyntactic noun sets












!Noun sets

Nominal sets defined according to their morphophonological properties
Sets for lexeme homonymy (most of them are moved to where the actual rules are.)


The words in the set __N-PO__ can be both N and Po, the set takes that into account.


!The LAHKA set family
















!Nominal sets defined according to their semantical properties


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





!Miscellaneous sets






















!Border sets and their complements














!Syntactic sets

ALLSYNTAG
NON-APP

''These were the set types.''




!!Guessing: Rule for adding Sem/Date as a tag to readings which looks like dates




!!Guessing: Rule for adding Adv Sem/Adr as a tag to readings which looks addresses








* Rule for adding <vdic> to verbs denoting verbal actions like: ... dadjá Aili Kestkitalo.






! Removing or selecting proper nouns that are lookalikes

* __AvvilProp__ selects Prop for Avvil


* __SamediggiProp__ selects Prop after Ášši 01/12







we don't want propernoun analysis of these words, initially in sentences





* __InitialSapmiProp__ the initial Sápmi rule. 


* Rules for removing some Props which are identical to common nouns




*Removes __PropPl__, but problems with names as Davviriikkaid Ráđi, there we want Prop Pl






*Select __PlcSur__ (Sem/Plc) (Sem/Sur) 









!Some propernouns have two parts and the first is not a genitive. We still have problems with abbr when these propernouns are inflected or are a part of a cmp. The copy rule adds Attr reading to names which not get it in the fst (Soria). The select rule selects Attr when the next word is e.g. Moria.




* __SoriaAttr__  Soria Attr Moria, Harry Attr Potter-girji

* __SoriaMoria__

! Rules for giving Attr to names, e.g. Ole Attr Kåven.



* __PropAttr__ 

Remove unwanted analyses



!!Southern Locative vs. Essive

* __SouthLoc__ removes Southern Locative vs. Essive


* __Apertium-rule__ we want Num as alternativ to Ord reading  









!!Numerals



* __NumRom__ in beginning of sentence








!!Lexicalised derivations

* __derVuohta__ removes A Attr Der/vuota if A Der/vuota.	


* __eapmi__ compounds with eapmi if they have Der/NomAct analysis


* __derN__ removes DER-N if lexicalised non-essives






* __derNEss__ removes DER-N if lexicalised essives (revise this) - flytter denne til slutten av fila

* __derA__ removes DER-A if lexicalised A


* __derlasj__ removes Der/lasj if lexicalised N




* __derV__ removes DER-V if lexicalised V,





* __derHderAlla, derAlla, derH, derST__ chosses longest Der/tag




* __derPassActio__ removes Actio Nom/Gen/Acc for passive forms. I don't think they exist in Sg, we prefer the PrfPrc analysis.


!Particular verbs





* __notRealV__ removes verb readings from verbs like álbmotregistreret

* __notN__ removes N for adjectives which have got noun analysis because of Px for Divvun 

* __leapmaDimin__ removes it

* __leage__ removes leahki Allegro

* __Divvun__ 



* __Der/PassS__ removes some Pass-readings in favour of V not Pass



* __notPass__ removes som Pass readings which are not likely at all


* __LEX-PASS__ removes passive forms of some lemmas in favour for the lexixalised one

* __LEX-PASSPrfPrc__ selects PrfPrc when noun to the right

* __VGenPass__ remove when Pass or LEX-PASS

* __Allegro__ 




* __LexSelbeassat__

* __LexSelgieldit__

* __LexSelmuohttit__

* LexSelvuhttot


* __LexSelollet__

* __Lexdiehttelasaid__ diehttelasaid Adv

* __Lexmearajiekŋa__ 

* __Lexmaniija__ 


* __Lexgeassit__ geassit Adv vs geassit V

* __Lexvaldot__ váldot V, not váldu

* __Lexsáhttit__ sáhtašit V, sáhttit Err/Orth


* __Ger and GER-NOTV__ remove Ger-forms which are not likely at all


















!!Propernouns


* __PropVfin__ selects propernouns which can be Vfin in the beginning of a sentence





* __confProp, Lea, Man, Hui, Mo, Prop__ removes Props which confuces the analyser, 




 * __Dert__ Rule for removing Der/t Prop when there are other analysis







!Some adjectives are never derived as Adv

!Rules for Prop Attr, Sem/Sur and Plc






* __PropAttrIfPropx__ removes Attr if no Prop on the right side

* __nationalOrg__ removes Prop after nation


* __PropInsideProp__ Selects Prop if capital letter inside clause

* __AttrPropDerlaš__ Selects (Prop Der/lasj Attr) if first one to the right is a noun

* __PropAttr__ Removes (Prop Attr), but not if to the right is Prop or Ord OR ABBR 

* __PropSur__ Selects (Prop Sem/Sur) if finite verb to the left. Immediately to the right is Sem/Fem OR Sem/Mal






* __PropAttr1__ Selects Attr if you are Sem/Fem OR Sem/Mal, Sem/Sur or INITIAL and to your right is Prop which is Sem/Fem OR Sem/Mal or Sem/Sur 









* Removes __PropAttr__ if no Prop on the right side

* Removes __PropEss__ if no Der/lasj

* Removes __HearránEss__ we want Px for Voc (we should we add it to the Prop version)

* Selects __PropNom__ 


!MISC

* __NotConNegII__ removes ConNegII if no Neg Imprt around. This is important, as the homonym forms are common. - 30850






* __errsub_uvvo__ removes -uvvat Err/Orth Sg3 if Der/PassL, e.g. čujuhuvvo



* sutnje is not verb

 * __ABBR__ Removes ABBR in favour of Adv, Pcle or Pron, e.g. "dii" when there is no punctuation

* __ollit__ removes ollit when ollu - move this one?

* __FocbaDu3__ removes Foc/ba when Du3 verbs like máhttiba and Adv like juoba and Prop like Jáhkoba (Acc) 

* __Focmis__ removes Foc/mis when Loc  

* __Focson__ removes Foc/son when Sur  


* __Focmat__ removes Foc/mat when not Imprt  

* __Fochan__ removes Foc/han when adp  


* __Focbe__ removes Foc/be when juobe Adv  


* __Focge__ removes Foc/ge when Adv like dieđusge

* __Focge-dis__ disambiguation Foc/Neg-ge and Foc/Pos-ge


!!!ONE-COHORT DISAMBIGUATION - CYCLE 0

The idea behind "cycle 0" is to have safe rules without context first.
These rules typically chose lexicalisations over derivations, 
Saami words instead of marginal names, etc.


!!Lexicalised derivations


*Removes __derN__ if lexicalised.

*Removes __derNEss__ if lexicalised, and both nouns are essive.

*Removes __derA__ or PrsPrc or VGen if lexicalised. VGen is a chance.

*Removes __derAdv__  when Adv is lexicalised.  

*Removes __VAbess__  when Adv is lexicalised.  


* Removes __derVhmm__ Does this function?

* __derHderAlla__ removes Der/h Der/alla if Der/halla.

* __derAlla__ removes Der/halla if Der/alla.

* Removes __derH__ if Der/InchL.  

* Removes __derST__ if Der/ahtti #OBS se på denne	




!!Fragments and headliners

* __foto__ 





* __Sem/Act__ selects lexicalised NomAct in fragments (instead of looking for VFIN). 

* __AnomInf__ initial adjectiv or ceartain nouns

* __ACompPl__ adjective plural nomitative, not comp sg nor adv

*  __viimmatAdv__ 




* __SA kurssat__  



* __NotGen__ 














* __compgo__ 
















!!Adjectives or nouns, not adverbs

* __Aifeambbo__ selects A after eambbo




* __muhtunlagan__ removes lága Ess if Indef ja lágan A

* __aiggePo__ removes áigge Po, which belongs to MT and thu

Adjective plural, not comparative

* __positivepl__ Pos Pl not Comp Pl for man A sii leat

!!Adverbs

* IFF __buotAdv__ : buot Adv in front of Superl



!Lexicalised adverbs
It is useful to select early the adverbial reading for potensial nouns or verbs.

* __aibbasAdv__ áibbas dolin

*__aloGen__ removes állu Gen,  álo  Adv vs. N Gen

* __aiddo__

*__bealisAdv__ 

*__bearreAdv__ beare vs bearri

*__ilusAdv__ 




*__rámisA__ 


* __mannelTimeAdv__ golbma jagi maŋŋel

* __Advbadjelii__ nahkehit badjelii


* __AdvSTV__ váldit mielde, oahppat bajil. eará? STRICT-TRANS-V is too strong




* __cadaAdv__ if oažžut juoidá čađa

* __cohkkutAdv__ čohkkut


* __dussaiAdv__  


* __gaskanAdvVGen__  

* __gotAdv__  

* __ovdalgoCS__  

* __ikteAdv__  

* __miehtaV__  

* __mannelAdv__  

* __miehtaPr__  


* __aigiAdv__  guokte vahku áigi




* __dalleAdv__

*  __dusseAdv__ 








* __alggageAdv__  

* __bearraiAdv__  

* __boaittobealeAdv__  


* __buresAdv__  

* __cadatAdv__  

* __cuozzutAdv__  

* __dadjatAdv__  

* __dadjatAdv2__ 


* __dainnaAdv__  

* __danin__ (Pron Ess OR Adv)
* __daninAdv__ selects danin Adv. It is a special rule, only negative restrictions.


* Select Ess, and then kill?  

* __dassaAdv__  

* __dakkoAdv__  


* __jusCS__  


* __duoAdv__  

* __duoN__  


* __duodaidAdv__  


* __plcadv__ words like nuortan adv (DOPPE) not N Ess



* __AdvNotNA__ Adverbs, not nouns or adjectives

* __biras__ is noun and not adverb if in GN context


* __AComp__ remove A Comp when Adv




* __birrasii__ removes birrasii N

* dieđusge chooses adv

* __sávvamis__ chooses adv



* __beali__ chooses adv


* __doarvaiAdv__ removes birrasii N


* __doložat__ removes doalut N


* __eanasAdv__  

* __eambbogo__ selects Adv eambbo go


* __eanetAdv__  







* __AdvComp__  

* __easkkaAdv__  






* __gaskatAdv__  

* __goassigeAdv__  

* __gosaAdv__  

* __gustoAdv__


* __gustoAdvláhka__

* __guhkasAdv__  



* __VifVFIN__ removes V 

* __harveAdv__

* __juogoQst__

* __justeAdv__

* __jámasAdv__



* __loahpasAdv__

* __liikkaAdv__



* __luovosAdv__



* __maninAdv__




* __manneAdv__


* __manneAdv__










* __muhtuminAdv3__

* __njuolgaAdv__

* __oddasitAdv__


* __oktanAdv__

* __ollengeAdv__i

* __ovttasAdv__




* __oktiiV__ remove

* __oktiiAdv__ select






* __ollasitAdv__ selects

* __radjaiPo__ selects

* __rabasAdv__ selects

* __rabasAttr__ selects


* __rabasANom__ selects


* __sámásAdv__ selects


* __soaittáhagasAdv__ selects




* __seahkáPl__ selects Pl


* __seammaAdv__ selects

* __unnanAdv__ selects


* __varraAdv__ selects


* __valjisAdv__ selects


* __vehaziidAdv__ selects

* __visotdAdv__ selects







* __vuhtiiAdv__

!!Pronouns 

* __recipr, reciprPl__ select Recipr






!Nouns, not verbs

* __álbmotN__, ii V.


* __headisge__, ii heađisge.

* __loahppa__ after TIME Gen.















































!Lexical selection - nouns























































































































* __sahkaEss__ if Mii lea sáhkan.

* __sahkaPl__ after PLURALIZER in NP























































* __UsImprt__ removes Imprt Sg3 for all nouns in -us	

* __SUBImprt__ removes Imprt when it can be a part of an NP	





* __oahppit__, ii Imprt.

* __bargi__, ii Imprt.


!mánnu vs mánus

!Not noun


!!Adposition or not

* The rules __Pooaivai, Pogiedas__ removes oaivái and gieđas as Po

*  __aldatV1, aldatPo, KillaldatV__ for the problem aldat V vs. alde Po



!!Not Qst

* __AdvQst__ removes dego/nugo Qst 


!!Interjections

* __Interjlemma__ voja voja nana nana select interj if repeated 


* __Interj__ or not



!!Px-rules for special nouns

* __NnoPx__ Remove Px for special nouns

* __gaskaneaset__ selects Po for gaskaneaset	

!!Some verb rules

* __vfingo__ selects VFIN in front of go Qst

* __buoritV__ removes buorit as V



* Some brave rules for removing Imprt










* __ImprtCopPrfPrc__ removes imperative readings in front of coopulas and PrfPrc

* __FocV__ revmoves Foc when Actio, PrfPrc, VGen, e.g. čađahan, ovttasge




!Particular CS

* __madeCS__ for mađe/mađi and dađe/dađi

* __dadeCS__ for mađe/mađi and dađe/dađi

!Verb or Noun?






* __Včiehká__ selects V instead of N when nomintive to the right and accusative to the left ''fápmu čiehká luottaid''



!!Adpositions

!Adpositions, not verbs

* __bealisPo__ removes imperatives when Po lookalikes






!!!Section 2: LOCAL DISAMBIGUATION - CYCLE 1



!!FAMILY pronouns

!Pron Pers 1. p.

* __moai__ This rule is not in use because of REMOVE:Prop

* __miiPersLeft1, miiPersLeft2, _miiPersRight__ select mii Pers 



!Pron Pers 2. p.

* __donDem__ selecst don as Dem instead of Pers


* __donPers__ selecst don as Pers instead of Dem



!Pron Pers 3. p.

* __sonSG3V, sonRel, goson__ select son as Pers, Rel or Pcle 




* __dePcle__ de as Pcle


* __sutnje__ ( = forms of the verb "suotnjat")


* __datPlIll__ selects dát Pron Dem Pl Ill

* __daiddaVerb__ removes dáidda N Sg Nom 


* __dasaVGen, dasaLassin dasa,datSg3, datSg3PrfPrc__ ( = forms of the verb "dassat"): 

* __dasaILLV__ choses dasa to the left of verbs like duhtat, suhttat, luohttit












* __DemPlLoc__ selects Dem when Dem Pl Loc and agreement, perhaps no need for it here because we have agreement-rules later. Men viktig: her blir vi kvitt duo N.

* __DemPlCom__ selects Dem when Dem Pl Com and agreement, perhaps no need for it here because we have agreement-rules later.

* __datPersCopulas__ select Pers in front of copula. I setninger som Riššat dat gal leat musge, jus eai leačča njuoskan. tolker jeg dat som Pcle. Derfor constraint hva som kommer etter.

* __datPcle1__ selects dat Pcle between N and finite, even if there is agreement between verb and dat .

* __datPcle2__ selects dat Pcle when there is no agreement between verb and dat .



* __KilldatPcle__ removes the remaining dat Pcle



* __PersAcc__ selects Pers Acc in accusativ infinitive clauses with object


* __datPers__ selects Pers. I made it stronger than it was. ref. r897 in sme-dis.rle

* __datDemSg__ selects Dem from Pron Pers Sg3 Gen

* __datPersPl3__ selects dat Pl3 in front of V Pl3 and V Du3 and Rel Pl


!!An early rule for "eanaš"/"eanas"

* __eanasPron__ selects Pron in front of Pron Loc

!!Px constraints 


First select Px, then remove all remaining Px

* Set with adjectives, which are documented to have Px in our corpus

* __APxifN__ Remove A Px if N:

* __PxAlone__ Remove Px if it is only word in the sentence, and not a typical px-term



* __APx__ Remove A Px if Adv of A Ess og A Attr og PrfPrc or Loc


* __PxLocIll__ Remove Px if viesus vissui or similar

* __NPxPrfPrc__ Remove Px if PrfPrc with  leat to the left


* Nouns: __NomPxSg1__ (not Ess) as the only word in a sentence. Needs no disambiguation.


* Nouns:  __AccPxSg1__ after a TV verb. Exception for Aux.

* Nouns:  __AccPxSg1__ after a TV Inf verb.


* __PxSg1LocAcc__ is Acc to the right.

* __PxSg1Acc__ is Acc to the right.


* coordination __PxSg1coord__ 

* __PxSg1coordLast__ for the last word of a coordination

* __ReflPxSg1__ lean oahppan alddán


* Nouns: __PxSg2__ if SG2-V. The rule needs no disambiguation. The DON-constraint because of homonymi with (N Pl)

* __PxSg2Acc__ if  TV to the right

* __PxSg2AccImprt__ if  TV Imprt to the left

* __PxSg2AccPrfPrc__ after PrfPrc 

* __NotPxSg2__ if no Sg2 

* __PxSg2GenPo__ if in front of Po, after til verb

* __PxSg2Loc__ after habitivconstruction


* __ánsuPx__ 


* __atnitPx__ removes Px for for atnit muittus, gudnis, árvvus, čalmmis

* Nouns: __PxSg3Acc__ if Sg3 or Sg to the left


* Nouns: __PxSg3Acc__ if Sg3 or Sg to the left

* Nouns: __PxSg3AccPrfPrc__ if PrfPrc and Sg3 to the left







*  __PxSg3GenPo1__ in front of Po, to the left of the owner

*  __PxSg3GenPo2__ in front of Po, to the left of the owner

* __Genguossis__ is  selection Gen, not only with Px. The FAMILY-set would be better than Sem/Hum-tag, but there is often a propernoun connected to the noun. guossái and guossis should have Po analysis?

* __GenNPFinal__ selects Gen as the modifier of a noun in the end of a sentence.

* __PxSg3Nom__

* __PxGenNorPo__  

* __PxGenNum__  

* __PxGenPr__  

* __PXGenoaivai__  for oaivái Po, there could be more Po for this rule?

* __eallitAcc__ Selects Acc for eallit IV if you are ''eallin'' or ''eallinahki''


* __PXAccCoor__  

*  __PxSg3CC__ in coordination with the owner



* __PxSgIllPx__  



* __gaskaAcc__  





We end section 2 by removing all remaining Px

* __KillPx__ removes all remaining Px readings


!!Section 3: Certain verb readings


* __FinGoInf__ for  vai áigu go njulget.. Lene:  we don't need this


verb or adv	


* __NotVGenIfDer__ removes VGen if 0 = Der/Pass or Der...(r947)

* __NotVGenIfDer__ selects Actio Ess 

* __NotActio__ selects Actio Ess 


!All imperatives

For imperative disambiguation we need the following:
Pick imperative contexts, and thereafter remove imperative.
Such contexts are: Imperative verb sentence-initially with exclamation mark



* __NotEmbeddedImprt__ removed Imprt after CS


* __NotImprtWhenInd__ removes Imprt if part of an Ind domain

* __NotImprtWhenIndCoor__ removes Imprt when coordination of an Ind domain - a very special case


* __NotImprtIfAttrLeft__ removes Imprt after attribute

* __NotImprtIfRel__ removes Imprt after Rel, unify this with other left context (r948)

* __ImprtDADJAT__ removes  DADJAT



!Sg1 - early cycle, safe rules



* __VSg1IfLeftMun__ selects Sg1 when "mun" is to the left (r949)


* __VSG1IfRightMun__ selects Sg1 when "mun" is to the right (r950)


!Sg2 - early cycle, safe rules


* __VSG2IfLeftDon__ selects Sg2 when "don" is to the left (r951)



* __VSG2IfRightDon__ selects Sg2 when "don" is to the right (r952)

* __VInfIfAhte__ removes Inf if there is no other VFIN between BOS and "ahte" (r953)


!Sg3 - early cycle, safe rules

* __VSG3IfLeftSon__ selects Sg3 when "son" is to the left (r954)

* __VSG3IfRithgSon__ selects Sg3 when "son" is to the right (r954)

* __VNotSg3When12Left__ removes Sg3 if 12 Pron immediate left (r955)

* __VNotSg3IfCom__ removes Sg3 in X with Y is... (r957)

* __Sg3vdic__ selects Sg3 if VERBAL-ACTIVITY between comma and Nom



* __NegSg3BeforeFoc__ selects Neg before Foc/ge or ConNeg (r959)

* __vfin__ removes verb reading when the reading should be noun  





Negative verb, not abbreviation or roman numeral Ii.

!Du1 - early cycle, safe rules

These Du1, Du2 rules are (almost) not in use in our corpus, but we keep them for completeness.

* __VDu1IfMoaiLeft__ selects Du1 when "moai" left (r960)

* __VDu1IfMoaiRight__ selects Du1 when "moai" right (r961)



!Du2 - early cycle, safe rules

The next two rules are not found in the corpus, but logically
they belong, to cover the whole paradigm. There is no verb-internal
homonymy here, but there is homonymy with e.g. Illative for certain verbs.

* __VDu2IFDoaiLeft__ selects Du2 if "doai" to the left (r962)	 

* __VDu2IFDoaiRight__ selects Du2 if "doai" to the right (r963)	 

!Du3 - early cycle, safe rules

The competitor to Du3 is -ba Foc.

* __VDu3IfSoaiLeft__ selects Du3 when "soai" left (r964)

* __VDu3IFSoaiLeft__ selects Du2 if "doai" to the right (r965)	 

* __VDu3IfGuokteLeft__ selects Du3 if "guokte" left (r966) - 15

* __VDu3IfGuokteRight__ removes Sg3 if "guokte" right and 0 Du3 (r967)

* __VDu3IfNjaNLeft__ selects Du3 as verb with coordinated subject to the left (r968) - 43

* __VDu3IfNjaNRight__ selects Du3 as verb with coordinated subject to the right (r969) - 12

* __VDu3IfCollLeft__ hmm, remove this?

!Pl1 - early cycle, safe rules

The competitor here is obviously Inf, but also Pl3 and Prt Sg2.

* __goasbeareInf__ goas beare Inf

* __VPl1IfMiiLeft__ selects Pl1 if "mii" Pron to the left (r971) - 3163

* __VPl1IfMiiRight__ selects Pl1 if "mii" Pron to the right (r972) - 272


* __VPl1NotImprIfMiiLeft__ removes Imprt if if "mii" Pron to the left and 0 = "mii" (r973) - 557

!Pl2 - early cycle, safe rules

These rules are not used when disambiguating the corpus
* __VPl2IfDiiLeft__ selects Pl2 if "dii" Pron to the left (r974) - 0

* __VPl2IfDiiRight__ selects Pl2 if "dii" Pron to the right (r975) - 0


!Pl3 - early cycle, safe rules

Select...

* __r976__ SE V Pl1 if *-1 SII

* __r977__ SE V Pl1 if *1 SII

* __VPl3jaPl3__ selects Prt Pl3 in coordination (r978)

* __muVPl3__ removes Prs Pl1 after mu


The following two may be joined:

* __VPl3IfPronRelLeft1__ selects Pl3 if -1 Rel is linked to -2 Pl (r979) - 7801


* __VPl3IfPronRelLeft2__ selects Pl3 if -1 Rel is linked via COMMA to -3 Pl (r980) - 853

* __VPl3IfCSLinkPl3Left__ selects Pl3 if -1 Rel is linked via COMMA to -3 Pl (r979) - 341


Remove...


The following two may be joined:

* __r982__ removes Prt Sg2 if Pl3 subject - 6002

* __r983__ removes Prt Sg2 if Pl3 subject via CS - 305

* __VPl3Lookalikes__ removes "verbs" like "manne" and "dušše" (r984) - 274


* __VSg3Lookalikes__ removes "verbs" like "skuvlii" 


* __VPl3NotSg2BefPassive__ removes Sg2 for Pl3 and Inf before passive (r985)

* __EssNotV__ selects Ess instead of VFIN

* nuorra (vs. nuorrat V)
* __PlNomCoor__ Selects (N Pl Nom)

* __johtilit og bastilit__ removed johtit + Der/l 




!PrsPrc

* __PrsPrc__ selects PrsPrc if coordinated with A - 10
Early rule since many PrsPrc readings are removed later.


OBS: denne er ikke helt bra










* Actio Gen










* __BeallileatPl3__ when bealli or oassi + Pl Loc


* __ENInf1__ 

* __ENInf2__ selects Inf (NOTE, this was further down in sme-dis)

* __ENInfcoor1__ selects Inf coor

* __ENInfcoor2__ selects Inf coor

*__listInf__ in lists

!!!Section 4: CYCLE 1B: REMOVING THE READINGS THAT WERE LEFT FROM THE 1A RULES 

We don't need more Px sections, it's done alrady

!!Noun, adjectiv, PrsPrc or not?






* __NnotAcoord__ removes A instead of N (earlier: selects N instead of A), based on coordination with N, and a vfin-verb

* __NPlbeforeRel, NSgbeforeRel__ select N in front of Rel and MO

!!Adjectives and adverbs

!Adv or not?
maid has many readings and as Rel it is a member of S-BOUNDARY. Therefore we need to disambiguate is early in this file. Most important is to select Adv. Because of that A ang N still can have Vfin readings, it is difficult to make very general rules.


* __vaikkomii__

* __giitu__ or not


* __gilvu__ or not


* __AdvPx__

* __comparAdv__

* __badjelisAdv__


* __guhkáAdv__

* __lasiAdv__

* __loanasAdv__

* __oaivvisAdv__


* __guossaiAdv__


* __AdvinfrontofPrfPrc__


* __viidáseappotAdv__

* __viidásetAdv__


* __vuostálagaAdv__



* __maidAdv1__ selects maid Adv when there is no vfin to the right.

* __maidAdv2__ selects maid Adv copulas and PrfPrc or Actio Ess. We need this rule because of that there can be an Inf to the right which also has Vfin reading.


* __maidAdv3__ selects maid Adv even if there is a vfin to the right.

* __maidAdv4__ selects maid Adv between two verbs or the verb after is IV

* __maidAdv5__ selects maid Adv in front of Comp which at this stage can have vfin analysis.

* __maidAdv6__ selects maid Adv between copulas Pl3 and N Pl.

* __maidAdv7__ in a special construction with geahččat

* __maidAdv8__ selects maid Adv after a Pers

* __maidAdv9__ selects maid Adv even 

* __maidAdv10__ selects maid Adv iežas 

* __maidAdv11__ selects maid Adv iežas 

* __maidAdv12__ selects maid Adv for Lea maid A Inf

* __maidAdv13__ selects maid Adv for 


* __AdvPlc__ selects Adv for 


* __KillmaidAdv__ removed the remaining maid Adv


* __mielasAdv__ 


__matPcle__

The following two rules are omitted. They only inflect on the disambiguation of mat pcle, a wackernagel, which is done in the rule over here, I think.








* __olluNom__ 










* __olluAdv__










* __valjitAdv__

* __vejolaččatAdv__

* __aččatAttr__


















* __jogoAdv__ jogo and juoga as adverbs

* __AdvPx__ selects Adv Px instead of N Px

* __AdvwhenAPl__ selects A Pl instead of Adv








!!Disambiguating abbreviations


* __AttrABBRNum__


!!Disambiguating particles

* __sonPcle__ selects son Pcle, the remaining Pcle are removed



!!Disambiguating rom attr



!!Disambiguating clitics




!!Disambiguating numerals



!!Disambiguating adpositions

!čađa
* __caddaN__ if čađa and movement-v


Commented out som adp-rules we don't need anymore:



!geahčai
* __geahcaiPP__ not geahččat V


!guovddaš
* __guovddasPP__ or not 

!mađe
* __madePo__ after Num Gen

* __NumMade__ Num before mađe

!miehta
* "miehtá" is also VFIN, and miehtá needs special treatment 
** __miehtaPo__ after place or time Gen

** __miehtaPr__ before place or time Gen

* __oidnosisAdv__

* "ovddas" has many readings and needs special treatment 
** __ovddasPo__  - commented out because we don't need it

* special rules for rastá because it often is Adv, and it can be an object connected to the PP
** __rastaAdv__  čuohppat/časkit/sahet rastá

** __rastaPo, rastaPr__  fievrridit olbmo man nu rastá

** __rastaPr__  rastá ráji/rájá


** __sisaAdv__   sisa

** __unnimusatAdv__   


* __birraPo, birraPr__ special rules for birra because it often is Adv, and it can be an object connected to the PP






* "vuostá" has many readings and needs special treatment 
** __vuostaAdv__  váldit vuostá/vuostái
** __vuostaPr__  váldit vuostá/vuostái	


* vuollel ja badjel as Adv in front of Num











!LIST LG-MATERIAL = Inf Adv Nom ;

* __gaskasPosticky, gaskasPrsticky__ selects Po after coordinating language materials

* __PoParantes__ selects Po after paranteces









* __PoNomCompl__ removes Po if no possible complement to the left



* __PoMeasure__ removes Po when MEASURE to the left

* __PrGen1__ selects Pr

* __PrGen2__ selects Pr


* __PrNoCompl__ removes Pr if no complement to the right	



* __PoGen__ selects Po



!Diambiguation  Noun vs. Po or Pr:

* __vuollaiPo__ selects

* __beallaiPo__ selects

* __PrTime__ 


* __ovdalPr__ selects

* __gaskanPo__ selects

* __gaskkasPo__ selects


* __lassinPo__ removes

* __ovddasPo1__ selects

* __ovddasPo2__ selects

* __ovddasPo3__ 	selects

* __ovddasPocoord__ selects

* __NwhenPo__ removes N if Po

* __VwhenPo__ removes V if Po




!!Some particular subjunctions and Neg Sup

* __amasCS__ selects CS, not A or Neg Sup

* __amasA__ selects A, not CS or Neg Sup

* __amasNegSup__ selects Neg Sup, not CS or A

* __amasNegSup__ selects Neg Sup, not CS or A


* __amatNegSup__ selects Neg Sup, not CS

* __dasgoCS__ selects CS, not Qst

* Select and remove __vaikkoAdv__ , 


!!go as CS and Qst Pcle
First select all "go" Qst Pcle, then remove them so the rest will be "go" CS

* __standQst__ selects Pcle in standard questions with question mark. Also without question mark if the verb is in 2. person.

* __standQst__ selects Pcle in standard questions without question mark



* __objQst__ selects Pcle in questions which function as object in the clause



* __objQst2__ selects Pcle in standard questions where an object follows VFIN


* __subQst__ selects Pcle in questions as subordinated clause

* __vaiQst__ selects Pcle in questions with vai

* __auxQst__ selects Pcle in questions as subordinated clause, starting with AUX

* __refQst__ selects Pcle in two main clauses, the first one a question which is referred to in the second.

* __nounQst__ selects Pcle for go after NP

* __poQst__ selects Pcle for go after Po

* __negQst__ selects Pcle for go after Neg


* __AdvQst__ selects Pcle for go after WORD

* __killPcle__ removes all remaining Pcle for go 










!!!Section 9 WORD-SPECIFIC RULES



!!Some particular subjunctions

!!Adverb rules

!!!MAPPING OF COMP-CS< , COMPLEMENTS OF PARTICLES IN COMPARISON
First map all COMP-CS<, then remove the other readings


* __compInf__ Inf go Inf


* __ComptimeAdvl__ buoret go ovdal

* __ComptimeAdvl__ ii nu ollu go dál

* __Compadvlcase__ eará sivas go fuorrávuođas

* __CompNumP__ uhcit go njealji stivrralahtu doarjagiin


* __CompNumP__ numerals




* __CompEanet__ dohko eanet go 


* __Compvejolas__ go vejolaš

* __compNomHead__ NP-HEAD-NOM (ADVL) go NP-HEAD-NOM (ADVL). VFIN-NOT-IMPRT pga manglende disamgiguering

* __CompNomHead__ Comp NP-HEAD-NOM leat go NP-HEAD-NOM  


* __compMisc__ go geassebuođut, go dán áigge





* __Compdego__ dego @COMP-CS<


* __compAccdego__ Acc dego Acc

* __compAccgo__ Acc go Acc


* __compNum__ TRANS-V eambbo go Num  


* __compCoord__ coordination	

* __compCoordAttr__ coordination again, now with Attr. Speacial rule because of that Attr also has other readings.	

* __compInf__ 

* __compInf__ 


* __compInfCoor__ 



* __killAllnotComp__ Removes analysis which are not @COMP-CS<

** ''This was the kill all not Comp rule!!''

* __goCSbeforeComp__ Selects CS analysis in front of @COMP-CS<

* __ACompgo__ Selects Comp analysis in front of go and @COMP-CS<




!!!MAPPING OF CC AND CS

Mostly we map both @CNP and @CVP, then we select @CNP, after that we remove them so @CVP remains

* __cnpCompSC__ Map @CNP if @COMP-CS< or COMPAR ahte

* __cnpCompSpec__ special rule because of PrfPrc = VFIN

* __CSasCNPCVP__ Map some CSs both @CNP @CVP

* __CSasCVP__ Map @CVP to CS

* __CCasCNPCVP__ Map (@CNP @CVP) to CC

* __ahteCNP__ ahte CC @CNP, remove the rest

* __killAllahtenotCS__ All other occurrences of "ahte" are CSs.



* __RelCNPRel__ maid ja gos


* __vaiCCCNP__ vai as CC or CS

* __vaiCC__ remove vai as CC 

* __vaiCCNegQst1__ vai CC @CVP before Neg or question

* __vaiCCNegQst2__ vai CC @CNP in question about two alternatives


* __vaiCCPrfPrcInfQst__ vai CC @CNP in question about two alternatives

* __killAllvainotCSCVP__ Select all vai CS @CVP	

* __dadeCNP__ removes dađe @CNP, so @CVP remains

* __CVPNPron__ No finite verb or verbalactivity in front N/Pron @CNP N/Pron	


* __CVPnoVfin__ No potential finite verb following


* __CVPnoVfin__ Infitive following


* __CVPnoVfin_iige__ didn't succeed including iige in barrier in the last rule

* __CVPInfInf__ between to Inf

* __CVPadvladvl__ between to ADVL


* __CVPAdvAdv__ between to Adv


* __CVPActioNom__ 







* __CVPnoVfinAdvl__ No finite verb in front ADVLCASE @CNP ADVLCASE	




* __CVPAdvNom__ Nom @CNP Adv Nom	

* __CVPCopNomInf__ COPULAS Nom @CNP Nom Inf	


 *__CVPoppramsing__ Lásse, Iŋgá ja mun


*__CVPCmp/SplitR__ Cmp/SplitR @CNP

* __CVPwrongCmpnd__ wrongly formatted compounds

* __CVPAAttr__ A Attr @CNP A Attr	

* __CVPA__ A @CNP A 	


* __CVPAccAdv__ Acc @CNP Adv Acc	

* __CVNFauxcFmainv__ 








* __killAllCNP__ removes all remaining @CNP

* __XCC-CS__ removes CC and CS with no synttag



!!PRONOUNS

!Plural?

* __PlSg3V__ removes plural in front of Sg3 verb (and __SgPl3V__ does the opposite)



!!Interrogative and relative pronouns


* __Interr__ selects interrogative pronouns in questions




* __InterrIfPot__ selects interrogative pronouns in potential sentences, and after that we remove the remaining Interr



* __munPl3__ removes Pron Pers Pl3 if there is no verb agreement

* __Rel__ selects Rel

* __RelSg1, RelSg2__ select Rel

* __RelPl__ selects Rel

* __RelPl__ removes Rel




!!Emphatic ieš     

* __ies1Pl, ies2Pl__ select Pl for ieža



* __iesDu__ select Pl for ieža


!!Numerals



* __NifNum__ 



* __AdvOvtta__ 

* __AdvNumEss__ 

* __NumCurrency__ Selects Num

* __NumNomJahki__ Selects (Num Nom) 

* __NumDassa__ Selects (Num Nom)

* __NumAccCurrency__ Selects (Num Acc)	

* __árvosátniNum__ Selects (Num Nom) 


* __NumNom__ Selects (Num Nom) 


* __NumNomCoord__ Selects (Num Nom) 

* __r1082__ Selects (Num Nom) 

* __year__ Selects (Num Gen)

* __numunit__ Selects (Num Gen) + NUMUNIT 

* __NumGenPo__ Selects Gen if you are Num and there is a Gen following the first Gen to the right ''gávcci máná njuni ovddas'' 




* __WWNumOrdIllAttr__ selects Ill Attr and Loc Attr for numerals and ordinals























!!Indefinite pronouns
The rules are not documented yet

* __IndefAttr1__ Selects (Indef Attr) 	


* __IndefAttr2__ Selects (Indef Attr) 

* __IndefAttr3__ Selects (Indef Attr)


* __NoAttr__ Removes Attr if you are Pron and first one to your right is (Pron Rel)	

* __NoIndefAttr__ Removes (Indef Attr) if first one to the right is (Pron Pers Loc)

* __NoIndefGen__ Removes (Pron Gen Indef) or (Pron Acc Indef) if intransitive mainverb to the left and end of sentence to the right ''muhto gávdnojit maid eará''

* __IndefAttr4__ Selects Indef if you are Interr, and to the left is ''jus''












* __AttrBuot__ IFF-rule

* __IndefNom__ Selects (Pron Indef Nom) if you are BUOT and first one to the right is PL3-V 	

* __IndefNom2__ Selects Indef Nom if you are BUOT and there is no transitive verb to your left or roght in the clause















* __miiIndef__ it vaikko mii or mii beare












!!Demonstrative pronouns - should have a look at these



* __DemPlIll__ removes Dem Ill and Dem Loc in front of Acc


* __DemSgNom__ selects Dem Nom Sg if VFIN Sg3



* __DemIndefAttr__ selects Dem in front of Indef Attr, no verb to the left

* __DemGenSeammas__ selects dat Dem Gen in front seammás

* __DemSg__ removes Dem Sg when there is no Sg N to the right

* __datPersSg3__ selects dat Pers Sg3 when there is no N to the right


* __PersNRel__ selects Pers Sg3 when there is a N and a Rel to the right

* __DemMeasure__ removes Dem in front of a Num and MEASURE or NUMUNIT in Ill




!!Disambiguating adjectives 

!Rules related to specific adjectives

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


* __vulitAttr__

* __Comp__ rules select Comp A


!Attribute disambiguation


* __AttrVFIN__ removes Attr in front of VFIN


* __AttrnotNA__ removes Attr when no N or A to the right


* __AttrnotNA__ removes Attr when no N or A to the right


* __ANomILLA__ selects Nom when ILL-A	

!Rules for Attr between Dem and N

* __AAttrDemSg1, AAttrDemPl1__ 

* __AAttrDemSg2, AAttrDemPl2__ 

* __AAttrDemSg3, AAttrDemPl3__ 

* __AAttrDemSgIll, AAttrDemPlIll__ 

* __AAttrDemSgLoc, AAttrDemPlLoc__ 

* __AAttrDemComPl__ 

* __AAttrDemdakkar__ 

!Other attribute rules 

* Not attribute in front of Ess: dovddus sánálaš nissonin








* __AAttrN__ no copulas close to the left

* __AAttrCop__  copulas close to the left



* __AttrPlacelaš__ This rule selects Sem/Plc Der/lasj A Attr in front of Prop or N


* __AttrCord__ 



* __AdvManimus__ 



* __Advovdalaš__ 


* __AttrIllCop__ 

* __AttrAdv__ 

* __Cop__ 


* __ANom__  removes A Nom




* __AAttr__  selects A Attr


* __ASuperlAttr__  selects A Superl Attr





* __AdvN__ removes Adv   

* __AAttrPunct__    

* __AAttrgoAAttr__    

* __AttrTIME__    bad rule

* __AAttrCoord1__ coordination, first part

* __AAttrCoord2__ coordination, first part

* __AAttrCoord2__ coordination, second part



* __PrfPrcCoordA__ selects PrfPrc in coordination with an A

* __ACoordPrfPrc__ selects A itn coordination with PrfPrc 

* __AAttrContra__ selects A itn coordination with PrfPrc 



!Special rules for 'buorre' (the only adjective showing case agreement)







This block of rules is there to ensure case agreement for comparatives.

* Select Pl Nom if V Pl3

* Remove Nom, Acc and Gen if Comp


!alit vs. allat Comp Attr


* __allat__ in front of ALLAT OR MONEY OR EDUCATION OR go

* __alitColour__ in coordination with COLOUR

* __alitN__ in front of VEHICLE, CLOTHES, BEDCLOTHES, BUILDING and more

* __alitEOS__ in the end of a sentence


* __APlNomafterCop__ selects A Pl Nom after copulas and Pl Nom OR Pl Pron

* __APlNomafterCop2__ selects A Pl Nom after copulas and Pl Nom OR Pl Pron

* __APlNomafterDu__ selects A Pl Nom after copulas and Du

* __ASgNomNoSubj__ selects A Sg Nom after copulas Sg3 or Neg Sg3

* __ASgNomafterCop__ selects A Sg Nom after copulas and Sg Nom, not so strong constraint for the target


* __ASgNomEssCopNeg__ selects A Sg Nom after copulas Sg3 or Neg Sg3s, 


* dsfa

* __AcompGo__ Selects (A Der/Comp Nom) even if there is no verb (ellipse)

* __Wr1775xc__ Selects (A Sg Nom) if you are (N Sg Loc), Der/NomAg or (Ex/N A). Copulas is to the left. EOS or CLB is to the right

* __Wr1776xc__ selects (A Sg Nom) 



























!!And now some rules for adverbs that modify adjectives


























!!Proper nouns

!!!VERBS

!!Disambiguating verbs - part 1 

First ConNeg forms, they are dependent upon Neg verbs. Then Imperative 
(with their special syntax), infinitive, and other infinite forms. 
Person comes later (in part 2)




!!ConNeg forms

Number following the rule headers below refer to numbers of hit in a 13 053 859 word corpus.

* __ConNegImp__ selects ConNeg Imprt if Neg Imprt to the left. - 4265



* __PrfPrcConNeg__  to ConNeg Aux after PrfPrc

* __ConNegIfNeg__ selects Ind ConNeg if Neg Ind to the left. This is the main (and common) ConNeg rule. - 660327


* __ConNegPrt__ selects Prt if Prt to the left

* __ConNegCondIfNeg__ selects Cond ConNeg if Neg Cond to the left. Less used, obviously. - 0 - homonymi?

* __ConNegPrfPrc__ selects ConNeg for leat when topicalised PrfPrc between Neg and leat - 713

* __ConNegImpCC__ catches the second ConNeg in cases like don't smile or laugh - 0

* __ConNegIndCC__ catches the second ConNeg in cases like doesn't smile or laugh - 369

* __NotConNegIfNotNeg__ removes ConNeg if no Neg to the left. Consider unifying with NotConNegNotNeg. - 1094269



* __NotConNegNotNeg__ removes remaining ConNegs whenever no Neg to the left. - 5862






!!Imperative

See also ''Imprt or Ind'' some sections down.

* __PassLNotImprt__ removes Imprt when passive (sentence-initial, hence important)

* __ImprtLeat__ says BOS Leat A is Imprt - 575

* __ImprtDál__ 

* __SelImprtExcl__ selects initial Imprt when excl mark 


* __ImprtComma__ 

* __ImprtNotVGen__

* __NotImprtInd__ 

* __NotImprtConNeg__ 

* __NotImprtA__ 

* __NotImprtN__ 


* __NotImprtVFIN__ 


* __NotImprtSlash__ 


* __NotImprtGo__ 


* bearrat TV or berret IV - berret is aux


!!Infinitive




* __r2974__ was moved up to select PL3-V after N Pl, might be relaxed to REMOVE Inf

* __headofparts__ 


* __r2976__ was moved up to select PL3-V after N Pl, might be relaxed to REMOVE Inf

* __r1809__ Not Pl1 (but Inf) if VFIN to the left, This is the basic Inf rule.

* __r1812__ 


* __InfCompCs__ 

* __r1811__ 


* __EssInf__

Rules that prevent later selection of Inf for a finite verb in the frame 			

''INF-V...CC...''

* __r1816__ 


* __r1818__ 


* __r1819__ 



* __r1820__ 

* __r1821__ 







* __r1823__ 

* __r1824__ 

* __r1825__ 

* __r1827__ 

* __r1828__ 




!!Verbgenitive




* __VGen__ is typo



* __VGen__ selects VGen after VGEN-V-TRIGGER-verb


* __Gen2__	selects VGen after after gaskan and lahka

* __VGen3__ selects VGen after copulas

* __VGen4__

* __VGenCoor__


* __KillAllVGen__ removes all VGen (r1842)


!!Supinum vs. potential -- no example found in large corpus

!!Perfect Participle





* __r1844__ removes PrfPrc if 0 is the second N in an N and ... N construction

* __r1844__ removes PrfPrc if 0 is the second N in an N and Gen ... N construction (this is marginal)

* __PrfPrc_Ess__ removes N Ess if 0 PrfPrc


* __r1852__ selects PrfPrc if copula to the left



* __r1853__ selects PrfPrc if Rel to the left which again is linked to copula




!Topicalized version

the following chapter should be possible to unify.

* __r1855__ selects PrfPrc if Nom to the left linked to copula

* __r1857__ selects PrfPrc if Acc to the left linked to copula

* __r1858__ selects PrfPrc if NP head to the left linked to copula

* __r1857__ selects PrfPrc if copula to the left

* __r1861__ selects PrfPrc if VFIN to the left



* __r3576__ selects PrfPrc if Acc to the left linked to activity verb

* __r1863__ is the mannan vahkku rule


!!Actio


!!Present participle
*orrut vs. orrot) 
!!Rules for "addit" (which is an adjective, but more often a verb)
!!Actio Loc = N Loc



* __ActioLocleat__ is an IFF rule, we also need rule for 'leat', like in lea go biergu oastimis

* __ActioLoc__ is an IFF rule, we also need rule for 'leat', like in lea go biergu oastimis




!!Actio Nom = Ess



!!Imprt or Ind



* __removeAllImp__

!!Nouns or verbs

The rules are no documented yet

* __VFINAttr__

* __NPlbuorit__  

* __ActioEssNum__	

* __ActEssIfSensationv__	

* __NoActorIfSg3__

* __GenIfPo__

* __semináraNOM__



!!Demonstrative pronouns, agreement in DP - should it be moved to after verbmappings? 
The rules are no documented yet

* __DemAttr__



* __IndefAgree__ guhtege goappašat iešguhtege guhte




* __DemCASEPl__

* __DemCASESg__

* __DemAttrNum__

* __DemAcc__

* __DemAttr__



!!!VERB MAPPINGS


!!Verbs as predicatives (@SPRED>) and (@<OPRED) 

!The tags (@SPRED>) and (@<OPRED) target  PrfPrc
The rules are no documented yet

* __spredPrfPrc__ Buressivdniduvvon lehkos (topicalised PrfPrc) -- was r494

* __opredPrfPrc__	

* __opredPrfPrc__


!!Passive verbs often have 





!!Verbs as prenominal participles (@>N):

* Some verbs will not be @>N if not Pass

* __NPrfPrc1__ with 1C N Nom



* __NPrfPrc2__ with -1C Dem or Num or Attr or Indef

* __NPrfPrc3__ with PrfPrc or ConNeg to the left, the N can be different cases

* __NPrfPrc4__ mannat in front of TIME

* __NPrfPrc5__ for LEX-PASS


* __NPrfPrcPr__ after Pr 

* __NPrfPrcPo__ before Po

* __NPrfPrcGen__ after Gen


* __NPrfPrc__ between aux and prfprc


* __NPrfPrc6__ the verb can be to the right

* __NPrfPrc7__ Der/Pass, no TIME to the right

* __NPrfPrcCoor__ coordination

!(@+FAUXV) and (@+FMAINV) target Neg, orrut
* __+FAUXVNeg__

* __+FMAINVorrut__ finite orrut

* __FAUXVorrut__ finite orrut

* __FAUXVorrut__ infinite orrut



!(@A<)  target Inf 	
* __AInf__ Inf 	

* __r368__	



!(@<SUBJ)  target Inf




* __<SUBJInf2__

* __r354__

* __<SUBJInf3__

* __<SUBJInf4__

* __<SUBJInf5__

* __<SUBJInf6__

* __SUBJ>Inf__

!(@<SPRED)  target Inf






!(@<ADVL)  target Inf, Actio Ess





















!@-F<OBJ  target Inf 







!(@N<)  target Inf, Actio Ess








* __N<Infcoor__





!(@<ADVL)  target Inf, Actio Ess





* __ADVLActioEss__ Inf 		


!(@<OBJ)  target Inf, Actio Ess, PrfPrc 



















* __OBJActioEss__ Inf 		


* __OBJPrfPrc__ PrfPrc 			











!(@+FMAINV) and (@+FAUXV) and (@-FAUXV)

* __+FMAINVaux__ AUX-OR-MAIN verbs     

* __+FAUXVcop__ AUX  COPULAS     



* __+FMAINVcop__ COPULAS verbs     

* __+FAUXVaux__ AUX  verbs     


* __+FAUXVboahtit__ boahtit as AUX      

* __-FAUXVaux__ AUX verbs     

* __+FMAINVcopInfconstr__ leat before Inf     



* __+FMAINVCop__  copulas even if PrfPrc coming after


* __+FAUXVCop__  copulas coming before the mainverb


* __+FAUXVCop__  copulas coming before the mainverb, relative clause inbetween


* __+FMAINVcopMannan__  leat before mannan TIME     

* __+FMAINVHabconstr__  in habitive constructions    

* __+FMAINVCoopCoord__ coordination  

* __+FAUXVleat__  

* __+FMAINVAux1__  

* __-FMAINVAux2__  

* __+FAUXVCop__  copulas coming after the mainverb

* __+FAUXVboahtit__  boahtit coming before the mainverb

* __+FMAINVCop__  copulas 	


* __+FMAINV__  to the remaining finite verbs which are not AUX    





* __+FMAINV__  to finite verb after mainverb


















!(@-FMAINV) and (@-FAUXV)

* __-FAUXVConNegCop__  to ConNeg COPULAS   

* __-FAUXVConNegAux__  to ConNeg AUX-OR-MAIN   

* __-FAUXVConNegAux__  to ConNeg AUX   




* __-FMAINVConNeg__  to ConNeg   





* __-FMAINVConNeg__  to ConNeg

* __-FMAINVConNeg__  to ConNeg Aux after PrfPrc

* __-FMAINVConNegCop__  to ConNeg COPULAS   




* __-FAUXVPrfPrcAux__  to PrfPrc AUX  before Inf or Actio Ess

* __-FMAINVPrfPrc__  to PrfPrc 

* __-FMAINVPrfPrcEss__  to PrfPrc before Ess

* __-FMAINVPrfPrcleat__  to PrfPrc leat

* __-FMAINVPrfPrcafterAuxAux__  to PrfPrc after two Auxs

* __-FMAINVPrfPrccoord__  to PrfPrc coordination	

* __-FMAINVPrfPrccoord__  to PrfPrc coordination	

* __-FMAINVPrfbeforeAux__  to PrfPrc before the Aux	

* __-FMAINVPrfafterMan__  to PrfPrc before the Aux	



* __-FMAINVInf__  to Inf





* __-FMAUXVActioEss__  to Actio Ess

* __-FMAINVActioEss__  to Actio Ess

* __-FMAINVSup__  to Sup

* __+FAUXV__ to  Aux


* __NPrsPrc1__ with 1C N Nom



* __ActioNom__ with 1C N Nom

* __<ADVLVAbess__ VAbess ADVL

* __<ADVLVGen__ VGen ADVL

* __ADVL>VGen__ VGen ADVL


* __<ADVLGer__ Gerundium ADVL

* __ADVLGer>__

* __-FMAINVLoc__ Actio Loc

* __>AActioGen__ Actio Gen

* __PrfPrcEllipsis__ being verbal head when finite verb is missing


!And then we remove the verbs which didn't get any syntactic tag, in favour of verbs with syntactic tags.



* __realverbX__


* __NomActLocX__

* __NomActX__ removes other readings when PrfPrc Or Actio Ess

* __IfonlyVerb__ selects the FMAINV reading in the cohort

* __IfonlyConNeg__ ConNeg if it is @-FMAINV or @-FAUXV


!__killifVinCohort__ This rule removes all other readings, if there is a mapped V reading in the same cohort. Every case which this goes wrong, should be fixed in mapping rules or previous disrules.

* __X__







!!!NOUNS








!!!CASE DISAMBIGUATION

!!Num as subject, tricky cases - the rule should be here because of the verbdisambiguation






* __DiminNomPxSg1__	


!!ACCUSATIVE-GENITIVE DISAMBIGUATION


!!Secure rules for choosing Acc



* __PGenN__ selects Gen when (Pron Pers) to the left and N to the right ''mu sámevuođa iđuid''

* __CoGen1__ (quite strict) selects the first of coordinated genitives ''riikkaid, čearuid ja boazoorohagaid ovttasbarggu''



! Semantihkka: Choosing accusative or genitive semantically



* __vuoiAcc__ selects accusative if ''vuoi'' or ''vuoi surgat'' to the left 

* __lihkkuAcc__ selects accusative 







* __SEMnotPossessor__ Removes Gen if you are not a possible possessor (a human) # HAB-ACTOR


* __SEMnotHUM__ removes Gen. This is when an NP is thought to be the OBJ, because it's not in the human sets and to the right is NON-FAMILY ''njálgáid mánáide''. 

* __SEMXr2066__ Removes Gen if there is a human or org to the right, exeption for ''čállingiela áhčči'' and so on





* __SEMgenEss__ Removes Acc if there is Gen + Ess, like ''dálu eamidin''




* __SEMXxr2071__ Removes Gen: Nobody can possess a Proper name? Except from (Pron Pers) and Sem/Fem OR Sem/Mal

* __SEMXxPropOrg__ Removes Gen: Who can possess Prop Sem/Org?    

* __SEMlohkat__     

* __SEMNation__ Removes Gen: Who can possess Sápmi?    

* __SEMdep__ Select Gen if main-organization in front of department   
* __SEMorghum__ select gen if organization or education in front of human or text  






* __SEMXr2073__ Remove Gen: Accusative in front of a human group ''loktema sámiid buorrin''

* __SEMr2074__ Selects Gen in front of HUMAN-GROUP

* __SEMGenOrg__ Selects Gen in front of Sem/Act


 * __SEMactor__ Select Gen in front of ABSTRACT and RIEKTEDILLI ''unnitlogu oaidninčiegas''

* __SEMXr2076__ Selects Gen if you are HUMAN or Pron with an ABSTRACT to your right ''iežaset vuoigatvuođa''

* __VocNom__ 



* __SEMyouareNom__ Removes Gen and Acc when 0 FAMILY or PROFESSION because you are Nom. Not if -1 Num and VFIN is LEAT or IV ''Oahpai go Sire sámegiela''

* __SEMyouareGen__ Removes Nom if movement verb to the left and illative to the right, because you are the modifier of Ill ''mannat Madame Tussaud kabinehttii''

* __SEMnotNom__ Removes Nom if a Nom to the right followed by a transitive verb. 0 is animate and to the right is Ill. You are the modifier of Ill







* __SEMXxr2081__ Removes Gen if NATION or POLITICAL-PLACE are to your right ''dilálašvuođaid sámi''


* __SEMr2082__ Selects Gen if you are LANGUAGE, giellanjuolggadus or giellaláhka in Acc-case and to your right is SAPMI-N-HEAD ''sámegiela hálddašanguovlun''


* __SEMr2084__ Selects Gen for ''hálddašanguovllu suohkanat/gielddat''


* __SEMguovttis__ selects genitive in front of guovttos and guovttis

* __SEMXr2087__ selects Gen if you are a Prop/Plc followed by "gielda" or "suohkan"

* __SEMXr2087__ Selects Gen if you have "eana" or "guovu" immediately to your right ''Gomorra eatnamii''

* __SEMhumgroup__ , tja




* __SEMplcGen_a__ Selects Gen if you are GEOGRAPHICAL-PLACE or (Prop Sem/Plc) in front of PLACE-ADV ''Finnmárkku máttabealde''
* __SEMplcGen_b__ Selects Gen if you are GEOGRAPHICAL-PLACE or (Prop Sem/Plc) after a PLACE-ADV


* __SEMplcGen2__ Removes Gen in front of a GENERAL-PLACE or POLITICAL-PLACE, if you are a noun ''bidjen hildu sadjásis'' 

* __SEMplcGen3__ Removes Gen in front of GENERAL-PLACE or POLITICAL-PLACE, if you are ABSTR-TEXT or TEXT ''cealkámušaid guovlluid dearvvašvuođafitnodagaid jahkedieđáhusain''

* __SEMXr2079__ Removes Gen if you are Acc in front of MANNU ''guđii virggi skábmanánu 1. b.''




* __SEMxhab__ Selects Acc if COPULAS to the left of HAB-ACTOR ''lea min''

* __SEMxboaris__ Selects Gen if you are ''boaris'' in front of SAPMI-N-HEAD or SAPMI-PROP-HEAD ''sii dolvo áhku boarrásiid siidii''

* __EMeallimamuorra__ Selects Gen eallima muorra


* __ACRGen__ Selects genitive: NRK Sápmi

* __ACRAttr__ Selects genitive: IL Nordlys


* __AccSemFeat__ Selects genitive: IL Nordlys








* __SEMXxr2093__ Selects accusative: if váldit to the left and mielde to the right: ''váldit mielde''


* __SEMXr2096__ Removes genitive: because Accusative in front of an organization


* __SEMGenORG__ selects Gen (modifier): in front of an organization ''Stáhta Oahpahuskantuvra''


* __SEMGenORG__ selects Gen (modifier): in front of an organization ''Stáhta Oahpahuskantuvra''



* __SEMgen1__ removes Acc if buot, gait or buohkat in front of a genitive, followed by a plural noun ''buot Norlándda ohppiid''


* __SEMgen2__ removes Acc if bargat or dihte are FMAINV or Inf and are found somewhere to the left of a Gen, which is followed by a noun ''bargame boazodoallolága ođastemiin''

* __SEMXr2103__ Selects accusative: OASSI is usually accusative ''hálddaša stuora oasi''


* __SEMXxr2104__ Selects accusative: if WRITING-ACTIVITY-V to the left and you are a TEXT ''čállá vaidaga''

* __SEMXxacc__Removes accusative: if WRITING-ACTIVITY-V to the left and a noun to the right ''čállit Norgga vásáhusaid''



* __SEMXxOrgRep__ Selects genitive: An organization´s representative ''Sámiráđi ovdaolmmoš''


* __SEMxr2107__ Acc if *-1 fáktemuš




* __SEMXxr2108__ Selects genitive if you are SAPMI with an Acc/Gen immediately to your left and a noun immediately to your right ''girji sámi áššiid (birra)''

* __SEMsapmiModifier__ Selects genitive (modifier): Sámi, suoma or ruoŧa  as modifier of noun ''sámi oahpahus''

* __SEMsamegiellaCoord__ Selects genitive 

* __SEMAcc__ Selects accusative #to be generalised


* __SEMálbmot__ Selects genitive #to be generalised




* __SEMsapmiModifier2__ Select genitive (modifier): Sámi, suoma or ruoŧa on both sides of CNP as modifier of noun ''Suoma ja Ruošša soahti''

* __SEMdazaModifier__ Selects genitive (modifier): dáža, indiána, maya-indiána or romer  as modifier of noun ''dáža oahpahus''




* __SEMXr2115__ Selects genitive (modifier) in front of a lahka-noun ''spábbačiekčanlága vuoigatvuohta''

* __SEMXr2116__ Selects genitive (modifier) if you are LAHKA OR ORGANIZATION followed by mannu, day and numerals..


* __SEMvaldi__ Selects removes NomAg váldi, till we find examples of actual use of it 



* __SEMtext__ (modifier) selects genitive (modifier) if you are a TEXT in front of KLASS ''doalloplána čuoggái''




*  __SEMgiella1__ (modifier) selects Gen if you are a LANGUAGE in front of LESSON or SATNI ''sámegiela oahpahusa''


* __SEMsamegiella__ selects Gen for LANGUAGE if *1 is LESSON 



* __SEMlang__ removes Gen if LANGUAGE is to the right, but not if you are ACTOR-ROLE and so on ''oahpponeavvuid sámegillii'' 

* __SEMlang2__ Gen if you are LANGUAGE with 1 N: You are only a modifier in a sentence with a TV-verb, if there is an Acc or Com between you, or if the Obj is topicalized ''ráhkadii sámegiela Áppesa''


* __SEMgiella2__ Gen if you are Pron followed by giella ''iežas giella''


* __vdicNom__ Selects Nom











* __SEMstahta1__ Gen if 0 stáhta 1 org etc.



* __SEMfylka1__ Gen if you are FYLKA followed by fylka ''Romssa fylkkasuohkan''

* __SEMfylka2__ Gen if you are FYLKA, then "ja" to the right followed by FYLKA ''Finnmárkku ja Romssa fylkkagielddaide''

* __SEMfylka3__ Gen if FYLKA and some place or org to the right ''Finnmárkku ássiide''



!Other genitive rules

* __topGEN__ Selects Gen if sentence intitial. To the right a Prf Prc that modifies nominative ''Stáhta nammadan láhtu''

* __NomQst__ Selects Nom in a Qst-sentence. To the left is Nom and leat with a Qst-particle ''Leat go álbmotmeahcit veahkaváldi''

*__Genlassin__ Selects Gen if first one to the right is lassin ''bargostipeanddaid lassin''

*__lassinIll__ Selects Ill if first one to the left is lassin ''lassin Sarai''



!Gen and preposition/postposition



* __GenAPP__ Selects genitive when a preposition to the left, or when a postposition to the right ''rastá riikarájiid''


* __NomIfPo__ removes Nom if sentence initial, because it modifies Gen


* __GenPoCoordPunct__ Selects genitive for coordinated postpositions: with PUNKT to the left 

* __GenPoCoord__ Selects genitive for coordinated postpositions ''ráŋggáštusa ja buhtadusa hárrái''




* __GenGenPo__ (modifies pp-phrase) selects Gen in front of postposition-phrase ''álgojagiid soađi maŋŋá''

* __GenORG__ (modifies Loc) selects Gen if you are MAIN-ORGANIZATION and to your right is Loc ''dearvvašvuođafitnodagaid jahkedieđáhusain''

* __GenPropSem/Semcon__ 

* __SEMnom__ (modifies Nom) removes Acc if sentence boundary or adv to the left. To the right is Nom followed by a transitive verb and Acc ''stálu beana njoallu háviid''


* __SEMDomain__ 

* __deaivatGenlusa__ selects genitive when used like deaivat Gen lusa/lahkosii even if the verb deaivat belongs to the strict TV set.


!Genitive in place adverbials ROUTE

* __GenPlc__ Selects genitive if you are ROUTE, and there is a MOVEMENT-V to your left or right ''boahtiba dán geainnu''

* Selects accusative if you are ROUTE, and the verb čuovvut to the left. 

* __ruovttoluottaAdv__

!Adjectives take object

!Temporal adverbials: Choosing accusative or genitive TIME

* __GenMannuOrdRight__ selects Gen if you are mannu and to your right is A Ord ''miessemánu 10.''

* __GenMannuOrdLeft__ selects Gen if you are mannu, to your left is Ord and to your right is a numeral



* __JahkeNumNom__ selects Nom if you are Num, to your left is beaivi, then ord/Num and then mannu ''borgemánu 1. b. 1891''

* __GenBoahtte__ selects Gen if you are time, to your left is boahtte, boahtit, čuovvovaš or ovddit


* __TIMEobs__ selects Gen if you are time, and to your right is an intransitive real-verb. No adverbials allowed to the right ''vuolggán bearjadaga''

* __GenGuhte__ selects Gen if you are vahkku with guhte to your left ''guđe beaivvi''

* __GenMan__ selects Gen : man adj







* __Nom_b_1__ selects Nom if you are b/beaivi with a numeral/Ord to your left and a mannu to the left of that. To your right a finite verb čuovvut

* __Nom_b_2__ selects Nom if your are b with a numeral/Ord to your left and a mannu to the left of that. To your right copulas followd by beaivi in nom-case ''juovlamánu 1. b. 1972 lei buorre beaivi''

* __Nom_b_3__ selects Nom if you are b/beaivi with Num/Ord to your left, with mannu to the left of that, with copulas even futer to the left and beaivi to the left of copulas

* __aigiAcc__ Gen if 0 TIME 1 áigi


* __GenBeaivi2__ selects Gen if you are beaivi with the end of the sentence or comma to your right. Restrictions to the left ''riegádanbeaivvi,''

* __GenBeaivi3__ selects Gen if you are beaivi with the beginning of the sentence to your right ''Bearjadaga mii vuolgit''

* __GenBeaivi4__ selects Gen if you are beaivi with a NP-boundary to your right

* __GenDate__ selects Gen if you are Sem/Date


* __GenJuohke__ selects Gen if juohke or seamma to the left ''juohke dálvvi''

* __GenJahkiNum__ selects Gen if you are jahki num with a numeral to your right ''Skuvlajagi 1998-99''

* __AigiModifier__ (modifier) selects Gen if aigi to the right ''konferánssa áiggi''

* __GenHávvi__ selects Gen for hávvi if Acc somewhere to the right 


* __GenHávvi2__ selects Gen for hávvi if a transitive verb cannot be found somewhere in the sentence

* __GenGeardi__ selects Gen if the beginning of the sentence to the left ''Eará háviid''

* __GenRbeaivi__ (modifier) selects Gen if riegádanbeaivi to your right 

* __GenGeardi2__ selects Gen for geardi if Num Gen or Ord to the left 

* __GenTimePl__ selects Gen for TIME-N + Pl if an attribute to the left ''lagamus beivviid''

* __GenDURadj1__ selects Gen if a duration adverbial to the left 

* __GenDURadj2__ removes Gen for TIME-N, if duration adjective to the left ''olles dálvvi''

* __accgenbeaivi__ ávvudit riegádanbeaivvi


* __GenDURNumPl__ duháhiid jagiid

* __GenDUR1__ removes Gen for VAHKKU-DUR if duration verb or place verb somewhere in the sentence. Restrictions. ''ádjánii beaivvi''

* __GenDURNum__ vázzen guokte maŋimuš jagi doppe

* __GenDUR2__ removes Gen for VAHKKU-DUR if the duration verb or place verb to the left is perfectum participle or infinitive with an auxiliary to the left 

* __NoTimeAcc__ removes Acc for time if POINT-IN-TIME-SPEC or Ord to the left ''vuosttas beaivvi''

* __NoTimeAccII__ removes Acc for time if POINT-IN-TIME verb to the left 

* __NoTimeAccIII__ removes Acc for time if POINT-IN-TIME verb to the left is infinitive or perfectum participle with an auxilliary or negation to the left 

* __AccBeaivi__ removes Acc for relative pronouns if followed by general beaivi ''guđe beaivvi''

* __timeADVL__ selects Gen for time: when perfectum participle or infinitive to the left are time adverbial verbs or not time object verbs, to the left of this there shall be an auxiliary ''lean čoavdán cealkagiid maŋimuš áiggi''

















* __theAccusative___ selects Acc if you are a N or Pron with CC to your right, followed by Acc and a CLB or VFIN ''gápmagiid ja vuoddagiid, sii geavahedje''







* __NotGenitive__ selects Acc if you are a N or Pron with punctuation marks to your right, followed by a noun-phrase boundary




! Reflexive pronouns: acc or gen



* __NUGOr2159__ selects Gen between nugo and N ''nugo suorri dulkaoahpu''




* __AccIEScoord__ selects (Pron Refl Acc) Acc in front of "ja" to the left. To the right Loc or Ill ''elliideaset ja iežaset ealáhussii''

* __GenIES__ (modifier) selects (Pron Refl Gen) if NON-FAMILY OR ("bellodat") OR SAMEDIGGI-GEN to the right ''iežaset mánáide''


* __AccIES__ SELECTS accusative object (Pron Refl Acc)  

* __AccIES__ (modifier) removes accusative object (Pron Refl Acc) if Ill or Loc to the right, but not if a transitive verb is found to the left 


* __GenIESinf__ removes (Pron Refl Gen) if a transitive verb to the left and an Inf to the right 




* __NomIfProp__ Removes Acc and Gen when you Prop because you are Nom. To the left is a sg3-verb. Should not hit Prop that are Sem/Plc.


* __NomIfProp2__ Removes Acc and Nom when you are Prop Sem/Plc because you are Gen. To the left is a sg3-verb. To the right is a noun.

* __NomSentFin__ Selects Nom if you are Acc or Gen and EOS is to yoru right. Copulas is found to the left 

* __jr_sr__ Selects (ABBR Nom) if you are ''jr'' or ''sr'' and first one to your left is (Sem/Sur Nom)



!Accusative object 


* __AccActioEss__ Selects accusative: when a Strict transitive verb actio ess to the left, but not if there is an other Acc to the right followed by EOS

* __AccEss__ removes Acc when you are SAPMI-N-HEAD with an Ess to your right, but not if there is a transitive mainverb to the left ''dutkama duogážin''


*__topOBJPers__ Removes Gen if you are Acc, and to you right is a Pron followed by a transitive verb. You have to be sentence initial

*__AccVAbess__ Selects Gen if to the right is abessive 

* __topOBJ1__ Selects accusative: when a Strict transitive verb to the right (topicalized object) ''beaskka geavahedje''

* __topOBJ2__ Selects Acc when a transitive finite mainverb to the right (less strict) ''dan juohkehaš fuobmá''



* __topOBJ3__ Selects Acc. It is not depending on a transitive verb like topOBJ1 and 2, but selects Acc when Aux to the left, but only if there is no chanse of it beeing a Nom 




* __AccTV1__ Selects accusative: when a Strict transitive verb to the left (barrier exludes everything but: adv, N Ess , N Loc and Pcle). No Acc allowed to the left of the verb. No Acc allowed to the right of you, except pronouns and education (sentenceboundary and N Ess as barriers). Only numunit numerals are allowed to the left. You are not Acc if you are: time, ruote or Pron Indef. Neither if you are Pron Refl with Gen to your right followed by N Ess. Neither if you are Pron Refl with Gen to your right followed by Po. N Nom and Ger not allowed immediatly to your right. You are not Acc if you are a Nom cased Prop and the verb is some kind of verbalactivityverb and ahte or sentenceboundary is to the right. Vdic not allowed immediately to your left. If váldit is the verb, you are likely to be a Gen if Ill-body noun is found to the right. ''oste mielkki gávppis''



* __gosnevrriid__ selects Acc in the special cases where there is an Acc Pl in the beginning of the question which is not the object of the verb: Gos nevrriid...




* __PronNP__ (removes Acc): selects Gen for Pron Pers if Acc or Ill to the right, given that there is a secure object or that no transitive verb is found ''bija ruđa mu kontoi''

* __dahkatGen__ selects Gen when dahkat or bargat takes only adverb

* __r2206__ selects Gen when a finite verb to the left and Nom or Acc to the right ''lohkaba su girjji''



* __r2271__ Removes genitive when a transitive verb to the left and you (not if you are a pronoun) are followed by Ill/Loc/Com/Adv: ''doalvvui stálu meahccái''

* __AccTV2__ Selects accusative: when a transitive verb to the left. No Acc allowed to the left in the sentence (sentenceboundary as a barrier). No Acc allowed to the right (barriers are CC, comma and sentenceboundary). Note that Gen to the right followed by a noun is allowed. You shall not be: route, time, Pron Dem. You are not Acc if you are: Gen-cased Pron or Animate with Ill immediately to your right. No Acc, Com, N Nom or Gerundium allowed immediately to your right. No Gen followed by Po allowed immediately to your right. A SG3-verb is only allowed to your left (barriers excluding everything except NP-heads and adverbs, PrfPrc is also a barrier) if there is a Nom left to the SG3-verb. No vdic allowed immediately to your left. You are not Acc if: you are a Nom-cased Prop, followed by ahte or EOS and the verb found to the left (SV-boundary) is some kind of verbalactivityverb or a humanagentverb.


* __AccTV3__ Selects accusative: when transitive verb to the left, if it doesn't find a barrier: comma, Num, real-v, Ess, s-boundary. Acc not allowed to the left of the verb. Not Acc if animate or Gen in front of Ill. Numerals the only Acc allowed to the right. Not Num, time route or adv. Not Com or Ger immediately to the right. Neither Po. Not Acc if sg3-verb to the left without a Nom to its left. Not Pron Dem followed by N, neither Pron Rel followed by time. No vdic immediately to your left. No Nom-cased Prop with some sort of verbal activity to its left is allowed..  



* __OLDr2466__ Selects accusative: when transitive verb to the left, but not if the TV is FAUX OR LOC-V




* __AccInf__ Selects Acc if the verb to the left is TV + Inf (you are the obj of the Inf). Differs from the other rules by not beeing restricted by an Acc to the right ''hállat eatnigiela''

* __AccCOP__ Selects Acc if copulas to the left and nominative to the left of COP ''gápmagat leat áhči''

!Gen modifiers inside NP 


* __GenNP1__ Selects Gen for Pron Pers (modifier): if NP-BOUNDARY OR Acc (but not if the finite verb is TV) to the left and N to right 

* __GenNP2__ Selects Gen for N (modifier): if CC "ja" immediately to your left and accusative to your right ''ja sámi jurddašanvuogi''

* __GenNP3__ Selects Gen (modifier): if first one to right is Nom or Loc ''Norgga oaivegávpogis''

* __GenNP4__ (modifier) selects Gen -1 BOS or COMMA, 1 Nom ''nissoniid bargu''

* __GenNPCo__ (modifier) Selects Pron Pers Gen if Nom to the left of ja ''Mun ja mu ustibat''

* __GenRefl__ (modifier) selects Gen in front of a noun in accusative or nominative case ''iežaset oiviliid''



* __AccAfterCC__ Select accusative: if genitiv to the left, and CC "ja" to the left of genitive ''eamiálbmot- ja globaliserenprošeavtta koordináhtor''




!Accusative in coordination



* __CoAcc1__ Selects Acc when NP inbetween commas ''guolleoivviid, dáraid, debbuid, buđeittaid, boares rásiid''


* __CoAcc2__ Select Acc if coordinator to your left and accusative to the left of the coordinator ''deaja dahje sávtta''


* __CoAcc3__ Selects Acc in front of ''ja'' if there is a secure Acc to the right ''semináraid ja diehtojuohkinčoahkimiid''


* __CoAccJA__ Selects Acc when "ja" to the left and comma to the left of "ja" with a secure Acc to the left of comma ''sámegiela, ja heajos dárogiela.''

* __CoAccJA2__ Selects Acc in front of Gen + Po if ja in front of Acc ''ja ruhtan sávzzaid ovddas''









!Intransitive verbs can sometimes be transitive

* __IVasTV__ Selects Acc if you are GEOGRAPHICAL-PLACE, ABSTR-ROUTE or EDUCATION and somewhere in the sentence is a intransitive verb acting as a transitive verb ''sii vázzet skuvlla''




* __IVisTrans__ Selects Acc if you are ''spábba'' and somewhere is ''viehkat'' 

* __IVisTrans2__ Selects Acc if you are SHOE or HUNT-ANIMAL or BOAZU and somewhere is ''vázzit''

* __IVceavzit__ Selects Acc for ceavzit IV if you are ''eksámen'' and ceavzit is found somewhere in the clause 


* __IVnohkkat__ Selects Acc if you are BEDCLOTHES  

* __IVsahttit__ Selects Acc 

* __IVsahttit2__ Selects Acc 


!Accusative or genitive in front of ALU and in front of adjectives


!Exceptional accusative attributes in front of ALU nouns.

* __ALU__ Selects Acc when Num and right is MEASURE LINK 1 ALU

* __ALU2__ Selects Acc when Num and not Adv, and 1 ALU

* __ALU3__ Selects Acc for Num when right context Num ALU


* __arabpros__ Selects Nom

* __NumAcc__ Selects Acc

* __NumNom__ Selects Nom

* __NumNom__ Selects Nom

* __NumComplAcc__ (complement of numerals) Selects Acc Sg when Num Sg to the left is Acc

* __NewGen__ (complement of numerals) Selects Gen Sg when Num Sg to the left ''guhtta kilu''



* __NewGenCo__ (coordinated complement of numerals) Selects Gen if Num Acc + NewGen found to the left of "ja" ''máŋga dáhpáhusa ja digaštallama''

* __ALU4__ Selects Acc if you are Num and to your right Num Acc followed by MEASURE OR ALU/A ''guokte golbma mehtara alu'' 

* __ALU5__ Selects Gen if Num to the right, followed by Num, followed by ALU/A 


* __NumTimeMannel__ Selects Acc for Num before TIME MANNEL

* __NumPageMannel__ Selects Acc for Num before siiddu etc + MANNEL.

* __NumPageMannel2__ Selects Acc for Num before ovdalis etc


* __GenBoaris__ Selects Gen in golbma ''jagi'' boaris

** Ritva comment: Find a rule for "viđa" aswell, this hits "mehter" as it should


* __XXr2002__ Selects genitive if there is a numeral immediately to your left, and you are TIME: ''golbma jagi''



!Numerals 


* __NumGenPo__ Selects Gen for a numeral if a transitive verb to the left. To the right a Gen followed by a postposition ''vuovdán 163 000 ruvnnu ovddas''

* __NumMoney__ Removes Gen if you are a numeral and immediately to your right is CURRENCY ''vihtta ruvnnu''

* __NumGitta__ Selects Acc when you are a numeral with "gitta" immediately to your right followed by a numeral with acc-case ''180 gitta 200''


* __NumAcc1__ Selects Acc if you have a transitive verb to the left and you are a numeral followed by a noun  ''oste guokte mielkki''

* __NumJahki__ Removes Acc if you are a numeral and JAHKI-NUM is immediately to your left ''mávssii mannan jagi 43 ruvnnu''

* __NomIfNum__ Removes Acc if Gen to the right (because you are Nom). Transitive verb with an Acc to the right ''máŋga gávpeolbmá lonuhedje fáhcaid''

__NumGenMeasure__ Genitive numerals in front of ruvdnosaš with friends


* __NumAcc2__ Selects Acc for singular numerals if there is a transitive verb somewhere in the sentence and the numeral is followed by a noun ''logi báhkkoma'' OBS



* __GenIfNum__ (complement of numerals) Selects Gen Sg if there is a Num Sg to your left ''guđa geardde'' 

* __NumAccCo__ (coordinated num) Selects Acc if you are Num Sg and to your right: CC with a Num to the right ''guokte ja eanemusat golbma''

* __NumAccIV__ Selects Acc 

* __NumAge__ Selects Acc for Sg numerals if a time unit to the right is followed by boaris ''vihtta jagi boaris''


* __NumAccPlRight__ Selects Acc when transitive verb to the left. You are Num Pl and to your right is Acc ''goarui viđaid gápmagiid''

* __NumAccPlLeft__ Selects Acc when tranistive verb to the right (same as the previous. Only differs in which direction the verb is found). ''galliid sabehiid don ostet''	

* __NumAccPlLeft__ Selects Acc if you are N Acc Pl and to your left is Num Acc Pl ''galliid sabegiid''		



* __NumOktaAcc__ Selects Acc if 0 okta followed by a noun. Transitive verb to the left ''oidnen ovtta nieidda''










* __QUANgenCoord__ Selects Gen for coordinated complement of a numeral

* __QUANgen1__ Selects Gen if a numeral with Nom-case to the left and 3Pl-verb to the right

* __QUANr2142__ Selects Gen if a numeral to the left and genitive to the right. Transitive verb not allowed to the left.




!Leftover accusatives


*__COMPInfAcc__ Selects Acc if you are Gen and to the left is an Inf TV @COMP-CS<



* __NomInf__ Selects Nom

* __NomInf__ Selects Nom


* __AccInf2__ Selects Acc if Inf immediately to the RIGHT ''guliid čoallut''

* __AccNomCOPconstr__ Selects Acc in front of Inf; only if there is no chance for itself beeing Nom


* __AccTV4__ Selects Acc if transitive mainverb to the left. Lots of restrictions to the right



* __AccPronRel__ Selects (Pron Rel Acc) when a secure Acc or Nom to the left ''gáibidedje internáhttaskuvlla man''

* __AccPronRel2__ Selects (Pron Rel Acc) when somewhere in the sentence is a Nom (barrier is sv-boundary), but only if leat isn't the main verb. ''geaid eamiálbmogat'' 

* __AccPronRel3__ Selects Acc if there is a (Pron Rel Nom) to the right. Obs: not hit nominatives, hence negations. ''eanu mii šealgá''	

* __AccActioLoc__ Selects Acc when transitive Actio Loc somewhere in the sentence ''guldeleames muitalusaid''


* __AccAhte__ Selects Acc when ''ahte'' is found to the right 

* __AccAux__ Selects Acc if beginning of sentence to the right and aux, not leat,  is to the left. No Acc allowed to the left ''láđđi fertejetne oastit''


* __HabGenAdvl__ Removes Acc; in a habitive adverbial construction with Gen, but only if there is no chans of 0 beeing Nom ''Dat lea áhči''

* __AccIll__ Selects Acc if a strict transitive verb is found to the left and Ill to your right. You are not allowed to be a possible modifier of ill: Pron, Px. ''buktán heasttaid meahccái''




* __Gerundium0__ Selects Acc as the complement of Ger

* __Gerundium1__ Removes Gen if no other object available for the preceding tv-verb


* __Gerundium2__ Selects Acc in front of Ger, but not if it is not HAB-ACTOR/Pron Pers. No transitive verb allowed to the left, exept it it has an object of its own.

* __GerundiumTEST__ Selects Acc 
* __GerundiumTEST__ selects Gen for HAB-ACTOR and Pron Pers in front of Ger, but only if there is an Acc belonging to a transitive to the left








* __NomIfProp__ Removes Acc and Gen when you Prop because you are Nom. To the left is a sg3-verb. Should not hit Prop that are Sem/Plc.
* __NomIfProp2__ Removes Acc and Nom when you are Prop Sem/Plc because you are Gen. To the left is a sg3-verb. To the right is a noun.
* __NomSentFin__ Selects Nom if you are Acc or Gen and EOS is to yoru right. Copulas is found to the left 
* __jr_sr__ Selects (ABBR Nom) if you are ''jr'' or ''sr'' and first one to your left is (Sem/Sur Nom)

!!Accusative before @COMP-CS<
!!Accusative before some A
!!Accusative sentence-finally

!!Genitive

* __r2143__ The most frequent genitive rule: Gen when postpos immediately to the right:




!!Nominative and accusative




* __NAr2266__ Selects Nom

*__NomIFInitialThenSg3__ Selects Nom if -1 BOS and 1 oblique / Sg3 lookalike. Works in fragments.


* __NAAccEllipsis1__ Selects Acc	

* __NAAccEllipsis2__ Selects Acc












* __r2281__ marginal



* __NAr2288__ Removes Nom




!!Nominative




!Miscellaneous rules
* __NDnom__ Selects Nom



* __NDr2300__ Selects Nom if Gen immediately to the left. You are N-SG-NOM and to your right is SG3-V ''Du ášši lea dehálaš''

* __NDr2302__ Selects Nom if immediately to the left is "ruvdno" and to the left of it is Num ''70 ruvnno mehtar''

* __NDr2304__ Selects Nom for (Num Sg Loc) if to the left is a spesific word and to the right is EOC 	

* __NDr2305__ Selects Nom for (Coll Nom) if to the left is (Pers Pl Nom) ''mii golmmas''


* __NDr2306__ Selects Nom for (N Nom) if to the left is "okta" or "nubbi" ''okta lihtter''



* __NDr2308__ Selects Nom for PROP asdf 11231



!Vocatives, subjects of sentence fragments
* __NDr2309__ Selects Nom

* __NDr2310__ Selects Nom	

* __NDr2311__ Selects Nom

* __NDr2312__ Selects Nom

* __NDr2313__ Selects Nom

* __NDr2314__ Selects Nom

* __NDr2315__ Selects Nom


!Nominative in titles and sentence fragments

* __NDr2317__ Selects Nom: A single word is nominative


* __NDr2318__ Selects Nom: A single word with a numeral in front of it is nominative

* __NDr2319__ Selects Nom: An NP head with a genitive modifier is nominative 

* __NDr2320__ Selects Nom: A title is nominative if it has a Nom reading at all

* __NDr2321__ Selects Nom: An NP head with an Attr modifier is nominative



* __onlyProp__ Selects Nom


* __nomAuthor__



!Nominative after "go", "dego", "dugo" and "nugo"

* __NDr2324__ Selects Nom

* __NDr2325__ Selects Nom

* __NDr2326__ Selects Nom

* __NDr2327__ Selects Nom


* __NumNomgo__ Selects (Num Nom)

* __NumAccgo__ Selects (Num Acc)



!Preverbal subjects

* __NDr2331__ Selects (N Nom)

* __NDr2332__ Selects (Num Nom)

* __NDr2333__ Selects (Num Nom)	

* __NDr2334__ Selects Nom

* __NomEss__ Selects Nom when not copula

* __NDr2335__ Selects Nom

* __NDr2336__ selects (N Sg Nom) when 1 SG3-V

* __NDr2337__ Selects (N Sg Nom)	

* __NDr2338__ Selects (N Sg Nom)	

* __NDr2339__ Selects (N Sg Nom)	



* __NDr2341__ Selects Nom

* __NDr2341__ Selects Nom

* __NDr2343__ Selects (Sg Nom)

* __NDr2345__ Selects Nom




* __NDr2350__ Selects Nom

* __NDr2351__ Selects Nom

* __NDr2353__ Selects Adv

* __NDr2354__ Selects Adv - Outcommented: This rule does not function well

* __NDr2355__ Selects Adv

* __NDr2357__ Selects (A Pl Nom)

* __NDr2358__ Selects (A Pl Nom)

* __NDr2359__ Selects (A Pl Nom)




!Postverbal subjects

* __NDr2360__ Selects Nom

* __NDr2361__ Selects Nom


* __NDr2364__ Selects (Sg Nom)

* __NDr2366__ Selects Nom

* __NDr2367__ Selects Nom

* __NDr2368__ Selects (N Pl Nom)



* __NDr2369__ Selects (Pl3 Nom)

* __NDr2370__ Selects (Num Nom)

* __NDr2372__ Selects (Pron Pl Nom)

* __NDr2373__ Selects Nom

* __NDr2375__ Selects Nom

* __NDr2376__ Selects Nom

* __PostVNom__ Selects Nom if a singular third person verb to the left with no Nom to the left of it

* __PostVNomComp__ Selects (N Sg Nom)




!Nominative predicatives


* __NDr2378__ Selects (Sg Nom)

* __ND__ selects Nom if; you are HUMAN and immediately to your right is a place. Leat is to the left, and there is HUMAN or Pers to the left of leat ''Son lei oahpaheaddji Kárášjogas''

* __NDr2379__ Selects (Sg Nom)

* __NDr2380__ Selects (Pl Nom)

* __NDr2381__ Selects (Pl Nom)	

* __NDr2382__ Selects (Pl Nom)

* __NDr2383__ Selects Nom

* __NDr2384__ Selects Nom

* __NDr2385__ Selects Nom

* __NDr2386__ Selects Nom

* __CollNom__ Selects Nom

* __CollGen__ Selects Nom


!Nominative as objects in existential clauses

* __NDSgr2388__ Selects Nom

* __NDPlr2388__ Selects Nom

* __NDr2389__ Selects Nom

* __NDr2390__ Selects Nom

* __NDr2391__ Selects Nom 

* __NDr2392__ Selects Nom



* __NDr2396__ Selects (Pl Nom)

* __NDr2391__ Selects Nom

!Nominative in coordination and apposition


* __NDr2399__ Selects Nom  


* __NDr2400__ Selects Nom

* __NDr2401__ Selects Nom

* __NDr2402__ Selects Nom

* __NDr2403__ Selects Nom

* __NDr3529__ Selects Nom	




* __NDr2406__ Selects Nom

* __NDr2407__ Selects Nom

* __NDr2408__ Selects Nom

* __NDr2409__ Selects Nom

* __NDr2411__ Selects Nom

* __NDr2412__ Selects Nom

* __NDr2413__ Selects Nom

* __NDr2414__ Selects Nom

* __NomCCNom__ Selects Nom

* __NDr2416__ Selects Nom

* __NDr2417__ Selects Nom

* __NDr2418__ Selects Nom

* __NDr2420__ Selects Nom

* __NDr2421__ Selects 

!Nominative in parallell constructions

* __NDr2422__ Selects Nom

* __NDr2423__ selects Nom if it finds a Nom to the left of CC and to the left of a verb. No verb allowed to the right ''eamit barggai vuođđoskuvllas ja isit fas gymnásas''

* __nomHnoun__ Selects Nom

* __SOV__ Selects Nom in front of an Acc	


!Not nominative
* __NDr2424__ Removes Nom

* __NDr2425__ Removes Nom

* __NDr2426__ Removes Nom, but not Actio 

* __NDr2427__ Removes Nom

* __ND__ Removes Nom	



* __ImprtAcc__ removes Nom


!!Comitative rules

!NP internal disambiguation of Com

* __PlSg-W__ removes Pl when SG-WORD


* __SgCom__ removes Sg when PLURALIZER or OASSI OR HEADOFPARTS

* __Locgoabbat__ selects Pl Loc after goabbat Foc/ge

* __LocNames__ selects Pl Loc 


* __NumCom__ selects Num Com: guvttiin nieiddain if not plural-noun like: guvttiin heajain

* __gástaCom__ selects Com: Johánas gásta


* __ComDemNum1__ selects N Com if there is a Dem or Num or buorre + Com to the left: Exception for plural-nouns  

* __Comburiin__ selects N Com if there is a safe N Com to the right: buriin vugiin  


* __ComCOM-A__ selects Sg Com after COM-A


* __Comduhtavas__ selects Sg Com after duhtavaš

* __ComComAdv1__ selects Com after COM-ADV or juohke







* __vuoitit__ select Com Sem/Time







!Disambiguation based upon verb valency


* __comheaitit__ select Sg Com if heaitit


* __LocLocVL1, LocLocVR__ select Pl Loc if there is a LOC-V


* __LLocAccLocVL__ select Pl Loc if there is a ACC-LOC-V

* __Loc-v__ select Sg Loc if LOC-V to the left in the clause. No mainverb to the right in the clause

!Disambiguation of Com depending on Adv or certain verb or N

* __ComComAdv1__ selects Com for ACTOR OR ACTOR-ROLE after og before COM-ADV 

* __Comboahtit__ selects riika Com when boahtit: boahtit riikkainis, which is a special construction

* __Comjohtit__ selects bihttá and čájálmas and čájáhus Com 


* __Comnamma__ selects namma  Com 

* __Combealli__ selects riika Com when boahtit: boahtit riikkainis, which is a special construction


* __ComComplPl-N__ selects Sg Com for HUMAN, ORGANIZATION, INSTITUTION, STATE, EVENT-TOOL-ACTIVITY, láhka when there is a COM-COMPL-N to the left or right

* __Comoktavuohta__ selects Sg Com when oktavuohta is to the left or right

* __ComDU-NR__ selects Sg Com after Pers dualis: moai áhčiin, munno vieljain


* __ComHumanOrg__ selects HUMAN Sg Com after HUMAN, ORGANIZATION, INSTITUTION

!Animate nouns
* __ComAnimate__ selecst Sg Com if there is an animate to the left, and the noun itself is not a ABSTR-TEXT,  TEXT,  PLACE,  INDUSTRY,  EDUCATION,  INSTITUTION,  ANIMATE

* __ComProp__ selecst Prop Sg Com for person names. Exception for habitive constructions.



!HAB-ACTOR in habitive-constructions

* __LocHab1, LocHab2__ select Pl when HAB-ACTOR


* __LocHab1, LocHab2__ select Pl when HAB-ACTOR

* __LocGenerell__ select Pl 

váldit vára + Loc

dahkat earrodearvvuođat geainna nu

eallit mainna nu

!Disambiguation based upon verb valency 

!COM-V 
* __ComVR, ComVL__ select Com when COM-V



* __ComVOktiiL__ select Com when OKTII-V 

* __ComVOktiiR__ select Com when OKTII-V 

!tools (concrete and abstract)

* __ComTool1, ComTool2, ComToolCoord__ select Com TOOL when ACTIVITY-V, MOVEMENT-V, PLACE-V-V 



* __ComHuman__ selects Com ABSTR-TOOL OR SATNI when HUMAN-AGENT-V - does it function? 

!BODY as an instrument

* __ComBodyVerbalV__ selects Com BODY when VERBAL-ACTIVITY-V 

* __ComHumanVerbalV__ selects Com HUMAN when VERBAL-ACTIVITY-V or báhcit

* Abstract-entity-com-verbs

* __ComAbstract__ selects Com if ABSTR-ENTITY-COM-V somwhere

* __ComOnlyPlaceV__ is Only-place-loc-verb 

* __ComMaterial__ selects Com Sem/Mat when some verbs 





!Dynamic-verbs

* __LocdynamicVR, LocdynamicVL__ select Pl Loc if there is a DYNAMIC-V and the noun itself is not a TOOL, ABSTR-TOOL, WRITING-TOOL, CONCEPT, HUMAN, VEHICLE, buorre, Der/NomAc






!Event-tool-actio
Most actio can be both tool and event. 


!PLACE-V

* __LocFurniture__ select Pl Loc FURNITURE if there is a PLACE-V

* __ComPlaceV__ select Com ANIMATE, CONCEPT, TOOL, ABSTR-TOOL, EVENT-TOOL-ACTIVITY if there is a PLACE-V

* __HumPxComPlaceV__  

* __HumPxComPlaceV__  


* __LocInstitution__ select Loc INSTITUTION if there is a ABSTR-PLACE-V

* __LocPlaceIndustry__ select Loc GEOGRAPHICAL-PLACE if there is a INDUSTRY to the right

* __LocSourceVR__ select (Pl Loc)  


* __LocHumanAgVL__ XXX This one was commented out (cf. 0 .. LINK ... BARRIER). Note that this rule did not affect the test result

* __LocHuman-agentV__ XXX This one was commented out (cf. 0 .. LINK ... BARRIER). Note that this rule did not affect the test result

!STATE-V (eallit)















!Movement-verbs







!The super-set Dynamic-verb according to choose (Pl Loc) or (Sg Com)

The idea is that the superset DYNAMIC-V are not connected to TOOL, ABSTR-TOOL or CONCEPT in (Pl Loc). This is the "minste felles multiplum". The sub-sets are different, f.i. many of them (but not all) are not connected to HUMAN in (Pl Loc), one is not connected to ABSTR-ENTITY and ACTOR in (Pl Loc). We work with negation so the rules don´t destroy analysis because of insufficent sets. 

First the general-rules for selecting (Sg Com), then the more special rules for selecting (Sg Com), and then we selct (Pl Loc) for the rest of them under # Another round of locative rules.


* __ComDynV__ Dynamic-verbs selects Com when TOOL, ABSTR-TOOL, WRITING-TOOL, CONCEPT, EVENT-TOOL-ACTIVITY


* Dynamic-verb selects Com when HUMAN, but not for HUMAN-SOURCE-VEHICLE-V 


* __ComBody__ Body-activity-verb Selects Com when BODY, for BODY-ACTIVITY-V or VERBAL-ACTIVITY-V

* __LocBody__ deaddu Selects Loc when BODY


* __ComVeh__ Selects (Sg Com) if you are VEHICLE, default is Sg Com




!HUMAN-LOC-V 
* __LOCsatni__ Selects (Pl Loc)

* __LOCwordparts__ Selects (Pl Loc)






* bivvat - we don't need this any more

* ealihit

* ipmirdit / áddet

* ruhtadit

* ávvudit


* suokkardit and čielggadit


* haddegoargŋun 



* vástidit 

* Coordination








* __AccTV1NoC__ was Eckhard's late version of AccTV1 without C. We will look at this.

* __AccEOS__ is The Dangerous Rule: it is one of the last rules before removing all leftover Acc. It only selects Acc if Nom is not an option, dont change this btw, and the end of the sentence is the next one to the right



* __AccEllipse__ 


* __genRel__ removes genitive if Rel OR @CVPg to your right ''ožžot olbmot skoviid maid''



* __genAcc__ selects Acc 

* __TopObj__ selects Acc for Finnish-style topicalisation



* __genNom__ removes Acc

* __makkárAcc__ selects Acc after makkár, if not time or route


* __DemAcc__ selects Den Acc after the last acc-disambiguation of nouns



* __KillAcc__ Removes Acc if you are Gen 




* __NumOktaGen__ Selects Gen after okta gen 




!Locative and comitative - Disambiguation based upon coordination




!And then we remove the remaining Sg Com analysis








!!Essive   OBS










!!Late case rules (after other case rules have worked). 


!!!VERBS PART 2, Section #22





!!Finite or not

!Finite






!Not Finite









!Indicative Negative



!Infinitive

* __InfComplToN__ Inf when -1 N




































!!Indicative or imperative

!!Verbs according to person and number

!Sg1 - First person singular


* __InitialLeanRule__ selects lean when no VFIN to the left

* __Sg1WhenAloneVfin__ selects Sg1 when no other VFIN or PrfPrc





!Sg2 - Second person singular



* --r2907__Sg2__ Prt Sg2 if ikte etc.













!Sg3 - Third person singular
Infinitive and clausal subject

Rules that look backwards for a subject across a relative clause:

Rules that look backwards for a subject across a subordinate clause (CP boundary):

Extension possibilities: Coordination

Son oaidná du ja mu ovdal go boahtit... 

Coordinated Sg3 verbs

Not V + Sg3 

!Du1 - First person dual 


* __MunJaDonDu__ selects Du1 if Mon V ja don V de V-Du2

* __DonJaMunDu__ selects Du1 if Don V ja mun V de V-Du2

The previous two rules look marginal.	

* __DuNotPrtIfToday__ selects Du1 over Prt in the context of a present-marker.

* __Du1IfDu1__ selects Du1 with a left context Du1 ... ja ... 


* __NoDu1__ removes Du1 if no MOAI or Du1 around.


!Du2 - Second person dual

!Rules for leahppi = ("leahppi" N Sg Nom)

!Du3 - Third person dual

!Pl1 - First person plural

!Pl2 - Second person plural

!Pl3 - Third person plural


* __Pl3IfPlSubj__ Pl3 if Pl noun to the left

* __Pl3IfPlSubj__ Pl3 if safe plural (incl pron) to the left



* __Sg2LeftDon__ selects Sg2 in Rel phrase if don to the left of it


* __groupPl3__ selects Prs Pl3





* __allSg2leat__ removes Sg2 if leat Prs Pl3


* __allPrsPl3__ selects and removes PrsPl3 if PrtSg2 initially


* __allPrtSg2__ removes PrtSg2 if PrsPl3


!!Rules for a special infinitive construction
!!More finite verbs
!!Passive
!!Infinitive

!!Present Participle
!!Actio/Perfect Participle 


















!!Actio
!!Selecting some more finite verbs


!!Lexical disambiguation of verbs 























































































































































!!!NOMEN

!!Case rules


!!Other rules for nouns and pronouns

!!Determiners
!!Adverbs and adjectives

!!!NOUNS




* __derNEss__ removes DER-N if lexicalised essives 






!!Variant lemmas


* Remove lemma2 if lemma 1










* __cleanSemClass__ cleans up if a word has more semclasses. This is just a start.


!!!VERBS









!!Final removing rules

* __TEST__ selects some infinte verb readings in the cohort



!!!Removing Err/Orth














   S Y N T A C T I C   F U N C T I O N S   F O R   S Á M I

 Sámi language technology project 2003-2018, University of Tromsø #

This file adds syntactic functions. It is common for all the Saami













LEFT RIGHT because of apertium



* Sets for POS sub-categories





* Sets for Semantic tags













* Sets for Morphosyntactic properties

































!!Syntactic tags

* @+FAUXV : finite auxiliary verb 
** ferte: Son ferte oaidnit ollislaš gova. - She must see the whole picture.
* @+FMAINV : finite main verb
** oaidná: Son oaidná ollislaš gova. - She sees the whole picture	
* @-FAUXV : infinite auxiliary verb
** sáhte: In sáhte gáhku borrat. - I cannot eat cake.	
* @-FMAINV : infinite main verb
** oaidnit: Son ferte oaidnit ollislaš gova. - She must see the whole picture.
* @-FSUBJ> : Subject of infinite verb outside the verbal.
** mu: Diet dáhpáhuvai mu dieđikeahttá. - It happened without me knowing about it.
* @-F<OBJ : Subject of infinite verb outside the verbal.
** nuppi: Ulbmil lea oažžut nuppi boagustit. - The goal is to get the other one to laugh.
* @-FOBJ> : Object of infinite verb outside the verbal.
** váldovuoittuid: Sii vurde váldovuoittuid fasket. - They waited to grab the main prizes.
* @SPRED<OBJ : Object of an subsject predicative. (some adjectives are transitive)
** guliid: Mánát leat oažžulat guliid.
* @-FADVL : Adverbial complement of infinite verb outside the verbal.
** várrogasat: Dihkkadeaddji rávve skohtervuddjiid várrogasat mátkkoštit. - The roadman warns snowscooter drivers to drive carefully.
* @-F<PRED : Predicative complement of infinite verb outside the verbal.
** ággan: Jáhkken kulturmáhtu leat oktan ággan.
* @>ADVL : Modifier of an adverbial to the right.
** vaikko: doppe leat vaikko man ollu studeanttat.
* @ADVL< : Komplement for adverbial.
** vahkus: Son málesta guktii vahkus.
* @<ADVL : Adverbial after the main verb.
** dás: Eanet dieđuid gávnnat dás.
* @ADVL> : Adverbial to the left of the main verb
** viimmat: Dál de viimmat asttan lohkat reivve.
* @ADVL>CS : Adverbial modifying subjunction.
** 'beare' pointing at 'danin go': Muhto dus ii leat riekti dearpat su beare danin go sáhtát.
* <hab> : Habitive, specifying an adverbial, e.g. @ADVL> <hab>
** Máhtes: Máhtes lea beana.
* <ext> : Extencial, specifying an subject, e.g. @<SUBJ <ext>
** beana: Máhtes lea beana.
* <logo> : logoforic pronouns, e.g. @>N <logo> (for MT)
* <cs> : 
* @>N : Modifier of a noun to the right.
** geavatlaš: Ráđđehussii lea geavatlaš politihkka deaŧalaš. - For the government, practical politics is important.
* @N< : Complement of noun to the left.
** vihtta: Mun boađán diibmu vihtta.
* @>A : Modifier of an adjective to the right.
** juohke: Seminára lágiduvvo juohke nuppi jagi.
* @P< : Complement of preposition.
** soađi: Dat dáhpáhuvai maŋŋel soađi.
* @>P : Complement of postposition.
** riegádeami: Seta riegádeami maŋŋel Áttán elii vel 800 jagi.
* @HNOUN : Stray noun in sentence fragment.
** muittut: Fidnokurssa muittut.
* @INTERJ : Interjection.
** Hei: Hei, boađe!
* @>Num : Attribute of numeral to the right.
** dušše: Mun ledjen dušše guokte mánu doppe.
* @Pron< : Complement of pronoun to the left.
** Birehiin: Moai Birehiin leimme doppe.
* @>Pron : Modifyer of pronoun to the right.
** vaikko: Olmmoš sáhttá bargat vaikko maid.
* @Num< : Complement of numeral to the left.
** girjjiin: Dat lea okta min buoremus girjjiin.
* @OBJ : Object, the verb is not in the sentence (ellipse)
* @<OBJ : Object, the verb is to the left.
** gávtti: Son goarru gávtti.
* @OBJ> : Object, the verb is to the right.
** filmma: Dán filmma leat Kárášjoga nuorat oaidnán.
* @OPRED : Object predicative, the verb is not in the sentence (ellipse).
* @<OPRED : Object predicative, the verb is to the left.
** buriid: Son ráhkada gáhkuid hui buriid.
* @OPRED> : Object predicative, the verb is to the right.
** dohkkemeahttumin: Son oinnii dohkkemeahttumin bargat ášši nu.
* @PCLE : Particle.
** Amma: Amma mii eat leat máksán? - We have not paid, have we?
* @COMP-CS< : Complement of subjunction.
** vejolaš: Dat šaddá nu buorre go vejolaš.
* @SPRED : Subject predicative, the verb is not in the sentence (ellipse).
* @<SPRED : Subject predicative, the verb is to the left.
** árgabivttas: Ovdal lei gákti árgabivttas.
* @SPRED> : Subject predicative, the verb is to the left.
** álbmogin: Sápmelaččaid historjá álbmogin lea duháhiid jagiid boaris.
* @SUBJ : Subject, the finite verb is not in the sentence (ellipse).
* @<SUBJ : Subject, the finite verb is to the left.
** gákti: Ovdal lei gákti árgabivttas.
* @SUBJ> : Subject, the finite verb is to the right.
** Son: Son lea mu oabbá. - Sheis my sister.
* @PPRED : Predicative for predicative.
* @APP : Apposition
* @APP-N< : Apposition to noun to the left.
** oahpaheaddji: Oidnen Ánne, min oahpaheaddji.
* @APP-Pron< : Apposition to pronoun to the left.
** boazodoalloáirasat: Ja moai boazodoalloáirasat áigguime vaikko guovttá joatkit barggu.
* @APP>Pron : Apposition to noun to the right.
* @APP-Num< : Apposition to numeral to the left.
* @APP-ADVL< : Apposition to adverbial to the left.
** bearjadaga: Mun vuolggán ihttin, bearjadaga.
* @VOC : Vocative
** Miss Turner : Bures boahtin deike, Miss Turner! - Welcome her, Miss Turner!
* @CVP : Conjunction or subjunction that conjoins finite verb phrases.
** go : Leago guhkes áigi dassá go Máreha oidnet? - Is it a long time since you saw Máret?
* @CNP : Local conjunction or subjunction.
** vai : Leago nieida vai bárdni? - Is it a girl or a boy?
* @CMPND
* @X : The function is unknown, e.g. because of that the word is unknown











!!Tag sets


































































































* Sets for verbs


** V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.
The REAL-V set thus awaits a fix to the preprocess V ... N bug.



* The set COPULAS is for predicative constructions







* NP sets defined according to their morphosyntactic features







* The PRE-NP-HEAD family of sets

These sets model noun phrases (NPs). The idea is to first define whatever can
occur in front of the head of the NP, and thereafter negate that with the
expression __WORD - premodifiers__.












The set __NOT-NPMOD__ is used to find barriers between NPs.
Typical usage: ... (*1 N BARRIER NPT-NPMOD) ...
meaning: Scan to the first noun, ignoring anything that can be
part of the noun phrase of that noun (i.e., "scan to the next NP head")






* Miscellaneous sets























* Border sets and their complements











ADLVCASE




* Syntactic sets





These were the set types.





!!Numeral outside the sentence




!!HABITIVE MAPPING






* __hab1__ hab aux leat

* __hab_numo1__ hab copula comma comma N+Nom

* __hab_numo2__ copula nu mo/go hab


* __leahab__ copula nu mo/go hab

* __hab2__ hab auxv adv leat

* __hab3__ (<hab> @ADVL>) for asdf hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.

* __hab3__ (<hab> @ADVL>) for asdf hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.

* __hab3__ (<hab> @ADVL>) for asdf hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.

* __hab3__ (<hab> @ADVL>) for hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.





* __hab_main__ (<hab> @ADVL>) for hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.


* __habInf__ hab lea inf

* __habNomLeft__ Nom or Num + gen hab lea

* __habAdvl__ Ii han ovttasge du sogas leat dat namma.

* __hab4__ hab cc hab leat



* __hab6__ lea go hab -- leago hab

* __hab7__ lea go hab

* __hab8__ This is not HAB Ellii šattai hoahppu.
* __hab5__  This is not HAB Mánás gollot gieđat.

* __hab9__ prop ord-hab leat

* __hab10__ prop ord-hab leat

* __habDain__ (<hab> @ADVL>) for (Pron Dem Pl Loc) if leat followed by Nom to the right
* __habDain2__ 


* __habRel__ # before relative clause

* __habEllipse__ Buot gánddain lea dreassa, nieiddain fas gákti.

* __habGen__ (<hab> @<ADVL) hab for Gen; if Gen is located in the end of the sentence and Nom is sentence initial

* __habGenQst__ (<hab> @<ADVL) hab for Gen; in a question sentence. Gen is located sentence initially and SUBJ is found to the right. To the right of SUBJ is copulas

















* __n<titel1__ (@N<) for ("jr") or ("sr"); if first one to the left is Prop



* __n<titel2__ (@N<) for INITIAL; if first one to the left is a noun, or if to the left of you is a single letter which is part of a noun conjunction ''bustávas e ja f gáibiduvvo''


* __n<:com__ (@N<) for (Sg Com); if first one to the left is Coll










* __>nAttr__ (@>N) for Attr; if there is a noun to your right

* __n>Indef__ (Pron Indef Attr); if eará is to the right

* __n>Indef__ (Pron Indef Com); if eará is to the right


* __>nNum__ (@>N) for numerals if; there is a noun to your right. You are not allowed to be (Sg Nom), (Sg Acc) or (Sem/Date)




* __noun>n__ (@>N) for Gen; if there is a noun to your right. Restrictions: Not if you are: a time related word. Not if you are OKTA with Pl Loc to your right. Not if CC is to your right followed by another Gen and then Po. Not if you are HUMAN and to your right is Actio Nom folloed by a noun.










* __>nTime__ (@>N) for Gen TIME-N; if timenoun to your right. Restrictions: Not if you are a OKTA Nom with Pl Loc to your right. Not if CC followed by Gen, followed by Po to your right. Not if COMMA to your right




* __>ntittel__ (@>N) for (Sg Nom TIME-N) or (Nom Der/NomAg); if to your right is Sem/Mal, Sem/Fem, Sem/Sur

* __>nplc__ (@>N) for (Sg Nom Prop Sem/Plc), if to your right is Sem/Plc


* __>nALU__ (@>N) for Sg Acc numerals; when a measure-noun to the right



* __>NTime__ (@>N) for Gen; if you are TIME-N with BOC to your left, and PREGEN to your right



* __n<:Refl__ (@N<) for (Refl Nom); if to the left is (N Nom), or if first one to the left is a finite mainverb with a (N Nom) to the left


* __>pron1__ (@>Pron) for GRADE-ADV, DUSSE, BUOT if; first one to the right is Pron

* __>pron2__ (@>Pron) for (Refl Nom) if; first one to the right is Refl

* __>pron3__ (@>Pron) for (Pron Recipr) if; first one to the right is (Pron Recipr)

* __vaikko__ (@>Pron) for vaikko if; first one to the right is Indef

* __vaikkoman__ (@>ADVL) for vaikko if; first one to the right is man

* __dasmaŋŋel__ (@>ADVL) for vaikko if; first one to the right is man

* __adv>advl__ (@>ADVL) 

* __adv>advl__ (@>ADVL) 






* __BOSvoc__ (@VOC) for HUMAN Nom; if sentence initial. To the right is comma. No nom-cased HUMAN followed by comma or CC is allowed to the right. There should not be a relative clause to the right, because then you are likely to be SUBJ



















* __voc__ (@VOC) for Nom HUMAN; if comma to the left and an second person verb or pronoun to the left. To the right is the end of the sentence
































* __Particle<subj __ (@PCLE)


* __spred<obj__ (@SPRED<OBJ) for Acc; the object of an SPRPED. Not to be mistaken with OPRED. If SPRED is to the left, and copulas is to the left of it. Nom or Hab are found sentence initially.



* __Hab<subj__ (<ext> @<SUBJ) for Nom; if copulas, goallut or jápmit is FMAINV and habitive or human Loc is found to the left. OR: if Ill or @Pron< followed by HAB are found to the left.



* __Hab<subj__ (<ext> @<SUBJ) with relative clause in between


* __Hab>Advlcase<subj__ (<ext> @<SUBJ) for Nom; it allows adverbials with Ill/Loc/Com/Ess to be found inbetween HAB and <ext>.

* __Nom>Advlcase<subj__ (<ext> @<SUBJ) for Nom; it allows adverbials with Ill/Loc/Com/Ess to be found inbetween Nom and <ext> @<SUBJ.

* __<extSubj__ (<ext> @<SUBJ) for Nom; if copulas to the left, and some kind of adverb, N Loc, time related word or Po to the left of it. OR: if Ill or @Pron< to the left, followed by copulas and the before mentioned to the left of copulas.

* __<extSubj__ (<ext> @<SUBJ) for sma Nom; if some kind of adverb to the left, N Loc, time related word or Po to the left of it. 


* __<extSubjA__ (<ext> @<SUBJ) for A - TEST WITHOUT THIS ONE

* __<extSubj__ (<ext> @<SUBJ) for Nom; if leat to the left and sentenceboundary



* __<extSubj__ (<ext> @<SUBJ) for Nom, but not for Pers. To the left boahtit or heaŋgát as MAINV, and futher to the left is some kind of place related word, or time related word

* __loc<extSubj__ (<ext> @<SUBJ) for Nom

* __<spred__ (@<SPRED) for Nom; if Nom to the left, copulas to the left of Nom, and a time related word to the left of it.


* __<extQst1__ (<ext> @<SUBJ) for Nom; in an existential sentence. To your left is hab, some kind of place or time-word or Po. This is a Qst-sentence so the qst-pcle is attached to leat or following leat

* __<extQst2__ (<ext> @<SUBJ) for Nom; in an existential sentence. To your left is leat and it is sentence initial. No attributes or other words are allowed inbetween (because then you are SPRED), except the attribute muhtun, muhtin

* __extQst3>__ (<ext> @SUBJ>) for Nom; if habitive first one to the left, followed by copulas.

* __extQst3>__ (<ext> @SUBJ>) for Nom; if habitive first one to the left, followed by copulas.


* __<extsubjcoor__ (<ext> @<SUBJ) for Nom. Coordination

* Sem/Year








* __<spredQst__ (@<SPRED) for Nom; in a typically question sentence; You are not allowed to be Pers or human. The special part is that Nom is not allowed to your right

* __<spredQst2__ (@<SPRED) for (A Nom); in a typically question sentence; You are SPRED if (N Nom) is to your left and leat + qst is to the left

* __<spredQst3__ (@<SPRED) for (A Nom); you are SPRED when you are (A Nom) and to your right is (N Nom). This is a Qst-sentence, so copulas is found to your left

* __<spredQst4__ (@<SPRED) for Nom; but only in a qst-sentence where there is no chance of you beeing the subj

* __<NomBeforeSpred__ (@<SPRED) for (A Nom) if; Nom to the left, and copulas is to the left of Nom. There is no Nom allowed to the right of copulas! To avoid messing with coordination: ja, dahje and comma are not allowed to your left. Comma is not allowed to your right; if so then you are likely to be coordinated

* __<spred__ (@<SPRED) for A Nom or N Nom if; the subject Nom is on the same side of copulas as you: on the right side of copulas

* __<spredVeara__ (@<SPRED) for veara + Nom; if genitive immediately to the right, and intransitive mainverb to the right of genitive

* __leftCop<spred__ (@<SPRED) for Nom; if copulas is the main verb to the left, and there is no Ess found to the left of cop (note that Loc is allowed between target and cop). OR: if you are Coll or Sem/Group with copulas to your left.

* __<spredLocEXPERIMENT__ (@<SPRED) for material Loc; if you are to the right of copulas, and the Nom to the left of copulas is not a hab-actor

* __NumTime__ (@<SPRED) for A Nom

* __<spredSg__ (@<SPRED) for Sg Nom

* __<spredPg__ (@<SPRED) for Pl Nom

* __<spred__ (@<SPRED) for Nom; if copulas to the left, and Nom or sentence boundary to the left of copulas. First one to the right is EOS.

* __COP<spredEss__ (@<SPRED) for N Ess

* __spredEss>__ (@SPRED>) for N Ess; if copulas to the right of you, and if an NP with nom-case first one to your left.

* __GalleSpred>__ (@SPRED>) for Num Nom; if sentence initial

* __spredSgMII>__ (@SPRED>)

* __spredšaddat>__ (@SPRED>)


* __r492>__ (@SPRED>) for Interr Gen; consisting only of negations. You are not allowed to be MII. You are not allowed to have an adjective or noun to yor right. You are not allowed to have a verb to your right; the exception beeing an aux.



* __AdjSpredSg>__ (@SPRED>) for A Sg Nom; if copulas to the right, but not if A or @<SPRED are found to the right of copulas





* __Spred>SubjInf__ (@SPRED>) for Nom; if copulas to the right, and the subject of copulas is an Inf to the right

* __spredCoord__ (@<SPRED) coordination for Nom; only if there already is a SPRED to the left of CNP. Not if there is some kind of comparison involved.









* __subj>Sgnr1__ (@SUBJ>) for Nom Sg, including Indef Nom if; VFIN + Sg3 or Pl3 to the right (VFIN not allowed to the left)



* __subj>Du__ (@SUBJ>) for dual nominatives, including Coll Nom. VFIN + Du3 to the right.
* __subj>Pl__ (@SUBJ>) for plural nominatives, including Coll and Sem/Group. VFIN + Pl3 to the right.

* __subj>Pl__ (@SUBJ>) for plural nominatives


* __subj>Sg__ (@SUBJ>) for Nom Sg; if VFIN + Sg3 to the right.

* __Sg<subj__ (@<SUBJ) for Nom Sg; if VFIN Sg3 or Du2 to the left (no HAB allowed to the left).

* __Du<subj__ (@<SUBJ) for Nom Coll if; a dual third person verb is found to the left

* __PlDu<subj__ (@<SUBJ) for (N Nom Pl), (Sem/Group Nom), (Coll Nom), (Pron Nom Pl) if; a verb is Pl3 or Du3 to your left. The verb is not allowed to be copulas with a place, Loc or time noun to its left

* __copPl3<subj__ (@<SUBJ) for Nom Pl; you don't to be a noun, only Nom Pl. To the left is copulas and first one to the right is @<SPRED























* __-fsubj>__ (@-FSUBJ>) for HUMAN Gen; in a NP-clause. To your right is Actio Nom followed by a noun

















* __f<advl__ (@-F<ADVL) for infinite adverbials





* __f<advl__ (@-F<ADVL) for infinite adverbials









* __s-boundary=advl>__ (@ADVL>) for ADVL that resemble s-boundaries. Mainverb to the right.





* __diibmuadvl>__ (@ADVL>) for (diibmu Nom) if first one to the right is Num


* __-fsubj__ (@-FSUBJ>) for HUMAN Acc after DADJAT verbs



* __-fobj>__ (@-FOBJ>) for Acc if front of abessive, gerundium, actio locative, perfectum participle or infinitive. First one to the right not allowed to be Acc though

* __-fobj>__ (@-FOBJ>) for Acc if human with ADVL-case to the left and transitive infinitive OBJ to the right. First one to the right not allowed to be Acc though












* __advl>mainV__ (@ADVL>) if; finite mainverb not found to the left, but the finite mainverb is found to the right.



















* __V<advl__ (@<ADVL) if; finite mainverb found to the left. Not if a comma is found immediately to the left and a finite mainverb is located somewhere to the right of this comma.





* __advl>v__ (@ADVL>) if; you are ADVL, time-noun or Sem/Route and there is a finite verb to the right in the clause, or if to your right is: de followed by a finite verb. OR: if you are a time-nound and to your right is: go or sentenceboundary followed by a finite verb



* __<advlPoPr__ (@<ADVL) for Po or Pr; if mainverb to the left.
* __advlPoPr>__ (@<ADVL) for Po or Pr; if mainverb to the right.

* __BOSPo>__ (@ADVL>) for Po; if trapped between BOS to the right and S-BOUNDARY OR COMMA to the left, because the main verb will then automatically be on your right side.

* __<advlComIll__ (@<ADVL) only if; you are Com OR Ill. To your left is a mainverb, and to your right a sentenceboundary, because we don't want there to be another mainverb you potentially could belong to

* __<advlEOS__ (@<ADVL) for Po or Pr or Loc; if you are found at the very end of a sentence. A mainverb is needed to the left though.


* __<advlGen__ (@<ADVL) for (N Gen) if mainverb to the left and no noun to the right


* __<opredgohcodit__ (@<OPRED) for Ess


* __advlEss>__ (@<ADVL) for weather and time Ess, if FMAINV to the left.




* __comma<advlEOS__ (@<ADVL) for Adv if; mainverb is to the left. Comma to the left and mainverb to the right in the same clause is not allowed


* __advl>inbetween__ (@ADVL>) for Adv; if inbetween two sentenceboundaries where no mainverb is present.

* __comma<advlEOS__ (@<ADVL) for Adv if; comma found to the left and the finite mainverb to the left of comma. To the right is the end of the sentence.



* __BOSadvl>__ (@ADVL>) if; you are N Loc or N Ill and found sentence initially and there is a main verb somewhere to the right. No barrier for the mainverb; based on the thought that first one to your right is probably a sentenceboundary.

* __cleanupILL<advl__ (@<ADVL) for N Ill if; there are no boundarysymbols to your left, if you arent already @N< OR @APP-N<, and no mainverb is to yor left.



* __cleanupPo__ (@ADVL) for Po: This rule tags all Po:s as ADVL if they haven't gotten a tag somewhere along the way.

* __cleanupPr__ (@ADVL) for Po: This rule tags all Pr:s as ADVL if they haven't gotten a tag somewhere along the way.




* __-fsubj>asAcc__ (@-FSUBJ>) for HUMAN Acc; if there is a verb @-F<OBJ to your left

* __-f<obj__ (@-F<OBJ) for Acc if there is a transitive verb + SYN-V to your left

* __-fsubj>IV__ (@-FSUBJ>) for Acc; if there is an IV-verb acting as a @-F<OBJ to your right

* __-fsubj>IV__ (@-FSUBJ>) for Acc; if there is an TV-verb acting as a @-F<OBJ to your right followed by an Acc

* __-fsubj>asGen__ (@-FSUBJ>) for Gen;

* __f<subj__ (@-F<SUBJ) for Nom if; (V @-F<OBJ) to the left.







* __<opredAAcc__ (@<OPRED) for A Acc; if an other accusative to the left, and a transtive verb to the left of it. OR: if a transitive verb to the left, and an accusative to the left of it.

* __TV<obj__ (@<OBJ) for Acc; if there is a transitive mainverb to the left in the clause. Not for Rel. Not if you are a numeral followed by a measure-noun



!sma object


* __<advlMeasr__ (@<ADVL) for (Num Acc); if finite IV-mainverb to the left, measure-noun to the right

* __<objMeasr__ (@<OBJ) for Num Acc; if finite TV-mainverb to the left, measure-noun to the right

* __<advlMeasr2__ (@<ADVL) for MEASR-N + Acc; if (Num Pl) to the left and mainverb to the left of it

* __advlMeasr>__ (@ADVL>) for Num Acc;


* __Obj>__ (@OBJ>) for Acc; if there is a finite mainverb to the right in the clause. A really simple rule with no other restrictions..

* __s-boun<obj__ (@<OBJ) for Acc; if sentenceboundary to your left and a transitive mainverb to the left futher to the left

* __<objIV__ (@<OBJ) for Acc; if there is an intransitive mainverb in the clause. Not for Rel or Num. Not if you are a numeral followed by a measure-noun







* __<advlEss__ (@<ADVL) for ESS-ADVL if; FMAINV to the left

* __IV<spredEss__ (@<SPRED) for N Ess if; FMAINV to the left is intransitive or bargat

* __<opredEss__ (@<OPRED) for (N Ess), (A Ess) if; transitive mainverb to the left in the clause. If accusative to the left or to the right, or if Inf or ahte to the right, or if there is a noun to the right followed by an Inf

* __Acc<opredEss__ (@<OPRED) for (N Ess), (A Ess) if; transitive mainverb to the left in the clause, and an accusative cased Rel left to the verb

* __onlyV<opred__ (@<OPRED) for (N Ess) if; there is a transitive mainverb to the left. Usually there needs to be an Acc to the left, but here it is not needed

* __onlyV<opred2__ (@<OPRED) for (N Ess) if;











!!SUBJ MAPPING - leftovers

* __subj>ifV__ (@SUBJ>) for NP-HEAD-NOM, DUPRON or (Num Nom) if; a finite mainverb is found to the right. This is a cleanup rule for subjects

* __hnoun>ifV__ (@SUBJ>) for NP-HEAD-NOM, DUPRON if. The counterpart of subj>ifV. You are HNOUN if there is a finite verb to your right, but NOT if there is a finite verb after a relative clause


!!OBJ MAPPING - leftovers

!!<logo> MAPPING for MT - experimental


!!HNOUN MAPPING









* __@<ADVLcoor__ (@<ADVL) for ADVLCASEAdv if @CNP to the left and ADVL to the left of it




! __missingX__ adds @X to all missings





! __therestX__ adds @X to all what is left, often errouneus disambiguated forms






!!For Apertium:
The analysis give double analysis because of optional semtags. We go for the one with semtag.








!!!C O M M O N  S Á M I  D E P E N D E N C Y   G R A M M A R

This dep file is for sma, sme, smj, sje.

!!!DELIMITERS

Sentence delimiters are the following: <.> <!> <?> <...> <¶>


!!!TAGS AND SETS


N
V
A
Adv
CC
CS
Inf
Sup
Neg
Num
Po
Pr

Pcle
Prop

Pron
IV
TV
COMMA
DASH
CITATION to keep colouring we add a "
HYPHEN
QMARK
PUNCT
LEFT
RIGHT
CLB
Ind
Pot
Impr
ImprtII
Cond
ConNeg
Caus causative eus
VGen
Interj
ABBR
ACR
Prs
Prt
Cmpnd
RCmpnd
PrfPrc
PrsPrc
Actor
Actio
Ger
Indef
Nom
Acc
Ill
Com
Gen
Ess

IM For fao

!!POS sub-categories


















































































!!Syntactic tags and sets

!Syntactic tags in input to this file


!Syntactic tags added in this file

* @FMV : finite main verb
** oaidná: Son oaidná ollislaš gova. - She sees the whole picture
* infinite main verb
* @FAUX : finite auxiliary verb
** ferte: Son ferte oaidnit ollislaš gova. - She must see the whole picture. 
* @FMVdic : finite main verb introducing direct speech
* @IMVdic : infinite main verb introducing direct speech
* @FS-IMV : infinite main verb of subclause 
* @FS-IAUX : infinite auxiliary verb in subclause
* @FS-N<IAUX : infinite auxiliary verb of a relative subclause
* @FS-N<IMV : infinite main verb of a relative subclause
* @FS-OBJ : finite verb in subclause functioning as object
* @FS-OBJ> : finite verb in subclause functioning as object
* @FS-<OBJ : finite verb in subclause functioning as object
* @FS-SUBJ : finite verb in subclause functioning as subject
* @FS-SUBJ> : finite verb in subclause functioning as subject
* @FS-<SUBJ : finite verb in subclause functioning as subject
* @FS-ADVL> : finite verb in subclause functioning as adverbial to the left of the main clause
* @FS-<ADVL : finite verb in subclause functioning as adverbial to the right of the main clause
* @FS-ACC>> : finite verb in subclause, object of speechact verb
* @S< : a clause modifying a sentence to the right of it
* @FS-ADVL : finite verb in subclause ...
* @-FS-<ADVL : infinite subclause - eus
* @-FS-ADVL> : infinite subclause - eus
* @FS-N< : relative clause to N
* @FS->N : relative clause to N to the left side of it - eus
* @FS-VFIN< : finite verb in sentence, statement
** eai: Idja ii leat šat, eai ge sii dárbbaš lámppá dahje beaivváža čuovgga, dasgo Hearrá Ipmil lea sin čuovga. - The night is not anymore, they do not need the lamp- or day- light either, because God the Lord is their light.
* @FS-<APP : finite subclause functioning as an apposition
* @ICL-ADVL : non-finite subclause ...
* @ICL-AUX< : "right" argument of auxiliary (?)
* @ICL-OBJ : infinitival clause object
* @ICL-SUBJ : infinitival clause subject
* @ICL-P< : infinitival clause complement of preprosition
* @IAUX : non-finite auxiliary
* <mv> : main verb. A temporarily tag omitted in the end of the file.
* <aux> : auxilary verb. A temporarily tag omitted in the end of the file.


!fao syntags

* @>V

!kal syntags

* @INS :
* @<INS :
* @INS> :

!eus syntags

* @FS-SPRED : finite verb in subclause functioning as a subject predicate - eus, but not sure if in use

!Syntactic set definitions












!!!Dep grammar



Correction rules



* __muitalit__


* __XX__

* __XX__

* __XX__



* __faoSumId=Rel__
















!!The finite verb































!!!Mapping rules









































































































































__lgRemove__ removes the language tags <sma>, <sme>,  etc, before proceeding to the dep file.





