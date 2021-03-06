Introduction
============

As the work has progressed, several problems have come up and been
resolved, not the least due to generous input from colleagues at Xerox.
Parts of the discussions are reprinted here, for future reference.

The Letters
===========

Shortening
----------

    [Trond:]
    I have problems understanding a set of rules, cf. the following quote
    from my rule file (it works, now, but I do not understand why) (Note that
    "Shortening" below is the Saami linguistic term for the u-o and i-e
    althernation, the lax vowels are percieved as shorter than the tense
    ones):

    "Vowel Shortening in Compounds after Long 1st Syllable 1"
       Vx:Vy <=> [ Vow Vow | á ] Cns:+ Cns: _ StemCns:* X7: ;
                             where Vx in (u i)
                                     Vy in (o e)
                             matched ;
    ! The following 1st line was removed from this rule:
    ! Vx:Vy <=> [ Vow Vow | á ] Cns:+ Cns _ StemCns:* [ X7: | X8: ] ;
    ! the problem with this one was that it was not restricted to compounds
    !!
    ! The X7: | X8: line was commented out since no lexicon in sme-lex.txt
    ! pointed from X8 to R. This move should be checked for compounds later.

    KRB:  I don't understand the use of X7 and X8, of course, but I
    note that there are a couple of differences between the current
    rule and the line commented out:

      1.  The current rule has Cns:+ Cns:  in the left context.  The
      commented out rule had   Cns:+ Cns
      I.e. in the current case, you need to match at least 2 Cns
      symbols ON THE UPPER SIDE.  In the commented out context,
      you need to match at least one Cns on the upper side, followed
      by a Cns that appears on both the upper and lower sides.

      2.  The other difference, of course, is that the current rule
      needs an upper side X7: to fire.  It won't fire with an X8:

    Is that helpful?  I assume you know about how "local variables"
    work in twolc rules.  But just in case,  here Vx and Vy are
    local variables, defined in the 'where' clause.  Vx ranges over
    the set (u i) and Vy ranges over the set (o e).  The 'where'
    clause also states that the ranges are "matched", meaning that
    u corresponds to o, and i corresponds to e.  So the rule, as
    written, is a shorthand for the two following rules:

    "Rule 1"
    u:o <=> [ Vow Vow | á ] Cns:+ Cns: _ StemCns:* X7: ;

    "Rule 2"
    i:e <=> [ Vow Vow | á ] Cns:+ Cns: _ StemCns:* X7:


    !"Vowel Shortening in Compounds after Long 1st Syllable 2"
    !  Vx:Vy <=> [ #: | Cns ] Vz Cns+ Cns: Cns+ _ StemCns:* [ X7: | X8: ] ;
    !                       where Vz in (a i o u) ;
    !                       where Vx in (u i)
    !                               Vy in (o e)
    !                       matched ;
    ! XXX Remainder! This rule is commented out since including it
    ! spoils the i:á alternation of verbs (boahtiQ4n:boad1á, for some
    ! reason.
    ! This should be looked into.

    There are several very difficult problems encountered when writing
    two-level rules.
      1.  You have to be very careful about writing the contexts, which
          are themselves "two-level".  Note that the example above has
          Vz  Cns+ Cns: Cns+

          in the left context, which is somewhat suspicious.  Vz is
          equivalent to Vz:Vz, i.e. the same symbol on both sides.
          Then Cns+ matches one or more Cns symbols (on both sides),
          Cns: matches a Cns JUST ON THE UPPER SIDE, and another
          Cns+ matches one or more Cns symbols ON BOTH SIDES.

          In two-level rules, it is as easy to make your contexts TOO
          specific as it is to make them too general.

          Very often you need to write something like c:, matching
          only on the upper side, if some other rule in your system
          is (simultaneously) mapping that c to something else, like
          a k, or an empty string, on the lower side.  In such a case,
          writing c, which is equivalent to c:c, is too specific.
          When you write
          or edit a two-level rule, you have to be aware of what all
          the other rules in the set are trying to do at the very
          same time.

      2.  Rule clashes.  The rule spoils the i:ï¿½alternation probably
          because it _clashes_ with the rule controlling i:ï¿½  I.e.
          there exists one or more upper-side input strings that match
          both rules, and one rules tries to map the lexical i to a
          surface e, and the other rule
          tries (simultaneously) to map the same lexical i to a surface ï¿½
          Instant rule clash.

          Looking at the two clashing rules together, you need to understand
          exactly WHY they are clashing and rewrite one or both of them
          so that the i:e alternation will occur always and only in the
          places where it is appropriate, and at the same time, the i:á
          alternation occurs always and only in the places where it is
          appropriate.

          The twolc rule compiler is very good at detecting the POSSIBILITY
          of a clash, even if your language never presents such a possibility
          to the rules.  In such a case, you might consider using the
          load-lexicon feature (see the twolc documentation) to block the clash
          messages that just don't matter, for your language.

          In general, debugging twolc rule sets is a headache, which
          is why so many of our people prefer the xfst Replace Rules.


    "Vowel Shortening in Compounds of Contract Stems"
       Vx:Vy <=> [ Vow Vow | á ] Cns:+ Cns: _ StemCns:* X4: X7: ;
                             where Vx in (u i)
                                     Vy in (o e)
                             matched ;

    "Vowel Shortening for buorre"
      Vx:Vy <=> [ Vow Vow | á ] Cns:+ Cns _ X8: ;
                            where Vx in (u i)
                                  Vy in (o e)
                                  matched ;
    ! This rule was actually made for one word only, buorre:buoret
    ! It replaces the missing "| X8:" sequence that is commented out in the
    ! "Vowel shortening ... 1" rule above. Why X8: does not work there is
    ! unclear.

    Note in the first rule that the left context has  Cns:+ Cns:
    while the secondt has Cns:+ Cns  (note the Cns rather than Cns:)

    That could be significant.  If there is another rule in the set
    that maps the Cns just before _ to something else, then the
    second rule won't match.  The second rule requires Cns:Cns
    just before the replace position _ .




    ! This rule should in any case

    where X4, X8 trigger cns gradation, whereas X7 does not.

    This looks like a mess. As the comment stated, the Shortening ...1
    rule earlier contained the more elegant [ X7: | X8: ], but that did
    not work. So I removed X8:, got the problem with buorre, and
    reintroduced X8: in a separate rule. The result works, but is
    confusing, and makes me believe in ghosts in machines. I see that the
    left contexts are not quite identical (Cns vs.  Cns: in the last LC
    position of the last rule), but do not remember why I have this
    difference.

    In two-level rules the difference between Cns and Cns: can make
    all the difference in the world, especially if there is another
    rule in the set that is mapping lexical Cns to something else
    on the surface.


    In retrospect, I cannot understand how the Shortening...2 rule could
    cause the (then very annoying) problem with failed i > ï¿½in present
    1st, 2nd of verbs, but the problem went away when Shortening---2 was
    removed. Here is the rule for Present tense 1st, 2nd i -> ï¿½ really a
    safe rule for boahtiQ4n:boad1ï¿½, as it seems (Q4 triggers cns grad as
    well):

    "Stem Vowel in 1st and 2nd Person Singular Present"
       i:á <=> Cns _ Q4: ;

    There are two kinds of two-level rule clash possible:

    1.  Right-arrow clashes.  e.g.

        a:b => l _ r ;

        a:b => q _ m ;

        The first rule says that the pair a:b occurs only
        in the context l _ r.  The second rule says that
        the pair a:b occurs only in the context q _ m.
        Clash.  Easy to resolve: just combine the two
        rules into one rule with two contexts:

        a:b => l _ r ;
               q _ m ;

    2.  Left-arrow clashes.  e.g.

        i:e <=   _  x ;

        i:á<= y _    ;

       the problem here is what to do when the input
       is the string "yix", which matches both rules.
       The first want to output yex, and the second
       yá.  Clash.

    Understanding why two-level rules clash takes some careful
    looking and a complete mastery of the semantics of the rules.

    Because the rules all apply simultaneously, and because the
    contexts of all the rules match on both sides of the relation,
    the difference between Cns and Cns: can be very significant.

    I hope that helps,

    Ken

Umlaut
------

    I struggle with twolc, on different topics. Here I consider Umlaut and
    Vowel Harmony issues.

    In your Monish task in the Book, you use archiphonemes. For VH this is
    OK, I can make archiphonemic suffixes. But for Umlaut I would like to
    have a clean lexicon representation (just enter roots from the
    dictionary as is, and indicate exceptional Umlaut stems by sending
    them to trigger-containing sublexica, rather than to write double
    entries in the lexicon.

    Thus rather lexicon
    LEXICON NounRoot
    bok UMLAUTFEMNOUN ;
    grop FEMNOUN ;

    than
    LEXICON NounRoot
    bok:b^Ok FEMNOUN ;
    gropFEMNOUN ;


    Trond,

    There's nothing wrong with your approach.

    However, keep in mind that when using Xerox technology, you
    are no longer restricted to the two-level geometry.  In a
    classic two-level (KIMMO-style) system, the forms you put
    in the lexicon are the forms that the ultimate user will
    see.

    But with Xerox tools, you can write the core dictionary to
    look like this

    LEXICON NounRoot
    b^Ok     FEMNOUN ;

    and then, after all the alternation rules have been applied
    on the lower side, you can compose the following
    trivial rule ON TOP of the lexicon fst.

        o <- %^O
          .o.
        LexiconFST

    mapping the ^O UP to a plain o so that the user will see "bok"
    instead of "b^Ok" in final solution strings.

    The dictionaries I want to pour into the system already contain
    grammatical codes that matches the former alternative, and I thus
    prefer the former solution, unless there are good reasons to chose the
    latter one (well, one reason is a smaller number of lexica, but in
    this case I can live with that).

    No, it sounds like your approach is perfectly reasonable.

    bokZ1er => bker! book.IndefPl w/Uml, since o: <=> _ Cns:* Z1: ;
    groper =>groper! hollow.IndefPl without Umlaut

    b^Oker => bker! ditto, since ^O: <=> _ Cns: +Pl: ;
    groper => groper! (can I make reference to grammatical categories like
    this?)

    I take it that the Z1 (Diacritics without being it) is something you
    do not like, but that is the format I inherited (btw., should I keep
    it as such (cf.  attachment) or should I use the Diacritics section
    that you deprecate in the book?).


    There's nothing wrong with using diacritics.  After they've served
    their purpose, and you're done with them, you can map them to
    the empty string to keep the solution strings clean (if you like):

          0 <- Z1
          .o.
          LexiconFST

    Now, if you compile the two files I send you you will see that nob.fst
    cannot analyse bker, but if you invert the stack to inob.fst, then it
    can generate it. How comes? And how do I assure analysing capability
    as well as generation?

    This looks like a bug.  The application routines don't like
    any of the surface words containing the  letter.  Thanks for
    sending the actual FST so that I could reproduce the problem.
    I've sent a report to the coders.

    I have the same problem with Finnish, when I try to make a vowel
    harmony rule based on the monish one. I generate, but do not analyse
    (source file forthcoming if needed). I take it the problem is the
    same, since I get the message "o: is not a feasible pair" when I do
    lex-pair test in twolc.

    This sounds like part of the same problem.  Let's see what the
    coders have to say.

    Thanks for the report.  Sorry for the confusion.

    Ken

Flag diacritics
---------------

    Flag Diacritics

    This time the Real Diacritics.

    Here is the problem: Saami can have N+N compounds, and I install a loop
    lexicon, R, so that nominative and genitive forms of nouns are
    redirected to R (with due vowel shortening, as described in an earlier
    mail).

    Unfortunately, some nouns do not start out as such, but are derived
    from verbs and adjectives. This derivation process is handled by going
    from the approporiate adjectival and verbal stems via derivational
    suffixes to the relevant nominal sublexica, like this:

    verbstem+V => deraff+N, gives the wordform verbstem+V+deraff+N

    These (productively) derived nouns may participate in compounding. I
    thus want to allow the following compounds:

    stem+N & stem+N
    stem+N & [ stem+V aff+N ]
    stem+N & [ stem+A aff+N ]

    At the moment, I let my recursive lexicon R accept continuation both
    to N, V and A, thus I also allow the illicit compounds

    stem+N & stem+A
    stem+N & stem+V

    Cf. these examples:

    viesumuitalus   viessu+N+Sg+Gen#muitalit+V+us+N+Sg+Nom
    viesumuitalit   viessu+N+Sg+Gen#muitalit+V+Inf

    The first one is correct, as the 2nd component verb (muitalit) is
    turned into a noun (muitalus) via us-derivation (yes, the tag is +us).
    The 2nd one i want to avoid, since it is ungrammatical, (N+V compound),
    but as you can see, it is allowed by the 8at the moment9 overgenerating
    parser.


    KRB:  you could, of course, produce the overgenerating lexicon
    and then remove the overgeneration by composing filters on
    the top.  They would have to be carefully written to allow
    multiple-part legal compounds, but it would almost certainly be possible
    to match and filter out illegal compounds that way.

    But let's assume that you want to use flag diacritics.



    It seems I need a flag diacritic at LEXICON R saying "ok to continue to
    +V or +A only if I find an +N tag later on in the string". Since I want
    to use diacritics sparsely, I would like it as follows (I use the flag
    diacritic X instead of {U, P, N, R, D, C} in this illustration, since I
    am not sure which one will fill my needs):

    LEXICON R
      # NounRoot ;
      #@X.compound.illicit@ VerbRoot ;
      #@X.compound.illicit@ AdjectiveRoot ;


    Flag Diacritics are tricky for many users.  Be sure to read the Flag
    Diacritics chapter and learn the semantics of each type.  Remember
    that features are set, checked and perhaps cleared linearly as
    analysis goes from beginning to end of the word.

    The semantics you suggest above correspond to "Forward-looking Feature
    Requirements", which is treated in the last section in the current chapter
    on Flag Diacritics.  You want to allow something, but only if something
    else is eventually found/satisfied down the road.

    The compounding significantly complicates the picture.  As you go
    around the compound loops, you may find a need to set, check and clear
    features carefully at critical points.  I had to do this a lot in
    Aymara, and it wasn't easy.

    For my own mnemonic convenience, I name such forward-looking feature
    requirements with "Need" or "Require" in the title, e.g. NeedNom for "needs
    nominalization".

    Let's just look at Nouns and Adjs, to make it slightly simpler.
    If and only if the Adjs are nominalized, they can participate in
    compounds.

    MulticharSymbols
    @P.NeedNom.ON@   ! positive setting of NeedNom = ON
    @D.NeedNom.ON@   ! disallow NeedNom = ON
    @C.NeedNom@      ! clear the NeedNom feature back to neutral

    LEXICON Root
            NounRoot ;   ! Start of normal noun
            AdjRoot ;    ! start of normal adj

    LEXICON NounRoot
    dog      N ;
    cat      N ;
    rat      N ;

    ! at the end of each noun root, or nominalized noun stem, go through
    ! LEXICON N

    LEXICON N
         NounEndings ;  ! whatever they might be, leading to end of word
         Compound ;     ! or look for a noun or nominalized adj to compound onto

    LEXICON Compound
    %#:0    NounRoot  ;   ! add a compound boundary, loop back to NounRoot; easy case
    < %#:0 @P.NeedNom.ON@ > AdjRoot ;
       ! or add a compound boundary and set a feature NeedNom=ON and continue
       ! to the AdjRoot lexicon


    LEXICON AdjRoot
    blue   A ;
    black  A ;

    ! all adjectives pass through the following LEXICON A
    LEXICON A
    @D.NeedNom.ON@  AdjEndings ;  ! go to normal adj endings,
                                  ! but DISALLOW this path if NeedNom is ON
    ness@C.NeedNom@    N ;  ! nominalizing suffix, makes the result a noun
                            ! continue to LEXICON N, which leads to nominal
                            ! endings or further compounding; Clear any
                            ! outstanding "need" for nominalization--
                            ! it has been satisfied.  Continue like any noun.


    Handle the nominalized verbs similarly to the nominalilzed adjectives
    above.

    That's probably not completely right, but it's all I have time for now.

    The example above is relatively simple because it is written so
    that every nounroot or nominalized stem has to pass through
    LEXICON N, and every AdjRoot has to pass through LEXICON A.
    LEXICON A, in particular, is the place where you need to check
    and clear feature values.  If your grammar has branches all over
    the place, and no central LEXICON through which all adjectives
    are funneled, then it will be harder to identify all the key
    points for checking and clearing features.    NOt impossible,
    but a bit harder.



    Then derivational sublexica might look like

    LEXICON DeverbalNounsDOHPPE-
      +n+N@X.compound.licit@+Actio:m BOAHTIN ;
      +mus1+N@X.compound.licit@:mus1s1 MUSH ;
      +meahttun+A:X7#meahttum MEAHTTUN ;

    The idea being that a warning flag is set at R (value = illicit), and
    that it is removed only if the path ends in +N (value changed to
    licit), otherwise the string is blocked.

    Right.  Setting NeedNom=ON is not difficult.  You do that just before
    continuing to AdjRoots or VerbRoots that are acceptable only if they
    are eventually nominalized.  And "removing" (clearing) NeedNom features
    when you find a suitable nominalizing suffix is easy.

    The harder part is identifying all the other paths out of AdjRoots and
    VerbRoots that do _not_ involve nominalization and blocking them if
    NeedNom=ON.  That's what the first entry in LEXICON A does.  It
    lets you follow a non-nominalizing path out of AdjRoot, but only
    if NeedNom is Not set to ON.


    What diacritic should I use?

    I have suggested a combination of P (positive setting), D (disallow)
    and C (clear) diacritics.

    There are no doubt other ways, using U (unification) and perhaps
    R (require) features, but this one fits my intuition about "forward-
    looking feature requirements".

    Must I have a line in the xfst part of the Makefile, to remove strings
    with a certain flag diacr value, or will one of your flags do that by
    itself (string is removed if flag value is inherently illegal, so to
    speak)

    Re-read the chapter on Flag Diacritics, which explain how they work.
    It's the application routines themselves (apply up, apply down,
    and the 'lookup' application) that are sensitive to flag diacritics
    and will block illegal paths at runtime.  It's automatic.  (In xfst,
    you can manually turn off the "obeying" of flag diacritics, but
    it's on by default.)

    but from what I see, you check from the suffix point of view (is the
    input I get legal) rather from the stem's point of view (I'll be legal
    only if saturated by a certain type of suffix later in this
    derivation).

    See the last section in the chapter "Forward-Looking Feature Requirements"
    to see a somewhat simple example of "Allow this tentatively, only if
    something else turns up later".  When compounding is involved, it
    gets a bit trickier, but not impossible.

    Good luck,

    Ken
