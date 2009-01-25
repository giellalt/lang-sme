#!/usr/bin/perl
use strict;

# Script that transforms something into something else

my $newAnalysis = 1;
my $hasLemma = 0;
my $lemma = "";
my $pos = 1;
my $wordForm = "";
my $xmlOutput = "<paradigm>\n";
my $firstClosing = 1;
my $dashedLemma = 0;
my $morph = "";

while (<>) {
  chomp;
  if (/100%|GMT|Opening|bye|^$$/) {
    next;
  } elsif (/Closing|^$$/) {
    if ($firstClosing) {
      $firstClosing = 0;
      $hasLemma = 0;
    } else {
      $xmlOutput = $xmlOutput."  </analysis>\n";
      $xmlOutput = $xmlOutput."</paradigm>\n";
    }
  } elsif (/^\s*$/) {
    $newAnalysis = 1;
  } elsif (/^([^\+]+)[\+]([^\+]+)[\+](.+)$/) {
    $newAnalysis = 0;
    $lemma = $1;
    $pos = lc($2);
    $morph = $3;
    $morph =~ s/\+/\_/g;
    if (!$hasLemma) {
      $xmlOutput = $xmlOutput."  <lemma>$lemma</lemma>\n";
      $xmlOutput = $xmlOutput."  <pos>$pos</pos>\n";
      $xmlOutput = $xmlOutput."  <analysis ms=\"$morph\">\n";
      $hasLemma = 1;
      $dashedLemma = ($lemma  =~ m/[^\-]+[\-].+/);
    } else {
      $xmlOutput = $xmlOutput."  </analysis>\n";
      $xmlOutput = $xmlOutput."  <analysis ms=\"$morph\">\n";
    }
    
    #     if ($dashedLemma) {
    #       print "mist::: $lemma ::: $pos ::: $morph\n";
    #     }
    
  } else {
    $wordForm = $_;    
    if (/\?+/) {
      $newAnalysis = 1;
      next;
    } else {
      if ($newAnalysis) {
	next;
      } else {
	if (!$dashedLemma) {
	  $wordForm =~ s/\-//g;
	}
	$wordForm =~ s/\#//g;
	$xmlOutput = $xmlOutput."  <wordform>$wordForm</wordform>\n";
      }
    }
  }
}

print $xmlOutput;



