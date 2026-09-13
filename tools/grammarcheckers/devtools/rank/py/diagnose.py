"""What, if anything, could a CG rule use to tell the gold from the rank-1 form?

Only rows where the gold is in the list but not first are interesting: those are
the rows a re-ranking rule could win, and they bound what any such rule can be
worth.

The classification is of the EVIDENCE, not of the error. CG3 sees readings. A
rule can only prefer form A over form B if some reading of A carries a tag no
reading of B carries, or vice versa -- a rule has no other handle. So the first
question is whether the two forms are distinguishable at all:

  tag-identical   every reading of the gold has a tag-twin among the rank-1
                  form's readings and vice versa. No CG rule of any shape can
                  separate these. This is a hard ceiling, not a difficulty.
  pos             the two differ in part of speech. Ordinary syntax --
                  a verb where a noun is wanted -- can in principle see this.
  inflection      same lemma, different case/number/person. This is the
                  agreement family, and it is the one the previous round tried.
  lexical         different lemma, same POS and same inflection. Nothing
                  morphosyntactic separates them; it would take semantics or
                  world knowledge.

`sem` is reported alongside because a Sem/ class difference is the only thing
between some lexical pairs, and semantic-class selection is a different and
weaker kind of evidence than agreement.
"""
import argparse
import json
import re
import sys
from collections import Counter

TAG_RE = re.compile(r"(?<= )([A-ZÁČĐŊŠŦŽ][\w/áčđŋšŧžÁČĐŊŠŦŽ*+-]*)")
LEMMA_RE = re.compile(r'^"([^"]*)"')
SFORM_RE = re.compile(r'"((?:[^"\\]|\\.)*)"S(?:\s|$)')

CASE = {"Nom", "Gen", "Acc", "Ill", "Loc", "Com", "Ess"}
NUM = {"Sg", "Pl", "Du"}
POS = {
    "N", "V", "A", "Adv", "Pron", "Num", "Prop", "CC", "CS", "Po", "Pr",
    "Interj", "Pcle", "Actio", "Ger", "Inf", "PrfPrc",
}


def tags(reading):
    body = reading
    body = re.sub(r'"[^"]*"S', " ", body)
    body = re.sub(r"<[^>]*>", " ", body)
    body = LEMMA_RE.sub(" ", body.strip())
    return frozenset(TAG_RE.findall(" " + body))


def lemma(reading):
    m = LEMMA_RE.match(reading.strip())
    return m.group(1) if m else ""


def readings_for(cohort, form):
    out = []
    for r in cohort["readings"]:
        if "<spelled>" not in r:
            continue
        m = SFORM_RE.search(r)
        if m and m.group(1) == form:
            out.append(r)
    return out


def readings_for_cased(cohort, form, allforms):
    """Match on the cased form the harness reports, falling back to raw."""
    out = readings_for(cohort, form)
    if out:
        return out
    low = form.lower()
    for r in cohort["readings"]:
        if "<spelled>" not in r:
            continue
        m = SFORM_RE.search(r)
        if m and m.group(1).lower() == low:
            out.append(r)
    return out


def classify(gold_rs, comp_rs):
    if not gold_rs or not comp_rs:
        return "no-readings", {}
    gt = {tags(r) for r in gold_rs}
    ct = {tags(r) for r in comp_rs}
    gl = {lemma(r) for r in gold_rs}
    cl = {lemma(r) for r in comp_rs}

    detail = {
        "gold_lemmas": sorted(gl),
        "comp_lemmas": sorted(cl),
        "gold_only_tags": sorted(set().union(*gt) - set().union(*ct)) if gt and ct else [],
        "comp_only_tags": sorted(set().union(*ct) - set().union(*gt)) if gt and ct else [],
    }

    if gt == ct:
        return "tag-identical", detail

    gonly = set(detail["gold_only_tags"])
    conly = set(detail["comp_only_tags"])
    diff = gonly | conly

    if diff & POS:
        return "pos", detail
    if gl & cl and (diff & (CASE | NUM)):
        return "inflection", detail
    if diff & (CASE | NUM):
        return "inflection-xlemma", detail
    if all(t.startswith("Sem/") for t in diff) and diff:
        return "semclass", detail
    if not (gl & cl):
        return "lexical", detail
    return "other", detail


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("scored")
    ap.add_argument("--examples", type=int, default=0)
    ap.add_argument("--dump", default=None, help="write the per-row classes as jsonl")
    args = ap.parse_args()

    rows = [json.loads(l) for l in open(args.scored, encoding="utf-8")]
    live = [r for r in rows if r.get("before_status") == "ok"]
    wrong = [r for r in live if r.get("before_rank") and r["before_rank"] > 1]
    missing = [r for r in live if not r.get("before_rank")]

    print("live rows                       %d" % len(live))
    print("gold at rank 1 already          %d (%.1f%%)"
          % (len(live) - len(wrong) - len(missing),
             100.0 * (len(live) - len(wrong) - len(missing)) / max(1, len(live))))
    print("gold in the list, not first     %d (%.1f%%)  <- the winnable rows"
          % (len(wrong), 100.0 * len(wrong) / max(1, len(live))))
    print("gold not in the list at all     %d (%.1f%%)  <- unreachable by filtering"
          % (len(missing), 100.0 * len(missing) / max(1, len(live))))
    print()

    counts = Counter()
    by_rank = Counter()
    out = []
    examples = {}
    for r in wrong:
        if not r.get("cohorts") or r.get("idx") is None:
            counts["no-cohort-dump"] += 1
            continue
        coh = r["cohorts"][r["idx"]]
        gold_rs = readings_for_cased(coh, r["correction"], r["before"])
        comp_rs = readings_for_cased(coh, r["before"][0], r["before"])
        cls, detail = classify(gold_rs, comp_rs)
        counts[cls] += 1
        by_rank[(cls, min(r["before_rank"], 4))] += 1
        out.append({"id": r["id"], "class": cls, "rank": r["before_rank"],
                    "error": r["error"], "gold": r["correction"],
                    "comp": r["before"][0], **detail})
        examples.setdefault(cls, []).append((r["error"], r["before"][0], r["correction"],
                                             detail["comp_only_tags"][:6],
                                             detail["gold_only_tags"][:6]))

    print("what separates the gold from the form ranked 1, on those %d rows:" % len(wrong))
    for cls, n in counts.most_common():
        print("  %-18s %5d  %5.1f%%" % (cls, n, 100.0 * n / max(1, len(wrong))))
    print()
    print("  reachable by a CG rule at all: %d (%.1f%%)"
          % (len(wrong) - counts["tag-identical"] - counts["no-readings"],
             100.0 * (len(wrong) - counts["tag-identical"] - counts["no-readings"])
             / max(1, len(wrong))))

    if args.examples:
        print()
        for cls, ex in examples.items():
            print("== %s ==" % cls)
            for e in ex[: args.examples]:
                print("   %-22s 1:%-18s gold:%-18s comp-only=%s gold-only=%s"
                      % (e[0], e[1], e[2], e[3], e[4]))
    if args.dump:
        with open(args.dump, "w", encoding="utf-8") as fh:
            for o in out:
                fh.write(json.dumps(o, ensure_ascii=False) + "\n")


if __name__ == "__main__":
    main()
