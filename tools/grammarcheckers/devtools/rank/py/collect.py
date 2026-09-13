"""Cache the CG stream each sentence has when it reaches the stage under test.

One OS process per sentence. Sentences never share a CG stream: the dependency
study measured what happens when they do -- batching changed 12.6% of heads,
because a later sentence's root gets re-attached to an earlier one's -- so the
per-process cost is not optional.

What is optional is paying it again for every grammar you want to price.
`spell-sugg-filtering` is a pure CG stage over the output of `disamb`, so
`vislcg3 --grammar X < disamb.cg` reproduces the pipeline's own output for X
byte for byte (verified; see ../README.md). Caching `disamb` therefore turns a
0.6 s pipeline run per variant into a 0.03 s vislcg3 run per variant, and makes
every variant exactly paired with the baseline by construction.

Output: streams/<id>.cg plus rows.jsonl carrying the row fields.
"""
import argparse
import json
import os
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor

DRT = os.environ.get(
    "DIVVUN_RUNTIME",
    os.path.expanduser("~/git/divvun/divvun-runtime/target/release/divvun-runtime"),
)


def load_rows(path, limit=None, offset=0):
    rows = []
    with open(path, encoding="utf-8") as fh:
        for n, line in enumerate(fh):
            if line.startswith("#") or not line.strip():
                continue
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 3:
                continue
            rows.append(
                {
                    "id": n,
                    "error": parts[0],
                    "correction": parts[1],
                    "sentence": parts[2],
                    "source": parts[3] if len(parts) > 3 else "",
                }
            )
    rows = rows[offset:]
    if limit:
        rows = rows[:limit]
    return rows


def collect_one(row, assets, pipeline, stage, outdir, timeout):
    dest = os.path.join(outdir, "%d.cg" % row["id"])
    if os.path.exists(dest) and os.path.getsize(dest) > 0:
        return row["id"], "cached"
    try:
        p = subprocess.run(
            [DRT, "run", "-p", assets, "--skip-check", "-P", pipeline, "-b", stage],
            input=row["sentence"].encode("utf-8"),
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired:
        return row["id"], "timeout"
    out = p.stdout.decode("utf-8", "replace")
    if not out.strip():
        return row["id"], "empty"
    tmp = dest + ".part"
    with open(tmp, "w", encoding="utf-8") as fh:
        fh.write(out)
    os.replace(tmp, dest)
    return row["id"], "ok"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("rows")
    ap.add_argument("outdir")
    ap.add_argument("--assets", default=os.environ.get("RANK_ASSETS", "."))
    ap.add_argument("--pipeline", default="spell")
    ap.add_argument("--stage", default="disamb")
    ap.add_argument("--jobs", type=int, default=14)
    ap.add_argument("--limit", type=int)
    ap.add_argument("--offset", type=int, default=0)
    ap.add_argument("--timeout", type=int, default=180)
    args = ap.parse_args()

    streams = os.path.join(args.outdir, "streams")
    os.makedirs(streams, exist_ok=True)
    rows = load_rows(args.rows, args.limit, args.offset)
    with open(os.path.join(args.outdir, "rows.jsonl"), "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")

    todo = [
        r
        for r in rows
        if not os.path.exists(os.path.join(streams, "%d.cg" % r["id"]))
    ]
    print("%d rows, %d to collect" % (len(rows), len(todo)), file=sys.stderr)

    t0 = time.perf_counter()
    n = 0
    stat = {}
    with ThreadPoolExecutor(max_workers=args.jobs) as ex:
        futs = [
            ex.submit(
                collect_one,
                r,
                args.assets,
                args.pipeline,
                args.stage,
                streams,
                args.timeout,
            )
            for r in todo
        ]
        for fut in futs:
            _, st = fut.result()
            stat[st] = stat.get(st, 0) + 1
            n += 1
            if n % 200 == 0:
                el = time.perf_counter() - t0
                print(
                    "  %d/%d  %.0fs  (%.2fs/row)  %s"
                    % (n, len(todo), el, el / n, stat),
                    file=sys.stderr,
                    flush=True,
                )
    print("done: %s" % stat, file=sys.stderr)


if __name__ == "__main__":
    main()
