#!/usr/bin/env python3
"""A second perturbed set, identical to the first except that the unknown
cohort's wordform is corrupted.

In the first set the blanked cohort keeps the correct wordform, so it is also
the baseform of the "?" reading, and lexical rules in the disambiguator can
still fire on it -- an advantage a real misspelling would not give.  Inserting
a "q" (not a Sámi grapheme) guarantees the string matches no lexical set while
preserving the initial letter and capitalisation, which a misspelling usually
does preserve.
"""
import json
import os
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"


def corrupt(form):
    if len(form) < 2:
        return form + "q"
    return form[0] + "q" + form[1:]


def main():
    index = [json.loads(l) for l in open(D + "/pert/index.jsonl", encoding="utf-8")]
    sents = list(cgio.read_stream(D + "/data/gold.ana.cg"))
    outdir = D + "/pert2/in"
    os.makedirs(outdir, exist_ok=True)
    for e in index:
        sent = sents[e["sent"]]
        p = e["pos"]
        pert = list(sent)
        bad = corrupt(sent[p].form[2:-2])
        c = cgio.Cohort('"<%s>"' % bad)
        c.readings = ['\t"%s" ?' % bad]
        pert[p] = c
        with open("%s/%s.cg" % (outdir, e["key"]), "w", encoding="utf-8") as out:
            cgio.write_sentence(out, pert)
    print("wrote", len(index))


if __name__ == "__main__":
    main()
