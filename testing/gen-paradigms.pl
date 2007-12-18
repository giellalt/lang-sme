#!/bin/perl
# Perl script that parses a list of word+POS lines, and for each
# such line, calls make to generate the corresponding paradigm.

while ( <> ) {
    chop;
    my $word, $pos;
    ($word, $pos) = split;
#    print "word is $word\n" ;
#    print "pos is $pos\n" ;
    my $command = "make $pos-paradigm WORD\=$word" ;
#    print "$command\n";
    system($command);
}
