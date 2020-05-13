#!/bin/perl
# Perl script that parses a list of word+POS lines, and for each
# such line, calls make to generate the corresponding paradigm.

use File::Spec;

my $word_pos_list = @ARGV[0];
my $xsl_script = @ARGV[1];
my $gen_tmp = @ARGV[2];
my $paratype = @ARGV[3];
my $jc = "java net.sf.saxon.Transform -it:main ";
my $para_tmp = "Para_tmp";
my $xml_tmp = "XML_tmp";
my $mk_dir_cmd = "mkdir -p $gen_tmp/$para_tmp $gen_tmp/$xml_tmp";
my $mwe = "no";
    system($mk_dir_cmd);
    print "$word_pos_list\n" ;

open FILE, $word_pos_list or die $!;

while ( <FILE> ) {
  chomp;
  if (/^\s.*$/) {
    next;
  } else {
    my $word, $pos;
    if ($mwe eq 'yes') {
      ($word, $pos) = $_ =~ /^([^\s]+\s+[^\s]+)\s([^\s]+)$/;
    } else {
      ($word, $pos) = split;
    }
    if (($word ne "") and ($pos ne "") ) {
      my $linked_word = $word;
      $linked_word=~ s/\s+/\_/g;
      #$word=~ s/\s+/\%/g;
      $word_pos = $linked_word . "_" . $pos;
      print "word is $word\n" ;
      print "pos is $pos\n" ;
      print "word_pos is $word_pos\n" ;
      my $command = "make -f make-gen-dict paradigm POS\=$pos WORD\=\'$word\' GEN_TMP\=$gen_tmp PARATYPE\=$paratype" ;
      #    print "$command\n";
      system($command);
      my $xmlcommand = "perl paradigm2xml.pl $gen_tmp/$para_tmp/$word_pos.paradigm > $gen_tmp/$xml_tmp/$word_pos.xml";
      system($xmlcommand);
      
      $abs_path = File::Spec->rel2abs("$gen_tmp/$xml_tmp/$word_pos.xml");
      
      my $xslcommand = "$jc $xsl_script file=$abs_path path=$gen_tmp";
      
      #     print "$xslcommand\n";
      
      system($xslcommand);

    }    
  }
  
}
