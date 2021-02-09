Flag diacritics
===============

Introduction
------------

The use of flag diacritics is documented in chapter 8 of the Xerox book.
The present page documents the flag diacritics format, and the use of
them in the parser.

Flag diacritics are used in the Saami morphological parser in order to
remove illegal compounds, and in order to handle automatic downcasing of
proper names when they are converted to e.g. adjectives.

Flag diacritics format
----------------------

There are four types of flag diacritics, all of them with the format
@operator.feature.value@ or @operator.feature@:

-   **U or Unification flags, @U.feature.value@:**  
    U is the unification operator, and the form is accepted if, for the
    relevant feature, the two flags in the derivation string have the
    same value.
-   **P or Positive (Re)Setting, @P.feature.value@:**  
    Sets or resets the feature to the given value.
-   **N or Negative (Re)Setting, @N.feature.value@:**  
    Sets or resets the feature to the negation of the given value.
-   **R or Require Test, @R.feature.value@:**  
    For this diacritic, a test is performed, and it succeeds iff feature
    is currently set to value, otherwise the path is blocked.
-   **D or Disallow Test, @D.feature.value@:**  
    A test is performed that succeds if feature is neutral or set to a
    value that is incompatible with value.
-   **C or Clear Feature, @C.feature@:**  
    For this flag, the value of feature is reset to neutral.
-   **U or Unification Test, @U.feature.value@:**  
    If feature is currently neutra, this diacritic causes feature to be
    set to value. Else if feature is currently set, then the test
    succeeds iff value is compatible with the current value of feature.

Flags diacritics for Saami compounds
====================================

Introduction
------------

Flag diacritics are used in the Saami morphological parser in order to
remove illegal compounds.

The problem
-----------

Without flag diacritics, compounds with derived nouns are errouneously
blocked, or, if they are accepted,

-   **Too strict::**  
    only N + N accepted, N + \[V-suf\]N is not
-   **Too sloppy::**  
    also N + V accepted, not only N + \[V-suf\]N
-   **Correct: :**  
    accept compound only if 2nd part is N at end of derivation

A solution
----------

1.  The Nominative and Genitive sublexica of all NounRoot entries are
    lead to the R lexicon (as earlier).
2.  From there, they go to NounRoot again without flag diacritics. They
    are also led to VerbRoot and AdjectiveRoot, but equipped with a
    compound flag diacritic. Then, all affixes that turn adjectives and
    verbs into nouns are equipped with a corresponding diacritic.
3.  Compounds with only an unsaturated diacritic are removed, whereas
    compounds with a saturated diacritic are accepted.

A sketch
--------

Here, the P and R diacritics are used, as shown with the R lexicon and
two lexica for deverbal nouns, that takes verbal stems as input. The P
diacritic sets the value of cmpnd to N, and the R diacritic requires a
test.

-   LEXICON R
    -   \# NounRoot ;
    -   \#@P.cmpnd.N@ VerbRoot ;
    -   \#@P.cmpnd.N@ AdjectiveRoot ;
-   LEXICON DeverbalNounsBOAHTI
    -   +N+Actor:@R.cmpnd.N@ DEVNVCASE ;
-   LEXICON DeverbalNounsDOHPPE-
    -   +n+N+Actio:m@R.cmpnd.N@ BOAHTIN ;
    -   +mus1+N:mus1s1@R.cmpnd.N@ MUSH ;
    -   +meahttun+A:X7\#meahttum MEAHTTUN ;

Flag diacritics for downcasing of derived proper nouns
======================================================

The problem
-----------

This is fixed, isn't it?

All proper nouns may be turned into adjectives of the type London &gt;
Londoner, in Sámi, Oslo &gt; oslolaš. In Sámi, the capital letter of the
proper name must be downcased.

An earlier solution was to write a twol rule that exchanged all initial
uppercase letters with an initial lowercase one if the stem was followed
by the right kind of derivational suffix (this rule is still found at
the end of the twol-sme.txt file, where it is commented out). This
solution was abandoned, since the compilation time was simply too long

A solution involving flag diacritics
------------------------------------

A possible solution is to use flag diacritics, in the same way as we
used flag diacritics to fix compounds.

The tags `@U.Cap.Obl@ @U.Cap.Opt@` were introduced (cf. the
`sme-lext.txt `file), but so far, we don't have a working solution. The
problem is documented (for Finnish) in section 8.5.5. (of the
pre-published version), and on pp. 368-372 in the published version of
the B&K book.

