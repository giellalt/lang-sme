#!/usr/bin/env perl
use warnings;
use utf8;
BEGIN { $| = 1; }

use Getopt::Long;
my $rop = GetOptions(
	"tracemeta|m" => \$tracemeta,
	"printall|p" => \$printall,
	);

$i=0;

while (<>) {
  s/"<\$¶>"//;
  if (/<[A-Z][A-Z]:(.+?)>/) {
    $trans =$1;
    $trans =~ s/^((.*=)?)SIC-?(\p{Ll})/$1$3/;
    $trans =~ s/=/ /g;
    if ($sentence && $sentence =~/(.)$/ && $trans eq "\$$1") {
      $trans = "nil"; # e.g. ? after "havd=tid?" translation
    }
    if (/ (PU|NUM) /) {$trans =~ s/^\$//;}
    if ($trans !~ /^(.*=)?[Nn]il$/ || $trans ne "nil" && /<compound>/) {
      $sentence .= " $trans";
    }
    if (/^\$([^0-9])/ && ($punct =$1) && $trans !~ /\Q$punct\E *$/) {
      if ($punct eq "=") {$sentence .= " $punct";}
      else {$sentence .= $punct;}
    }
  }
  elsif (/^\$([^ \t]+)/) { # punctuation
    $trans = $1;
    if ($trans =~ /^[([{\-]/) {
      $sentence .= " $trans";
    }
    else { 
      $sentence .= "$trans";
    }
  }

  if (($tracemeta || $printall) && /^</ && ! /<raw=/) {
    if (/^<orig=/) {print "\n";}
#    s/\n//; # otherwise emty line between orig and raw
    print;
  }
  elsif ($printall) {
    if (/^([^ \t]+)[ \t]+\[/) {$i++; print "$i ";}
    print;
  }
  if (/<raw=/ || /^$/) {
    print $sentence . "\n\n";
    $sentence = ""; $i=0; $sentence_orig = ""; $i=0;
  }
  
}
