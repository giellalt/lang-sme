# Documentation North Sámi grammar checker beta


This grammar checker has been developed by Divvun, University of Tromsø 2019.
It is a combined spell- and grammar checker for North Sámi and checks regular spelling errors as previous versions of the spellchecker. 
In addition, it checks a number of formatting errors, punctuation errors and grammatical errors. 
Typos are misspelled words that are not part of the lexicon.
Formatting errors include one or several redundant spaces before punctuation marks (period, exclamation mark, comma).
Punctuation errors include for now only the use of quotation marks.
Grammatical errors affect the grammar of the sentence, such as compound errors and words that are not used correctly in the sentence. 
Compound errors include two (or more) adjacent words that should be written as one word or that should be joined by a hyphen, and compounds that should be written as two separate words.


# error types


## typos

`&typo`

Misspelled words are by default not recognised, and instead we run the spelling checker on them. The suggestions from the spelling checkers are then filtered slightly to try to provide only suggestions that fit in the context.
The word "juhkamša" is misspelled. The form does not exist. Instead, the grammar checker suggests "juhkamuša":

> 8B-luohká oahppit galget vuovdit biepmu ja juhkamša váhnenčoahkkima oktavuođas skuvllas.

The word "rehknastte" is misspelled. The grammar checker suggests "rehkenastte".

> Geavat cealkaga maid ráhkadit á-bihtás ja rehknastte man olu Miriam šaddá máksit jus oastá gávcci T-báiddi.

The word "rehkanstincealkaga" is misspelled. The grammar checker suggests "rehkenastincealkaga".

> Ráhkat rehkanstincealkaga mii heive bihttái.

## real word errors

`&real-hallan`

Real word errors are mostly spelling errors as well. However, the words do exist. They are just not the ones we were meaning to use. Here we need to take into account the whole sentence in order to see that the word is "wrong". Since we use the grammar of the whole sentence to identify the errors, they count as grammatical errors.
The word "oainnahallot" is not used correctly in this context. Instead it should be "oainnahallat", which is suggested by the grammar checker.

> Dat ferte oainnahallot ovdal go sáhttit báhčit dan, lohká son.

## case error in the first part of the compound

Compounds can have either nominative or genitive case in their first word. Some compounds, such as compounds with "biire" should have genitive case in their first word. The grammar checker marks "biireduopmár" as an error and suggests "biirreduopmár" instead.

* `&msyn-wrong-case-biirre`
* `&msyn-wrong-case-bismma`
* `&msyn-wrong-case-bismmá`
* `&msyn-wrong-case-fylkka`
* `&msyn-wrong-case-gieldda`
* `&msyn-wrong-case-gili`
* `&msyn-wrong-case-guovllu`
* `&msyn-wrong-case-leana`
* `&msyn-wrong-case-riikka`
* `&msyn-wrong-case-stivrra`

## compound errors &msyn-compound

### &msyn-addhyphen

The word "geahččalan" is the first part of a coordinated compound and should be followed by a hyphen, i.e. "geahččalan-".

> Ossodagat addet maiddái doarjaga dutkamii, geahččalan ja ovdánahttinbargui, ja servet riikkaidgaskasaš ovttasbargguide sin fágasurggiineaset.

The word "giella" is the first part of a coordinated compound and should be followed by a hyphen, i.e. "giella-".

> Guovdageainnus ja Diehtosiiddas leat maiddai eará guovddáš sámi ásahusat, nu go Sámedikki oahpahus-, giella ja kulturossodat, Sámi árkiiva, Gáldu- Álgoálbmotvuoigatvuođaid gelbbolašvuođaguovddáš ja Riikkaidgaskasaš boazodoalloguovddáš.

### &msyn-compound

The two words "atnu ávnnasin" should be written as one word "atnuávnnasin" since they are a compound in this sentence rather than two words with different functions in the sentence.

> Guollenáhkki lea árbevirolaš materiála mii geavahuvvo sihke čikŋan ja {atnu ávnnasin}.

The two words "guovddáš guovlluin" should be written as one word "guovddášguovlluin".

> Boazodoallu duvdojuvvo máŋgga bealis, ja dasa lassin lea boazolohku váttisvuohtan {guovddáš guovlluin} Finnmárkkus. 

The two words "gáhtta bargit" should be written as one word with a hyphen, i.e. "gáhttabargit".

> Oslos bohtet {gáhtta bargit} muitalit midjiide narkotihkkageavaheddjiid beaivválaš dilis.

