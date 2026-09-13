"""Price a candidate-level test offline, before writing any CG.

Three operations, in increasing order of how much damage they can do:

  penalty  add N to the candidate's `<W:...>`. divvun.suggest sorts on that tag,
           so a CG `SUBSTITUTE` of it reorders the list. A penalty only reorders
           where the margin is smaller than N, so the size of N is a dial
           between "never fires" and "demote".
  demote   move the candidate behind every unsuspected one. The limit of
           penalty as N grows.
  remove   drop it. Can delete the gold, and on the shipped grammar that is
           exactly what happens: -47 rows at top-5 with zero gains.

All three are exact, not predictive: none can introduce a candidate the speller
did not already offer, so the re-ranked list is what the pipeline would really
produce. That is not true of cost repricing in the speller itself, where a
cheapened edit admits competitors no simulation can see.

A test is candidate-level. A form is suspect only when EVERY reading carrying it
is suspect, so a suggestion is never touched because one of its analyses was.
"""
import argparse
import json
import re

SFORM_RE = re.compile(r'"((?:[^"\\]|\\.)*)"S(?:\s|$)')
WEIGHT_RE = re.compile(r"<W:([-0-9.eE]+)>")


def tagged(readings, tag):
    pat = re.compile(r"(?<![\w/-])" + re.escape(tag) + r"(?![\w/-])")
    return [bool(pat.search(r)) for r in readings]


def has(readings, tag):
    return any(tagged(readings, tag))


def all_have(readings, tag):
    return bool(readings) and all(tagged(readings, tag))


def none_have(readings, tag):
    return bool(readings) and not any(tagged(readings, tag))


def cohort_is(cohorts, i, tag):
    """Does cohort i have the tag on a non-<spelled> reading?"""
    if i < 0 or i >= len(cohorts):
        return False
    rs = [r for r in cohorts[i]["readings"] if "<spelled>" not in r]
    return has(rs, tag) if rs else False


def cohort_all(cohorts, i, tag):
    if i < 0 or i >= len(cohorts):
        return False
    rs = [r for r in cohorts[i]["readings"] if "<spelled>" not in r]
    return all_have(rs, tag) if rs else False


# --- tests ------------------------------------------------------------------

def t_prop_only(c, i, f, rs):
    return all_have(rs, "Prop")


def t_prop_lower(c, i, f, rs):
    return all_have(rs, "Prop") and c[i]["form"][:1].islower()


def t_dummytag(c, i, f, rs):
    return all_have(rs, "Sem/Dummytag")


def t_dummytag_lower(c, i, f, rs):
    return all_have(rs, "Sem/Dummytag") and c[i]["form"][:1].islower()


def t_v_before_n(c, i, f, rs):
    """Verb-only candidate immediately before an unambiguous noun.

    The dependency study's point in its cheapest form: the token after is a
    noun, so this position wants a modifier, and a finite verb is not one.
    `(1 N)` is a test of adjacency rather than of modification, which is why
    this is measured rather than assumed.
    """
    return all_have(rs, "V") and cohort_all(c, i + 1, "N")


def t_nonattr_before_n(c, i, f, rs):
    """Candidate that can be neither attribute nor genitive, before a noun."""
    if not cohort_all(c, i + 1, "N"):
        return False
    return (
        none_have(rs, "Attr")
        and none_have(rs, "Gen")
        and none_have(rs, "A")
        and none_have(rs, "Num")
    )


def t_conneg(c, i, f, rs):
    return all_have(rs, "ConNeg")


def t_imprt(c, i, f, rs):
    return all_have(rs, "Imprt")


def t_actio(c, i, f, rs):
    return all_have(rs, "Actio")


def t_prop_or_dummy_lower(c, i, f, rs):
    return c[i]["form"][:1].islower() and (
        all_have(rs, "Prop") or all_have(rs, "Sem/Dummytag")
    )


