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

      if ($pos eq 'n') {
	# print STDERR "::: and the pos is --- $pos and the morph is $morph\n";
	if ($morph =~ /^Prop_(.+)/) {
	  # print STDERR "---:::--- and the morph is $morph\n";
	  $pos = "prop";
	  $morph = $1;
	} elsif ($morph =~ /^Actor_(.+)/) {
	  # print STDERR "---:::--- and the morph is $morph\n";
	  $pos = "actor";
	  $morph = $1;
	  # print STDERR "---:::--- and the morph DANACH is $morph\n";
	}
      } elsif ($pos eq 'g3') {
	print STDERR "::: and the pos is --- $pos and the morph is $morph\n";
	if ($morph =~ /^N_(.+)/) {
	  # print STDERR "---:::--- and the morph is $morph\n";
	  $morph = $1;
	}
      } elsif ($pos eq 'pron') {
	print STDERR "::: and the pos is --- $pos and the morph is $morph\n";
	if ($morph =~ /^Indef_(.+)/) {
	  # print STDERR "---:::--- and the morph is $morph\n";
	  $morph = $1;
	}
      }
      
      $xmlOutput = $xmlOutput."  <pos>$pos</pos>\n";
      $xmlOutput = $xmlOutput."  <analysis ms=\"$morph\">\n";
      
      $hasLemma = 1;
      $dashedLemma = ($lemma  =~ m/[^\-]+[\-].+/);
    } else {
      $xmlOutput = $xmlOutput."  </analysis>\n";
      if (($morph =~ /^Actor_(.+)/) || ($morph =~ /^Prop_(.+)/) || ($morph =~ /^N_(.+)/) || ($morph =~ /^Indef_(.+)/)) {
	$morph = $1;
      }
      
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



