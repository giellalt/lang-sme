#!/bin/env python3
'''Script to convert smj or sma propernouns.lexc for sme.'''
import sys
inprops = False
for line in sys.stdin:
    if line.startswith("LEXICON"):
        if line.split()[1] in ["ProperNoun-smj-nocomp", "ProperNoun-smj",
                               "ProperNoun-sma-nocomp", "ProperNoun-sma"]:
            inprops = True
            print(line)
            continue
        else:
            inprops = False
            continue
    if not inprops:
        continue
    if "OLang/SME" in line:
        continue
    if "Err/Orth" in line:
        continue
    if "!" in line:
        line = line.replace("%!", "§EXCLAMATION§")
        line = line.split("!")[0]
        line = line.replace("§EXCLAMATION§", "%!")
    line = line.replace("% ", "§SPACE§")
    if not ";" in line:
        print(line)
        continue
    fields = line.split()
    if ":" in fields[0]:
        deep = fields[0].split(":")[0]
        surf = fields[0].split(":")[1]
    else:
        deep = fields[0]
        surf = fields[0]
    deep = deep.replace("§SPACE§", "% ")
    surf = surf.replace("§SPACE§", "% ")
    print(f"{deep}+N+Prop+Sg+Nom:{surf} # ;")
