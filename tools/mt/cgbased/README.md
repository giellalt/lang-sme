Denne fila dokumenterer oppsett og bruk av cg-basert mt basert på Eckhard Bick sine verkty
==========================================================================================

Filene ligg i `$GTHOME/lang-nob`, i `$GTHOME/lang-sme` og i `$GTPRIV/plan/projects/mt`.

Kompiler i sme og nob
=====================

```sh
./autogen.sh # berre første gong
./configure --enable-tokenisers --enable-apertium --enable-cgmt
make -j
```

Bruk
====

Stå i `lang-sme/tools/mt/cgbased`

Kommando for omsetjjing:
------------------------

```sh
echo Dat lea buorre| ./bin/smegram 
```

Output:

> det er bra 


Ulike delkommandoar (kortare delar av pipeline, lista frå kort til lang):
------------------------------------------------------------------------

Rein syntaktisk input til MT (utan prosessar i MT)
echo Dat lea buorre| ./bin/smegram --sme

Trace på CG som tilpasser samisk analyse (source) til transfer:
(tilføye kategoriar frå målspråket til kjeldespråket):
echo Dat lea buorre| ./bin/smegram --nob

Leksikalsk transfer (= tradução):
echo Dat lea buorre| ./bin/smegram --trad

Syntaktisk transfer:
echo Dat lea buorre| ./bin/smegram --nobsyn

Output av niceline (formattering av transfer):
echo Dat lea buorre| ./bin/smegram --niceline

Målspråksgenerering:
echo Dat lea buorre| ./bin/smegram --gen


Dei ulike opsjonane er definert i bin/smegram

NB! Tidlegare hadde vi  {{PERL_UNICODE=SDA ./bin/smegram}} 
i staden for {{./bin/smegram}}. For å få den attende 
(i tlifelle vi får teiknsett-vanskar) kommenterer
vi den inn i smegram-fila.


Dokumentasjon
=============

Dette skal vi rydde opp i etter kvart.



Den opne katalogen (sme/tools/mt/cgbased) inneheld desse filene:
----------------------------------------------------------------

bin/smegram         # alias for mt: cat prov.dep | smegram --option
etc/smecg.nob.cg    # tilpasser kategorier til målspråket før transfer
etc/smecg.nobsyn.cg # lagar syntaktisk transfer og legg til/fjernar ord
lex/sme.nob.dict    # leksikon og transfer- og seleksjonsreglar

Den lukka katalogen bin/ i private/ innheled desse filene:
---------------------------------------------------------------------
sme2nor     # ordboksoppslag og leksikalsk seleksjon
genmorf_no  # generator
nob.analyser.wrapper   # denne les analysefiler for norsk, veit ikkje korfor.
nob.generator.wrapper  # denne les genereringsfiler for norsk


Pipeline
--------

Programmet smegram inneheld heile pipeline. Det har desse opsjonane for debugging:

--nob    (kæden indtil smecg.nob, med trace)
--trad   (kæden indtil sme2nor)
--nobsyn (kæden indtil smecg.nobsyn, med trace)
--gen    (kæden indtil genmorf_no, med debugging output --, 
          der viser fst-kaldene as is)

Uden options køres hele kæden, dvs. nob tekst med følgende kæde:

cat prov.dep | cg3 -g $etcDir/smecg.nob.cg | $binDir/niceline_mt | $privDir/sme2nor --l | cg3 -g $etcDir/smecg.nob.cg | cg3 -g $etcDir/smecg.nobsyn.cg | $binDir/niceline_mt | $privDir/genmorf_no | $binDir/trad2inline.pl

Konkret sti, ståande i tools/mt/cgbased:

cat prov.dep | cg3 -g etc/smecg.nob.cg | bin/niceline_mt | $GTPRIV/plan/projects/mt/bin/sme2nor --l | cg3 -g etc/smecg.nob.cg | cg3 -g etc/smecg.nobsyn.cg | bin/niceline_mt | $GTPRIV/plan/projects/mt/bin/genmorf_no | bin/trad2inline.pl







