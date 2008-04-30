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
    my $xmlcommand = "egrep -v '[0-9]|Opening|Closing|bye|\\+|^$$' " .
    	"$word.paradigm | tr -d '#' | sort -u | " .
    	"perl -pe 's/^(.+)\$/<wordform>\\1<\\/wordform>/;' " . 
    	" | cat pstart.xml - pend.xml > $word.xml";
    system($xmlcommand);
}
