#!/bin/perl
# Litt pseudo aktig, filnavn og target må være utskiftbar
#rm -f paradigm-sme.txt
while ( <> ) {
    chop;
    my $word, $pos;
    ($word, $pos) = split;
#    print "word is $word\n" ;
#    print "pos is $pos\n" ;
    my $command = "make $pos-paradigm WORD\=$word >> paradigm-sme.txt" ;
#    print "$command\n";
    system($command);
}
