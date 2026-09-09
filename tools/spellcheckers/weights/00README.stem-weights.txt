Stem-level lemma-frequency weights
==================================

PROTOTYPE. Nothing here is enabled by default; see "Turning it on" below.

The proposal this implements, verbatim: "use the full analyser pipeline (with
disambiguation and all), then calculate the frequencies, and store the
frequencies in the stem lexicons."

Verdict up front: it works, it costs almost nothing, and it does not help.
Best case is +9 first-position out of 10 675 on typos.tsv at alpha 0.5, all of
it in one half of an even/odd split, and it is negative from alpha 1 up.

This is the third attempt at getting lemma frequency into the speller. The
earlier one is described in 00README.txt (the `lemma-backoff.json` section) and
was accuracy-neutral. This one differs from it on every count it could have
been wrong on -- the frequencies come out of a fully disambiguated pipeline,
they apply to every form rather than only out-of-corpus ones, and they are
added to the corpus weight rather than min'd against it -- and the answer comes
out the same. The numbers are in section 5. Section 2 is the other result: the
obvious non-invasive injection cannot be built at a usable size at all, which
is worth knowing before anyone tries it again.


Files
-----

    corpus2stemcounts.sh      corpus -> per-stem token counts, the whole
                              tokenise/analyse/disambiguate/count pipeline
    stemcounts.py             the stages of it that are not a shell one-liner
    stem.counts.tsv           the output: stem TAB token count (generated)
    stemweights2lexc.py       counts + alpha -> lexc entry weights (a filter)
    stem-weights.json         alpha, min-count, quantum
    corpus2stemweights.py     the REJECTED injection: counts -> a weighted
                              lemma trie for composition. Kept because the
                              measurement below is the argument against it.
    ../../../src/fst/morphology/Makefile.mod-stem-weights.am
                              the live hook
    ../Makefile.mod-stem-weights.am
                              the rejected hook


1. The frequency pipeline
-------------------------

    preprocess          tokenise, with tools/tokenisers/abbr.txt
    hfst-lookup         analyse, with src/fst/analyser-disamb-gt-desc.hfstol
    lookup2cg           lookup output -> CG cohorts
    vislcg3             src/cg3/disambiguator.cg3
    count               surviving readings -> per-stem token counts

on tools/spellcheckers/weights/spellercorpus.raw.txt. Measured:

    corpus                     155 792 lines, 30.4 MB
    tokens                   3 811 567          (preprocess, 16 s)
    types                      177 401
    analyses                   991 896 readings (hfst-lookup, 17 s)
    cohorts                    177 401 types    (lookup2cg, 2 s)
    CG, 18-way parallel                          18 min wall
    readings after CG        3 908 459          = 1.025 per token
    reading -> stem matched  3 902 604          = 99.85%
    tokens with no analysis      6 459          = 0.17%
    stem-unique tokens       3 759 093          = 98.8%
    stem-ambiguous tokens       46 015          = 1.2%
    distinct stems              83 764
    of those, with a letter     70 086          (3 034 202 tokens)

Only the 177k types are looked up, not the 3.8M tokens; the analyser is a
function, so the cohorts are cached per type and the token stream is expanded
from the cache. CG is the slow stage and the stream is split at paragraph
marks, which are CG delimiters, so no window is cut.

`cut -f1,2` between hfst-lookup and lookup2cg is not optional. lookup2cg
deletes tabs inside the analysis field, so hfst-lookup's weight column arrives
glued to the last tag (`... Sg Gen10.000000`), and CG then matches nothing.
Every rule keyed on a final tag silently stops firing.

Disambiguation bites, hard. Before CG, 19.8% of tokens are stem-ambiguous and a
token proposes 1.236 stems on average; after CG that is 1.2% and 1.014. What
the earlier experiments did instead -- split a type's tokens evenly over the
stems its analyses propose -- gets the big homonyms exactly wrong:

    stem            even split      disambiguated
    sámediggi         20 356.2         1 471.7     (-93%)   common noun
    Sámediggi         19 217.2        38 101.7     (+98%)   the institution
    mii               37 040.7        52 181.0     (+41%)
    mun               11 453.5         6 854.5     (-40%)
    Norga              3 836.8         8 925.3    (+133%)
    norga              3 557.8            47.8     (-99%)
    Lea                1 853.3            79.0     (-96%)   proper name
    oahppat            6 154.8         1 369.9     (-78%)   'to learn'
    oahppi             3 379.0         6 612.0     (+96%)   'pupil'
    viessut              127.6             0.0    (-100%)   'to live'
    viessu               297.6           289.0              'house'
    guohtut            1 443.4           753.6     (-48%)
    guohtun              995.4         1 506.1     (+51%)

