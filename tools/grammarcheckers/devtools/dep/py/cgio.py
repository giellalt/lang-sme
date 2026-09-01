#!/usr/bin/env python3
"""Reading and writing the CG stream this study works over.

A sentence is a list of cohorts; a cohort is a wordform plus its reading lines.
Sentence boundaries come from the tokeniser's newline blanks (":\\n"), which is
exactly one per input line, so cohort-to-sentence alignment is exact and does
not have to be reconstructed from punctuation.
"""
import re

DEP_RE = re.compile(r"#(\d+)->(\d+)")
FUNC_RE = re.compile(r"(?:^|\s)(@[^\s]+)")


class Cohort:
    __slots__ = ("form", "readings")

    def __init__(self, form):
        self.form = form
        self.readings = []


def read_stream(path_or_lines):
    """Yield sentences (lists of Cohort) from a giella-CG stream."""
    if isinstance(path_or_lines, str):
        fh = open(path_or_lines, encoding="utf-8")
        close = True
    else:
        fh = path_or_lines
        close = False
    sent = []
    cur = None
    try:
        for line in fh:
            line = line.rstrip("\n")
            if line.startswith('"<') and line.endswith('>"'):
                cur = Cohort(line)
                sent.append(cur)
            elif line.startswith("\t") or line.startswith(" "):
                if cur is not None:
                    cur.readings.append(line)
            elif line.startswith(":"):
                # ":\n" is the tokeniser's rendering of a newline in the input,
                # i.e. our sentence boundary.  Bare ": " is an intra-sentence
                # space and must not split.
                if "\\n" in line:
                    if sent:
                        yield sent
                    sent = []
                    cur = None
            elif line == "":
                continue
        if sent:
            yield sent
    finally:
        if close:
            fh.close()


def write_sentence(out, sent):
    for c in sent:
        out.write(c.form + "\n")
        for r in c.readings:
            out.write(r + "\n")
    out.write(":\\n\n")


def blank_cohort(cohort):
    """A copy of the cohort as the analyser would leave an unknown word."""
    form = cohort.form[2:-2]
    c = Cohort(cohort.form)
    c.readings = ['\t"%s" ?' % form]
    return c


def parse_tree(sent):
    """(heads, labels) for a parsed sentence, 1-based and sentence-local.

    Cohort ids in the stream are global to the whole run, so a head pointing
    outside this sentence's span is the cross-window root leakage described in
    the report; it is normalised to 0 (root).
    """
    ids = []
    heads = []
    labels = []
    for c in sent:
        cid = None
        head = None
        lab = None
        for r in c.readings:
            m = DEP_RE.search(r)
            if m:
                cid = int(m.group(1))
                head = int(m.group(2))
            fm = FUNC_RE.search(r)
            if fm:
                lab = fm.group(1)
            if cid is not None:
                break
        ids.append(cid)
        heads.append(head)
        labels.append(lab)
    known = {gid: i + 1 for i, gid in enumerate(ids) if gid is not None}
    local_heads = []
    for h in heads:
        if h is None:
            local_heads.append(None)
        else:
            local_heads.append(known.get(h, 0))
    return local_heads, labels


def is_punct(cohort):
    form = cohort.form[2:-2]
    return not any(ch.isalnum() for ch in form)