Installering
============

* Kopier filene sme2nor og genmorf_no frå den lukka mappa referert til ovanfor
  til ei mappe i stien, td. $HOME/bin eller  /usr/local/bin
* Sjekk kor du har perl: {{which perl}}  /opt/local/bin/perl
  og endre stien i første linja i sme2nor og genmorf_no til rett perl-adresse
* sjekk at niceline_mt og trad2inline.pl har fått 
** {{chmod a+x  bin/niceline_mt bin/trad2inline.pl}} 

Installering av modulane IPC/Run og String/Approx i perl skjer slik:

sudo cpan
install IPC::Run
install String::Approx


(Trond:Eg er usikker på kva denne kommandoen gjer:)

perl -MCPAN -e shellx
to install the module type. install module name. Example: install HTML::Template. installing the module making the shell much more user friendly.


************
Brevveksling
************


Her kommenterer Eckhard output av testsetninga:


Output er nedenståend, og behøver ikke at være korrekt, det er udtryk for hvad jeg troede, det skulle hedde på norsk. Jeg har valgt indefinit for 'boken' for at prøve indsætningsreglen for artiklen.

******************

1 Mun      [jeg] <NO:jeg> <left> <1> PRON Pers Sg1 Nom @SUBJ #1->2
2 logan      [lese] <NO:leser> <2> <__verb> V TV Ind Prs Sg1 @FMV #2->7
3 en      [en] <NO:en> <insert> Art Indef @>N #3->3
4 girjji      [bok] <NO:bok> <maydetind^n> <right> <3> N Sem/Txt Sg Acc @OBJ #4->2
5 ihttin      [i=morgen] <NO:i=morgen> <right> <4> ADV Sem/Time @ADVL-ine #5->2
6 ,      [,] <NO:,> <5> CLB #6->5
7 logai      [si] <NO:sa> <6> <__verb> V TV Ind Prt Sg3 @FMVdic #7->0
8 oahpaheaddji      [lærer] <NO:læreren> <right> <7> N Def NomAg Sem/Hum Sg Nom @SUBJ #8->7
9 .      [.] <NO:.> <8> CLB #9->7

 jeg leser en bok i morgen , sa læreren .

1 Son      [han] <NO:han> <left> <1> PRON Pers Sg3 Nom @SUBJ #1->2
2 vulggii      [reise] <NO:reiste> <^verb> <2> V IV Ind Prt Sg3 @FMV #2->0
3 for=å      [for=å] <NO:for=å> <insert> Sub @SUB #3->4
4 lohkat      [telle] <NO:telle> <right> <3> <__verb> V TV Inf @ADVL #4->2
5 sávzzaid      [sau] <NO:sauer> <right> <4> N Sem/Ani Pl Acc @-FOBJ #5->4
6 .      [.] <NO:.> <5> CLB #6->2

 han reiste for å telle sauer .


Og så en gennemgang af modulerne:

1. sme.nob.dict

Denne fila inneholder tospråklig leksikon pluss ordspesifikke regler. syntaks

lemma <kommenter> (kommentar) :defaultoversetting; (vilkår) :oversetting2; (vilkår) : oversetting3;


Opertorer til bruk for vilkår, syntaks: OPERATOR=(TAG)
* B = brother
* D = daughter
* GD = granddaughter,
* GM = grandmother
* H = head, (mother)
* P-1 = en posisjon til venstre (BARRIER virker ikke. Stjerne fungerer, men tar tid)
* P1 = en posisjon til høyre
* P2 = to posisjoner til høyre, osv.
* S = self

Regler for å endre tagger har formatet oversetting_[a->b], der a er taggen for kildespråket og b er taggen for målspråket.

Regler i smecg.nobsyn.cg som har enkeltord som mål (lexicon selection rules) skal inn i dict.


Dictfila bruker også <ø> på samme måte som smecg.nob.cg. Formatet her er:

{{{
oversetting_[<ø>-><ø>±<pardef>]
D=(Loc)_[Loc->Ela±<pardef>]
}}}

