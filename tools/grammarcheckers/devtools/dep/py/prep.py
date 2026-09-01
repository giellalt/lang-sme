#!/usr/bin/env python3
"""Build the study's sentence sample from typos-context.tsv.

For each row we substitute the correction for the error word, giving a sentence
that is (as far as the speller is concerned) correct.  That sentence is what the
gold dependency tree is built over.
"""
import json
import random
import re
import sys

TSV = "/private/tmp/lang-sme-dep/tools/spellcheckers/test/typos-context.tsv"
OUT = "/private/tmp/depstudy/data/rows.jsonl"

# One error form can dominate a corpus sample; the previous CG experiment lost
# 79 apparent points to a single word occurring in 279 of 765 sentences.
MAX_PER_ERROR = 3
MIN_TOKENS = 5
MAX_TOKENS = 35
SAMPLE = 1000


def main():
    rows = []
    with open(TSV, encoding="utf-8") as fh:
        for line in fh:
            if line.startswith("#") or not line.strip():
                continue
            parts = line.rstrip("\n").split("\t")
            if len(parts) != 4:
                continue
            err, corr, sent, src = parts
            rows.append((err, corr, sent, src))

    seen_sent = set()
    per_err = {}
    kept = []
    for err, corr, sent, src in rows:
        if sent in seen_sent:
            continue
        # The error form must occur as a standalone token so the substitution is
        # unambiguous; otherwise the gold/perturbed alignment is guesswork.
        pat = re.compile(r"(?<![^\s\"'(\[«])" + re.escape(err) + r"(?![^\s\"')\]».,:;?!])")
        hits = list(pat.finditer(sent))
        if len(hits) != 1:
            continue
        ntok = len(sent.split())
        if ntok < MIN_TOKENS or ntok > MAX_TOKENS:
            continue
        if per_err.get(err, 0) >= MAX_PER_ERROR:
            continue
        m = hits[0]
        gold_sent = sent[: m.start()] + corr + sent[m.end():]
        per_err[err] = per_err.get(err, 0) + 1
        seen_sent.add(sent)
        kept.append(
            {
                "error": err,
                "correction": corr,
                "err_sent": sent,
                "gold_sent": gold_sent,
                "source": src,
            }
        )

    rnd = random.Random(20260901)
    rnd.shuffle(kept)
    kept = kept[:SAMPLE]
    for i, r in enumerate(kept):
        r["id"] = i

    with open(OUT, "w", encoding="utf-8") as fh:
        for r in kept:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")

    print(f"rows in file      : {len(rows)}")
    print(f"kept after filters: {len(seen_sent)}")
    print(f"sampled           : {len(kept)}")
    print(f"distinct errors   : {len(set(r['error'] for r in kept))}")


if __name__ == "__main__":
    main()
