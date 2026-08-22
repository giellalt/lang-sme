#!/usr/bin/env python3
"""Predict the effect of editdist cost changes without rebuilding the speller.

Works from a per-word JSON report produced by

    divvunspell accuracy -c <config> -o report.json test/typos.tsv se.zhfst

For every suggestion the script derives a single-edit *signature* against the
input word (which substitution, which insertion/deletion and where, transpose,
or case-only), applies a candidate reprice — a list of (signature, weight
delta) rules — to every matching suggestion, re-ranks each word's suggestion
list, and reports the predicted top-1/top-5/any counts plus the individual
flips in both directions.

Run with just a report to get the baseline and an inventory of the edits the
intended corrections *needed* in every non-top-1 case (the place to look for
repricing candidates), together with how often current wrong winners used the
same edit (the collateral indicator):

    ./simulate-editdist-reprice.py report.json

Then score a candidate vector:

    ./simulate-editdist-reprice.py report.json --deltas my-deltas.json --flips

where my-deltas.json is a list of rules, matched in order, first match wins:

    [
      {"kind": "subst", "detail": "o:u", "delta": -7},
      {"kind": "add",   "detail": "*",   "pos": "gem", "delta": -5},
      {"kind": "add",   "detail": "d",   "pos": "final|after:i", "delta": -21}
    ]

"kind" is one of subst / add / del / transpose / case.  "detail" is the
substitution pair, the added/deleted character, or "*" for any.  "pos" is a
substring match against the positional info: "initial", "mid", "final",
"after:<char>", and for add/del "gem" when the edit creates or removes a
doubled character.  "delta" is added to the suggestion's weight (negative =
cheaper).  Signatures are computed case-insensitively; a suggestion differing
from the input only by case gets ("case", "", "").

Calibration honesty, from the 2026-08 round-3 tuning of lang-sme: the
simulator reproduces the report's baseline exactly, and its per-rule flip
attribution is reliable for deciding *which* levers help and which hurt (it
caught a net-negative rule in one iteration).  Its aggregate prediction is an
upper bound, not a forecast: it can only re-rank suggestions already present
in the report, while a real rebuild also admits new cheap candidates that
compete with the intended corrections.  Round 3 realized roughly 40% of the
predicted top-1 gain.  Always confirm a vector with a real rebuild and a full
accuracy run before shipping it.
"""
import argparse
import json
import sys
from collections import Counter


def signature(inp, sug):
    """Return (kind, detail, posinfo) for a single edit, else None."""
    a, b = list(inp.lower()), list(sug.lower())
    la, lb = len(a), len(b)
    if inp.lower() == sug.lower():
        return ("case", "", "")
    if la == lb:
        diffs = [(i, x, y) for i, (x, y) in enumerate(zip(a, b)) if x != y]
        if len(diffs) == 1:
            i, x, y = diffs[0]
            pos = "final" if i == la - 1 else ("initial" if i == 0 else "mid")
            return ("subst", f"{x}:{y}", pos)
        if len(diffs) == 2 and diffs[0][0] + 1 == diffs[1][0] and \
           diffs[0][1] == diffs[1][2] and diffs[0][2] == diffs[1][1]:
            return ("transpose", f"{diffs[0][1]}{diffs[1][1]}", "")
        return None
    if la - lb == 1:  # deletion (input char removed)
        for i in range(lb + 1):
            if a[:i] + a[i + 1:] == b:
                pos = "final" if i >= la - 1 else ("initial" if i == 0 else "mid")
                gem = (i > 0 and a[i - 1] == a[i]) or (i + 1 < la and a[i + 1] == a[i])
                ctx = "gem" if gem else (f"after:{a[i - 1]}" if i > 0 else "after:^")
                return ("del", f"{a[i]}", f"{pos}|{ctx}")
        return None
    if lb - la == 1:  # addition
        for i in range(la + 1):
            if b[:i] + b[i + 1:] == a:
                pos = "final" if i >= lb - 1 else ("initial" if i == 0 else "mid")
                gem = (i > 0 and b[i - 1] == b[i]) or (i + 1 < lb and b[i + 1] == b[i])
                ctx = "gem" if gem else (f"after:{b[i - 1]}" if i > 0 else "after:^")
                return ("add", f"{b[i]}", f"{pos}|{ctx}")
        return None
    return None


