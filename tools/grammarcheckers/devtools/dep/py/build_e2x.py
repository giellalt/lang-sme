#!/usr/bin/env python3
"""Controls for E2.

The correction is in the speller's top-10 for every row of this data, because
the rows come from typos.tsv, which the speller is tuned against.  E2 could
therefore be measuring "the right word was in the cohort" rather than "the
suggestions agree on a shape".

e2x   top-10 with the correction deleted -- the floor
e2k1  the single best suggestion only     -- what a one-best pipeline would give
e2k3  top-3
"""
import json
import os
import subprocess
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio
from build_e import read_suggestions, analyse_words

D = "/private/tmp/depstudy"


def main():
    align = [json.loads(l) for l in open(D + "/data/err_align.jsonl", encoding="utf-8")]
    err = list(cgio.read_stream(D + "/data/err.ana.cg"))
    sugg = read_suggestions(D + "/data/err_sugg.txt")

    vocab, seen = [], set()
    for e in align:
        for w in sugg.get(e["error"], [])[:10]:
            if w not in seen:
                seen.add(w)
                vocab.append(w)
    ana = analyse_words(vocab)

    variants = {
        "e2x": lambda lst, corr: [w for w in lst[:10] if w != corr],
        "e2k1": lambda lst, corr: lst[:1],
        "e2k3": lambda lst, corr: lst[:3],
    }
    for v in variants:
        os.makedirs("%s/%s/in" % (D, v), exist_ok=True)

    ranks = []
    for e in align:
        si, p = e["sent"], e["pos"]
        key = "%04d_%02d" % (si, p)
        lst = sugg.get(e["error"], [])
        ranks.append(lst.index(e["correction"]) + 1 if e["correction"] in lst else 0)
        for v, pick in variants.items():
            c = cgio.Cohort(err[si][p].form)
            for w in pick(lst, e["correction"]):
                for r in ana.get(w, []):
                    c.readings.append(r.rstrip() + " <spelled>")
            if not c.readings:
                c.readings = ['\t"%s" ?' % e["error"]]
            s = list(err[si])
            s[p] = c
            with open("%s/%s/in/%s.cg" % (D, v, key), "w", encoding="utf-8") as out:
                cgio.write_sentence(out, s)

    at1 = sum(1 for r in ranks if r == 1)
    print("correction at rank 1 : %d/%d (%.1f%%)" % (at1, len(ranks), 100 * at1 / len(ranks)))
    print("mean rank when found : %.2f" % (sum(r for r in ranks if r) / max(1, sum(1 for r in ranks if r))))


if __name__ == "__main__":
    main()
