
# North Saami numerals

## The initial lexica

* **LEXICON Numeral**  initial lexica

The **LEXICON CmpNumeral**  lexicon is the entrance for compounds
with numbers. Introduced to restrict such compounding
to a subgroup of numerals only, mainly to exclude
roman numerals, that turned out to be too problematic.
With this change, roman numerals are only recognised
on their own.

* **LEXICON MILJON**  miljons and miljards

* **LEXICON OVERDUHAT** for the numerals over 1000.

* **LEXICON O-OKTAF** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON O-2TO9F** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON 1TO9DUHAT**

* **LEXICON O-JUSTLOGIF** This lexicon is for the number 10 000 only. it is separated from the rest to avoid forms like *logivihttaduhát, etc.

* **LEXICON O-LOGIF** this lexicon is accessed only via other O-lexica, and not directly from OVERDUHAT. Thus, *logivihttaduhát, etc. is avoided.

* **LEXICON O-2TO9LOG** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON O-NUPPELOT**  Teens of thousands

* **LEXICON O-NL**

* **LEXICON O-NUPPELOHKAI**

* **LEXICON O-CUODI** Hundreds of thousands

* **LEXICON O-2TO9CUO**

* **LEXICON O-GCUO**

* **LEXICON DUHAT**

* **LEXICON JUSTDUHAT** for numerals going via 1000

* **LEXICON OLD** for the old counting thirteen hundred etc.

* **LEXICON NLX**

* **LEXICON NUPPELOHKAICUODI**

* **LEXICON UNDERDUHAT**  the numerals under 1000

* **LEXICON ONLY_CMP**

* **LEXICON OKTAF**

* **LEXICON 2TO9F**

* **LEXICON 11TO99F**

* **LEXICON BARELOGIF**

* **LEXICON LOHKI**

* **LEXICON 2TO9LOG**

* **LEXICON 21TO99**

* **LEXICON 111TO119**

* **LEXICON CUODI**

* **LEXICON 2TO9CUO**

* **LEXICON GCUODI**

* **LEXICON 1TO9CUODI**

* **LEXICON NUPPELOGIS**

* **LEXICON LOHKAI-END**

* **LEXICON ARABICCOMPOUNDS**  ! arabic as first part,

* **LEXICON NUMERALCOMPOUNDS**: numeral as first part: duhatjienat,
logigielat, etc.

* **LEXICON SAS** gives :»»» and goes to SASCont

* **LEXICON num-ordinal** Ordinal numbers

* **LEXICON num-ordinal-1** Ordinal numbers vuosttas, vuosttaš

* **LEXICON num-ordinal-2to9** Ordinal numbers, 2 to 20, even though the name implies differenty

* **LEXICON VUOSTTAS**

* **LEXICON num-collective** Collective numerals

* **LEXICON num-imprecise** Imprecise numbers

# Arabic numerals

Arabic numeral expressions can be classified in at least the following categories:
* **general numeric expressions: 123 456,789 - note**:  space as thousand separator, groups of three digits
* **accounting numeric expressions: 123.456,789 - note**:  full stop as thousands separator, groups of three digits
* **numeric range expressions**:  12-14 - can be dates, times, lengths, masses and other sorts of measurements
* **measurements**:  123 kg
* **dates**:  2.4.1999, 4.5., 7.8.02, 04.10.2016
* **times: 12**: 34
* **money amounts**:  kr 1234,56
* **temperature**:  –8°C, 256°K, 100°F

And for sure more than these. Previously everything has been more or less
lumped together, but to avoid noise and to get better input for grammar
checking the ARABICS section should be rewritten such that each category
gets its own lexicon. That way it is easier to restrict the syntax of
numerical expressions in each category.

* **LEXICON ONLY_OKTA**

* **LEXICON LOGIF**

* **LEXICON NUPPELOHKAI**

* **LEXICON GOLBMALOGIOKTA**

* **LEXICON GAVCCILOGIOKTA**

* **LEXICON GUOKTELOGIOKTA**

* **LEXICON VIHTTALOGIOKTA**

* **LEXICON GOLBMALOGIGUOKTE**

* **LEXICON GAVCCILOGIGUOKTE**

* **LEXICON GUOKTELOGIGUOKTE**

* **LEXICON VIHTTALOGIGUOKTE**

* **LEXICON GOLBMALOGIGOLBMA**

* **LEXICON GAVCCILOGIGOLBMA**

* **LEXICON GUOKTELOGIGOLBMA**

* **LEXICON VIHTTALOGIGOLBMA**

* **LEXICON GOLBMALOGINJEALLJE**

* **LEXICON GAVCCILOGINJEALLJE**

* **LEXICON GUOKTELOGINJEALLJE**

* **LEXICON VIHTTALOGINJEALLJE**

* **LEXICON GOLBMALOGIVIHTTA**

* **LEXICON GAVCCILOGIVIHTTA**

* **LEXICON GUOKTELOGIVIHTTA**

* **LEXICON VIHTTALOGIVIHTTA**

* **LEXICON GOLBMALOGIGUHTTA**

* **LEXICON GAVCCILOGIGUHTTA**

* **LEXICON GUOKTELOGIGUHTTA**

* **LEXICON VIHTTALOGIGUHTTA**

* **LEXICON GOLBMALOGICIEZA**

* **LEXICON GAVCCILOGICIEZA**

* **LEXICON GUOKTELOGICIEZA**

* **LEXICON VIHTTALOGICIEZA**

* **LEXICON GOLBMALOGIGAVCCI**

* **LEXICON GAVCCILOGIGAVCCI**

* **LEXICON GUOKTELOGIGAVCCI**

* **LEXICON VIHTTALOGIGAVCCI**

* **LEXICON GOLBMALOGIOVCCI**

* **LEXICON GAVCCILOGIOVCCI**

* **LEXICON GUOKTELOGIOVCCI**

* **LEXICON VIHTTALOGIOVCCI**

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/numerals.lexc](https://github.com/giellalt/lang-sme/blob/main/src/fst/morphology/stems/numerals.lexc)</small>
