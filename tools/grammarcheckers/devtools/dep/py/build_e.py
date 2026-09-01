#!/usr/bin/env python3
"""Build the real-misspelling conditions at the real error position.

E0  the misspelling as an unknown, which is what the speller pipeline sees
    after err-to-unknown puts an Err-only cohort back on the speller's footing
E2  the misspelling's cohort replaced by the analyses of the speller's top-k
    suggestions, which is what cgspell actually produces
"""
import json
import os
import re
import subprocess
import sys

sys.path.insert(0, "/private/tmp/depstudy/py")
import cgio

D = "/private/tmp/depstudy"
LSME = "/private/tmp/lang-sme-dep"
TOPK = int(sys.argv[1]) if len(sys.argv) > 1 else 10
SUFFIX = sys.argv[2] if len(sys.argv) > 2 else ""


def read_suggestions(path):
    out = {}
    cur = None
    for line in open(path, encoding="utf-8"):
        line = line.rstrip("\n")
        if line.startswith("Input: "):
            cur = line[len("Input: "):].split("\t")[0]
            out[cur] = []
        elif line.strip() and cur is not None and "\t" in line:
            w = line.split("\t")[0].strip()
            if w:
                out[cur].append(w)
    return out


def analyse_words(words):
    """One tokeniser run over the suggestion vocabulary."""
    inp = "\n".join(words) + "\n"
    r = subprocess.run(
        ["hfst-tokenise", "--giella-cg",
         LSME + "/tools/tokenisers/tokeniser-disamb-gt-desc.pmhfst"],
        input=inp, capture_output=True, text=True,
        env={**os.environ, "PATH": "/private/tmp/depstudy/bin:" + os.environ["PATH"]},
    )
    sents = list(cgio.read_stream(r.stdout.splitlines(keepends=True).__iter__()))
    out = {}
    for w, s in zip(words, sents):
        # A suggestion that does not tokenise to exactly one cohort cannot be
        # dropped into a single cohort's place.
        if len(s) == 1:
            out[w] = s[0].readings
    return out


def main():
    align = [json.loads(l) for l in open(D + "/data/err_align.jsonl", encoding="utf-8")]
    err = list(cgio.read_stream(D + "/data/err.ana.cg"))
    sugg = read_suggestions(D + "/data/err_sugg.txt")

    vocab = []
    seen = set()
    for e in align:
        for w in sugg.get(e["error"], [])[:TOPK]:
            if w not in seen:
                seen.add(w)
                vocab.append(w)
    ana = analyse_words(vocab)
    print("suggestion vocabulary: %d, analysable as one cohort: %d" % (len(vocab), len(ana)))

    for cond in ("e0", "e2"):
        os.makedirs("%s/%s%s/in" % (D, cond, SUFFIX), exist_ok=True)
    index = []
    n_e2 = 0
    for e in align:
        si, p = e["sent"], e["pos"]
        sent = err[si]
        key = "%04d_%02d" % (si, p)

        c0 = cgio.Cohort(sent[p].form)
        c0.readings = ['\t"%s" ?' % e["error"]]
        s0 = list(sent)
        s0[p] = c0
        with open("%s/e0%s/in/%s.cg" % (D, SUFFIX, key), "w", encoding="utf-8") as out:
            cgio.write_sentence(out, s0)

        c2 = cgio.Cohort(sent[p].form)
        for w in sugg.get(e["error"], [])[:TOPK]:
            for r in ana.get(w, []):
                # cgspell marks its readings <spelled>; keeping the marker means
                # a rule can tell a suggestion from an ordinary reading.
                c2.readings.append(r.rstrip() + " <spelled>")
        if not c2.readings:
            c2.readings = ['\t"%s" ?' % e["error"]]
        else:
            n_e2 += 1
        s2 = list(sent)
        s2[p] = c2
        with open("%s/e2%s/in/%s.cg" % (D, SUFFIX, key), "w", encoding="utf-8") as out:
            cgio.write_sentence(out, s2)

        index.append({"key": key, "sent": si, "pos": p, "set": "E",
                      "is_error_pos": True, "form": e["error"],
                      "n_sugg": len(sugg.get(e["error"], [])[:TOPK]),
                      "correction_in_sugg": e["correction"] in sugg.get(e["error"], [])[:TOPK]})
    with open(D + "/data/e_index%s.jsonl" % SUFFIX, "w", encoding="utf-8") as fh:
        for r in index:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    print("rows: %d, with at least one analysable suggestion: %d" % (len(index), n_e2))
    print("correction present in top-%d: %d (%.1f%%)"
          % (TOPK, sum(1 for r in index if r["correction_in_sugg"]),
             100 * sum(1 for r in index if r["correction_in_sugg"]) / len(index)))


if __name__ == "__main__":
    main()
