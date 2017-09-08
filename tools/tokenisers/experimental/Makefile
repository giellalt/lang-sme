.PHONY: check
check: RC-with-flags.pmhfst
	hfst-tokenize -g $< < input > output
	diff output expected

%.pmhfst: %.pmscript %.hfst
	hfst-pmatch2fst < $< >$@.tmp
	mv $@.tmp $@

%.hfst: %.lexc
	hfst-lexc $< -o $@

.PHONY: clean
clean:
	rm *.pmhfst *.hfst