Alle <pardef> (og en del tilsvarende) kommer fra Apertium, og skal bort.

Fordi det er usikkert, om det går helt uden cglex.txt, har jeg nu åbnet for *både* in-situ regler i sme.nob.dict *og* efterfølgende semantisk cg-disambiguering. Hvis MT-kernen (sme2nor) konstaterer, at et opslag ikke har in-situ regler, outputter den alle læsninger som cg-kohorte, ellers én læsning, den valgte. 

Forskellen ses også på, at i begge tilfælde får man norsk lemma i kohorten, men med in-situ-regler (dvs. dict-regler) kommer der også et <NO:norskoversættelse> tag. (Denne taggen kan vi ssv. fjerne når vi har en prinsipiell forskjell mellom dict-regler og nobsyn-regler.

(se. f.eks. "lokhat" og "mun" i .dict).


Bruk av semantiske tagger i dict: I

For å referere til Sem/Txt der taggen er +Sem/Money_Txt skriver vi (Sem/.*Txt.*) i leksikon
Problem: Sem/Build Sem/Buildpart, Lene skriver BZ om å endre disse taggene

NB! Tegna "_" og ":" er beskytta i .dict. Bruk regex "." i steden for "_".

2. MT-kernen (= sme2nor)

Fila sme2nor i priv leser og implementerer sme.nob.dict og seleksjonsregler.regler. 


Jeg har nu lavet en sme2nor version af vores MT-kerne, dvs. det program, der læser og implementerer sme.nob.dict. Hvis der er _[a->b] opskrifter og lignende i forbindelse med in-situ-regler, bliver de implementeret, ellers er der [<ø>-><ø>±<pardef>] for pardef'erne. <ø> er indføjet af cg'en før, som et hook for stedstyres substitution. Output af sme2nor er CG, hvor sme-analysen er bibeholdt efter ordformen, og kohorten eller er en kopi med norsk(e) lemma(ta).

3. smecg.nob.cg

Den fil, hvor jeg mener norske kategorier skal indføjes, der ikke er der på samisk (fx definitness?). Desuden kreerer den foreløbigt set tags til brug i sme.nob.dict.


Den har bare disse to: BEFORE-SECTIONS og AFTER-SECTIONS. Grunnen til ikke å bruke SECTION er at det ville ha iterert reglene, og vi ville ha fått mange innsettinger.

BEFORE-SECTIONS

Denne seksjonen skal lage de norske kategoriene samisk ikke har. I dag har vi regelen:

{{{
SUBSTITUTE (N) (N Indef) TARGET (<ext>) ; # example of addition of Norwegian-relevant category
}}}

Denne legger til Indef ''til den samiske analysen'' av substantiv merka med <ext>. Dette er __før__ dict, og ingen endringer som .dict skal se kan bli gjort her.


AFTER-SECTIONS


AFTER-SECTIONS starter med regelen

{{{
SUBSTITUTE (".*"r) (VSTR:"$1" <ø>) TARGET ("([^<]*)"r) ; # create SUBSTITUTE anchor
}}}

som setter inn <ø> som anker for senere substitusjonsregler. Filosofien er å bruke SUBSTITUTE-regler som insettingsregler, og kontrollere posisjonen for innsetting ved hjelp av <ø>.


AFTER-SECTIONS inneholder disse reglene:

{{{
SUBSTITUTE (<ø>) (<ø> <%BOS>) TARGET BOS ;
SUBSTITUTE (<ø>) (<ø> <%COMMA>) TARGET COMMA ;
...
}}}

CG har semantiske sett. Dictfila trenger __tagger__. Disse substitutereglene gjør setta om til tagger, og setter dem inn rett etter lemmaforma (dvs. etter <ø>). Tegnet <ø> markerer posisjonen mellom lemma og tagstreng. Grunnen til dette er at vi vil ha sekundære tagger (merka som <tag>) __før__ den vanlige taggrekka.

Regelen ADDCOHORT SUB:1 brukes til å løfte opp forleddet i sammensetninger.

Disse reglene:

{{{
SUBSTITUTE (Pr) (PR) TARGET (Pr) ;
}}}

er laga fordi .dict forventer ordklasse med bare store bokstaver (PRON-osv.). Deretter endrer generatoren dem tilbake til standard giella-format (Pron, osv.) for nob-generering.

# ta inn sme med giella-tagg
# endring til versaltagger i smecg.nob
# bruk av versaltagger i dict
# bruk av versaltagger i smecg.nobsyn (via sett som giella-tag)
# endringer til giella-tagger i genmorf_no (usynlig for oss)


4. smecg.nobsyn.cg

Eckhard sine kommentarer:
Den grammatik, der indføjer tokens (i eksempler "for å" og artiklen "en"), og først og fremmest laver MOVE regler. Jeg mener også, at det må være muligt, at lave næsten alt, der er pardef, her. Hvorfor have __verb, hvis det alligevel skal gøres for alle verber? Så enten skal der være regler, der reagerer på pardefs, der stammer fra sme.nob.dict, eller også kan man lave direkte a->b ændringer i sme.nob.dict, og generelle ting i smecg.norsyn.cg, helt uden pardefs.

Hvis jeg husker ret, har I også selv et cg-modul mere, hvorfra ting måske skal smeltes sammen med (4) i denne pipe.

Fila inneholder nå reglene fra lex-fila i Apertium. De ordspesifikke reglene skal over i .dict.

Det er mulig å velge mellom ulike oversettelser av kildespråksord på to måter: i {{sme.nob.dict}} og i {{smecg.nobsyn.cg}}. Enkle regler og regler som bruker dependens kan vi ha i dict. Mer kompliserte CG-regler kan vi i steden ha i nobsyn. For å få til det må alle oversettelsene være i dict, __men uten vilkår__. Hvis det ikke er regler i nobsyn, vil den første oversettinga bli valgt. 

Eksempel:

{{{
dict:
miehtá_PR :langs;  :over; :i=hele;

nobsyn:
SELECT:fallback ("i=hele"i) (0 ("<miehtá>"i)) ;

Resultat (overatt med smegram --nobsym):
"<miehtá>" "miehtá" <right> <3> PR <W:0.0> @ADVL #3->1
	"i=hele" <right> <3> PR @ADVL #5->1 SELECT:971:fallback SUBSTITUTE:3351
;	"langs" <right> <3> PR <W:0.0> @ADVL #5->1 SELECT:971:fallback
;	"over" <right> <3> PR <W:0.0> @ADVL #5->1 SELECT:971:fallback
}}}


5. genmorf_no

Norsk generator, der klarer sig med frit input, bare norsk lemma og tags i vilkårlig rækkefølge. Jeg har lavet en tilsvarende for grønlandsk, der virker fint. fst-handleren har Tino hjuplet med. Der er en subrutine nederst, der høster morfologiske tags, og som kan udvides. Jeg har bare lagt nogle generelle ting ind for norsk, for at få eksemplet til at køre. Generatoren outputter fuldformen som <NO:....> tag.

genmorf_no går ud fra at fst'en ligger i /usr/share/giella/nob,  håber det er det samme hos jer, ellers må I tilpasse det.

6. nogle småscripts: niceline_mt og trad2inline.pl, der henholdsvis udflader cg-format og svejser den norske sætning sammen ud fra <NO:....> felterne. --p i sidstnævnte giver output med analyselinjerne først.

7.   generate_dbs.smenor

Laver perl-db'er til den endelige version, når den er i drift på nettet. Pt. bliver sme.nob.dict indlæst hver gang (--l), så ændringer ses med det samme. sme.nob.baselex og sme.nob.memory er tomme, men var tænk til as-is oversættelser. Ikke så relevant for et morfologirigt sprog.

TO DO: Jeg har ikke set på komposita (og subreadings). Helst skal de komme ind som <POS:aaa~fuge+bbb> tags, uden subreadings, så kan jeg nemmest håndtere det i sme2nor.

NOTABENE: Dette projekt er jo et forsøg på at vise, at samarbejde mellem Open Source og Ikke-Open Source sagtens kan lade sig gøre :) Men det betyder, at tingene kun kan blandes frit in-house på serveren, ikke i fx sourceforge eller svn-distribution. Det er relevant for 2 af modulerne: sme2nor og genmorf_no, som jeg har lavet copyright headers i af den grund. De andre scripts er så små, at det er ligemeget, cg'erne bliver det jo jer, der skal udfylde :), og sme.nob.dict er lavet med baggrund i jeres cglex og cgdix. Og mit arbejde er en julegave :) Håber, pipen kommer til at virke og gør det nemmere end den nuværende xml.

