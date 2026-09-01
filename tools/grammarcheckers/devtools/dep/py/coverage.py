#!/usr/bin/env python3
"""How much of the gold tree is actually usable as a relatedness signal.

A head of 0 means "root", which the grammar also uses for "could not attach";
@X is the null function label.  Neither can support a CG context test, so they
bound everything downstream regardless of how well the misspelling is handled.
"""
import collections
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"

tot = content = attached = labelled = usable = 0
xlab = 0
nsent = 0
single_root = 0
rel_sizes = []
for i in range(1000):
    try:
        s = list(cgio.read_stream("%s/gold/out/%04d.dep" % (D, i)))
    except FileNotFoundError:
        continue
    if len(s) != 1:
        continue
    sent = s[0]
    nsent += 1
    heads, labels = cgio.parse_tree(sent)
    n = len(sent)
    roots = 0
    for j in range(n):
        tot += 1
        if cgio.is_punct(sent[j]):
            continue
        content += 1
        h, l = heads[j], labels[j]
        if h not in (None, 0):
            attached += 1
        else:
            roots += 1
        if l is not None:
            labelled += 1
            if l == "@X":
                xlab += 1
        if h not in (None, 0) and l is not None and l != "@X":
            usable += 1
    if roots == 1:
        single_root += 1

print("gold trees over %d sentences" % nsent)
print("  content tokens              : %d" % content)
print("  with a head that is not root: %d (%.1f%%)" % (attached, 100 * attached / content))
print("  with a function label       : %d (%.1f%%)" % (labelled, 100 * labelled / content))
print("  label is @X (null)          : %d (%.1f%%)" % (xlab, 100 * xlab / content))
print("  usable (real head + real label): %d (%.1f%%)" % (usable, 100 * usable / content))
print("  sentences forming one tree  : %d (%.1f%%)" % (single_root, 100 * single_root / nsent))