1 480 stems present in the even-split table have no disambiguated mass at all:
they are readings CG always rejects.

The stem key is the analysis prefix before its first tag, which is what a lexc
stem entry carries. lookup2cg rewrites that prefix for compounds, so each
analysis is passed through lookup2cg a second time with its own stem appended
as a marker tag; stripping the marker recovers the canonical cohort line and
gives a (type, reading) -> stem map that the CG output is read back through.
The CG stream itself carries no marker, so the disambiguation is the stock one.


2. Injection: what does not work
--------------------------------

The non-invasive design -- keep the change inside tools/spellcheckers, compose
a lemma-keyed weight transducer onto the LEXICAL side of the finished speller
so the weight reaches every inflection -- was built (Makefile.mod-stem-weights.am
in tools/spellcheckers, corpus2stemweights.py) and it does not work. Not
"scores badly": it cannot be built at a usable size.

The transducer is `Trie x Tag x ?*` unioned with a `?*` fallback carrying the
unlisted-stem weight, composed with `-F` onto
generator-desktopspeller-gt-norm-unit_weighted. It is correct path by path --
`viessu+N+Sem/Build+Sg+Loc` goes from 40.3646 to 43.1146, which is its corpus
weight plus `viessu`'s 2.75 -- and the composition itself is cheap (a few
seconds, 795 MB peak). The problem is what it does to the machine:

    speller lexicon                       873 449 states
    after composition                   1 969 433 states   (2.25x)

The union has two branches and every listed stem's path exists on both, so the
whole sublexicon reachable after a listed stem is duplicated. The duplication
is not recoverable downstream. hfst's weighted determinization runs inside a
2 000 000-state / 4 194 304-subset-element envelope, and the composed machine
is past it, so `hfst-minimize` gives up ("preserving the exact input language
without further minimization") -- and so does the shared step-5 xfst script
that does `set encode-weights ON`. That leaves the final generator at 68 MB
instead of 35 MB, and since the acceptor rule's HFST_MINIMIZE_SPELLER is
`hfst-remove-epsilons` -- it does not minimise at all -- the acceptor comes out
at 295 MB instead of 35.7 MB. Measured on typos.tsv at the shipped config:

                     top1     top5      any
    baseline         9155    10379    10547
    composed         8765     9954    10127

That is a coverage loss, not a ranking one: 420 words lose the correct
suggestion entirely, because the search budget is spent walking duplicate
paths.

Three ways out were measured and all are worse:

  * Shrink the table. min-count 500 leaves 838 stems and still gives
    1 572 116 states. The frequent stems are exactly the productive
    compound-initial ones, so their sublexicon is most of the lexicon.

  * Make the transducer unambiguous by replacing the `?*` fallback with the
    real complement -- the lexicon's own stem language (extracted as a
    188 395-state DFA) minus the listed stems. Deterministic, single-branch,
    and 23 626 385 states / 2.0 GB after composition. The minimised lexicon
    shares stem *suffixes*; tracking any stem automaton against it
    de-minimises the whole stem region. The `?*` fallback is cheap precisely
    because it is one state and remembers nothing.

  * Complement `?*` directly. 52 157 776 arcs, 836 MB, before composing
    anything.

The conclusion is structural, and it is the reason the proposal says "in the
stem lexicons" rather than "on the finished speller": a stem weight has to be
attached while the lexicon still distinguishes stems, i.e. before minimisation.
After minimisation the information is gone and re-deriving it costs the
minimisation back.


3. Injection: what is used
--------------------------

A lexc entry may carry a weight in its gloss:

    viessu+N+Sem/Build:viess GOAHTI-A "house N weight: 2.7500" ;

hfst-lexc puts it on the entry's own arc before the lexicon is determinised and
minimised. Every path through the stem pays it once, every inflection inherits
it, and the cost is nil: with all 159 410 stem entries priced, the speller
acceptor goes from 35.70 MB to 36.27 MB (alpha 0.25) .. 36.60 MB (alpha 4) and
the zhfst from 229.96 MB to 230.35 .. 230.59 MB, with no determinization budget
warnings anywhere in the build. Build time is unchanged: about a minute for the
morphology and five for the speller, the same as without it.

