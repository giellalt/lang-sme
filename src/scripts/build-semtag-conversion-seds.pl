#!/usr/bin/env perl

use utf8;
use feature 'unicode_strings';
BEGIN {
       $| = 1;
       binmode(STDIN, ':encoding(UTF-8)');
       binmode(STDOUT, ':encoding(UTF-8)');
}
use open qw( :encoding(UTF-8) :std );

my $orig ;
my @sorted ;

while (<>) {
    chomp;
    $orig = $_ ;
    @sorted = sort(split(/\+/,$orig));
    s/Sem\//Sem\\\//g for $orig;
    s/Sem\/// for @sorted;
#    print $orig ;
    print "s/$orig/Sem\\/" . join('_', @sorted) . "/\n";
}