Mange hilsner,
Eckhard

KOMMENTARAR: fst-en ligg ikkje i /usr/share/giella/nob.


On 12/7/18 10:04 PM, Lene Antonsen wrote:
Hei, Eckhard!

Takk for flere brev med mye hjelp. Vi har sett på filene og har endel svar og endel nye spørsmål til dine kommentarer:

Men der er et problem - formalismen er lavet til dependens-træer (D=daughter GD=granddaughter, H=head, GM=grandmother),
og de er ikke brugt i cglex. I stedet er der *-kontekster og BARRIER i cglex. Jeg kan muligvis tilføje * i formalismen, men hvis det kombinere
med LINK og BARRIER bliver det svært. Løsningen må, for mig at se, snarere være at omskrive disse relativ få steder til dependens,
fx D=(<H> @OBJ) for et humant objekt i et verbumsopslag, i stedet for *1 (<H> @OBJ BARRIER CLB OR V). Kan I prøve at se, om og
i hvilken grad det er muligt, i sme.nob.dict filen?

Ja, det ser ut til å være en rimelig konklusjon. Poenget er jo å utnytte dependensen, og vi skal se på muligheter for omskriving. Trond ser på det.



Vedlagt er en liste af de pardefs der forekom i cgdix i forbindelse med
oversættelsesopslag (replace_patternsE). Min idé er at erstatte disse
med en replace/insert-opskrift i sme.nob.dict: [from->to], og der kan
være flere end én: [sg_m_RL_f__n] [pl->sg][n->n±m]
'±' bliver til ' ' (space) i output, tomrum er bare et beskyttet tegn i
.dict-formatet. Af samme grund er der '=' alle de steder i ord og
lemmata, hvor i har mellemrum inde i ordet.
Kan I færdiggøre og/eller kommentere omskrivningerne i pardef-filen?
Ja, Lene skal gjøre dette.


