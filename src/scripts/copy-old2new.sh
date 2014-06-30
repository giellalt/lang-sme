#!/bin/bash
#
# A simple shell script to automatically update files from the old to the new
# infra, until sme is moved completely.

# Variables:

OLDSRCDIR=$GTHOME/gt/sme/src
NEWSRCDIR=$GTHOME/langs/sme/src
OLDCOMMONDIR=$GTHOME/gt/smi/src
NEWCOMMONDIR=$GTHOME/gtcore/langs-templates/smi/src
STEMSDIR=morphology/stems
AFFIXDIR=morphology/affixes

# morphology/ dir files
echo "*** Copying morphology ***"
cp -f $OLDSRCDIR/sme-lex.txt              $NEWSRCDIR/morphology/root.lexc
cp -f $OLDSRCDIR/clitics-sme-lex.txt      $NEWSRCDIR/morphology/clitics.lexc
cp -f $OLDSRCDIR/compound-sme-lex.txt     $NEWSRCDIR/morphology/compounds.lexc

# affixes/ dir files
echo "*** Copying morphology/affixes ***"
cp -f $OLDSRCDIR/adj-sme-morph.txt        $NEWSRCDIR/$AFFIXDIR/adjectives.lexc
cp -f $OLDSRCDIR/noun-sme-morph.txt       $NEWSRCDIR/$AFFIXDIR/nouns.lexc
cp -f $OLDSRCDIR/poss-sme-morph.txt       $NEWSRCDIR/$AFFIXDIR/possessive-suffixes.lexc
cp -f $OLDSRCDIR/pronoun-sme-morph.txt    $NEWSRCDIR/$AFFIXDIR/pronouns.lexc
cp -f $OLDSRCDIR/propernoun-sme-morph.txt $NEWSRCDIR/$AFFIXDIR/propernouns.lexc
cp -f $OLDSRCDIR/verb-sme-morph.txt       $NEWSRCDIR/$AFFIXDIR/verbs.lexc

# stems/ dir files
echo "*** Copying morphology/stems ***"
cp -f $OLDSRCDIR/abbr-sme-lex.txt         $NEWSRCDIR/$STEMSDIR/abbreviations.lexc
cp -f $OLDSRCDIR/acro-sme-lex.txt         $NEWSRCDIR/$STEMSDIR/acronyms.lexc
cp -f $OLDSRCDIR/adj-sme-lex.txt          $NEWSRCDIR/$STEMSDIR/adjectives.lexc
cp -f $OLDSRCDIR/adv-sme-lex.txt          $NEWSRCDIR/$STEMSDIR/adverbs.lexc
cp -f $OLDSRCDIR/conjunction-sme-lex.txt  $NEWSRCDIR/$STEMSDIR/conjunctions.lexc
cp -f $OLDSRCDIR/interjection-sme-lex.txt $NEWSRCDIR/$STEMSDIR/interjections.lexc
cp -f $OLDSRCDIR/noun-sme-lex.txt         $NEWSRCDIR/$STEMSDIR/nouns.lexc
cp -f $OLDSRCDIR/numeral-sme-lex.txt      $NEWSRCDIR/$STEMSDIR/numerals.lexc
cp -f $OLDSRCDIR/particle-sme-lex.txt     $NEWSRCDIR/$STEMSDIR/particles.lexc
cp -f $OLDSRCDIR/pp-sme-lex.txt           $NEWSRCDIR/$STEMSDIR/adpositions.lexc
cp -f $OLDSRCDIR/pronoun-sme-lex.txt      $NEWSRCDIR/$STEMSDIR/pronouns.lexc
cp -f $OLDSRCDIR/propernoun-sme-lex.txt   $NEWSRCDIR/$STEMSDIR/sme-propernouns.lexc
cp -f $OLDSRCDIR/punct-sme-lex.txt        $NEWSRCDIR/$STEMSDIR/punctuation.lexc
cp -f $OLDSRCDIR/subjunction-sme-lex.txt  $NEWSRCDIR/$STEMSDIR/subjunctions.lexc
cp -f $OLDSRCDIR/verb-sme-lex.txt         $NEWSRCDIR/$STEMSDIR/verbs.lexc

# syntax/ dir files
echo "*** Copying syntax ***"
cp -f $OLDSRCDIR/sme-dis.rle    $NEWSRCDIR/syntax/disambiguation.cg3

# phonology/ dir files
echo "*** Copying phonology ***"
cp -f $OLDSRCDIR/twol-sme.txt   $NEWSRCDIR/phonology/sme-phon-l1.twolc

# transcriptions/ dir files
echo "*** Copying transcriptions ***"
cp -f $OLDSRCDIR/clock-sme.lexc $NEWSRCDIR/transcriptions/clock.lexc
cp -f $OLDSRCDIR/date-sme.lexc  $NEWSRCDIR/transcriptions/date.lexc
cp -f $OLDSRCDIR/sme-num.txt    $NEWSRCDIR/transcriptions/numbers.lexc

# orthography/ dir files
echo "*** Copying orthography ***"
cp -f $GTHOME/gt/common/src/spellrelax.regex $NEWSRCDIR/orthography/spellrelax.regex

# hyphenation/ dir files
echo "*** Copying hyphenation ***"
cp -f $OLDSRCDIR/hyph-sme.txt $NEWSRCDIR/hyphenation/hyphenation.xfscript
