# sme fst guide
How to add new words to lexc files:
- "Middagsfjället" 
- "Iežasnájadeapmi"
- "Árbediehtoguovddáš"
- "siskkáldasdálkkodeapmi"
- "Jensenius"
- "buotagat"
- "Rama Cay"

## Adding Nay Pyi Taw
Search google
Hovedstaden i Myanmar (Burma)
search for -aw in smi-propernouns.lexc

Saginaw+OLang/UND:Saginaw BERN-plc ;
Nay% Pyi% Taw+MWE+OLang/UND:Nay% Pyi% Taw BERN-plc ;


## Adding Frivilighet Norge
propernoun in smi-propernouns.lexc

Frivillighet% Norge+MWE+CmpNP/First+OLang/NOB:Frivillighet% Norge ACCRA-org ;


## Adding Play-boy sub to Playboy
is a propernoun in smi (smi-propernouns.lexc)
since there is no -boy I search for -y

Roy+CmpNP/None+OLang/UND:Roy BERN-mal ;
but Playboy should be -org or -obj
so better:
FairPlay+CmpNP/First+OLang/ENG:FairPlay BERN-obj ;
Playboy+Err/Orth+CmpNP/First+OLang/ENG:Play-boy BERN-obj ; !SUB

## Adding last and first names

Mollekleiv - last name
same ending as Hynnekleiv+OLang/NOB:Hynne^kleiv BERN-sur ;

Mollekleiv+OLang/NOB:Molle^kleiv BERN-sur ;

## Adding Nouns - perfomativitehtateoriija
ráŋggáštanriekteteoriija+N+Sem/Dummytag:ráŋggáštan#riekte#te^ori IIJA ;

## Adding Iežasnájadeapmi
  
is a noun:
try to find another one with the same ending


```
AWG-lágideapmi+N+CmpN/SgN+CmpNP/First:AWG-lágid EAPMI_default_sem ;
```



but this one has a hyphen, those are special, so try to find one without

```
beassášávvudeapmi+N+CmpN/SgN+Sem/Event:beassáš#ávvud EAPMI_lex_sem ;
biebmoguollešaddadeapmi+N+CmpN/SgN:biebmo#guolle#šaddad EAPMI_default_sem ;
vuorbádeapmi+N+CmpN/SgN+CmpNP/First:vuorbád EAPMI_default_sem ;
```


how to know which one:
=EAPMI_default_sem= gets a default semantic tag
EAPMI_lex_sem gets a manual semantic tag for example Sem/Event in this case

means self-harm
so it should be default_sem


1. add at some place in nouns.lexc, if possible alphabetically, but not necessary, and put first letter in lower case
2. copy ending from a similar entry: +N+CmpN/SgN+CmpNP/First:vuorbád EAPMI_default_sem ;
3. switch the part after the colon and look at which letter it stops, so "iežasnájad"
4. remove +CmpNP/First - iežasnájadeapmi+N+CmpN/SgN:iežasnájad EAPMI_default_sem ;
5. if it is a compound then put a hashtag inbetween on the part after the comma: iežasnájadeapmi+N+CmpN/SgN:iežas#nájad EAPMI_default_sem ;
6. run make -j in lang-sme
7. test word - echo iežasnájadeapmi | hfst-lookup -q src/analyser-gt-desc.hfstol