Der er nogle enkelte uregelmæssigheder, jeg har udskrevet i toppen af
.dict filen, hvor en cglex-regel syntes at gå efter en oversættelse, der
slet ikke var i  cgdix. Muligvis pga af et matching-problem i mit
script. Men der er tale om ret få tilfælde, som i måske kan klare ved
inspektion i filen.
Ja, det er feil (uoverenstemmelse mellom .lex og .dix. fordi det har vært gjort endringer i dix som ikke er fulgt opp i lex.
Disse tilfellene kan vi bare stryke.


MANGLENDE POS:
En sidste ting: Normalt har jeg altid en POS for et .dict opslag (som
_POS efter lemma), men cgdix havde entries uden POS, som så er blevet
til _X. Er det korrekt gættet, at sme-input alligevel HAR en POS? Fordi
så kan den evt. benyttes, eller også må MT-kernen slå op i dict med _X,
når den ikke kan finde en "tilladt" ordklasse i input (N, A, ADV, V, PRON
Det er riktig at vi ikke alltid har ført det opp i ordpar entrynen i dix. Det er flere grunner til dette:

1) noen tilhører loops for å lage tallord, ala njeallječuođinjeallje = fire-hundre-fire (= 404),
og da skal PoS selvfølgelig bare komme til slutt.

2) noen får PoS i pardefs, og kunne like gjerne hatt det i selve entryen, f.eks. N ABBR - N ACR. Bør vi endre dette før
ny dict-fil lages?

