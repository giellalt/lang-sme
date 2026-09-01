#!/usr/bin/env python3
"""Generate the perturbed set: one copy of each sentence per word, with that
word forced to the analysis an out-of-vocabulary word gets.

Set A: every content position of the first N_A sentences.
Set B: only the real error position, over all sentences.

Each perturbation is written as its own CG stream, because batching sentences
into a shared stream changes 12.6% of heads (measured).
"""
import json
import os
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"
N_A = 400

rows = [json.loads(l) for l in open(D + "/data/rows.jsonl", encoding="utf-8")]
sents = list(cgio.read_stream(D + "/data/gold.ana.cg"))
assert len(rows) == len(sents)


def is_known(c):
    return not (len(c.readings) == 1 and c.readings[0].rstrip().endswith(" ?"))


def find_error_pos(row, sent):
    """Cohort index of the corrected word, or None if it is not a clean match."""
    target = row["correction"]
    hits = [i for i, c in enumerate(sent) if c.form[2:-2] == target]
    if len(hits) == 1:
        return hits[0]
    return None


def main():
    outdir = D + "/pert"
    os.makedirs(outdir + "/in", exist_ok=True)
    index = []
    for si, (row, sent) in enumerate(zip(rows, sents)):
        epos = find_error_pos(row, sent)
        positions = []
        if si < N_A:
            positions = [
                i for i, c in enumerate(sent)
                if not cgio.is_punct(c) and is_known(c)
            ]
            setname = "A"
        else:
            positions = [epos] if epos is not None and is_known(sent[epos]) else []
            setname = "B"
        for p in positions:
            key = "%04d_%02d" % (si, p)
            with open("%s/in/%s.cg" % (outdir, key), "w", encoding="utf-8") as out:
                pert = list(sent)
                pert[p] = cgio.blank_cohort(sent[p])
                cgio.write_sentence(out, pert)
            index.append(
                {
                    "key": key,
                    "sent": si,
                    "pos": p,
                    "set": "A" if si < N_A else "B",
                    "is_error_pos": (p == epos),
                    "form": sent[p].form[2:-2],
                }
            )
    with open(D + "/pert/index.jsonl", "w", encoding="utf-8") as fh:
        for e in index:
            fh.write(json.dumps(e, ensure_ascii=False) + "\n")
    na = sum(1 for e in index if e["set"] == "A")
    nb = sum(1 for e in index if e["set"] == "B")
    print("perturbations: %d  (set A %d over %d sentences, set B %d)"
          % (len(index), na, N_A, nb))
    print("error positions located: %d / %d"
          % (sum(1 for e in index if e["is_error_pos"]), len(rows)))


if __name__ == "__main__":
    main()
