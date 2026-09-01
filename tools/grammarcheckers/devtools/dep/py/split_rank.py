#!/usr/bin/env python3
"""Split the E index by whether the speller got the word right at rank 1.

If relatedness only holds when the speller already had the answer, the signal is
not independent of the speller and cannot be used to help it.
"""
import json
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
from build_e import read_suggestions

D = "/private/tmp/depstudy"
align = {(json.loads(l)["sent"], json.loads(l)["pos"]): json.loads(l)
         for l in open(D + "/data/err_align.jsonl", encoding="utf-8")}
sugg = read_suggestions(D + "/data/err_sugg.txt")
idx = [json.loads(l) for l in open(D + "/data/e_index.jsonl", encoding="utf-8")]

top1, nottop1 = [], []
for e in idx:
    a = align[(e["sent"], e["pos"])]
    lst = sugg.get(a["error"], [])
    if lst and lst[0] == a["correction"]:
        top1.append(e)
    else:
        nottop1.append(e)

for name, rows in (("top1", top1), ("nottop1", nottop1)):
    with open("%s/data/e_index_%s.jsonl" % (D, name), "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
print("speller correct at rank 1: %d   not at rank 1: %d" % (len(top1), len(nottop1)))