+CmpNP/First means: it can only be the first part of a compound, if not we put a spelling error - this is put if it is easily confused with another compound that is more common
We also use it if the word is an MWE (Sámi% Dáiddaguovddáš+MWE+CmpNP/First:Sámi% Dáidda#guovddáž LONDON-org ;)

next word:

## Adding siskkáldasdálkkodeapmi


1. find the longest possible match (that is also a compound), so not only deapmi, but dálkkodeapmi --`+N+CmpN/SgN:ele#rávdnje#dálkkod EAPMI_default_sem ;`
2. replace ele#rávdnje by siskkáldas: siskkáldasdálkkodeapmi+N+CmpN/SgN:siskkáldas#dálkkod EAPMI_default_sem ;
3. DONE


## Adding Árbediehtoguovddáš
it's a propernoun
since it is a sme-specific propernoun which would get translated in the other Sámi languages it goes to lang-sme/src/fst/stems/sme-propernouns.lexc (instead of shared-smi)

2. look for the longest possible match meaning if we have a compound, let's try to find a compound - diehtoguovddáš NO
guovddáš:
```
Davvi% álbmogiid% guovddáš+MWE+CmpNP/First:Davvi% álbmogiid% guovddáž LONDON-org ;
Sámi% Dáiddaguovddáš+MWE+CmpNP/First:Sámi% Dáidda#guovddáž LONDON-org ;
```
4. Add entry + tags from the match - `Árbediehtoguovddáš+MWE+CmpNP/First:Sámi% Dáidda#guovddáž LONDON-org` ;
5. Change part after the colon and add hashtags if there are more parts of a compound - `Árbediehtoguovddáš+MWE+CmpNP/First:Árbe#diehto#guovddáž LONDON-org ;`
6. and then remove +MWE since it's only one word
7. remove +CmpNP/First



## Adding buotagat

It's an adjective:
1. search for a compound with -agat
`guhkesagat+A+Sem/Dummytag:guhkes#ag AGAdj ;`
CAREFUL (don't confuse) with similar -agat words where the consonant before is part of the word, like - `lagat+A+Sem/Dummytag+Gram/Comp:laga OVDDIT ;`
2. add entry with tags of guhkesagat
3. replace parts after the colon:



These are tags that say that the entry can be the first part of the compound, it can either be in nominative singular and genitive plural.

`+CmpN/SgN` --- could be buotagatsearvi
`+CmpN/PlG` --- could be buotagagiidsearvi (this is used in combination with Sem/Hum tag)


be aware of morphophonological processes:
before the hashtag:

## Adding unnibuš
It's an adjective, but not yet in the normative lexicon

```
unnibuš unni+A+Der/Comp+A+Der/Dimin+A+Attr 0,000000
unnibuš unni+A+Der/Comp+A+Der/Dimin+A+Sg+Nom 0,000000
unnibuš unni+A+Err/Orth+Der/Comp+A+Der/Dimin+A+Attr 0,000000
unnibuš unni+A+Err/Orth+Der/Comp+A+Der/Dimin+A+Sg+Nom 0,000000
```


search for the ending -buš:
`stuorebuš+A+Sem/Hum:stuorebužž STUORIBUS ;`
exchange parts of it
`unnibuš+A+Sem/Hum:unnibužž STUORIBUS ;`

## Adding “Middagsfjället”

it is a propernoun for all Sámi languages
open shared-smi/src/fst/stems/smi-propernouns.lexc
search for fjället
find:
`Borkafjället+OLang/UND:Borka^fjället LONDON-LOAN-plc ;`
adapt:
`Middagsfjället+OLang/UND:Middags^fjället LONDON-plc ;`

## Adding buotagat “Jensenius”
is a surname
open shared-smi/src/fst/stems/smi-propernouns.lexc
search for the ending -ius
`Iskanius+OLang/UND:Iskani^us BERN-sur ;`

## Adding buotagat “Rama Cay”
what on earth is that? - google knows
an island in Nicaragua
There is nothing similar in the lexicon
The following continuation lexica mean the following:
BERN-plc — Bernas, Bernii
LONDON-plc — Londonis, Londonii
ACCRA-plc — Accras, Accrai

search for “ay” – Bay+CmpNP/None+OLang/UND:Bay BERN-plc ;
add +MWE
change +CmpNP/None to +CmpNP/First


## what does the number 9 mean?

```
bargiidbellodatpolitihkar+v1+N+CmpN/SgN+CmpN/SgG+CmpN/PlG+OLang/NOB+Sem/Hum:bargiid9#bellodat#politihkkar MATTAR ;

bargiid#bellodat#politihkkar MATTAR ;
slamlaguna+N+CmpN/SgN+CmpN/SgG+CmpN/PlG+Sem/Plc:slam9#laguna GOAHTI-A ;

eaŋkilváikkuhangaskaoapmi+v5+N+OLang/NOB+Sem/Dummytag:eaŋkal#váikkuhan#gask9#oapmi GOAHTI-I ;
```

9 prevents that 
- bargiid- changes to bargiit-
- slam- changes to slan- (slanlaguna)
- gask- changes to gas-

## What does ^ mean?
Playboy+CmpNP/First+OLang/ENG:Play^boy BERN-obj ;

It's a soft hyphen

## What kind of languages are there in propernouns
+OLang/NOB - Norwegian
+OLang/FIN - Finnish
+OLang/SWE - Swedish
+OLang/ENG - English
+OLang/UND - everything else

## What does +CmpNP/First mean?

We add it always after +MWE
it means that it can only be the first part of a compound, e.g. "Frivillighet Norge-organisašuvdna"

## Meaning of different continuation lexica
BERN-plc — Bernas, Bernii
LONDON-plc — Londonis, Londonii
ACCRA-plc — Accras, Accrai

