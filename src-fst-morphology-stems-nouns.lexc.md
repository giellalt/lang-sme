
#                     North Sámi noun lexicon                                !

* **LEXICON NounRoot  ** Main lexicon, dividing in HyphNouns and Noun

* **LEXICON MiddleNouns  ** is pointed to from R in compounds.lexc

* **LEXICON Lahka  ** is pointed to from NounRoot above, cannot be last part of Cmp

* **LEXICON HyphNouns  ** is pointed to from NounRoot above

* **LEXICON FirstComponent  ** is pointed to from Noun below

* **LEXICON Eahpe_Noun  **

* **LEXICON NAMATLAGANLAGASCont  ** gives »»» and directs to NAMATCont

* **LEXICON SASCont ** FROM NUMERALS, gives -kilosaš etc.

* **LEXICON DER-SAS ** gets Der/sasj and points to AHKASAS

* **LEXICON Noun  ** dividing in NounNoPx, NounPx (with a P.Px.add flag)  and NounPxKin (with a P.Nom3Px.add flag)
 * NounNoPx ;  default nouns, no px
* @P.Px.add@ NounPx ;  nouns with px
* @P.Px.add@@P.Nom3Px.add@ NounPxKin ;  kinship nouns with px

* **LEXICON NounNoPx   ** here goes nouns not taking Px.

* **LEXICON NounPxKin  ** this is the noun lexicon for nouns which can have Px Nom 3. person, mostly kinshipterms

* **LEXICON NounPx  ** this is the main noun lexicon

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/nouns.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/stems/nouns.lexc)</small>
