# Numerals


**Background**


Some Numeral meeting is long overdue


**Potential obstacle**


Different people have different things they want to discuss. Now, we just jot down what we want, and then go to lunch.


**Question to think of:**


What part of the list below as a plenary discussion for all, and what for only some.




# Topics
1. The TODO-list (**all**)
1. Morphology (**Trond, Thomas, Sjur?, Börre?**)
1. Spelling: Recursivity and the non-recursive transducers (**Thomas,**)
1. Preprocessing (**Trond, Saara,** no need to meeting on this, there is a bug report)
1. Morphosyntax (**Trond, Linda, others?**)




## The TODO-list:
* discontinous case inflection (but only for maximally three-part compound
  numerals) (`viđain/goalmmát/logiin` and `guvttiin/logiin/viđain`)
  (**Thomas, Trond**)
* produce correct base forms in the analyzer (**Thomas, Trond**)
* include numbers in the non-recursive transducers (i.e. split the recursive and 
  the non-recursive part of the numerals) (**Trond, Thomas**)THIS MUST BE DONE IMMEDIEATELY (i.e. today...)
* Make a test bed `make num-paradigm` (**Trond**). Done.
* Set up test bed for numerals, test and revise (**who?**)
* Go through the Num bugs (**Trond, Thomas, Steinar**)
* Preprocessing of ordinals at the end of sentences - reported as bug #368.
  (**Trond**)


Fleshing out some priority items:


**Top-priority:** make num-paradgim (**Trond**) Done.

```sh
cvs up
cd gt/sme/testing
make num-paradigm WORD=guokte
```

