#!/usr/bin/env python3
"""The comparison a CG rule author actually faces.

A rule that wants "the word this misspelling modifies" currently writes (-1 N)
or (1 N).  This asks how often each way of naming that word is right, and adds
the function label, because a rule usually tests the relation as well as the
head.
"""
import collections
import json
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"


def main(conds):
    align = [json.loads(l) for l in open(D + "/data/e_index.jsonl", encoding="utf-8")]
    gold_cache = {}
    adj = collections.Counter()
    res = {}
    for cond, cdir in conds:
        c = collections.Counter()
        for e in align:
            si, p = e["sent"], e["pos"]
            if si not in gold_cache:
                g = list(cgio.read_stream("%s/gold/out/%04d.dep" % (D, si)))
                gold_cache[si] = g[0] if len(g) == 1 else None
            gsent = gold_cache[si]
            if gsent is None:
                continue
            try:
                ps = list(cgio.read_stream("%s/%s.dep" % (cdir, e["key"])))
            except FileNotFoundError:
                continue
            if len(ps) != 1 or len(ps[0]) != len(gsent):
                continue
            n = len(gsent)
            gh, gl = cgio.parse_tree(gsent)
            ph, pl = cgio.parse_tree(ps[0])
            if gh[p] in (None, 0):
                continue
            c["n"] += 1
            gold_head = gh[p] - 1
            if ph[p] not in (None, 0):
                c["fires"] += 1
                if ph[p] - 1 == gold_head:
                    c["head_ok"] += 1
                    if pl[p] == gl[p]:
                        c["head_and_label_ok"] += 1
            if pl[p] == gl[p]:
                c["label_ok"] += 1
            if cond == conds[0][0]:
                adj["n"] += 1
                if abs(gold_head - p) == 1:
                    adj["adjacent"] += 1
                if gold_head == p - 1:
                    adj["left1"] += 1
                if gold_head == p + 1:
                    adj["right1"] += 1
                if abs(gold_head - p) <= 2:
                    adj["within2"] += 1
                if abs(gold_head - p) <= 3:
                    adj["within3"] += 1
        res[cond] = c

    print("=" * 74)
    print("Naming the head of the misspelling")
    print("=" * 74)
    n = adj["n"]
    print("rows where gold gives the misspelling a head: %d" % n)
    print()
    print("adjacency, as a way of naming that head:")
    print("  the head IS the token at -1          : %.1f%%" % (100 * adj["left1"] / n))
    print("  the head IS the token at +1          : %.1f%%" % (100 * adj["right1"] / n))
    print("  the head is one of the two neighbours: %.1f%%" % (100 * adj["adjacent"] / n))
    print("  the head is within 2                 : %.1f%%" % (100 * adj["within2"] / n))
    print("  the head is within 3                 : %.1f%%" % (100 * adj["within3"] / n))
    print()
    print("%-42s %8s %8s %8s" % ("dependency, as a way of naming that head",
                                 "fires", "head ok", "+label"))
    for cond, _ in conds:
        c = res[cond]
        if not c["n"]:
            continue
        print("  %-40s %7.1f%% %7.1f%% %7.1f%%"
              % (cond,
                 100 * c["fires"] / c["n"],
                 100 * c["head_ok"] / c["n"],
                 100 * c["head_and_label_ok"] / c["n"]))
    print()
    print("  (fires   = a head is proposed at all)")
    print("  (head ok = the proposed head is the gold head, over ALL rows)")
    print("  (+label  = head right AND the misspelling's own function label right)")
    print()
    print("precision when it fires:")
    for cond, _ in conds:
        c = res[cond]
        if c["fires"]:
            print("  %-40s %.3f" % (cond, c["head_ok"] / c["fires"]))


if __name__ == "__main__":
    main([
        ("E0 unknown, stock CG", D + "/e0/out"),
        ("E1 unknown + POS guesser", D + "/e1/out"),
        ("E2 speller top-10", D + "/e2/out"),
        ("E2x top-10 minus the correction", D + "/e2x/out"),
        ("E2 top-3", D + "/e2k3/out"),
        ("E2 best suggestion only", D + "/e2k1/out"),
    ])
