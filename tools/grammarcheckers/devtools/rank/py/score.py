"""Rank the gold correction before and after a CG stage, over cached streams.

`before` is the cached `disamb` stream; `after` is what a grammar makes of it.
Both are read through py/cohort.py, which reproduces divvun.suggest's ordering
(ascending `<W:...>`, stable) and dedup (keep first).

Pass `--grammar none` to score the streams as they are, which is the control
that says a no-op grammar moves nothing.
"""
import argparse
import json
import os
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from cohort import find_cohort, parse_stream, suggestions  # noqa: E402

VISLCG3 = os.environ.get("VISLCG3", "vislcg3")


def apply_grammar(grammar, binpath, text):
    cmd = [VISLCG3, "--grammar", grammar, "--quiet"]
    if binpath:
        cmd += ["--grammar-bin", binpath]
    p = subprocess.run(
        cmd,
        input=text.encode("utf-8"),
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
    )
    return p.stdout.decode("utf-8", "replace")


def score_one(row, streams, grammar, binpath):
    path = os.path.join(streams, "%d.cg" % row["id"])
    rec = {k: row[k] for k in ("id", "error", "correction", "sentence")}
    if not os.path.exists(path):
        rec["status"] = "no-stream"
        return rec
    before_text = open(path, encoding="utf-8").read()
    after_text = before_text if grammar in (None, "none") else apply_grammar(
        grammar, binpath, before_text
    )

    for label, text in (("before", before_text), ("after", after_text)):
        cohorts = parse_stream(text)
        idx = find_cohort(cohorts, row["error"])
        if idx is None:
            rec[label] = None
            rec[label + "_status"] = "no-cohort"
            continue
        sugg = suggestions(cohorts[idx], row["error"])
        rec[label] = sugg
        rec[label + "_status"] = "ok" if sugg else "no-suggestions"
        rec[label + "_rank"] = (
            sugg.index(row["correction"]) + 1 if row["correction"] in sugg else None
        )
        if label == "before":
            rec["idx"] = idx
            rec["cohorts"] = [
                {"form": c["form"], "readings": c["readings"]} for c in cohorts
            ]
    rec["status"] = "ok"
    return rec


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("rundir", help="directory holding rows.jsonl and streams/")
    ap.add_argument("out")
    ap.add_argument("--grammar", default="none")
    ap.add_argument("--grammar-bin", default=None)
    ap.add_argument("--jobs", type=int, default=14)
    ap.add_argument(
        "--no-cohorts",
        action="store_true",
        help="omit the full sentence cohorts; much smaller output",
    )
    args = ap.parse_args()

    rows = [
        json.loads(l)
        for l in open(os.path.join(args.rundir, "rows.jsonl"), encoding="utf-8")
    ]
    streams = os.path.join(args.rundir, "streams")
    with open(args.out, "w", encoding="utf-8") as fh, ThreadPoolExecutor(
        max_workers=args.jobs
    ) as ex:
        futs = [
            ex.submit(score_one, r, streams, args.grammar, args.grammar_bin)
            for r in rows
        ]
        for fut in futs:
            rec = fut.result()
            if args.no_cohorts:
                rec.pop("cohorts", None)
            fh.write(json.dumps(rec, ensure_ascii=False) + "\n")


if __name__ == "__main__":
    main()
