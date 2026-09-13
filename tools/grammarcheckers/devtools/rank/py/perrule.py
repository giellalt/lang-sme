"""Per-rule accounting: what each rule in a grammar gains and loses.

Two views, because they answer different questions and can disagree when rules
interact:

- `only`   : the grammar reduced to this one rule. What the rule does on its own.
- `without`: the grammar with this one rule commented out. What removing it from
             the shipped set would do.

Both are scored against the same cached `disamb` streams, so every variant is
paired with the baseline row for row.

A rule is identified by the line it starts on. Rules in these grammars are
one-liners; a multi-line rule would need the block, not the line.
"""
import argparse
import json
import os
import re
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from report import mcnemar_exact  # noqa: E402

RULE_RE = re.compile(
    r"^\s*(ADD|MAP|SELECT|REMOVE|IFF|APPEND|SUBSTITUTE|COPY|SETPARENT|SETCHILD|"
    r"ADDRELATION|SETRELATION|DELIMIT|MOVE|SWITCH|PROTECT|UNPROTECT)\b"
)


def find_rules(path):
    out = []
    for i, line in enumerate(open(path, encoding="utf-8")):
        if RULE_RE.match(line):
            out.append((i, line.rstrip()))
    return out


def variant(path, keep=None, drop=None):
    lines = open(path, encoding="utf-8").readlines()
    rules = [i for i, _ in find_rules(path)]
    for i in rules:
        if (keep is not None and i != keep) or (drop is not None and i == drop):
            lines[i] = "#OFF# " + lines[i]
    fd, tmp = tempfile.mkstemp(suffix=".cg3", dir=os.path.dirname(path) or ".")
    with os.fdopen(fd, "w", encoding="utf-8") as fh:
        fh.writelines(lines)
    return tmp


def score(rundir, grammar, jobs):
    out = tempfile.mktemp(suffix=".jsonl")
    subprocess.run(
        [
            sys.executable,
            os.path.join(HERE, "score.py"),
            rundir,
            out,
            "--grammar",
            grammar,
            "--jobs",
            str(jobs),
            "--no-cohorts",
        ],
        check=True,
    )
    rows = [json.loads(l) for l in open(out, encoding="utf-8")]
    os.unlink(out)
    return rows


def tally(rows, k):
    live = [r for r in rows if r.get("before_status") == "ok"]
    gain = sum(
        1
        for r in live
        if not (r.get("before_rank") and r["before_rank"] <= k)
        and (r.get("after_rank") and r["after_rank"] <= k)
    )
    loss = sum(
        1
        for r in live
        if (r.get("before_rank") and r["before_rank"] <= k)
        and not (r.get("after_rank") and r["after_rank"] <= k)
    )
    return len(live), gain, loss


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("rundir")
    ap.add_argument("grammar")
    ap.add_argument("--jobs", type=int, default=16)
    ap.add_argument("--mode", choices=["only", "without", "both"], default="both")
    args = ap.parse_args()

    rules = find_rules(args.grammar)
    print("%d rules in %s" % (len(rules), args.grammar))
    print()
    hdr = "%-5s %-8s %5s %5s %6s %9s  %s"
    print(hdr % ("line", "mode", "+1", "-1", "net1", "p", "rule"))
    for i, text in rules:
        for mode in (["only", "without"] if args.mode == "both" else [args.mode]):
            tmp = variant(
                args.grammar,
                keep=i if mode == "only" else None,
                drop=i if mode == "without" else None,
            )
            try:
                rows = score(args.rundir, tmp, args.jobs)
            finally:
                os.unlink(tmp)
                for ext in (".bin",):
                    if os.path.exists(tmp + ext):
                        os.unlink(tmp + ext)
            n, g, l = tally(rows, 1)
            n5, g5, l5 = tally(rows, 5)
            print(
                hdr
                % (
                    i + 1,
                    mode,
                    "+%d" % g,
                    "-%d" % l,
                    "%+d" % (g - l),
                    "%.3g" % mcnemar_exact(g, l),
                    (text[:78] + "...") if len(text) > 78 else text,
                )
            )
            print(
                "%-5s %-8s %5s %5s %6s %9s  (top-5)"
                % ("", "", "+%d" % g5, "-%d" % l5, "%+d" % (g5 - l5), "%.3g" % mcnemar_exact(g5, l5))
            )
        print()


if __name__ == "__main__":
    main()
