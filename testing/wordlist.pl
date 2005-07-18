#!/usr/bin/perl -w

# Use utf-8 encoding
use encoding 'utf-8';
use open ':utf8';


$PARADIGM = $ARGV[0];

if (($file) = $ARGV[1]) {
    open (WORDFILE, $file) or die "Can't find file $file: $!\n";
} else {
    die "Too many files in input.\n";
}

chop (@words = <WORDFILE>);
close WORDFILE;

foreach $word (@words) {
    @command = ("make", $PARADIGM, "WORD=$word");
    system(@command) == 0
           or die "System @command failed: $?"
}
