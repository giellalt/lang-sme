#!/usr/bin/env python3
"""score.py against an arbitrary index file (used for the real-misspelling runs)."""
import collections
import json
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio
from score import related, pr

D = "/private/tmp/depstudy"


def main(index_path, pert_dir, label, only_error_pos=False):
    index = [json.loads(l) for l in open(index_path, encoding="utf-8")]
    if only_error_pos:
        index = [e for e in index if e.get("is_error_pos")]
    gold_cache = {}
    stats = collections.Counter()
    rel = collections.Counter()
    win = collections.defaultdict(collections.Counter)
    head_exact = collections.Counter()
    dist = collections.defaultdict(collections.Counter)

    for e in index:
        si, p = e["sent"], e["pos"]
        if si not in gold_cache:
            g = list(cgio.read_stream("%s/gold/out/%04d.dep" % (D, si)))
            gold_cache[si] = g[0] if len(g) == 1 else None
        gsent = gold_cache[si]
        if gsent is None:
            stats["gold_missing"] += 1
            continue
        try:
            ps = list(cgio.read_stream("%s/%s.dep" % (pert_dir, e["key"])))
        except FileNotFoundError:
            stats["missing"] += 1
            continue
        if len(ps) != 1 or len(ps[0]) != len(gsent):
            stats["mismatch"] += 1
            continue
        psent = ps[0]
        n = len(gsent)
        gh, gl = cgio.parse_tree(gsent)
        ph, pl = cgio.parse_tree(psent)
        punct = [cgio.is_punct(c) for c in gsent]
        for i in range(n):
            if i == p or punct[i] or gh[i] is None:
                continue
            stats["tok"] += 1
            d = min(abs(i - p), 6)
            dist[d]["n"] += 1
            if ph[i] == gh[i]:
                stats["uas"] += 1
                dist[d]["uas"] += 1
                if pl[i] == gl[i]:
                    stats["las"] += 1
            if pl[i] == gl[i]:
                stats["lab"] += 1
        if gh[p] not in (None, 0):
            head_exact["gold_has"] += 1
            if ph[p] not in (None, 0):
                head_exact["predicted"] += 1
                if ph[p] == gh[p]:
                    head_exact["exact"] += 1
        G = {i for i in related(gh, p, n) if not punct[i]}
        P = {i for i in related(ph, p, n) if not punct[i]}
        rel["n"] += 1
        rel["tp"] += len(G & P)
        rel["fp"] += len(P - G)
        rel["fn"] += len(G - P)
        if ph[p] not in (None, 0):
            rel["p_attached"] += 1
        cand = [i for i in range(n) if not punct[i] and i != p]
        for N in (1, 2, 3, 5):
            W = {i for i in cand if abs(i - p) <= N}
            win[N]["tp"] += len(G & W)
            win[N]["fp"] += len(W - G)
            win[N]["fn"] += len(G - W)

    print("=" * 68)
    print("RUN: %s" % label)
    print("=" * 68)
    print("rows scored: %d   dropped: %s" % (rel["n"], dict(stats) if stats["missing"] or stats["mismatch"] else "none"))
    t = stats["tok"]
    print("UAS %.2f%%   LAS %.2f%%   label %.2f%%   (n=%d)"
          % (100 * stats["uas"] / t, 100 * stats["las"] / t, 100 * stats["lab"] / t, t))
    print("UAS by distance:", "  ".join(
        "%s:%.1f%%" % ("6+" if d == 6 else d, 100 * dist[d]["uas"] / dist[d]["n"])
        for d in sorted(dist) if dist[d]["n"]))
    if head_exact["gold_has"]:
        print("head of the misspelling: predicted %d/%d (%.1f%%), correct %d (%.1f%% of all)"
              % (head_exact["predicted"], head_exact["gold_has"],
                 100 * head_exact["predicted"] / head_exact["gold_has"],
                 head_exact["exact"], 100 * head_exact["exact"] / head_exact["gold_has"]))
    print("misspelling attaches: %d/%d (%.1f%%)"
          % (rel["p_attached"], rel["n"], 100 * rel["p_attached"] / rel["n"]))
    p_, r_, f_ = pr(rel["tp"], rel["fp"], rel["fn"])
    print("relatedness  CG tree      prec %.3f  rec %.3f  F1 %.3f" % (p_, r_, f_))
    for N in (1, 2, 3, 5):
        w = win[N]
        p2, r2, f2 = pr(w["tp"], w["fp"], w["fn"])
        print("             within %d     prec %.3f  rec %.3f  F1 %.3f" % (N, p2, r2, f2))
    print()


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else sys.argv[2],
         len(sys.argv) > 4 and sys.argv[4] == "errpos")
