"""Score the speller+disambiguation pipeline against its no-disamb control.

Both bundles are identical except for the disambiguation stage, so any
difference is the disambiguator acting on <spelled> readings and nothing else.
Rows are appended as they finish, so a kill never loses the run.
"""
import json, subprocess, sys, time

DRT = "/Users/brendan/git/necessary/divvun/divvun-runtime/target/release/divvun-runtime"

def suggestions(bundle, sentence, form):
    r = subprocess.run([DRT, "run", "-p", bundle], input=sentence,
                       capture_output=True, text=True, timeout=180)
    try:
        d = json.loads(r.stdout or "{}")
    except json.JSONDecodeError:
        return None
    for e in d.get("errors", []):
        if e.get("form") == form:
            return e.get("suggestions", [])
    return []

def main(rows_path, out_path, a_bundle, b_bundle, limit=None):
    rows = [json.loads(l) for l in open(rows_path, encoding="utf-8")]
    if limit:
        rows = rows[:limit]
    t0 = time.perf_counter()
    with open(out_path, "w", encoding="utf-8") as fh:
        for i, row in enumerate(rows):
            rec = {k: row[k] for k in ("id", "partition", "error", "correction")}
            rec["standalone_rank"] = row.get("rank")
            for label, bundle in (("nodisamb", a_bundle), ("disamb", b_bundle)):
                try:
                    s = suggestions(bundle, row["sentence"], row["error"])
                except subprocess.TimeoutExpired:
                    s = None
                    rec[label + "_timeout"] = True
                rec[label] = s
                rec[label + "_rank"] = (
                    s.index(row["correction"]) + 1
                    if s and row["correction"] in s else None)
            fh.write(json.dumps(rec, ensure_ascii=False) + "\n")
            fh.flush()
            if (i + 1) % 25 == 0:
                el = time.perf_counter() - t0
                print("  %d/%d  %.1fs  (%.2fs/row)" % (i + 1, len(rows), el, el / (i + 1)),
                      file=sys.stderr, flush=True)

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4],
         int(sys.argv[5]) if len(sys.argv) > 5 else None)
