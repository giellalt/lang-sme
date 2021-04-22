Oversyn
=======

Her er eit oversyn over fst-ane som skal bli kompilert og eigenskapane
deira.

-   **Bortfiltrering av strenger**: Dial/- og Use/NG filtreres bort bare
    for generator-mt-gt-norm og generator-oahpa-gt-restr . Err/Orth og
    Err/Lex filtreres bort for alle norm-analysatorer og -generatorer.
    Use/MT filtreres bort for alle bortsett fra for Apertium. Selve
    taggen skal ikke vises.
-   **MWE** er lagt til entryer som skal beholdes som multiwords under
    preprosessering. Taggen skal ikke være synlig i noen FSTer.
-   De andre taggene, pluss Err/Orth-varianter og Err/Lex, er **synlige
    eller usynlige** i de forskjellige applikasjonene. Hensikten er å
    skille varianter fra hverandre, eller å gi semantisk, grammatisk
    eller uttale-informasjon, eller å skille lemmaer fra hverandre som
    er homonyme i grunnform.
-   **NDS** analyseres online med analyser-dict-gt-desc, og genereres
    med generator-dict-gt-norm. I ordbøkene trenger vi tagger som Hom,
    G3 for å velge riktig oversetting til lemmaene, og vi vil ha tagger
    synlige for å kunne velge hvilke former vi vil ha med i
    miniparadigmene: [dictionarywork](../../dicts/dictionarywork.html)
-   **VD-dict** genereres med generator-dict-gt-norm. I ordbøkene
    trenger vi tagger som Hom, G3 for å velge riktig oversetting til
    lemmaene, og vi vil ha tagger synlige for å kunne velge hvilke
    former vi vil ha med i miniparadigmene:
    [dictionarywork](../../dicts/dictionarywork.html)
-   For **disambiguering** til **Korp og web-setningsanalyse** og
    liknende, analyseres med analyser-disamb-gt-desc, fordi vi trenger
    semantiske tagger for disambiguering, og tagger som Hom, G3 for å
    velge riktig lemma. Allegro, Err/Orth-varianter og Err/Lex kan også
    være til hjelp ved disambiguering.
-   For **Oahpa** generes generator-oahpa-gt-restr for hver dialekt og
    generator-oahpa-gt-norm som fungerer som fasit, og her skal alle
    normative former være med sammen med tagger som Hom, G3 osv. for å
    skille mellom lemmaene. Vi trenger Allegro for å kunne filtrere ut
    denne formen. For Oahpa genereres også ped-sme.fst i egen
    error-gt-branchen, og den brukes for analyse av studentenes input i
    Sahka og Vasta. Den er ikke dokumentert her.
-   På **web** ønsker vi å gi morfologisk analyse til brukeren med minst
    mulig ekstratagger, slik at det blir ryddigst mulig for brukeren.
    Men her vil vi ha Err/Orth og Err/Lex synlig slik at brukeren ser om
    former er normativ. For at dette skal fungere, må dubletter med
    samme analyse, men hvor den ene har Err/-tag, fjernes, evt med
    vislcg3-fil.

Analysatorar
============

|                  |                                 |                                                                                               |                                                            |                                                              |                    |
|------------------|---------------------------------|-----------------------------------------------------------------------------------------------|------------------------------------------------------------|--------------------------------------------------------------|--------------------|
| **alias \*.fst** | **FST**                         | **synlege**                                                                                   | **Usynlege**                                               | **Merknader**                                                | **Status**         |
| \-               | analyser-raw-gt-desc            | alle bortsett frå MWE                                                                         | MWE                                                        | MWE blir berre brukt i preprosessoren, aldri i fst-samanhang | \-                 |
| \-               | analyser-dict-gt-desc           | NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma), vN, Coll, Use/NGminip, Allegro (sme) | Sem/-taggar, OLang/\*, MWE                                 | v1-vN - N = 24                                               | NGminip må testast |
| \-               | analyser-dict-gt-desc-mobile 1) | NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma), vN, Coll, Use/NGminip, Allegro (sme) | Sem/-taggar, OLang/\*, MWE                                 | v1-vN - N = 24                                               | NGminip må testast |
| smX-norm.fst     | analyser-gt-norm                | NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma), Coll, vN                             | Sem/-taggar, OLang/\*, MWE, Use/NGminip, Allegro (sme)     | v1-vN - N = 24                                               | NGminip må testast |
| \-               | analyser-oahpa-gt-norm          | NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma), Coll                                 | Sem/-taggar, OLang/\*, MWE, Use/NGminip, Allegro (sme), vN | v1-vN - N = 24. Fst for testing, parallell til generatoren   | NGminip må testast |

analyser-dict-gt-desc-mobile er kompilert med
orthography/spellrelax-mobile-keyboard.regex i tillegg til den vanlege
spellrelax.regex.

Morfologisk analyse presentert på web vs. til disambiguering:

