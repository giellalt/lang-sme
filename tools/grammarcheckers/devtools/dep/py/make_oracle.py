#!/usr/bin/env python3
"""Ceiling condition: the unknown cohort keeps the correct morphology but loses
its lexical identity.

This is what a perfect POS-and-morphology guesser would deliver -- or, in the
real pipeline, a speller whose suggestions all have the right shape.  If the
tree is recovered here, the limit is the guesser; if it is not, the limit is the
dependency grammar.
"""
import json
import os
import re
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"
LEMMA = re.compile(r'^(\s*)"([^"]*)"')


def corrupt(form):
    if len(form) < 2:
        return form + "q"
    return form[0] + "q" + form[1:]


def main():
    index = [json.loads(l) for l in open(D + "/pert/index.jsonl", encoding="utf-8")]
    sents = list(cgio.read_stream(D + "/data/gold.ana.cg"))
    outdir = D + "/pert3/in"
    os.makedirs(outdir, exist_ok=True)
    for e in index:
        sent = sents[e["sent"]]
        p = e["pos"]
        bad = corrupt(sent[p].form[2:-2])
        c = cgio.Cohort('"<%s>"' % bad)
        for r in sent[p].readings:
            c.readings.append(LEMMA.sub(lambda m: '%s"%s"' % (m.group(1), bad), r))
        pert = list(sent)
        pert[p] = c
        with open("%s/%s.cg" % (outdir, e["key"]), "w", encoding="utf-8") as out:
            cgio.write_sentence(out, pert)
    print("wrote", len(index))


if __name__ == "__main__":
    main()