No file under src/fst/morphology/stems/ is edited. The hook overrides the
generated `.generated/lexicon.lexc` rule and pipes the concatenated lexc
through stemweights2lexc.py, so the weights exist only in the build tree.
stemweights2lexc.py is a filter, never an in-place editor: a line that gets no
weight is copied byte for byte, and a line that does is spliced. At alpha 0 the
output is byte-identical to the input (`cmp` clean), which is the null control
for the whole harness.

Scope, and the main thing to settle before this ships: the weights go into the
shared morphology, so they appear in every analyser and generator built from
it, not only in the speller. That is inherent to putting frequency in the stem
lexicon. Anything downstream that reads absolute weights out of
analyser-gt-desc, or takes an n-best from a generator, sees them.


4. Weight design
----------------

    w(L) = alpha * ( log10(Fref + 1) - log10(count(L) + 1) )

quantised to `quantum` (0.25), floored at 0, with Fref the largest stem count
in the table. A stem below `min-count`, or one the corpus never saw at all,
pays the full `alpha * log10(Fref + 1)`.

Written as a penalty rather than a discount so no arc goes negative -- the
speller acceptor is converted to olw and searched by shortest path, and
negative arcs are not worth the risk. The most frequent stem pays 0 and
everything else pays more; ranking only sees differences, so this is the same
model as a discount.

With the sme corpus, Fref = 167 303 (`ja`) and the span is 5.224, so alpha is
"weight units per decade of stem frequency" and the whole stem term is
`5.22 * alpha` wide.

For scale, measured on the same corpus: the surface LM prices a *form* at 9.89
if it is the most frequent one, 47.69 if it was seen once, and 50 if it was
never seen -- 37.8 units over 5.2 decades, about 7.2 units per decade. The tag
weights spend +5 (+Prop) to +45 (+Cmp). Best-path weights on real words sit
around 25..63 today, so alpha 1 moves them to 25..68 and alpha 7.2 would make
the stem term exactly as steep as the form term.

min-count 5 puts 20 779 of the 70 086 stems in the table. The rest are within
`alpha * log10(6)` = 0.78 * alpha of the unlisted weight, which is what the
threshold buys: 49 307 fewer distinct weights for the lexicon to keep apart.

The unlisted weight has to be written out. Leaving unlisted entries at lexc's
default weight of 0 does not mean "no opinion", it means "as frequent as the
most frequent stem in the language" -- and that is 138k of the 159k stem
entries. An earlier run of this prototype did exactly that, and it cost 38
first positions at alpha 1 and 269 at alpha 4, monotone in alpha, which is what
an inverted model looks like from outside. stemweights2lexc.py therefore prices
every stem entry it recognises, not only the ones in the table.

Double counting -- decided, and this is the substantive difference from the
earlier attempts. The stem weight is ADDED to whatever the surface model
already says, including for forms the corpus has seen. A lexc stem weight is on
the stem entry and every path through it pays, so this is what the proposal
asks for; and the alternatives (take the min, or apply the stem weight only
where the corpus has no form) are precisely what the surface-side lemma-backoff
did, with the result recorded in 00README.txt. A seen form is therefore priced
by its own frequency *and* by its lemma's, which is a real double count, and
alpha is the knob that says how much of it to do.

One consequence worth noting: in lexc a compound path runs through every
component's stem entry, so a compound pays the sum of its components' stem
penalties. The composition design would only have priced the first component.
Compounds already carry +45 from tags.reweight, so this is not the dominant
term, but it is not nothing either.


5. Results
----------

Baseline is the shipped configuration (scratch cfg-ship.json: n-best 100,
beam 80, budget 1e6, start/end 10, mid 5, word-split 50) on
tools/spellcheckers/test/typos.tsv (10 675 scored) and on the errorort eval set
(2 733). Train/held-out are the even/odd halves of each file.

typos.tsv, 10 675 scored, as absolute and as delta from baseline:

                    FULL              tuning half      held-out half
    alpha      top1        top5        top1              top1        top5
    0 (base)   9155        10379       4579              4576        5199
    0.25       9164   +9   10380   +1  4579    +0        4585   +9   5200  +1
    0.5        9164   +9   10383   +4  4578    -1        4586  +10   5201  +2
    1          9152   -3   10382   +3  4567   -12        4585   +9   5202  +3
    2          9112  -43   10373   -6  4539   -40        4573   -3   5194  -5
    4          8991 -164   10348  -31  4476  -103        4515  -61   5182 -17