def load(report_path):
    with open(report_path, encoding="utf-8") as f:
        report = json.load(f)
    cases = []
    for x in report["results"]:
        sigs = [signature(x["input"], s["value"]) for s in x["suggestions"]]
        cases.append((x["input"], x["expected"], x["position"],
                      [(s["value"], s["weight"]) for s in x["suggestions"]], sigs))
    return cases


def match(rules, sig):
    if sig is None:
        return 0.0
    kind, detail, posinfo = sig
    for r in rules:
        if r["kind"] != kind:
            continue
        if r.get("detail", "*") not in ("*", detail):
            continue
        if r.get("pos") and r["pos"] not in posinfo:
            continue
        return float(r["delta"])
    return 0.0


def apply_reprice(cases, rules, collect_flips=False):
    top1 = top5 = anyp = 0
    flips_up, flips_down = [], []
    for inp, exp, pos0, suggs, sigs in cases:
        rescored = [(w + match(rules, sig), v) for (v, w), sig in zip(suggs, sigs)]
        rescored.sort(key=lambda t: t[0])
        newpos = next((i for i, (_, v) in enumerate(rescored) if v == exp), None)
        if newpos == 0:
            top1 += 1
        if newpos is not None and newpos < 5:
            top5 += 1
        if newpos is not None:
            anyp += 1
        if collect_flips:
            winner = rescored[0][1] if rescored else ""
            if pos0 != 0 and newpos == 0:
                flips_up.append((inp, exp, pos0))
            elif pos0 == 0 and newpos != 0:
                flips_down.append((inp, exp, winner, signature(inp, winner)))
    return top1, top5, anyp, flips_up, flips_down


def print_inventory(cases):
    need, used_by_winner = Counter(), Counter()
    for inp, exp, pos, suggs, sigs in cases:
        if pos is None or pos == 0:
            continue
        if sigs[pos]:
            need[sigs[pos]] += 1
        if sigs[0]:
            used_by_winner[sigs[0]] += 1
    print("\nEdits the intended correction needed (non-top-1 cases), most common first.")
    print("'winner-used' counts wrong winners reached via the same edit — high values")
    print("mean cheapening it strengthens existing wrong answers too.\n")
    for sig, n in need.most_common(40):
        print(f"  {sig!r:52} need={n:4}  winner-used={used_by_winner.get(sig, 0)}")


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("report", help="divvunspell accuracy JSON report")
    ap.add_argument("--deltas", help="JSON file with reprice rules (see module docstring)")
    ap.add_argument("--flips", action="store_true",
                    help="list every predicted per-word flip, both directions")
    args = ap.parse_args()

    cases = load(args.report)
    b1, b5, ba, _, _ = apply_reprice(cases, [])
    n = len(cases)
    print(f"baseline: top1={b1} ({100 * b1 / n:.2f}%) top5={b5} any={ba} of {n}")

    if not args.deltas:
        print_inventory(cases)
        return

    with open(args.deltas, encoding="utf-8") as f:
        rules = json.load(f)
    t1, t5, ta, up, down = apply_reprice(cases, rules, collect_flips=True)
    print(f"predicted: top1={t1} ({t1 - b1:+}) top5={t5} ({t5 - b5:+}) any={ta} ({ta - ba:+})"
          f"  flips +{len(up)}/-{len(down)}")
    if args.flips:
        print("\ngained (was not top-1, now is):")
        for inp, exp, pos0 in up:
            print(f"  {inp} -> {exp}  (was rank {pos0 + 1})")
        print("\nregressed (was top-1, no longer), with the new winner's edit:")
        for inp, exp, winner, sig in down:
            print(f"  {inp} -> {exp}  lost to {winner}  via {sig!r}")


if __name__ == "__main__":
    main()
