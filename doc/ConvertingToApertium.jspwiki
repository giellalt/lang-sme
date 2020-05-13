
[Apertium|http://wiki.apertium.org] is a machine translation platform, we use it a.o. for sme-sma.


!!!Converting the fst

In order to convert the North Sami fst to Apertium, do the following, in {{langs/sme}}:

{{{
./configure --with-hfst --enable-apertium
make
cd src
make analyser-apertium-norm.att
gzip -9 analyser-apertium-norm.att
cp analyser-apertium-norm.att.gz /path/to/your/apertium/nursery/apertium-sme-sme/apertium-sme-sma.sme.att.gz 
}}}


* Then compile in the apertium folder, and check that everything is well. 
* Then check in the {{apertium-sme-sma.sme.att.gz}} file.

!!!Documenting the conversion setup

tbw.