This is according to [Riektačállinrávvagat page 60-66, 3.5$|https://www.samediggi.no/content/download/870/file/Riektačállinrávvagat.pdf]

The two words "Davvi Sápmái" should be written as one word with a hyphen, i.e. "Davvi-Sápmái".

> Danne son dagai mátkki {Davvi Sápmái} ja hálahii moadde badjebearraša oktan herggiiguin vuolgit su mielde stuorra čájáhussii Parisii 1878.

The two adjacent words "Davvi Suomas" should be conjoined by means of a hyphen, which is why the grammar checker suggest "Davvi-Suomas".

> Suopmelaš ođđaássiid deattu geažil sápmelaš ássan suttai goittotge johtilit oktii nu, ahte 1500-logus sápmelaččat eai šat gávdnon Davvi Suomas.

This is according to [Riektačállinrávvagat page 63, 3.5$|https://www.samediggi.no/content/download/870/file/Riektačállinrávvagat.pdf]

### &msyn-unspace-compound

In this sentence, the word "ovddasguvlui" should be written as two words. The grammar checker suggests two words, "ovddas guvlui".

> Sámediggeáirras Randi A. Skum (NSR) jearrá dasto odne gažaldagaid sámediggeráđđái ahte máid lea Sámediggeráđđi dássážii bargan čoavdindihti divatgažaldaga boazodoalus ja makkár strategiija lea Sámediggeráđis {ovddasguvlui} oažžun 	dihti 	vuoiggalaš divatortnega boazodollui.

In this sentence, the word "mánáguovttos" should be written as two words. The grammar checker suggests two words, "máná guovttos".

> {Mánáguovttos} geat leaba skuvla agis, šattaiga fáhkkestaga dárogielat skuvlii.

## quotation mark error

The grammar checker corrects wrongly formatted quotation marks as in the following sentence. 

> «Čohkken áiggiid čađa buoremus sámi artisttaid»

It is corrected to:

> ”Čohkken áiggiid čađa buoremus sámi artisttaid”

Both left and right quotation marks should be _”_.
This is according to [Riektačállinrávvagat page 21-23, 1.8$|https://www.samediggi.no/content/download/870/file/Riektačállinrávvagat.pdf]

* &punct-aistton
* &punct-aistton-both
* &punct-aistton-left
* &punct-aistton-right

## space errors after punctuation marks

### &double-space-before

Here the sentences are separated by two or more spaces, which is corrected to one space by the grammar checker.

> álgit gaikut.  Stoagus joatká

⇒

> álgit gaikut. Stoagus joatká

### &no-space-after-punct-mark

The grammar checker adds a space after a punctuation mark if it is missing as in the following sequence.

> Bonju dán!Lassin.

⇒

> Bonju dán! Lassin.

### &punct-end

### &space-after-paren-beg

### &space-before-paren-end

> áddejumi )

⇒

> áddejumi)

### &space-before-punct-mark

A removal of the space before the punctuation mark (period, comma, semicolon, question mark, exclamation mark) is suggested by the grammar checker.

> Son gii njeaidá skáluid šaddá eret vuolgit .

⇒

> Son gii njeaidá skáluid šaddá eret vuolgit.

And:

> Duođaid máhttet buori musihka ráhkadit, muhto gos lea iešvuohta mii muitala ahte dát lea Inuihtta joavku ? 

⇒

> Duođaid máhttet buori musihka ráhkadit, muhto gos lea iešvuohta mii muitala ahte dát lea Inuihtta joavku?

----

# Alle feiltypar

For kvar feiltype, skriv:

* forslag til namn på feilen for brukarane (sjå og jf med errors.xml.in)
* ei skildring av kva feilen er, korleis vi rettar han, og kvifor, med referanse til normerande tekst (Riektačállinrávvagat (paragrafnummer), GG (lenke til vedtak på nett, dersom det finst), Nickel (paragrafnr), osb)
* ev. (generelle) døme på feil og retting

Lagre dokumentet i:

`xtdoc/divvun/src/documentation/contents/xdocs/korrektur/userdocs/`

&corr-not-compound
&double-space-before
&msyn-addhyphen
&msyn-compound
&msyn-unspace-compound
&msyn-wrong-case-biirre
&msyn-wrong-case-bismma
&msyn-wrong-case-bismmá
&msyn-wrong-case-fylkka
&msyn-wrong-case-gieldda
&msyn-wrong-case-gili
&msyn-wrong-case-guovllu
&msyn-wrong-case-leana
&msyn-wrong-case-riikka
&msyn-wrong-case-stivrra
&no-space-after-punct-mark
&punct-aistton
&punct-aistton-both
&punct-aistton-left
&punct-aistton-right
&punct-end
&real-hallan
&space-after-paren-beg
&space-before-paren-end
&space-before-punct-mark
&typo