errorort eval, 2 733 scored, report-only:

    alpha      top1        top5
    0 (base)   1742        2048
    0.25       1742   +0   2050   +2
    0.5        1742   +0   2051   +3
    1          1742   +0   2053   +5
    2          1734   -8   2048   +0
    4          1709  -33   2035  -13

test/typos-generated-err.tsv, the 167 704-pair set generated from the
lexicalised +Err/ entries, run at alpha 0.5 only, as the power check on the
+9 above:

    alpha        top1            top5           any
    0 (base)   139124          159690         162707
    0.5        139174   +50    159695    +5   162694   -13

and by half, tuning / held-out:

    0 (base)    69587 / 69537   79890 / 79800
    0.5         69605 / 69569   79891 / 79804
    delta         +18 /   +32      +1 /    +4

+50 first positions in 167 704 is +0.030%. The same speller gave +0.084% on
typos.tsv, so the effect shrinks threefold on the set with sixteen times the
power; top-5 is flat (+5, i.e. +0.003%) and `any` goes the other way by 13.
Both halves do move the same way here, which the typos split did not -- but
they move by nothing. This is the measurement that settles it: the stem term is
not a small win being hidden by noise, it is zero.

The curve peaks between 0.25 and 0.5 at +9 first-position out of 10 675 --
+0.08% -- and is negative from alpha 1 up. Take the peak seriously for a
moment and it does not survive the split: the whole +9 comes from the held-out
half (+9, +10, +9 at alpha 0.25, 0.5, 1) while the tuning half gives 0, -1,
-12. An effect that appears in one half of an arbitrary even/odd split and not
the other is noise. The one consistent thing across the small-alpha runs is
errorort top-5, +2/+3/+5, which is 0.1-0.2% of that set.

What moves, at alpha 0.5 on typos.tsv: 24 words gain first place, 15 lose it,
85 improve rank and 49 worsen -- 9 net out of 10 675, from 173 words that moved
at all. At alpha 1: 44 gained, 47 lost, 132 improved, 103 worsened. The losses
are not concentrated in proper nouns (at alpha 1, 10 of 47 losses have an
upper-case target against a 19% base rate), so this is not the "rare name
outranked by a common word" story; it is the general one.

Cost of the change, at alpha 0.5: acceptor 35.70 -> 36.37 MB, zhfst 229.96 ->
230.43 MB, mean lookup 101.4 -> 101.8 ms over typos.tsv (base 101.4, alpha 1
101.4, alpha 2 103.0, alpha 4 99.4 -- i.e. no measurable change).

Where the movement comes from is the interesting part, and it is the opposite
of what the model predicts. 59% of the targets in typos.tsv are word forms the
corpus has seen. Splitting the alpha-0.5 movement by that:

                    target seen in corpus   target unseen
    gained first             13                   11
    lost first                3                   12
    net                     +10                   -1

The stem term is *meant* to earn its keep on the unseen side -- that is the
whole argument for it, since every unseen form is flat at 50 today and the
lemma is the only thing that distinguishes them. On the unseen side it breaks
even. What it actually buys is ten words on the seen side, where the corpus
already has a per-form count and the lemma term is a second, coarser copy of
the same evidence. That is not a mechanism that generalises; it is the shape of
a small in-sample correlation.

That also explains why alpha cannot be turned up. Past 1 the stem term starts
overriding form counts that are better estimates than it is, and the losses
compound: -43 at alpha 2, -164 at alpha 4.


6. Turning it on
----------------

    1. Build the counts (needs the Rust cg3 port; ~20 min):

           tools/spellcheckers/weights/corpus2stemcounts.sh /tmp/stemfreq

    2. Set alpha in weights/stem-weights.json.

    3. Add, as the LAST include in src/fst/morphology/Makefile.am:

           include $(srcdir)/Makefile.mod-stem-weights.am

    4. make -C src && make -C tools/spellcheckers

Dropping the include reverts the lexicon exactly; alpha 0 is byte-identical to
no injection at all. `preprocess`, `lookup2cg` (giella-core/scripts) and the
hfst tools have to be on PATH, and step 1 wants the Rust cg3 port -- override
VISLCG3 / CGCOMP if it is not at ~/git/necessary/cg3/target/release.