|                        |                         |                                         |              |            |
|------------------------|-------------------------|-----------------------------------------|--------------|------------|
| **alias \*.fst**       | **FST**                 | **synlege**                             | **Usynlege** | **Status** |
| smX-site.fst (smX.fst) | analyser-gt-desc        | Err/Orth, Err/Lex, +vN                  | Sem/-taggar  | Ferdig     |
| smX-dis.fst            | analyser-disamb-gt-desc | Err/Orth, Err/Lex, Sem/-taggar, Allegro | +vN          | Ferdig     |

Generatorar
===========

|                  |                              |                                                                                               |                                                                                                       |
|------------------|------------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| **alias \*.fst** | **FST**                      | **obligatoriske**                                                                             | **valgfrie**                                                                                          |
| ismX             | generator-gt-desc            | \-                                                                                            | IV, TV, vN, Coll, Allegro (sme), Use/NGminip, NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma) |
| ismX.norm        | generator-gt-norm            | \-                                                                                            | IV, TV, vN, Coll, Allegro (sme), Use/NGminip, NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma) |
| \-               | generator-dict-gt-norm       | NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma), vN, Coll, Use/NGminip, Allegro (sme) | IV, TV                                                                                                |
| \-               | generator-oahpa-gt-norm      | NomAg (sme), G3 (sme), G7 (sme), Hom1 (sma), Hom2 (sma), Coll                                 | IV, TV, vN, Allegro (sme), Use/NGminip                                                                |
| \-               | generator-oahpa-gt-restr\_GG | = generator-oahpa-gt-norm + Allegro                                                           | men strengar med Use/NG og Dial/-GG skal ikke med i kompileringa (sme)                                |
| \-               | generator-oahpa-gt-restr\_KJ | = generator-oahpa-gt-norm + Allegro                                                           | men strengar med Use/NG og Dial/-KJ skal ikke med i kompileringa (sme)                                |
| \-               | generator-oahpa-gt-restr\_SH | = generator-oahpa-gt-norm                                                                     | men strengar med Use/NG og Dial/-SH skal ikke med i kompileringa (sma)                                |
| \-               | generator-oahpa-gt-restr\_L  | = generator-oahpa-gt-norm                                                                     | men strengar med Use/NG og Dial/-L skal ikke med i kompileringa (sma)                                 |

Dialekt-fst-ane er no implementerte. Dei må testast slik at vi veit at
dei fungerer som dei skal.

Ferdige FST-ar
==============

|                                     |                                                                      |
|-------------------------------------|----------------------------------------------------------------------|
| **FST-namn**                        | **Tag-merknader m.m.**                                               |
| analyser-mt-apertium-desc.sma       | Sem/-tagger for sme-sma, filtrert mot bidix (gjort på Apertium-sida) |
| analyser-mt-apertium-desc.smj       | Sem/-tagger for sme-smj, filtrert mot bidix (gjort på Apertium-sida) |
| generator-mt-apertium-norm          | uten Sem/tagger                                                      |
| analyser-mt-gt-desc.sma             | GT-taggar                                                            |
| analyser-mt-gt-desc.smj             | --"--                                                                |
| generator-mt-gt-norm                | --"--                                                                |
| analyser-mt-gt-desc                 | grunnlag for .sma og .smj                                            |
| analyser-raw-gt-desc                | testa, verkar ok                                                     |
| analyser-dict-gt-desc               | testa, verkar ok                                                     |
| analyser-dict-gt-desc-mobile        | testa, verkar ok                                                     |
| analyser-gt-norm                    | testa, verkar ok                                                     |
| analyser-oahpa-gt-norm              | testa, verkar ok                                                     |
| analyser-gt-desc                    | testa, verkar ok                                                     |
| analyser-disamb-gt-desc             | testa, verkar ok                                                     |
| generator-gt-desc                   | testa, verkar ok                                                     |
| generator-gt-norm                   | testa, verkar ok                                                     |
| generator-dict-gt-norm              | testa, verkar ok                                                     |
| generator-oahpa-gt-norm             | testa, verkar ok                                                     |
| generator-oahpa-gt-norm-dial\_$DIAL | testa, verkar ok                                                     |

Dette burde vera alle fst-ar for alle formål som gjeld meir enn eitt
språk.

Korleis kompilere i langs/sme
=============================

`./configure`

Eksempel på parameterverdiar:`./configure --enable-dicts etc.`

-   --enable-spellers build any/all spellers \[default=no\]
-   --enable-grammarchecker enable grammar checker \[default=no\]
-   --enable-dicts enable dictionary transducers \[default=no\]
-   --enable-oahpa enable all tranducers with adjective-oahpa.lexc file
    instead of adjective.lexc \[default=no\]
-   --enable-apertium enable apertium transducers \[default=no\]

(Shell-)skript som manglar
==========================

-   preprocess
-   Oppsett for dis-regresjonstesting mot gullstandard (gt/sme/script/)
-   mange andre skript skrive for sme
-   lookup2cg
-   look
-   mhrdis
-   \~/main/gt/script/init.d/lookup-init.sh

Notatar framover
================

1.  Sme til nyinfra
2.  Nyinfra-namn i /opt/smi etc.
3.  vurdering av 4x sme-lex
4.  Ny vurdering av error-greina (sme-L1 + sme-L2?)
