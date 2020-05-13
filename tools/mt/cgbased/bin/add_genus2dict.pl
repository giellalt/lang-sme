#!/usr/bin/env perl
use warnings;
use utf8;
$|=1;


while (<STDIN>) {
    if (/^([^ ]+)\t([mfn]p?)/) { # nouns from lex
	$genus{$1} = "\U$2";
#	print "--adding genus $2 to $1\n";
    }
    elsif (/^[^ ]+ *\t/ || /[23]_letter/) { # non-nouns from lex
    }
    elsif (/^([^ ]+)_N /) { # nouns from dict
	$sme =$1;
	while (s/ :([^ ,;_]+)/ YYY$1XXX/) {
	    $nob =$1;
	    if ($genus{$nob}) {
		s/XXX/\/N$genus{$nob}/;
	    }
	    else {
		s/XXX/\/NX/;
#		print "--no genus for: $nob\n";
	    }
	}
	s/YYY/:/g;
	s/XXX//g;
	print;
    }
    else { # non-nouns from dict
	print;
    }
loopend:
}


