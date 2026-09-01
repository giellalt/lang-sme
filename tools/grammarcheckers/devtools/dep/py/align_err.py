#!/usr/bin/env python3
"""Align the real error sentences with their corrected counterparts.

A row is usable only if the misspelling and the correction occupy the same
single cohort position and the two sentences agree everywhere else; otherwise
"the head of token i" means different things in the two parses and the
comparison is meaningless.
"""
import json
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"

rows = [json.loads(l) for l in open(D + "/data/rows.jsonl", encoding="utf-8")]
gold = list(cgio.read_stream(D + "/data/gold.ana.cg"))
err = list(cgio.read_stream(D + "/data/err.ana.cg"))
assert len(rows) == len(gold) == len(err)

ok = []
reason = {"len": 0, "multi": 0, "nomatch": 0, "context": 0}
for i, (r, g, e) in enumerate(zip(rows, gold, err)):
    if len(g) != len(e):
        reason["len"] += 1
        continue
    diff = [j for j in range(len(g)) if g[j].form != e[j].form]
    if len(diff) != 1:
        reason["multi" if len(diff) > 1 else "nomatch"] += 1
        continue
    p = diff[0]
    if g[p].form[2:-2] != r["correction"] or e[p].form[2:-2] != r["error"]:
        reason["nomatch"] += 1
        continue
    ok.append({"sent": i, "pos": p, "error": r["error"], "correction": r["correction"]})

with open(D + "/data/err_align.jsonl", "w", encoding="utf-8") as fh:
    for e in ok:
        fh.write(json.dumps(e, ensure_ascii=False) + "\n")

print("aligned rows: %d / %d" % (len(ok), len(rows)))
print("dropped:", reason)
