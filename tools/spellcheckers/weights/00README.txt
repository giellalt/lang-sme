This directory contains data for building a weighted fst for spell checking purposes. There are three editable source files:

* Makefile.am
* spellercorpus.raw.txt
* tags.reweight

Makefile.am
-----------

Contains two variables that can be changed if wanted:

GT_RAW_SPELLER_CORPUS   - name of file containing the raw corpus data (see next)
GT_CLEAN_SPELLER_CORPUS - name of file containing cleaned corpus data (generated)

The default value should be fine for most purposes. The template corpus file has
the default name.

spellercorpus.raw.txt
---------------------

This file contains the raw corpus text used as basis for the frequency weighting
of the speller fst. Replace the dummy content with real text in your language.

TODO: add a build option to use corpus text stored elsewhere, to avoid filling
up svn with replicas of corpus material.

tags.reweight
-------------

This file contains a list of tags for which we want to give specific weights.
This can be used both for morphology-based weighting (ie give a certain weight
to morphosyntactic tags) and to weight tags for other purposes, like to give a
very high weight to tags designating words that should never be suggested.

The weights are used when ranking suggestions for misspellings. The total weight
for a given suggested word form is the sum of:

* frequency weight (frequent words have less weight than less frequent words)
* tags-based weights
* the total weights coming from the error model to generate the suggestion

lemma-backoff.json
------------------

Weights for word forms the corpus never saw.

The corpus LM prices a word form by its own frequency. A form that does not
occur in the corpus has no frequency, so corpus2unigramlm.py gives it the OOV
weight -- which, because the coefficient is maxweight / -log10(unkprob), is
exactly maxweight. Every unseen form in the lexicon therefore carries the same
weight: an unseen inflection of `leat` costs what an unseen derivation of a
lemma nobody has written down costs. The analyser knows the difference and the
weighting was throwing it away.

corpus2lemmaweights.py runs the corpus vocabulary through the normative
analyser, counts lemmas, and prices an unseen form by its lemma:

    weight(L) = maxweight - alpha * slope * log10(count(L) + 1)

anchored so that a lemma the corpus never saw keeps exactly the weight it had
before. Nothing gets heavier; frequent lemmas get a discount.

`slope` is measured, not chosen. Splitting the corpus 90/10 and asking how
often a form the training split never saw turns up in the held-out split gives,
per lemma-frequency decade:

    log10(count)   lemmas   new forms   p(unseen slot fires)
             1     14861        1079    7.8e-06
             2      3863         856    2.7e-05
             3       945         589    9.4e-05
             4       125         165    2.4e-04

which is a straight line in log-log with R2 = 0.83 and a slope of 0.343 log10
units per decade -- 2.63 weight units at this corpus size. So `slope` is 2.6329
and `alpha` is 1, meaning the model is used at the strength the corpus
measured; alpha scales it up or down without refitting.

Asking the same data the other way round -- predict a held-out form's *count*
from its lemma and tags -- gives nothing (R2 = 0.003): conditioned on occurring
at all, a rare form occurs once or twice whatever its lemma. Occurrence is the
event lemma frequency predicts, not frequency-given-occurrence, and the speller
is choosing between candidates rather than estimating a rate.

Note what this does to a rare form of a common lemma that *is* in the corpus:
the lexicon path and the corpus path are unioned and the cheaper wins, so a
form seen thirteen times whose lemma is very common ends up priced by its lemma
rather than by its thirteen occurrences. That is backoff smoothing and it is
intended -- thirteen occurrences is a bad estimate -- but it means corpus
weights below roughly count 60 are interpolated toward the lemma prior rather
than used as-is.

`min-count` keeps lemmas below it out of the table. They would get a discount
under one weight unit, and every lemma in the table doubles a path in the
speller lexicon, so the cheap ones are not worth the states.

Other files
-----------

There are other files in that dir:

* Makefile.am
* corpus2lemmaweights.py
* word-boundary.att
* word-boundary.relabel
* word-boundary.txt