Do not compare acceptors by sha across rebuilds. Two builds from the same
lexicon.lexc at the same alpha produced acceptors with different shas
(e26d8bfd and ada30958) and zhfsts a byte apart, with identical accuracy to
the word -- 9164 / 10383 / 10545 both times. hfst-compose's budget-aware path
sizes itself against *available* RAM, so state numbering moves with machine
load. Compare the artefacts by measuring them, not by hashing them.


6b. Migrating to weights in the source lexc
-------------------------------------------

The stakeholder's eventual target is the weights living in
src/fst/morphology/stems/*.lexc rather than being injected at build time.
Nothing in the toolchain blocks that -- hfst-lexc reads `"weight: N"` from the
gloss either way, and stemweights2lexc.py already emits exactly the lines that
would be committed; running it per file instead of over the concatenation is a
one-line change to the hook. What the migration needs is four decisions, none
of them technical:

  * Refresh policy. The weights are a function of the corpus, and the corpus
    grows. Committing them means every corpus refresh is a 159 000-line diff
    across twelve files that no reviewer can read, landing on top of whatever
    lexicographers are editing. The build-time injection has no such diff. The
    only argument for source weights is wanting to *hand-tune* individual
    stems, and if that is the goal the two have to coexist: a hand-set weight
    has to survive regeneration, which means a marker convention the generator
    honours (it currently overwrites any `weight:` it finds).

  * Scope. Weights in the stem lexicon reach every analyser and generator built
    from the morphology, not just the speller. If the speller is meant to be
    the only consumer, the lexicon has to be built twice -- an unweighted one
    for analysis and a weighted one for the speller -- which roughly doubles
    the morphology build and needs a second lexicon.hfst target. Deciding this
    is a prerequisite, not a follow-up: it changes where the injection hook
    lives.

  * Coverage of the entry shapes. The injector prices an entry when its upper
    side has a lemma before its first tag; it deliberately skips entries whose
    "lemma" is a flag diacritic (`@R.SpellRlx.ON@+Err/Spellrelax:...`), ones
    with no letter in them (punctuation, digits), and regex entries
    (`< ... > Cont ;`). On the current lexc that is 159 410 priced entries out
    of 219 881 lines. Those exclusions are judgement calls and should be looked
    at by someone who knows the lexicon before they are frozen into source.

  * Variant stems. Several entries can share a lemma -- `viessu` also appears
    as `+Err/Orth` variants and as compound-initial `+Cmp/Sh` forms -- and each
    gets the same weight, which is right, since a path uses one of them. A
    compound path, though, goes through one stem entry per component and pays
    each. Whether a three-part compound should pay three stem penalties on top
    of its +45 is a modelling question this prototype does not answer.


7. If someone picks this up again
---------------------------------

The pipeline (section 1) is the part worth keeping. The counts are good, the
disambiguation earns its runtime, and stem.counts.tsv is reusable for anything
that wants sme lemma frequencies.

What is not established -- and now has been probed twice from opposite
directions without success -- is that a stem prior helps a speller whose
surface LM is trained on the same corpus. Note what the seen/unseen split in
section 5 rules out: the backoff variant (price a seen form by its own count,
an unseen one by its lemma) is the one 00README.txt already measured as
neutral, and this run says why. The unseen side is where backoff operates, and
that side broke even here even with disambiguated counts and full paradigm
coverage. Redoing backoff with better counts is not a promising next step.

What is left untested is the assumption underneath all three attempts:

  * Use a corpus the surface LM has not seen. Every number here is in-sample
    twice over -- the same 3.1M tokens set the form weights and the stem
    weights, so the stem term is largely a coarser restatement of the form
    term, which is exactly what section 5 measures. A stem prior estimated from
    a *larger, separate* corpus would carry information the form weights do not
    have, and it is the only version of this idea with a mechanism to help. It
    is also cheap to try: the pipeline in section 1 takes a corpus path, and
    nothing else in the prototype changes.

  * If that is done, sweep alpha again from scratch. The optimum found here
    (0.25-0.5, i.e. under a tenth of the form term's slope) is where a
    redundant feature lands. A genuinely independent stem prior should tolerate
    a much larger alpha, and if it does not, that is the answer.
