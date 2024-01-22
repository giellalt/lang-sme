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
* to Lahka, 
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
* to Lahka,
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

<small>This (part of) documentation was generated from [src/fst/morphology/compounding.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/compounding.lexc)</small>

---