3) noen får flere PoS, f.eks. lemma 'X' får SL:pr og post => TL: pr (sme har mange ambiposisjoner), eller også
lemma 'X' får SL:pr og post og adv => TL: pr og adv
Disse liker jeg ikke helt fordi det er ikke alltid vi vil ha samme oversettelse til nob, og jeg kan omgjøre disse
til ordpar i dix før ny dict-fil lages.

Lene tar seg av dette.




Til brev fredag 14.08

Lige for at sige, at det jo ikke kan "testes" i egentlig forstand, fordi der ikke er en sme2nor kerne endnu, der skal læse og bruge .dict filen.
Hva inngår i en sme2nob-kjerne, og hva skal til for å lage den?

Så det jeg have feedback på, er mest, om I synes, det er realistisk, at have alle semantiske disambigueringsregler med i .dict-filen.
Det er i de aller fleste tilfelle realistisk med .dict.

Spørsmålet er så om vi trenger formalismen fra .lex (altså ordinær CG) i tillegg til .dict. Det vet vi ikke enda, og det er også avhengig av dine *1 og *-1 -tilpasninger (nedenfor).
Med mapping av semantiske motiverte tagger, slik som du har skissert, burde fungere for de fleste reglene.
I alle fall er vel mekanismen modulær nok til bare å legge til en .lexc etter .dict i pipeline?



*1 og *-1 har jeg forresten også fået til at virke nu (dog uden BARRIER).
Fint.

Men under alle omstændigheder tror jeg, at meget at det kunne mere præcist formuleres som dependens: D=(....)
Ja, det ser ut til å være en rimelig konklusjon. Poenget er jo å utnytte dependensen, og vi skal se på muligheter for omskriving. Trond ser på det.

Vi ser på .dict og finner disse:

* B = brother
* D = daughter
* GD = granddaughter,
* GM = grandmother
* H = head, (mother)
* P-1 = en posisjon til venstre
* P1 = en posisjon til høyre
* S = self


Er det noen dependensrelasjoner vi mangler?
Finnes det en urmoder (oldemor)?

Hilsen Lene og Trond






Kommentar frå NoDaLiDa-diskusjonen:
------- -------- -------- ---------


cat  testsetning.dep |\       # input, evt. prov.dep eller anna input, ferdig dep-analysert
vislcg3 -g smecg.nob.cg |\    # cg for å lage sme meir nob-aktig språk
                              # (sett inn Det, Pr ...)
perl niceline_mt |\           # formater til ei linje
sme2nor --l | \               # transfer-kjerna. Den les sme.nob.dict
vislcg3 -g smecg.nobsyn.cg |\ # syntaktiske tilpassingar (MOVE), ... 
                              # Legg til ord ...
perl niceline_mt |\           # formater til ei linje (ein gong til)
genmorf_no |\                 # morfologisk generator for norsk
perl trad2inline.pl |\        # postformattering


Sjur sine notat
---------------

(kan vera utdaterte, notata er frå 12.2.2019)

perladressefiks for cg-mt

I dag ligg filene i 

/Users/trond/main/langs/sme/tools/mt/cgbased/bargofiillat

Dette er førebels ("arbeidsfiler"), vi vil flytte dei opp i 

/Users/trond/main/langs/sme/tools/mt/cgbased

Det ligg ei README-fil i bargofiillat.


--------


Filene vi vil bruke er (alle "nob" tilsvarer eckhards "nor", filene i cgbase (den endelege plasseringa) har namn med *nob*, filene i bargofiillat (filene vi fekk frå eckhard) heiter *nor*):

Filene i pipeline:
smecg.nob.cg    = 
niceline_mt     = 
sme2nob         = 
cglex.txt       = 
smecg.nobsyn.cg = 
genmorf_no      = 
trad2inline.pl  = 

Fil som blir brukt av filene i pipeline:
sme.nob.dict    = leksikon + MT-reglar. (ligg i cgbased)
