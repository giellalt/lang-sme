"""Dump per-candidate readings for rows where the gold is not first.

Runs the no-disamb bundle (full candidate list, untouched by CG) and captures
the CG stream at spell-sugg-filtering plus the whole sentence's cohorts, so
rule conditions can be checked against real neighbouring context.
"""
import json, re, subprocess, sys, time

DRT = "/Users/brendan/git/necessary/divvun/divvun-runtime/target/release/divvun-runtime"
COHORT = re.compile(r'^"<(.*)>"$')
FORM = re.compile(r'"([^"]*)"S(?=\s|$)')

def stream(bundle, sentence, stage):
    r = subprocess.run([DRT, "run", "-p", bundle, "-b", stage],
                       input=sentence, capture_output=True, text=True, timeout=180)
    cohorts, cur = [], None
    for line in r.stdout.splitlines():
        m = COHORT.match(line.strip())
        if m:
            cur = {"form": m.group(1), "readings": []}
            cohorts.append(cur)
        elif line.startswith("\t") and cur is not None:
            cur["readings"].append(line.strip())
    return cohorts

def main(rows_path, out_path, bundle):
    rows = [json.loads(l) for l in open(rows_path, encoding="utf-8")]
    t0 = time.perf_counter()
    with open(out_path, "w", encoding="utf-8") as fh:
        for i, row in enumerate(rows):
            rec = {k: row[k] for k in ("id", "partition", "error", "correction")}
            try:
                cohorts = stream(bundle, row["sentence"], "spell-sugg-filtering")
            except subprocess.TimeoutExpired:
                rec["timeout"] = True
                cohorts = []
            rec["cohorts"] = cohorts
            idx = next((j for j, c in enumerate(cohorts) if c["form"] == row["error"]), None)
            rec["idx"] = idx
            # readings grouped by the suggested form they carry
            by_form = {}
            if idx is not None:
                for r_ in cohorts[idx]["readings"]:
                    m = FORM.search(r_)
                    if m:
                        by_form.setdefault(m.group(1), []).append(r_)
            rec["by_form"] = by_form
            fh.write(json.dumps(rec, ensure_ascii=False) + "\n")
            fh.flush()
            if (i + 1) % 25 == 0:
                el = time.perf_counter() - t0
                print("  %d/%d %.0fs" % (i + 1, len(rows), el), file=sys.stderr, flush=True)

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3])