Working on it (Trond): I copied the two files demo-lex.txt (the lexc
file) and lexscript.xfst (the xfst script). I then saved the former as
lex.fst (in lexc) and ran the latter (in xfst). The lexc commands were:

    compile-source demo-lex.txt
    obey-flags
    source-to-result
    save-result lex.fst

The sole xfst command was:

    source paloscript.xfst

The resulting message from xfst is seen below:

    xfst[0]: source paloscript.xfst
    Opening file paloscript.xfst...
    defined UC: 568 bytes. 2 states, 26 arcs, 26 paths.
    5.2 Kb. 6 states, 356 arcs, Circular.
     >>>>This leaves the rule transducer on the stack
    0: 5.2 Kb. 6 states, 356 arcs, Circular.
     >>>>Loading lex.fst onto the stack
    Opening 'lex.fst'
    Closing 'lex.fst'
     >>>>There should now be two networks on the stack
    0: 1.5 Kb. 32 states, 35 arcs, 12 paths.
    1: 5.2 Kb. 6 states, 356 arcs, Circular.
     >>>>Composing the rules under the lexicon
    1.8 Kb. 38 states, 45 arcs, 18 paths.
    flex scanner jammed

According to the Book, we should have two networks, so that is ok. The
question is why we get the final message
(`flex scanner             jammed`), and how we shall get the demo work,
and thereafter how we can make our own problem work.

Appendix: The files used
------------------------

These two files were copied from the B&K book. No attempt was done do
modify them, as the first goal should be to get them to work.

The lexc file demo-lex.txt

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! demo-lex.txt
    !
    ! Simple Finnish Lexicon with Flag Diacritics
    !
    ! Includes words like "Pariisi" (Paris) "pariisilainen"
    ! (Parisian), "Palo Alto", "paloaltolainen" (Palo Altan).
    ! The initial capital is obligatory in "Pariisi",
    ! optional in "pariisilainen". The internal space in
    ! "Palo Alto" is not present in "paloaltolainen".

    Multichar_Symbols
     @U.Cap.Obl@ @U.Cap.Opt@
     +PN +Adj +Der+

    LEXICON Root
     @U.Cap.Obl@ PropNoun ;
     @U.Cap.Opt@ PropNoun ;

    LEXICON PropNoun
     Pariisi PNSuff ;
     Grenoble PNSuff ;
     Palo_Alto PNSuff ;

    ! N.B. that _ denotes the literal space
    ! character in this grammar

    LEXICON PNSuff
     @U.Cap.Obl@ PN ;
     @U.Cap.Opt@ AdjSuff ;

    LEXICON PN
    +PN:0 # ;

    LEXICON AdjSuff
     +Der+:0 LAINEN ;

    LEXICON LAINEN
     lainen ADJ ;

    LEXICON ADJ
     +Adj:0 # ;

The xfst script paloscript.xfst

    clear stack
    define UC A | B | C | D | E | F | G | H |
    I | J | K | L | M | N | O | P | Q | R | S |
    T | U | V | W | X | Y | Z ;

    read regex [
    # Allow optional initial downcasing after @U.Cap.Opt@
    A (->) a, B (->) b, C (->) c, D (->) d, E (->) e,
    F (->) f, G (->) g, H (->) h, I (->) i, J (->) j,
    K (->) k, L (->) l, M (->) m, N (->) n, O (->) o,
    P (->) p, Q (->) q, R (->) r, S (->) s, T (->) t,
    U (->) u, V (->) v, W (->) w, X (->) x, Y (->) y,
    Z (->) z
                    || .#. %@U%.Cap%.Opt%@ _

    .o.

    # No uppercase in the middle of a downcasable word

    A->a, B->b, C->c, D->d, E->e, F->f, G->g, H->h,
    I->i, J->j, K->k, L->l, M->m, N->n, O->o, P->p,
    Q->q, R->r, S->s, T->t, U->u, V->v, W->w, X->x,
    Y->y, Z->z

    || %@U%.Cap%.Opt%@ ?+ _

    .o.

    # Eliminate internal spaces inside a downcasable word
    # Spaces are indicated here with the literal
    # underscore character
    %_ -> [] || .#. %@U%.Cap%.Opt%@ ?+ _
    ] ;

    echo >>>>This leaves the rule transducer on the stack
    print stack

    echo >>>>Loading lex.fst onto the stack
    load stack lex.fst

    echo >>>>There should now be two networks on the stack
    print stack

    echo >>>>Composing the rules under the lexicon
    compose net

    echo >>>>Composition complete
