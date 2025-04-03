#!/usr/bin/perl -wT

# Debugging
#use CGI::Debug;

use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;
use DBI;
use File::stat;
use File::Path;
use Data::Dumper;
use POSIX qw(ceil floor);
use Encode qw(encode decode);
use utf8;
 
$CGI::POST_MAX = 1024 * 5000;
my $safe_filename_characters = "a-zA-Z0-9_.-";
my $query = new CGI;
my $filename = $query->param("file");
my $preproc = '/home/ciprian/main/gt/script/preprocess';
my $abbr = '/home/ciprian/main/langs/sme/tools/preprocess/abbr.txt';
my $lookup = '/usr/local/bin/lookup';
my $fst_file = '/home/ciprian/main/langs/sme/src/analyser-disamb-gt-desc.xfst';
my $lookup2cg = '/home/ciprian/main/gt/script/lookup2cg';
my $vislcg =  '/usr/local/bin/vislcg3';
my $dis_file = '/home/ciprian/main/langs/sme/src/syntax/disambiguation.cg3';
my $korp_file = '/home/ciprian/main/giella-shared/smi/src/syntax/functions.cg3';
my $grep = '/usr/bin/grep';
my $enc = 'utf-8';

if ( !$filename )
{
print $query->header ( );
print "There was a problem uploading your file (try a smaller file).";
exit;
}

my ( $name, $path, $extension ) = fileparse ( $filename, '..*' );
$filename = $name . $extension;
$filename =~ tr/ /_/;
$filename =~ s/[^$safe_filename_characters]//g;

$path = $ENV{'PATH'};       # $path now tainted

$ENV{'PATH'} = '/bin:/usr/bin';
delete @ENV{'IFS', 'CDPATH', 'ENV', 'BASH_ENV'};

$path = $ENV{'PATH'};       # $path now NOT tainted

my $upload_dir = "upload_test";
system "mkdir -vp $upload_dir";

if ( $filename =~ /^([$safe_filename_characters]+)$/ )
{
$filename = $1;
}
else
{
die "Filename contains invalid characters";
}

my $upload_filehandle = $query->upload("file");

open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> )
{
print UPLOADFILE;
}

close UPLOADFILE;

my $analysis_f = 'analysis.txt';
my $word_freq_f = 'word_freq.txt';
my $lemma_freq_f = 'lemma_freq.txt';
my $pos_freq_f = 'pos_freq.txt';
system "rm -f $upload_dir/$analysis_f";
system "rm -f $upload_dir/$word_freq_f";
system "rm -f $upload_dir/$lemma_freq_f";
system "rm -f $upload_dir/$pos_freq_f";

my $the_analysis=`cat $upload_dir/$filename | $preproc --abbr=$abbr | \
	$lookup $fst_file | $lookup2cg | \
	$vislcg -g $dis_file| $vislcg -g $korp_file`;

open(OUT, ">>$upload_dir/$analysis_f") or &dienice("Couldn't open output file: $!");
print OUT  $the_analysis;
close(OUT);

my $word_freq = `cat $upload_dir/$analysis_f | grep '"<'| \
	tr -d '"' | tr -d '<' | tr -d '>'`;

$word_freq = lc $word_freq;

#my $word_freq = `cat $upload_dir/$analysis_f | grep '"<'| \
#	tr -d '"' | tr -d '<' | tr -d '>' | sort | uniq -c | sort -nr`;

open(OUT, ">$upload_dir/$word_freq_f") or &dienice("Couldn't open output file: $!");
print OUT $word_freq;
close(OUT);

$word_freq = `cat $upload_dir/$word_freq_f | sort | uniq -c | sort -nr`;

open(OUT, ">$upload_dir/$word_freq_f") or &dienice("Couldn't open output file: $!");
print OUT $word_freq;
close(OUT);

my $lemma_freq = `cat $upload_dir/$analysis_f | grep '^\t"'| \
	tr -d '"' |cut -d ' ' -f1-2| tr -d '#' |sort | uniq -c | sort -nr`;

open(OUT, ">$upload_dir/$lemma_freq_f") or &dienice("Couldn't open output file: $!");
print OUT $lemma_freq;
close(OUT);

my $pos_freq = `cat $upload_dir/$analysis_f | grep '"'| grep -v '"<' |\
	cut -d '"' -f3 | cut -d ' ' -f2 | \
        sort | uniq -c | sort -nr`;

open(OUT, ">$upload_dir/$pos_freq_f") or &dienice("Couldn't open output file: $!");
print OUT $pos_freq;
close(OUT);

print $query->header ( );
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thanks!</title>
<style type="text/css">
img {border: none;}
</style>
</head>
<body>
<p>Thanks for uploading your file!</p>
<p><a href="download.cgi?ID=$filename">input</a></p>
<p><a href="download.cgi?ID=$analysis_f">analysis</a></p>
<p><a href="download.cgi?ID=$word_freq_f">word form frequency</a></p>
<p><a href="download.cgi?ID=$lemma_freq_f">lemma frequency</a></p>
<p><a href="download.cgi?ID=$pos_freq_f">pos frequency</a></p>
</body>
</html>
END_HTML