**Thereafter:** someone to test the output (let's see how it looks before we decide who)


**Speller:** numbers in non-recursive




## Morphology

* Complex numerals written as single words
* Case forms of Complex numerals written as single words (subnorm?)
* Checking what we generate (test bed)




Split the lexicon into circular and non-circular parts:
* all base numbers should be non-circular as well as circular (ones, tens, hundred, thousand, etc)
* complex numbers can be formed by simple concatenation (ie compounding) by the base numbers
* case inflection of complex numbers will have to be pregenerated for spellers - but what counts as "three parts"? will **305 000** be such a three-part compound?




```
golbma#cuohti#vihtta#duhát = four parts
```


ok - 300 000 ?

```
golbma#cuohti#duhát = three parts


"<golbmačuohtiduhát>"
        "golbmačuohtiduhát" Num Sg Nom <<< @SPRED
```


thus case inflection on all parts? yes, and that is not implemented. I suggest we do that after the beta release.


That is fine with me, we don't need perfect numeral coverage in the beta


Have a look at the Finnish numeral example from the book, see [this link.
| http://www.stanford.edu/~laurik/fsmbook/LSA-207/Scripts/finnum/Finnish%20Numerals.html]


### Complex numerals written as single words


**Nothing here yet**


## Spelling


Cf. the num.plx.txt list (output from the present PLX number conversion).
We need a clarification of the num.plx.txt list. What is in, what is out, and why.
Börre?


## Preprocessing


Issue: We analyse numerals at the end of sentences as ordinals. Oslo analyses it as cardinals.
Arguments for our view? I (TT) am leaning toward the Oslo solution as better.


I could do some research with both options. That's fine. I remember there was a request to analyze end of sentences as ordinals, but it can be otherwise.


Examples of sentence final numerical expressions:


```
    1. Dat lea s. 240.
    1. Dieđáhusa nummar okta.
    1. Mun lean ilus go beasan ovdanbuktit St.dieđ. nr. 33.
    1. Mun boađán diibmu vihtta/viđas.
    1. Máŋggabealatvuohta ja ovttadássásašvuohta - ráđđehusa dearvvašvuođa- ja
   sosiálabálvalusaid doaibmaplána Norgga sápmelaččaid várás 2002-2005.
        1. There is no problem with years, they are not regarded as ordinals in the
    preprocessor in any case. How do you know it is a year?  we have rules that
    say it is a year after "jagi" and we have a Range analysis for "-"
    expressions, but isn't it a usual numeral (potentially) otherwise?
    1. He owned kr 10000.
    1. She was only 16.
    1. The population is 120.000.
    1. He reads from book 4.
        1. Well, I don't go so deep to details, I just assume that a number containing
    4 digits is a year. Of course there are errors, but not so many.
        1. I'm not so sure since we have a lot of law texts to which get numbers and
    other entitites which just as well could get 4 digits, it would be nice
    though to have some help for recognizing years
        1. Trond and I have worked on date expressions such as 21.5.2000 which are now
    clearly identified as dates, that helps a lot
        1. Yes, they are fine. The thing is, at the moment I don't have any better
    heuristics for recognizing years, if they are not part of some date
    expression like above. It may also be that the date expressions in analyzer
    are not compatible with preprocessor, since I haven't updated it lately.
        1. But we are maybe talking of two issues here. The expressions with 4 digits
    are not considered as ordinals (since they are assumed to be years) but the
    question is if there are other 4-digit expressions that are ordinals
    contrary to the assumption.
        1. would it be possible to get a tag for the 4-digit expressions so that we
    could use it in the rule file?
        1. counterexamples could be:
    1. I took part in a race. I got 1345.
        1. Probably not very often in our corpus :)
        1. Exactly, I think this is an empirical question.


Empirical investigation:
kwic-snt '[a-z] [0-9]\. [A-Z]
So far, ONE example with sentence-final ordinals (Nordlys). 
tafettinnspurt greide Trude å sikre Kjelsås sitt 10. NM-gull. 
er til Kypros torsdag 2. februar, proffene søndag 5. Roger Nilsen   <== 1/100
  real example, ellipsis                              
```


probably not..unless min aigi desides to write about large-scale sports with placing


Ok. What if you just punched some Finnish text through the preprocessor and looked for the final numerals, to get an impression? I am pretty sure Fi and Sa behave the same.


So, we have a verdict, and a new system.




##  Syntax

* Date
* Range
* Numbers in date expressions
* Numbers postmodifying nouns
* Concrete analyses


### Date


<empty>


### Range


<empty>


### Numbers after ":"
such as in "faksa: 2323232323"


I tried to solve that problem before when there were still sentence borders, so that the numeral item after the communication-device would get @SPRED (which was at least my favorable analysis) but after the sentence borders disappeared the analysis does not work any more. My proposal would be to make a set of communication devices with numbers and make a new rule


```
"<Statens>"
        "Statens" N Prop Attr @PROP>
"<forvaltningstjeneste>"
        "forvaltningstjeneste" ? @X
"<Informasjonsforvaltning>"
        "Informasjonsforvaltning" ? @X
"<Poastaboksa>"
        "poasta#boksa" N Sg Nom @SUBJ
"<8169>"
        "8169" Num Sg Acc @OBJ
        "8169" Num Sg Gen @QN>


"<Poastaboksa>"
        "poasta#boksa" N Sg Nom @HNOUN
"<8169>"
        "8169" Num Sg Nom @NumN<
"<.>"
        "." CLB <<<


Status?
```

        
### functional numbers in texts (such as ennumerations etc.)


This is a formating problem. I would prefer to mark those numbers as text-functional numbers, otherwise we always have the problem that they could be either quantifiers (post or pre) or one of the "thousand" different functions of numerals...

```
"<¶>"
        "¶" CLB <<<
"<SISDOALLU>"
        "SISDOALLU" ? @X
"<Ovdasátni>"
        "ovda#sátni" N Sg Nom @HNOUN
"<...>"
        "..." CLB <<<
"<5>"
        "5" Num Sg Nom @HNOUN
"<¶>"
        "¶" CLB <<<
"<1.>"
        "1" A Ord @X
"<.>"
        "." CLB <<<




"<12>"
        "12" Num Sg Gen @QN>
"<2.1>"
        "2.1" Num Sg Gen @QN>
"<2.2>"
        "2.2" Num Sg Gen @QN>
"<2.3>"
        "2.3" Num Sg Gen @QN>
"<2.4>"
        "2.4" Num Sg Gen @QN>
"<Sámepolitihkalaš>"
        "sáme#politihkalaš" A Attr @AN>
"<perspektiivvat>"
        "perspektiiva" N Pl Nom @HNOUN
"<...>"
        "..." CLB <<<
"<12>"
        "12" Num Sg Gen @GN>
"<Riikkaviidosaš>"
        "riikka#viiddus" N* Der1 Der/Dimin N Sg Nom @HNOUN
"<diehtojuohkindoaimmat>"
        "diehto#juohkin#doaibma" N Pl Nom @SPRED
```


### Numbers in date expressions

there is a lot of creativity among dates (written in several or just one words, leaving out month or day, writing b or beaivvi
probably not a big problem, even though sometimes I am unsure about the case


```
"<Gustojeaddji>"
        "gustojeaddji" A Attr @AN>
"<luoddaplána>"
        "luodda#plána" N Sg Nom @SUBJ
"<dohkkehuvvui>"
        "dohkkehit" V TV Der2 Der/Pass Ind Prt Sg3 @+FMAINV
"<guovvamánu>"
        "guovva#mánnu" N Sg Gen @ADVL
"<1997>"
        "1997" Num Sg Nom @SUBJ
        "1997" Num Sg Nom @APP
        "1997" Num Sg Nom @HNOUN
"<ja>"
        "ja" CC @CC-VP
"<sisttisdoallá>"
        "sisttis#doallat" V TV Ind Prs Sg3 @+FMAINV
"<njuolggadusaid>"
        "njuolggadus" N Pl Acc @OBJ
"<ahte>"
        "ahte" CS @CS-VP
"<makkár>"
        "makkár" Pron Dem Attr @DN>
"<eavttut>"
        "eaktu" N Pl Nom @SUBJ
"<galget>"
        "galgat" V IV Ind Prs Pl3 @+FAUXV
"<leat>"
        "leat" V IV Inf @-FMAINV
"<devdojuvvon>"
        "deavdit" V TV Der2 Der/Pass PrfPrc @-FMAINV
"<go>"
        "go" CS @CS-VP
"<klassifisere>"
        "klassifiseret" V TV Ind Prs Sg3 @+FMAINV
"<suohkanlaš>"
        "suohkanlaš" A Attr @AN>
"<luotta>"
        "luodda" N Sg Acc @OBJ
"<.>"
        "." CLB <<<
```


### Numbers postmodifying nouns


* so etwas wie láhka nr. 67, jahki 2000,...
* The láhka nr. 45 already has the analysis we want (the @NNum< must be interpreted as
  "not the one to the left, but the one to the left of that again.


I was thinking about more complex expressions, I can look after concrete examples
Gut.


```
"<láhka>"
        "láhka" N Sg Nom @SPRED
"<nr.>"
        "nr" ABBR N Nom @NNum>
        "nr" ABBR N Gen @NNum>
"<45>"
        "45" Num Sg Nom <<< @NNum<
```

        
That is a wrong analysis...


### Concrete analyses


```
golbma maŋemus jagi leat lassánan buhtadusat boraspiriid geažil.


"<golbma>" S:14943, 14945, 15284
        "golbma" Num Sg Nom S:3314 @SUBJ <==== ADVL
"<maŋemus>" S:8267
        "maŋemus" A Attr S:2431 @AN>
"<jagi>" S:9657
        "jahki" N Sg Gen S:2900 @NQ<
"<leat>" S:8607, 12762, 13029, 13029, 13276, 13276, 14531
        "leat" V IV Ind Prs Pl3 S:3102 @+FAUXV
"<lassánan>" S:3610, 5049, 5049, 8834
        "lassánit" V IV PrfPrc S:3162 @-FMAINV
"<buhtadusat>" S:10195, 10358, 10358, 10586
        "buhtadus" N Pl Nom S:3314 @SPRED
"<boraspiriid>" S:9683
        "bora#spire" N Pl Gen S:2798 @GP>
"<geažil>" S:5921
        "geažil" Po S:3419 @ADVL
"<.>"
        "." CLB <<<




[


"<62>"
	"62"                              <=== head
"<milj.>" Num       
	"milj" ABBR Num Gen @NumQ<        <===
	"milj" ABBR Num Acc @NumQ<


"<10>"
        "10" Num Sg Nom @SUBJ-QH
"<kr.>"
        "kr" ABBR Gen <<< @NQ<




<10>" S:10069, 10069, 14874, 15260
        "10" Num Sg Gen S:2683 @QN>
"<miljovnna>" S:10069
        "miljon" Num Sg Gen S:2647 @NumQ<
"<ruvnnu>" S:3583, 15042
        "ruvdnu" N Sg Acc <<< S:3397 @OBJ




ok:
"<10>" S:10072, 10072, 15392, 15468
        "10" Num Sg Nom S:3360 @SUBJ
"<miljovnna>" S:9871
        "miljon" Num Sg Gen S:2647 @NumQ<
"<ruvnnu>" S:9851
        "ruvdnu" N Sg Gen S:2650 @NQ<
"<lea>" S:15390
        "leat" V IV Ind Prs Sg3 S:3145 @+FMAINV
"<stuorra>"
        "stuoris" A Attr S:2449 @AN>
"<summa>" S:10090, 10090, 10804, 14722
        "summa" N Sg Nom S:3360 @SPRED
"<.>"
        "." CLB <<<
```
        

        
what modifies what? 


> 2006 stáhtabušeahtas lea ráđđehus liigudan 10 milj. kr álggahanmearreruhtan ođđa dieđavistái. 

```
"<2006>"
        "2006" Num Sg Acc @OBJ
"<stáhtabušeahtas>"
        "stáhta#bušeahtta" N Sg Gen PxSg3 @NQ<
"<lea>"
        "leat" V IV Ind Prs Sg3 @+FAUXV
"<ráđđehus>"
        "ráđđehus" N Sg Nom @SUBJ
"<liigudan>"
        "liigudit" V TV PrfPrc @-FMAINV
"<10>"								   ||
        "10" Num Sg Gen @QN>		   ||
"<milj.>"							   ||
        "milj" ABBR Num Acc @NumQ<	   ||
        "milj" ABBR Num Gen @NumQ<	   ||
"<kr>"								   ||
        "kr" ABBR Gen @GN>  <== @NQ<   ||
"<álggahanmearreruhtan>"
        "álggahan#mearre#ruhta" N Ess @OPRED
"<ođđa>"
        "ođas" A Attr @AN>
"<dieđavistái>"
        "dieđa#visti" N Sg Ill @ADVL
"<.>"
        "." CLB <<<


"<2006>" S:11106, 11106, 15045, 15313
        "2006" Num Sg Acc S:3400 @OBJ
"<stáhtabušeahtas>" S:9851
        "stáhta#bušeahtta" N Sg Gen PxSg3 S:2936 @NQ<
"<lea>" S:14633
        "leat" V IV Ind Prs Sg3 S:3145 @+FAUXV
"<ráđđehus>" S:8340, 14714
        "ráđđehus" N Sg Nom S:3360 @SUBJ
"<liigudan>" S:3665, 8951
        "liigudit" V TV PrfPrc S:3207 @-FMAINV
"<10>" S:11064, 15057, 15395
        "10" Num Sg Gen S:2686 @QN>
"<milj.>" S:11064
        "milj" ABBR Num Gen S:2647 @NumQ<
        "milj" ABBR Num Acc S:2647 @NumQ<
"<kr>" S:3586, 9851
        "kr" ABBR Gen S:2650 @NQ<
"<álggahanmearreruhtan>" S:5138, 5138, 5138, 5138, 5138, 15392
        "álggahan#mearre#ruhta" N Ess S:3495 @OPRED
"<ođđa>"
        "ođas" A Attr S:2449 @AN>
"<dieđavistái>"
        "dieđa#visti" N Sg Ill S:3480 @ADVL
"<.>"
        "." CLB <<<


"<Sámediggi>"
        "Sámediggi" N Prop Org Sg Nom @SUBJ
"<hálddaša>"
        "hálddašit" V TV Ind Prs Sg3 @+FMAINV
"<2>"
        "2" Num Sg Acc @OBJ
        "2" Num Sg Gen @QN>
"<milj.>"
        "milj" ABBR Num Acc @NumQ<
        "milj" ABBR Num Gen @NumQ<
"<kr>"
        "kr" ABBR Acc @OBJ
        "kr" ABBR Gen @GN>
"<doarjjaortnega>"
        "doarjja#ortnet" N Sg Acc @OBJ
"<maid>"
        "mii" Pron Rel Sg Acc @OBJ
"<Birasgáhttendepartemeanta>"
        "Birasgáhttendepartemeanta" N Prop Org Sg Nom @SUBJ
"<lea>"
        "leat" V IV Ind Prs Sg3 @+FAUXV
"<ruhtadan>"
        "ruhtadit" V TV PrfPrc @-FMAINV
"<.>"
        "." CLB <<<




"<2006>"
        "2006" Num Sg Nom S:3360 @SUBJ
        "2006" Num Sg Acc S:3400 @OBJ
        "2006" Num Sg Gen S:2686 @QN>
        "2006" Num Sg Acc S:3400 @OPRED
        "2006" Num Sg Nom S:3360 @SPRED
"<stáhtabušeahtas>"
        "stáhta#bušeahtta" N Sg Acc PxSg3 S:3400 @OBJ
        "stáhta#bušeahtta" N Sg Gen PxSg3 S:2936 @NQ<
        "stáhta#bušeahtta" N Sg Loc S:3482 @ADVL
        "stáhta#bušeahtta" N Sg Acc PxSg3 S:3400 @OPRED
"<lea>"
        "leat" V IV Ind Prs Sg3 S:3145 @+FAUXV
        "leat" V IV Ind Prs Sg3 S:3145 @+FMAINV
"<ráđđehus>"
        "ráđđehus" N Sg Nom S:3360 @SUBJ
        "ráđđehus" N Sg Nom S:3360 @SPRED
        "ráđđet" V TV Der1 Der/h Imprt Prs Sg3 S:3195 @+FMAINV
"<liigudan>" S:3665
        "liigudit" V TV Actio Nom S:3360 @SUBJ
        "liigudit" V TV Actio Acc S:3400 @OBJ
        "liigudit" V TV Ind Prs Sg1 S:3195 @+FMAINV
        "liigudit" V TV Actio Acc S:3400 @OPRED
        "liigudit" V TV PrfPrc S:3207 @-FMAINV
        "liigudit" V TV Actio Gen S:3498 @ADVL
        "liigudit" V TV Actio Nom S:3360 @SPRED
"<10>"
        "10" Num Sg Acc S:3397 @OBJ    <============= gibt's schon!!
        "10" Num Sg Nom S:2754 @NumN<
        "10" Num Sg Acc S:3397 @OPRED
        "10" Num Sg Gen S:2686 @QN>   <============== ausschliessen?
"<milj.>"
        "milj" ABBR Num Acc S:3397 @OBJ
        "milj" ABBR Num Nom S:2724 @SUBJ-QH
        "milj" ABBR Num Nom S:2724 @SPRED
        "milj" ABBR Num Gen S:2647 @NumQ<
        "milj" ABBR Num Acc S:3397 @OPRED
"<kr>" S:3586
        "kr" ABBR Acc S:3400 @OBJ
        "kr" ABBR Nom S:3360 @SUBJ
        "kr" ABBR Gen S:2650 @NQ<
        "kr" ABBR Nom S:3360 @SPRED
        "kr" ABBR Acc S:3400 @OPRED
"<álggahanmearreruhtan>"
        "álggahan#mearre#ruhta" N Ess S:3495 @SPRED
        "álggahan#mearre#ruhta" N Sg Nom PxSg1 S:3360 @SUBJ
        "álggahan#mearre#ruhta" N Sg Acc PxSg1 S:3400 @OBJ
        "álggahan#mearre#ruhta" N Sg Gen PxSg1 S:2886 @GN>
        "álggahan#mearre#ruhta" N Sg Acc PxSg1 S:3400 @OPRED
        "álggahan#mearre#ruhta" N Sg Nom PxSg1 S:3360 @SPRED
        "álggahan#mearre#ruhta" N Ess S:3495 @OPRED
"<ođđa>"
        "ođas" A Attr S:2449 @AN>
"<dieđavistái>"
        "dieđa#visti" N Sg Ill S:3480 @ADVL
"<.>"
        "." CLB <<<
```        
