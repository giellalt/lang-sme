#!/usr/bin/env python3
"""Does batching sentences into one CG stream change their parses?"""
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

iso = list(cgio.read_stream("/private/tmp/depstudy/val/iso.dep.cg"))
bat = list(cgio.read_stream("/private/tmp/depstudy/data/gold.dep.cg"))[: len(iso)]
assert len(iso) == len(bat), (len(iso), len(bat))

tok = 0
head_diff = 0
lab_diff = 0
read_diff = 0
examples = []
for si, (a, b) in enumerate(zip(iso, bat)):
    if len(a) != len(b):
        print("LENGTH MISMATCH at sentence", si, len(a), len(b))
        continue
    ha, la = cgio.parse_tree(a)
    hb, lb = cgio.parse_tree(b)
    for i, (ca, cb) in enumerate(zip(a, b)):
        tok += 1
        if ha[i] != hb[i]:
            head_diff += 1
            if len(examples) < 8:
                examples.append((si, i, ca.form, ha[i], hb[i], la[i], lb[i]))
        if la[i] != lb[i]:
            lab_diff += 1
        ra = [r.split("#")[0] for r in ca.readings]
        rb = [r.split("#")[0] for r in cb.readings]
        if ra != rb:
            read_diff += 1

print("tokens compared : %d over %d sentences" % (tok, len(iso)))
print("head differs    : %d (%.2f%%)" % (head_diff, 100 * head_diff / tok))
print("label differs   : %d (%.2f%%)" % (lab_diff, 100 * lab_diff / tok))
print("readings differ : %d (%.2f%%)" % (read_diff, 100 * read_diff / tok))
print()
for e in examples:
    print("  s%-3d tok%-2d %-20s iso head=%s bat head=%s  iso lab=%s bat lab=%s" % e)
