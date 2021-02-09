The sme Makefile and scripts
============================

The Makefile is used to compile the source files, i.e. to make the
programs. It is put to use by (being in `gt/sme/src/` and) writing the
command `make`. Makefiles in general are documented in introductions to
the program `make`, and the format of the makefiles used in this project
is found in Appendix C of the Beesley and Karttunen book. The makefiles
for the other languages follow the same layout, but they are simpler.

The Makefile itself
-------------------

The sme Makefile is organized as follows: It contains of a number of
blocks, each block builds one binary file. Each binary file is dependent
upon a number of other files. The first line of each block, the
dependency line, mentions the target file, a colon, and the address of
the dependency file. On the next line comes the file with address,
thereafter again a colon, and after the colon the dependency files are
listed. The dependency line can go over several lines with the backslash
character (\\). In the first block, the dependency lines look as
follows:

    isme.fst: ../bin/isme.fst
    ../bin/isme.fst: ../bin/sme.fst ../bin/sme.save ../bin/tok.fst \
            ../bin/allcaps.fst

After the dependency line comes the actions themselves. In the Makefile,
each line is initiated with a TAB character. Commands are initiated with
the "@" character, and arguments delimited with quotes. Quotes within
the quotes are preceded by \\.

The commands are initiated by an informative banner printed to the
screen. Then comes the actions. They are printed to a temporary script
file (in the first block, the file is "isme-fst-script", by the @printf
command. Then the relevant program (e.g. the program xfst in the first
block of the sme Makefile) reads the scriptfile and executes it.
Finally, the temporary script file is removed by the @rm command. The
makefiles for the other languages are made in the same way.

Note that the source files are taken from the src directory (and
referred to by filenames only, since the Makefile itself is in the src
directory), whereas the binary files are taken from the bin directory,
and hence prefixed with '../bin/'.

### lookup: the lookup scripts

There are three lookup scripts (i.e. scripts for the Xerox program
`lookup`) in the bin directory, cap-sme, guess-sme and missing. They are
all invoked with the lookup -f flag, i.e. when the ordinary parser is
called as in 1., the script version is called as in 2the.:

1.  ... \| lookup -flags mbTT -utf8 bin/sme.fst \| ...
2.  ... \| lookup -flags mbTT -utf8 -f bin/cap-sme \| ...

The general format of the Xerox lookup scripts is documented in the
chapter on lookup in the Beesley and Karttunen book. To take one
example, the script missing looks like this (for the user `trond`, the
Makefile generates scripts with a unique absolute path for each user):

    analyzer /Users/trond/gt/sme/bin/sme.fst
     foreign /Users/trond/gt/sme/bin/foreign.fst
     typos /Users/trond/gt/sme/bin/typos.fst

     analyzer
     foreign
     typos

The script names three transducers (by arbitrary names), and gives an
absolute path to each of the transducers. Then comes an empty line, and
then the transducers, in the order they are meant to apply.

The main point with the scripts is that it is possible to chunk
different transducers together, without making one large transducer. The
main drawback with them is that they are much slower than simple
transducers. The script cap-sme makes it possible to analyse words
written with capital letters, but if you want to analyse a larger text
with this script, you should rather issue the command before lunch
break, and then return after lunch to have a look at what has happened.

Since these scripts need a user-unique path, involving the user name,
they must be generated in the makefile. This is done as follows (using
the same script as example):

    missing: ../bin/missing
    ../bin/missing:
            @echo
            @echo "*** Generating missing ***";
            @echo
            @printf "analyzer ${BINDIR}/sme.fst\n\                                                                                             
            foreign ${BINDIR}/foreign.fst\n\                                                                                                   
            typos ${BINDIR}/typos.fst\n\n\                                                                                                     
            analyzer\n\                                                                                                                        
            foreign\n\                                                                                                                         
            typos\n" > $@

#### The cap-sme script

This script chunks the transducers sme.fst and allcap.fst, i.e., it
analyses both biilla, Biilla and BIILLA (but not BiilLA).

#### The guess-sme script

This script involves the transducers sme.fst (the ordinary sme
transducer) and g-sme.fst (the guesser).

It is unclear to what extent this script works.

#### The missing script

The script itself was quoted in the introductory text above. The idea
behind the script is to first run the incoming text through the ordinary
sme transducer, then to run it through an extensive list of foreign
(i.e. Norwegian, Swedish, Finnish and English) word forms, and then to
run it through a list of known typos, both typos that we know are
common, and typos that we have attested in our corpora. A typical
command involving this script is the following:

    cat corp/ntunix corp/*txt | preprocess --abbr=bin/abbr.txt | 
     lookup -flags mbTT -utf8 -f bin/missing | grep '\?' | 
     cut -f1 | sort | uniq -c | sort -nr | less

Here, the text is preprocessed as usal. Then it is lead to the missing
script, and all wordforms that are either Saami words, Norwegian etc.
words or known typos, get an analysis. The remaining words (the ones
picked out with the `grep '\?'             `command) are the words
really missing from the transducer (thereby the name of the script).

### The preprocessor

The sme Makefile contains target for generating a file `abbr.txt` which
contains a list of abbreviations used in the preprocessing phase. The
file is generated by script `abbr-extract.pl` which is located in
`gt/script` directory. It gets as a command line parameter the main
abbreviation file and then a list of files from where multiword
expressions should be searched for. Basically:

    abbr.txt: ../bin/abbr.txt
    ../bin/abbr.txt: ../../script/abbr-extract abbr-sme-lex2.txt \
            propernoun-sme-lex.txt closed-sme-lex.txt adv-sme-lex.txt

            abbr-extract --abbr_lex=abbr-sme-lex2.txt \
            --lex=propernoun-sme-lex.txt,closed-sme-lex.txt,adv-sme-lex.txt \
            --output=../bin/abbr.txt

If one ever should need to manage without make...
-------------------------------------------------

In case the actual commands themeselves are sometimes needed: This is a
list of the commands that were needed to build a morphological parser
before the time of the makefile.

    exchange "sme" for other lg (smj, sms)

    Compiling the parser
    ====================

    in twolc (open by typing "twolc")
    ---------------------------------
    read-grammar twol-sme.txt
    compile
    save-binary twol-sme.bin

    in lexc (open by typing "lexc")
    -------------------------------
    compile-source *-sme.txt
    or: run-script skript1 (smj has script file "lskr", sms has no script file)
    read-rules twol-sme.bin
    compose-result
    save-result sme.save

    in xfst (open by typing "xfst")
    -------------------------------
    load stack caseconv.fst
    load stack sme.save
    compose net
    save stack sme.fst

    The tok.fst tokenizer is also built in xfst:
    --------------------------------------------
    read-regex < case.regex
    save stack caseconv.fst
