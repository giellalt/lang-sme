"""Read a CG stream and reproduce the suggestion list divvun.suggest would emit.

The harness taps the pipeline mid-flight rather than running it to completion,
so this module has to reproduce the tail that was skipped. Three things matter
and all three are copied from divvun-runtime's `src/modules/divvun/suggest.rs`:

1. the list is the `"form"S` tag of every `<spelled>` reading in the cohort;
2. it is sorted by `<W:...>` ascending, stably, so equal weights keep the order
   cgspell emitted them in -- and a CG rule that rewrites `<W:...>` reorders the
   list, which is the only reordering operation CG3 has;
3. repeats are dropped keeping the FIRST occurrence, not the consecutive-only
   dedup `Vec::dedup` would give: syncretism routinely puts two analyses of one
   surface form either side of a third form.

Casing is then applied as `with_casing` does, from the casing of the word the
user actually typed.
"""
import re

READING_RE = re.compile(r'^\t+')
WEIGHT_RE = re.compile(r"<W:([-0-9.eE]+)>")
SFORM_RE = re.compile(r'"((?:[^"\\]|\\.)*)"S(?:\s|$)')
WORDFORM_RE = re.compile(r'^"<(.*)>"$')


def parse_stream(text):
    """CG stream -> [{form, readings:[str]}], in stream order.

    Sub-readings (deeper indentation) are folded into the reading above them,
    which is what a cohort-level view wants: a dependent reading is part of one
    analysis, not a competing one.
    """
    cohorts = []
    cur = None
    for line in text.split("\n"):
        m = WORDFORM_RE.match(line.strip()) if line.startswith('"<') else None
        if m:
            cur = {"form": m.group(1), "readings": []}
            cohorts.append(cur)
        elif line.startswith("\t") and cur is not None:
            depth = len(line) - len(line.lstrip("\t"))
            if depth == 1 or not cur["readings"]:
                cur["readings"].append(line.strip())
            else:
                cur["readings"][-1] += " " + line.strip()
        elif line.startswith(":") or line.startswith("<"):
            cur = None
    return cohorts


def casing_of(word):
    letters = [c for c in word if c.isalpha()]
    if not letters:
        return "mixed"
    if all(c.isupper() for c in letters) and len(letters) > 1:
        return "upper"
    if all(c.islower() for c in letters):
        return "lower"
    if letters[0].isupper() and all(c.islower() for c in letters[1:]):
        return "title"
    return "mixed"


def with_casing(case, s):
    if case == "title":
        cs = list(s)
        for i, c in enumerate(cs):
            if c.isalpha():
                cs[i] = c.upper()
                break
        return "".join(cs)
    if case == "upper":
        return s.upper()
    if case == "lower":
        return s.lower()
    return s


def suggestions(cohort, input_form):
    """Ordered, deduped suggestion list for one cohort."""
    items = []
    for r in cohort["readings"]:
        if "<spelled>" not in r:
            continue
        m = SFORM_RE.search(r)
        if not m:
            continue
        w = WEIGHT_RE.search(r)
        items.append((float(w.group(1)) if w else None, m.group(1)))

    # order_by_weight: only weighted entries move, and only among themselves.
    slots = [i for i, (w, _) in enumerate(items) if w is not None]
    if len(slots) >= 2:
        picked = sorted((items[i] for i in slots), key=lambda t: t[0])
        for slot, val in zip(slots, picked):
            items[slot] = val

    case = casing_of(input_form)
    out, seen = [], set()
    for _, form in items:
        f = with_casing(case, form)
        if f not in seen:
            seen.add(f)
            out.append(f)
    return out


def find_cohort(cohorts, form):
    """Index of the cohort for `form`, or None.

    Exact match first. The tokeniser can hand back a cohort whose wordform
    differs from the input token (an MWE join, a stripped clitic), and a
    case-insensitive fallback is the only one of those that is safe to accept:
    anything looser and the harness would be scoring a different word.
    """
    for i, c in enumerate(cohorts):
        if c["form"] == form:
            return i
    low = form.lower()
    for i, c in enumerate(cohorts):
        if c["form"].lower() == low:
            return i
    return None
