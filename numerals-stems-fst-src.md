
# North Saami numerals





## The initial lexica

* **LEXICON Numerallexica**  initial lexica

The **LEXICON CmpNumeralcompounds**  lexicon is the entrance for compounds
with numbers. Introduced to restrict such compounding
to a subgroup of numerals only, mainly to exclude
roman numerals, that turned out to be too problematic.
With this change, roman numerals are only recognised
on their own.




* **LEXICON MILJONmiljards**  miljons and miljards




* **LEXICON OVERDUHAT1000.** for the numerals over 1000.





* **LEXICON O-OKTAFJUSTDUHAT.** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.


* **LEXICON O-2TO9FJUSTDUHAT.** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.

* **LEXICON 1TO9DUHAT**@CODE@****




* **LEXICON O-JUSTLOGIFetc.** This lexicon is for the number 10 000 only. it is separated from the rest to avoid forms like *logivihttaduhát, etc.



* **LEXICON O-LOGIFavoided.** this lexicon is accessed only via other O-lexica, and not directly from OVERDUHAT. Thus, *logivihttaduhát, etc. is avoided.



* **LEXICON O-2TO9LOGJUSTDUHAT.** All the child lexica of OVERDUHAT have the prefix O-. They are directed via their respective numerals to the lexicon JUSTDUHAT.



* **LEXICON O-NUPPELOTthousands**  Teens of thousands

* **LEXICON O-NL**@CODE@****

* **LEXICON O-NUPPELOHKAI**@CODE@****




* **LEXICON O-CUODIthousands** Hundreds of thousands

* **LEXICON O-2TO9CUO**@CODE@****

* **LEXICON O-GCUO**@CODE@****


* **LEXICON DUHAT**@CODE@****



* **LEXICON JUSTDUHAT1000** for numerals going via 1000




* **LEXICON OLDetc.** for the old counting thirteen hundred etc.

* **LEXICON NLX**@CODE@****


* **LEXICON NUPPELOHKAICUODI**@CODE@****




* **LEXICON UNDERDUHAT1000**  the numerals under 1000


* **LEXICON ONLY_CMP**@CODE@****


* **LEXICON OKTAF**@CODE@****


* **LEXICON 2TO9F**@CODE@****


* **LEXICON 11TO99F**@CODE@****



* **LEXICON BARELOGIF**@CODE@****

* **LEXICON LOHKI**@CODE@****


* **LEXICON 2TO9LOG**@CODE@****


* **LEXICON 21TO99**@CODE@****


* **LEXICON 111TO119**@CODE@****


* **LEXICON CUODI**@CODE@****



* **LEXICON 2TO9CUO**@CODE@****

* **LEXICON GCUODI**@CODE@****


* **LEXICON 1TO9CUODI**@CODE@****





* **LEXICON NUPPELOGIS**@CODE@****


* **LEXICON LOHKAI-END**@CODE@****

* **LEXICON ARABICCOMPOUNDSpart,**  ! arabic as first part,


* **LEXICON NUMERALCOMPOUNDSduhatjienat,**: numeral as first part: duhatjienat,
logigielat, etc.

* **LEXICON SASSASCont** gives :»»» and goes to SASCont







* **LEXICON num-ordinalnumbers** Ordinal numbers

* **LEXICON num-ordinal-1vuosttaš** Ordinal numbers vuosttas, vuosttaš

* **LEXICON num-ordinal-2to9differenty** Ordinal numbers, 2 to 20, even though the name implies differenty


* **LEXICON VUOSTTAS**@CODE@****


* **LEXICON num-collectivenumerals** Collective numerals





* **LEXICON num-imprecisenumbers** Imprecise numbers



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








* **LEXICON ONLY_OKTA**@CODE@****


* **LEXICON LOGIF**@CODE@****


* **LEXICON NUPPELOHKAI**@CODE@****



* **LEXICON GOLBMALOGIOKTA**@CODE@****

* **LEXICON GAVCCILOGIOKTA**@CODE@****


* **LEXICON GUOKTELOGIOKTA**@CODE@****

* **LEXICON VIHTTALOGIOKTA**@CODE@****

* **LEXICON GOLBMALOGIGUOKTE**@CODE@****

* **LEXICON GAVCCILOGIGUOKTE**@CODE@****


* **LEXICON GUOKTELOGIGUOKTE**@CODE@****

* **LEXICON VIHTTALOGIGUOKTE**@CODE@****

* **LEXICON GOLBMALOGIGOLBMA**@CODE@****

* **LEXICON GAVCCILOGIGOLBMA**@CODE@****


* **LEXICON GUOKTELOGIGOLBMA**@CODE@****

* **LEXICON VIHTTALOGIGOLBMA**@CODE@****

* **LEXICON GOLBMALOGINJEALLJE**@CODE@****

* **LEXICON GAVCCILOGINJEALLJE**@CODE@****


* **LEXICON GUOKTELOGINJEALLJE**@CODE@****

* **LEXICON VIHTTALOGINJEALLJE**@CODE@****

* **LEXICON GOLBMALOGIVIHTTA**@CODE@****

* **LEXICON GAVCCILOGIVIHTTA**@CODE@****


* **LEXICON GUOKTELOGIVIHTTA**@CODE@****

* **LEXICON VIHTTALOGIVIHTTA**@CODE@****

* **LEXICON GOLBMALOGIGUHTTA**@CODE@****

* **LEXICON GAVCCILOGIGUHTTA**@CODE@****

* **LEXICON GUOKTELOGIGUHTTA**@CODE@****

* **LEXICON VIHTTALOGIGUHTTA**@CODE@****

* **LEXICON GOLBMALOGICIEZA**@CODE@****

* **LEXICON GAVCCILOGICIEZA**@CODE@****


* **LEXICON GUOKTELOGICIEZA**@CODE@****

* **LEXICON VIHTTALOGICIEZA**@CODE@****

* **LEXICON GOLBMALOGIGAVCCI**@CODE@****

* **LEXICON GAVCCILOGIGAVCCI**@CODE@****


* **LEXICON GUOKTELOGIGAVCCI**@CODE@****

* **LEXICON VIHTTALOGIGAVCCI**@CODE@****

* **LEXICON GOLBMALOGIOVCCI**@CODE@****

* **LEXICON GAVCCILOGIOVCCI**@CODE@****

* **LEXICON GUOKTELOGIOVCCI**@CODE@****

* **LEXICON VIHTTALOGIOVCCI**@CODE@****
* * *
<small>This (part of) documentation was generated from [../src/fst/stems/numerals.lexc](http://github.com/giellalt/lang-sme/blob/main/../src/fst/stems/numerals.lexc)</small>