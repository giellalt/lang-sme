#!/usr/bin/env perl

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
