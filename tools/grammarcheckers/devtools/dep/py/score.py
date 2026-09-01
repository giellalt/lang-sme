#!/usr/bin/env python3
"""Score a perturbed run against the gold trees.

Two questions, kept separate:

1. Tree recovery.  Of the tokens that are NOT the perturbed one, how many keep
   the head and the function label they had in the gold parse?  UAS = head only,
   LAS = head and label.  Punctuation is excluded throughout: it carries no
   function tag and its attachment is an artefact of the grammar's clean-up
   rules.

2. Relatedness.  For the perturbed position p, the gold "related" set is
   head(p), the dependents of p, and p's siblings.  We ask how well the
   perturbed parse recovers that set, and compare against the trivial
   predictor "every token within N of p".
"""
import collections
import json
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"


def related(heads, p, n):
    """head(p) + dependents(p) + siblings(p), as 0-based indices."""
    r = set()
    hp = heads[p]
    if hp is not None and hp != 0:
        r.add(hp - 1)
    for i in range(n):
        if i == p:
            continue
        if heads[i] == p + 1:
            r.add(i)
    if hp is not None and hp != 0:
        for i in range(n):
            if i == p:
                continue
            if heads[i] == hp:
                r.add(i)
    return r


def pr(tp, fp, fn):
    p_ = tp / (tp + fp) if tp + fp else 0.0
    r_ = tp / (tp + fn) if tp + fn else 0.0
    f_ = 2 * p_ * r_ / (p_ + r_) if p_ + r_ else 0.0
    return p_, r_, f_


def main(pert_dir, label, gold_dir=None):
    gold_dir = gold_dir or (D + "/gold/out")
    index = [json.loads(l) for l in open(D + "/pert/index.jsonl", encoding="utf-8")]
    gold_cache = {}

    stats = collections.Counter()
    rel = collections.Counter()
    win_tp = collections.Counter()
    win_fp = collections.Counter()
    win_fn = collections.Counter()
    gold_rel_sizes = []
    pred_rel_sizes = []
    per_set = collections.defaultdict(collections.Counter)

    for e in index:
        si = e["sent"]
        p = e["pos"]
        if si not in gold_cache:
            g = list(cgio.read_stream("%s/%04d.dep" % (gold_dir, si)))
            gold_cache[si] = g[0] if len(g) == 1 else None
        gsent = gold_cache[si]
        if gsent is None:
            stats["gold_missing"] += 1
            continue
        try:
            psents = list(cgio.read_stream("%s/%s.dep" % (pert_dir, e["key"])))
        except FileNotFoundError:
            stats["pert_missing"] += 1
            continue
        if len(psents) != 1:
            stats["pert_split"] += 1
            continue
        psent = psents[0]
        if len(psent) != len(gsent):
            stats["len_mismatch"] += 1
            continue
        n = len(gsent)
        gh, gl = cgio.parse_tree(gsent)
        ph, pl = cgio.parse_tree(psent)
        punct = [cgio.is_punct(c) for c in gsent]

        s = e["set"]
        for i in range(n):
            if i == p or punct[i]:
                continue
            if gh[i] is None:
                continue
            stats["tok"] += 1
            per_set[s]["tok"] += 1
            if ph[i] == gh[i]:
                stats["uas"] += 1
                per_set[s]["uas"] += 1
                if pl[i] == gl[i]:
                    stats["las"] += 1
                    per_set[s]["las"] += 1
            if pl[i] == gl[i]:
                stats["lab"] += 1
                per_set[s]["lab"] += 1

        G = {i for i in related(gh, p, n) if not punct[i]}
        P = {i for i in related(ph, p, n) if not punct[i]}
        gold_rel_sizes.append(len(G))
        pred_rel_sizes.append(len(P))
        rel["n"] += 1
        rel["tp"] += len(G & P)
        rel["fp"] += len(P - G)
        rel["fn"] += len(G - P)
        if not G:
            rel["gold_empty"] += 1
        if not P:
            rel["pred_empty"] += 1
        if ph[p] not in (None, 0):
            rel["p_attached"] += 1
        if gh[p] not in (None, 0):
            rel["p_attached_gold"] += 1

        cand = [i for i in range(n) if not punct[i] and i != p]
        for N in (1, 2, 3, 5, 8):
            W = {i for i in cand if abs(i - p) <= N}
            win_tp[N] += len(G & W)
            win_fp[N] += len(W - G)
            win_fn[N] += len(G - W)
        W = set(cand)
        win_tp[999] += len(G & W)
        win_fp[999] += len(W - G)
        win_fn[999] += len(G - W)

    print("=" * 68)
    print("RUN: %s" % label)
    print("=" * 68)
    print("scored perturbations : %d" % rel["n"])
    for k in ("gold_missing", "pert_missing", "pert_split", "len_mismatch"):
        if stats[k]:
            print("  dropped (%s): %d" % (k, stats[k]))
    print()
    print("-- tree recovery on the non-perturbed tokens --")
    t = stats["tok"]
    print("tokens scored        : %d" % t)
    print("UAS (head match)     : %.2f%%" % (100 * stats["uas"] / t))
    print("LAS (head+label)     : %.2f%%" % (100 * stats["las"] / t))
    print("label-only accuracy  : %.2f%%" % (100 * stats["lab"] / t))
    for s in sorted(per_set):
        ts = per_set[s]["tok"]
        if ts:
            print("   set %s: UAS %.2f%%  LAS %.2f%%  (n=%d)"
                  % (s, 100 * per_set[s]["uas"] / ts, 100 * per_set[s]["las"] / ts, ts))
    print()
    print("-- relatedness of the perturbed word --")
    print("perturbed word has a head in gold      : %d/%d (%.1f%%)"
          % (rel["p_attached_gold"], rel["n"], 100 * rel["p_attached_gold"] / rel["n"]))
    print("perturbed word attaches when unknown   : %d/%d (%.1f%%)"
          % (rel["p_attached"], rel["n"], 100 * rel["p_attached"] / rel["n"]))
    print("mean |gold related| : %.2f    mean |predicted related| : %.2f"
          % (sum(gold_rel_sizes) / len(gold_rel_sizes),
             sum(pred_rel_sizes) / len(pred_rel_sizes)))
    print("gold related set empty : %d (%.1f%%)"
          % (rel["gold_empty"], 100 * rel["gold_empty"] / rel["n"]))
    print("pred related set empty : %d (%.1f%%)"
          % (rel["pred_empty"], 100 * rel["pred_empty"] / rel["n"]))
    p_, r_, f_ = pr(rel["tp"], rel["fp"], rel["fn"])
    print()
    print("%-22s  prec    rec     F1" % "predictor")
    print("%-22s  %.3f   %.3f   %.3f" % ("CG tree (recovered)", p_, r_, f_))
    for N in (1, 2, 3, 5, 8, 999):
        p2, r2, f2 = pr(win_tp[N], win_fp[N], win_fn[N])
        nm = "whole sentence" if N == 999 else "within %d tokens" % N
        print("%-22s  %.3f   %.3f   %.3f" % (nm, p2, r2, f2))
    print()


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else sys.argv[1])
