.PHONY: check check-RC-with-flags check-spacetag
check: check-RC-with-flags check-spacetag

check-RC-with-flags: RC-with-flags.pmhfst
	hfst-tokenize -g $< < input > output
	diff output expected

check-spacetag: spacetag.pmhfst
	echo 'kake  kaffi, kake kaffi' | hfst-pmatch -l -c spacetag.pmhfst
	echo '( kake ) kaffi' | hfst-pmatch -l -c spacetag.pmhfst
	echo '( ( ' | hfst-pmatch -l -c spacetag.pmhfst
	echo '( ( ' | hfst-tokenise -g spacetag.pmhfst
	printf 'kake\n\nkaffi\n' | hfst-pmatch -l -c spacetag.pmhfst
	printf '\n\n' | hfst-tokenise -g spacetag.pmhfst

%.pmhfst: %.pmscript %.hfst
	hfst-pmatch2fst < $< >$@.tmp
	mv $@.tmp $@

%.hfst: %.lexc
	hfst-lexc $< -o $@

.PHONY: clean
clean:
	rm *.pmhfst *.hfst
