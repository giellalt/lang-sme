#!/usr/bin/perl
use strict;

# Script that transforms something into something else
# Yess, Cip! Very informative comments!

# This script transforms the output of the generation paradigm into an intermediate xml format.
# It is used both for sma and for sme, the only difference being the use of dashedLemma: with sma but not with sme.

my $newAnalysis = 1;
my $hasLemma = 0;
my $lemma = "";
my $pos = 1;
my $wordForm = "";
my $xmlOutput = "<paradigm>\n";
my $firstClosing = 1;
my $rest = "";
my $orig = "";

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
    $pos = $2;
    $rest = $3;
    $rest =~ s/\+/\_/g;
    $rest = $pos.'_'.$rest;
    $orig = $lemma.'___'.$rest;

    #print STDERR "orig ---:::::--- $orig\n";

    if (!$hasLemma) {
      $xmlOutput = $xmlOutput."  <lemma>$lemma</lemma>\n";
      $xmlOutput = $xmlOutput."  <pos>$pos</pos>\n";
      $xmlOutput = $xmlOutput."  <analysis ms=\"$rest\">\n";
      $hasLemma = 1;
    } else {
      $xmlOutput = $xmlOutput."  </analysis>\n";
      $xmlOutput = $xmlOutput."  <analysis ms=\"$rest\">\n";
    }
  } else {
    $wordForm = $_;    
    if (/\?+/) {
      $newAnalysis = 1;
      next;
    } else {
      if ($newAnalysis) {
	next;
      } else {
	$wordForm =~ s/\#//g;
	$xmlOutput = $xmlOutput."  <wordform>$wordForm</wordform>\n";
      }
    }
  }
}

print $xmlOutput;



