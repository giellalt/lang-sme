"""Simulate candidate-level REMOVE rules over collected readings.

Removal-only, so this is exact rather than predictive: dropping candidates can
never introduce one the speller did not already offer, so the re-ranked list is
what the pipeline would really produce. That is not true of cost repricing,
where a cheapened edit admits competitors the simulation cannot see.

A rule is a function (cohorts, idx, form, readings) -> bool ("remove this
form"). It is applied at CANDIDATE level: a form goes only when the rule holds
against every reading carrying it, so a suggestion is never deleted because one
of its analyses was ruled out.
"""
import json, re

CASE = ["Nom", "Gen", "Acc", "Ill", "Loc", "Com", "Ess"]
NUM = ["Sg", "Pl"]
POS = ["N", "V", "A", "Adv", "Pron", "Num", "Prop", "CC", "CS", "Po", "Pr"]


def tags(reading):
    return set(re.findall(r"(?<= )[A-ZÁČĐŊŠŦŽ][\w/áčđŋšŧž*-]*", reading))


def feats(readings, universe):
    """Values from `universe` present across these readings."""
    out = set()
    for r in readings:
        out |= tags(r) & set(universe)
    return out


def is_spelled(reading):
    return "<spelled>" in reading


def unambiguous(cohort, universe):
    """The value shared by every reading, if there is exactly one."""
    rs = [r for r in cohort["readings"] if not is_spelled(r)]
    if not rs:
        return None
    vals = [tags(r) & set(universe) for r in rs]
    if any(len(v) != 1 for v in vals):
        return None
    first = next(iter(vals[0]))
    return first if all(next(iter(v)) == first for v in vals) else None


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8")]


def evaluate(rows, order_by_id, rule):
    """Return (gains, losses, unchanged, detail)."""
    gains = losses = 0
    detail = []
    for r in rows:
        bf = r.get("by_form") or {}
        order = order_by_id.get(r["id"])
        gold = r["correction"]
        if not bf or not order:
            continue
        idx = r.get("idx")
        cohorts = r.get("cohorts") or []
        if idx is None:
            continue
        kept = [f for f in order
                if f not in bf or not rule(cohorts, idx, f, bf[f])]
        before = order.index(gold) + 1 if gold in order else None
        after = kept.index(gold) + 1 if gold in kept else None
        if before == after:
            continue
        if after == 1 and before != 1:
            gains += 1
            detail.append(("+", r["error"], gold, before, after))
        elif before == 1 and after != 1:
            losses += 1
            detail.append(("-", r["error"], gold, before, after))
    return gains, losses, detail
