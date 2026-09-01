#!/usr/bin/env python3
"""Where the damage is, and how usable the relatedness signal is.

Splits the tree-recovery loss by distance from the unknown word, and reports
relatedness at three levels of ambition: the head alone, head+dependents, and
head+dependents+siblings.
"""
import collections
import json
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"


def pr(tp, fp, fn):
    p_ = tp / (tp + fp) if tp + fp else 0.0
    r_ = tp / (tp + fn) if tp + fn else 0.0
    f_ = 2 * p_ * r_ / (p_ + r_) if p_ + r_ else 0.0
    return p_, r_, f_


def rel_head(heads, p, n):
    h = heads[p]
    return {h - 1} if h not in (None, 0) else set()


def rel_hd(heads, p, n):
    r = rel_head(heads, p, n)
    for i in range(n):
        if i != p and heads[i] == p + 1:
            r.add(i)
    return r


def rel_hds(heads, p, n):
    r = rel_hd(heads, p, n)
    hp = heads[p]
    if hp not in (None, 0):
        for i in range(n):
            if i != p and heads[i] == hp:
                r.add(i)
    return r


def main(pert_dir, label):
    index = [json.loads(l) for l in open(D + "/pert/index.jsonl", encoding="utf-8")]
    gold_cache = {}
    dist = collections.defaultdict(collections.Counter)
    levels = {"head only": rel_head, "head+deps": rel_hd, "head+deps+sibs": rel_hds}
    acc = {k: collections.Counter() for k in levels}
    win = {k: collections.defaultdict(collections.Counter) for k in levels}
    head_exact = collections.Counter()

    for e in index:
        si, p = e["sent"], e["pos"]
        if si not in gold_cache:
            g = list(cgio.read_stream("%s/gold/out/%04d.dep" % (D, si)))
            gold_cache[si] = g[0] if len(g) == 1 else None
        gsent = gold_cache[si]
        if gsent is None:
            continue
        try:
            ps = list(cgio.read_stream("%s/%s.dep" % (pert_dir, e["key"])))
        except FileNotFoundError:
            continue
        if len(ps) != 1 or len(ps[0]) != len(gsent):
            continue
        psent = ps[0]
        n = len(gsent)
        gh, gl = cgio.parse_tree(gsent)
        ph, pl = cgio.parse_tree(psent)
        punct = [cgio.is_punct(c) for c in gsent]

        for i in range(n):
            if i == p or punct[i] or gh[i] is None:
                continue
            d = min(abs(i - p), 6)
            dist[d]["n"] += 1
            if ph[i] == gh[i]:
                dist[d]["uas"] += 1
                if pl[i] == gl[i]:
                    dist[d]["las"] += 1

        # head of the unknown word, exactly right?
        if gh[p] not in (None, 0):
            head_exact["gold_has"] += 1
            if ph[p] == gh[p]:
                head_exact["exact"] += 1
            if ph[p] not in (None, 0):
                head_exact["predicted"] += 1

        cand = [i for i in range(n) if not punct[i] and i != p]
        for name, fn_ in levels.items():
            G = {i for i in fn_(gh, p, n) if not punct[i]}
            P = {i for i in fn_(ph, p, n) if not punct[i]}
            acc[name]["tp"] += len(G & P)
            acc[name]["fp"] += len(P - G)
            acc[name]["fn"] += len(G - P)
            for N in (1, 2, 3, 5):
                W = {i for i in cand if abs(i - p) <= N}
                win[name][N]["tp"] += len(G & W)
                win[name][N]["fp"] += len(W - G)
                win[name][N]["fn"] += len(G - W)

    print("=" * 68)
    print("DIAGNOSTICS: %s" % label)
    print("=" * 68)
    print("tree recovery by distance from the unknown word:")
    print("  dist    n      UAS      LAS")
    for d in sorted(dist):
        c = dist[d]
        tag = "%d" % d if d < 6 else "6+"
        print("  %-4s %7d  %6.2f%%  %6.2f%%"
              % (tag, c["n"], 100 * c["uas"] / c["n"], 100 * c["las"] / c["n"]))
    print()
    print("head of the unknown word:")
    if head_exact["gold_has"]:
        print("  gold gives it a head        : %d" % head_exact["gold_has"])
        print("  a head is predicted         : %d (%.1f%%)"
              % (head_exact["predicted"], 100 * head_exact["predicted"] / head_exact["gold_has"]))
        print("  predicted head is correct   : %d (%.1f%% of all, %.1f%% of predicted)"
              % (head_exact["exact"], 100 * head_exact["exact"] / head_exact["gold_has"],
                 100 * head_exact["exact"] / head_exact["predicted"] if head_exact["predicted"] else 0))
    print()
    for name in ("head only", "head+deps", "head+deps+sibs"):
        a = acc[name]
        p_, r_, f_ = pr(a["tp"], a["fp"], a["fn"])
        print("%-16s CG tree      prec %.3f  rec %.3f  F1 %.3f" % (name, p_, r_, f_))
        for N in (1, 2, 3, 5):
            w = win[name][N]
            p2, r2, f2 = pr(w["tp"], w["fp"], w["fn"])
            print("%-16s within %d     prec %.3f  rec %.3f  F1 %.3f" % ("", N, p2, r2, f2))
        print()


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else sys.argv[1])
