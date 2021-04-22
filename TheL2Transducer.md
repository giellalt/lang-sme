



The L2 transducer is a transducer that models probable L2 errors.
Similar transducers are planned for Plains Cree and Northern Haida as well.


It is made as follows:


For **lexc**, the ordinary files are named as for all other languages, 
`adjectives.lexc`, etc. The L2 transducer files for adjectives, nouns and verbs in the stems and affixes folders are named `affixes/adjectives-L2.lexc`
etc. They shall be manually copied over from `branches/errorfst`.


For **twolc**, the ordinary file is called sme-phon-L1.twolc (and is
automatically copied over from the oldinfra file twol-sme.txt, by our
ordinary update script. The L2 file is called sme-phon-L2.twolc, and
is our source file for the L2 transducer.


**Note the not-so-elegant asymmetry**: sme-phon-L1.twolc is a file 
copied from oldinfra, and shall **not** be edited. sme-phon-L2.twolc
is the source file itself, and **shall** be edited. The derived
file sme-phon.twolc is the copy of either -L1 or -L2, and shall not be
edited.


To compile, in langs/sme:


```
./configure --enable-oahpa # to make the L2 transducer
./configure --disable-oahpa # to **not** make the L2 transducer
make
```


The normal transducers have their normal names, the L2 transducers are called *-oahpa*.
