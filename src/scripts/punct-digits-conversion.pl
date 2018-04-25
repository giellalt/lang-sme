#!/usr/bin/perl -w
#
# smi-smn-conversion.pl
# Convert names in the SMI propernoun lexicon to smn.
# $Id: smi-smn-conversion.pl 91035 2014-03-24 22:56:01Z sjur $

use strict;
use utf8;

while(<>) {
#	s/\^//g ;
	s/:'/:'7/g ; #  

	my $line = $_;

	print $line;
}

