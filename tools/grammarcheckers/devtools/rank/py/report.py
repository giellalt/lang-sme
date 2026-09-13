"""Turn a scored run into the before/after table, with a paired test.

The design is paired -- same sentence, same speller, same disambiguation, one
stage different -- so the interesting quantity is not two independent
proportions but the discordant pairs: rows the stage moved INTO rank 1 against
rows it moved OUT. McNemar's exact test on those, and a Wilson interval on the
levels for context.

Denominators are stated because there are three of them and they are not
interchangeable: all rows in the file; rows where the misspelling reached the
speller at all; and of those, rows where the gold is somewhere in the list.
"""
import argparse
import json
import math
import sys
from collections import Counter


def wilson(k, n, z=1.96):
    if n == 0:
        return (0.0, 0.0)
    p = k / n
    d = 1 + z * z / n
    c = (p + z * z / (2 * n)) / d
    h = z * math.sqrt(p * (1 - p) / n + z * z / (4 * n * n)) / d
    return (max(0.0, c - h), min(1.0, c + h))


def mcnemar_exact(b, c):
    """Two-sided exact binomial p for b successes out of b+c at p=0.5."""
    n = b + c
    if n == 0:
        return 1.0
    k = min(b, c)
    tail = sum(math.comb(n, i) for i in range(0, k + 1)) / (2.0**n)
    return min(1.0, 2 * tail)


def at(rank, k):
    return rank is not None and rank <= k


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("scored", nargs="+")
    ap.add_argument("--label", default=None)
    args = ap.parse_args()

    for path in args.scored:
        rows = [json.loads(l) for l in open(path, encoding="utf-8")]
        name = args.label or path
        print("=" * 72)
        print(name)
        print("=" * 72)
        print("rows in file: %d" % len(rows))
        print(
            "  before status: %s"
            % dict(Counter(r.get("before_status") for r in rows))
        )

        live = [r for r in rows if r.get("before_status") == "ok"]
        print(
            "  reached the speller with a non-empty list: %d (%.1f%% of file)"
            % (len(live), 100.0 * len(live) / max(1, len(rows)))
        )
        ingold = [r for r in live if r.get("before_rank") is not None]
        print(
            "  gold present in the before-list:           %d (%.1f%% of those)"
            % (len(ingold), 100.0 * len(ingold) / max(1, len(live)))
        )

        print()
        print("  %-10s %10s %10s %10s" % ("", "before", "after", "delta"))
        for k, lab in ((1, "top-1"), (5, "top-5"), (10, "top-10")):
            b = sum(at(r.get("before_rank"), k) for r in live)
            a = sum(at(r.get("after_rank"), k) for r in live)
            lo, hi = wilson(b, len(live))
            lo2, hi2 = wilson(a, len(live))
            print(
                "  %-10s %9.2f%% %9.2f%% %+9.2fpp   [%.1f, %.1f] -> [%.1f, %.1f]"
                % (
                    lab,
                    100.0 * b / max(1, len(live)),
                    100.0 * a / max(1, len(live)),
                    100.0 * (a - b) / max(1, len(live)),
                    100 * lo,
                    100 * hi,
                    100 * lo2,
                    100 * hi2,
                )
            )

        print()
        for k, lab in ((1, "top-1"), (5, "top-5")):
            gain = [r for r in live if not at(r.get("before_rank"), k) and at(r.get("after_rank"), k)]
            loss = [r for r in live if at(r.get("before_rank"), k) and not at(r.get("after_rank"), k)]
            p = mcnemar_exact(len(gain), len(loss))
            print(
                "  %s discordant: +%d / -%d  net %+d   McNemar exact p=%.4g"
                % (lab, len(gain), len(loss), len(gain) - len(loss), p)
            )

        moved = [
            r
            for r in live
            if r.get("before_rank") != r.get("after_rank")
        ]
        shrunk = [
            r
            for r in live
            if r.get("after") is not None
            and len(r["after"]) != len(r.get("before") or [])
        ]
        dropped = sum(
            len(r.get("before") or []) - len(r.get("after") or []) for r in shrunk
        )
        print()
        print(
            "  rows whose gold rank moved at all: %d (%.2f%%)"
            % (len(moved), 100.0 * len(moved) / max(1, len(live)))
        )
        print(
            "  rows whose candidate list changed: %d (%.2f%%), %d candidates removed"
            % (len(shrunk), 100.0 * len(shrunk) / max(1, len(live)), dropped)
        )
        print(
            "  candidates in the before-list: mean %.1f, median %d"
            % (
                sum(len(r["before"]) for r in live) / max(1, len(live)),
                sorted(len(r["before"]) for r in live)[len(live) // 2] if live else 0,
            )
        )
        print()


if __name__ == "__main__":
    main()