TESTS = [
    ("Prop-only", t_prop_only),
    ("Prop-only, lowercase token", t_prop_lower),
    ("Sem/Dummytag-only", t_dummytag),
    ("Sem/Dummytag-only, lowercase", t_dummytag_lower),
    ("Prop|Dummytag-only, lowercase", t_prop_or_dummy_lower),
    ("V-only before a N", t_v_before_n),
    ("no Attr/Gen/A/Num before a N", t_nonattr_before_n),
    ("ConNeg-only", t_conneg),
    ("Imprt-only", t_imprt),
    ("Actio-only", t_actio),
]


def readings_by_form(cohort):
    out = {}
    for r in cohort["readings"]:
        if "<spelled>" not in r:
            continue
        m = SFORM_RE.search(r)
        if m:
            out.setdefault(m.group(1), []).append(r)
    return out


def weight_of(readings):
    ws = [float(m.group(1)) for m in (WEIGHT_RE.search(r) for r in readings) if m]
    return min(ws) if ws else None


def reorder(order, weights, suspect, op, penalty):
    """Re-derive the list under the operation. `order` is already sorted."""
    if op == "remove":
        kept = [f for f in order if f not in suspect]
        return kept if kept else order
    if op == "demote":
        return [f for f in order if f not in suspect] + [
            f for f in order if f in suspect
        ]
    keyed = []
    for n, f in enumerate(order):
        w = weights.get(f)
        if w is None:
            keyed.append((n, n, f))
        else:
            keyed.append(((w + penalty) if f in suspect else w, n, f))
    keyed.sort(key=lambda t: (t[0], t[1]))
    return [f for _, _, f in keyed]


def run(live, fn, op, penalty, k_list=(1, 5)):
    fires = 0
    res = {k: [0, 0] for k in k_list}
    for r in live:
        coh = r["cohorts"]
        i = r["idx"]
        bf = readings_by_form(coh[i])
        order = r["before"]
        lookup, weights = {}, {}
        for f in order:
            rs = (
                bf.get(f)
                or bf.get(f[:1].lower() + f[1:])
                or bf.get(f[:1].upper() + f[1:])
            )
            lookup[f] = rs or []
            weights[f] = weight_of(rs or [])
        suspect = {f for f in order if lookup[f] and fn(coh, i, f, lookup[f])}
        if not suspect:
            continue
        new = reorder(order, weights, suspect, op, penalty)
        if new == order:
            continue
        fires += 1
        gold = r["correction"]
        b = order.index(gold) + 1 if gold in order else None
        a = new.index(gold) + 1 if gold in new else None
        for k in k_list:
            was = b is not None and b <= k
            now = a is not None and a <= k
            if now and not was:
                res[k][0] += 1
            elif was and not now:
                res[k][1] += 1
    return fires, res


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("scored")
    ap.add_argument("--ops", default="penalty,demote,remove")
    ap.add_argument("--penalties", default="5,10,20,40")
    ap.add_argument("--only", default=None, help="substring filter on test name")
    args = ap.parse_args()

    rows = [json.loads(l) for l in open(args.scored, encoding="utf-8")]
    live = [
        r
        for r in rows
        if r.get("before_status") == "ok"
        and r.get("cohorts")
        and r.get("idx") is not None
        and r.get("before")
    ]
    print("live rows with cohorts: %d" % len(live))
    print()
    print(
        "%-32s %-10s %6s %5s %5s %6s %5s %5s %6s"
        % ("test", "op", "fires", "+1", "-1", "net1", "+5", "-5", "net5")
    )
    for name, fn in TESTS:
        if args.only and args.only not in name:
            continue
        plans = []
        for op in args.ops.split(","):
            if op == "penalty":
                plans += [("penalty+%s" % p, "penalty", float(p)) for p in args.penalties.split(",")]
            else:
                plans.append((op, op, 0.0))
        for label, op, pen in plans:
            fires, res = run(live, fn, op, pen)
            g1, l1 = res[1]
            g5, l5 = res[5]
            print(
                "%-32s %-10s %6d %5d %5d %+6d %5d %5d %+6d"
                % (name, label, fires, g1, l1, g1 - l1, g5, l5, g5 - l5)
            )
        print()


if __name__ == "__main__":
    main()
