# Grammatikkontrollting som må rettast før lansering

* manglande blåstrek ved (feil) høgre hermeteikn:
  > «Čohkken áiggiid čađa buoremus sámi artisttaid»
  - her får fyrste hermeteikn blåstrek under både seg sjølv og dei to neste orda (hadde klart seg med det fyrste :), medan siste hermeteikn berre får blåstrek under seg sjølv - burde ha vore under føregåande ord

* forslag har liten bokstav sjølv om input har stor/er fyrst i setninga
  > Beahcevuovdi ja gulluluvvan šattut leat ritnon ja eana bihcon Kárášjogas. Eana lea ráhkkaneamen dálvái. Maŋimuš vahkku lea maid moadde muohtačalmmi seivon eatnamii ja dasa bisánan. Maŋŋebárgga lei johka áibbas vuodjagoalki, beaivváš báittii balvvahis almmis ja lei čoaskkis. Bajábeal Kárášjoga šalddi lei Kárášjohka jiekŋumin. Farga lea skábma ja beaivváš ii leat nu badjin almmis go láve. Guovddášbeaivvi lea suoivvan guhkki. Dán sotnabeaivvi, golggotmánu 26. beaivvi, álgá fas dálveáigi. Dalle bonjasta tiimmu tiimmu maŋos tiibmu golmmas tiibmu guoktái. Easkka njukčamánu 29. beaivvi beasat fas bonjastit tiimma geasseáigái.
  - => Forslaget for Bajábeal skal vera med stor bokstav

* vi må analysera korrekt uttrykk som *«gielda- ja ođasmahttinministtar»*, slik det er no får vi blåstrek på det fyrste ordet pga bindestreken

* Grammatikkontrollen har ikkje noko påskeegg. "nuvviDgrammar" er eit godt framlegg til triggerord, parallelt med "nuvviDspeller".

* ved to feil på same ord kjem det ingen blåstrek:
  > De galgá  fas cegget skáluid ja álgit gaikut.
  * => galgá: både &real-galgá og "&double-space-before &LINK"
  * => forslag til løysing: velja den eine (alfabetisk?) og vis den, deretter køyr på nytt
* vi må sjå over alle tilbakemeldingane, sjekka at dei er gode, saklege og ikkje for lange
* fiksa alle feil melde i Bugzilla og andre stader


# FIXED

* få vekk blåstrek for manglande mellomrom etter punktum, når punktumet står sist i avsnittet
* robuste forslag, ikkje ekstra ord:
  > Vulogeahčen maŋemus vuosttu  ceggejit lágideaddjit lávu  gos oasseváldit sáhttet bosihit

  * vuosttu  ceggejit blir retta til: vuosttu maŋemus  ceggejit (som i seg sjølv inneheld originalfeilen, to mellomromg)
  * og same sak for: «lávu  gos» i den same setninga

* blå bylgjeline under blankteiknsfeil (må dekkja ordet før eller etter, ev begge)
* ved manglande mellomrom kring punktum osb, må blåstreken strekkja seg til både ordet før og ordet etter, og vi må generera forslag
* forslag til retting for blankteiknsfeil (set inn/ta vekk blankteiknet)
* feilmeldingane må vera forståelege (ikkje: syn-inf-not-Der/h)
* vi må slå saman feilkategoriar til logiske grupper, så folk har noko overskodeleg å halda seg til (ikkje tusen kategoriar som no)
* alle «[SE]»-merka tilbameldingar til brukarane må omsetjast
* forenkla lista med feilkategoriar
