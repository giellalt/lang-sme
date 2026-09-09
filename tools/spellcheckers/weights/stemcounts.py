#!/usr/bin/env python3
"""Per-stem token counts from a CG-disambiguated corpus. Driven by
corpus2stemcounts.sh, which documents the pipeline; each subcommand here is one
stage of it.

The stem key is the analysis prefix before its first tag -- what a lexc stem
entry carries. lookup2cg rewrites that prefix for compounds (`boazu+N+Cmp/SgNom
+Cmp#guohtun+N+Sg+Nom` comes out as base `boazo#guohtun`), so the mapping from
a CG reading back to a stem is recovered by running the analyses through
lookup2cg a second time with each analysis's own stem appended as a marker tag.
Stripping the marker from the marked cohort gives the canonical cohort line,
hence a (type, reading) -> stem map. The CG stream itself is unmarked, so the
disambiguation is the stock one.
"""

import collections
import glob
import os
import re
import sys
from argparse import ArgumentParser

MARK = "Stem§"


def cmd_types(opts):
    counts = collections.Counter()
    with open(opts.input, encoding="utf-8") as f:
        for line in f:
            token = line.rstrip("\n")
            if token:
                counts[token] += 1
    with open(opts.output, "w", encoding="utf-8") as o, \
            open(opts.types_out, "w", encoding="utf-8") as t:
        for token, n in counts.most_common():
            print(token, n, sep="\t", file=o)
            print(token, file=t)
    print(f"*** {len(counts)} types, {sum(counts.values())} tokens",
          file=sys.stderr)


def cmd_mark(opts):
    """Append each analysis's own stem to it as a marker tag."""
    n = 0
    with open(opts.input, encoding="utf-8") as f, \
            open(opts.output, "w", encoding="utf-8") as o:
        for line in f:
            line = line.rstrip("\n")
            if not line:
                o.write("\n")
                continue
            parts = line.split("\t")
            if len(parts) < 2:
                o.write(line + "\n")
                continue
            form, analysis = parts[0], parts[1]
            plus = analysis.find("+", 1)
            stem = analysis[:plus] if plus > 0 else analysis
            o.write(f"{form}\t{analysis}+{MARK}{stem}\n")
            n += 1
    print(f"*** {n} analyses marked", file=sys.stderr)


def load_cohorts(path):
    cohorts, key, buf = {}, None, []
    with open(path, encoding="utf-8") as f:
        for line in f:
            if line.startswith('"<'):
                if key is not None:
                    cohorts[key] = "".join(buf)
                key = line[2:line.rindex('>"')]
                buf = [line]
            else:
                buf.append(line)
    if key is not None:
        cohorts[key] = "".join(buf)
    return cohorts


def cmd_expand(opts):
    """Type cohorts + token stream -> the CG input stream, split for parallel
    disambiguation at paragraph marks (a CG delimiter, so no window is cut)."""
    work = opts.work
    cohorts = load_cohorts(f"{work}/types.cohorts.txt")
    path = f"{work}/corpus.cg"
    missing = n = 0
    with open(f"{work}/corpus.tokens.txt", encoding="utf-8") as f, \
            open(path, "w", encoding="utf-8") as o:
        for line in f:
            token = line.rstrip("\n")
            if not token:
                continue
            # lookup2cg underscores whitespace inside a multiword token.
            cohort = cohorts.get(token) or cohorts.get(token.replace(" ", "_"))
            if cohort is None:
                missing += 1
                cohort = f'"<{token}>"\n\t"{token}" ?\n'
            o.write(cohort)
            n += 1
    size = os.path.getsize(path)
    target = size // opts.jobs
    idx, written = 0, 0
    out = open(f"{work}/chunks/c00.cg", "w", encoding="utf-8")
    with open(path, encoding="utf-8") as f:
        for line in f:
            if line.startswith('"<¶>"') and written >= target \
                    and idx < opts.jobs - 1:
                out.close()
                idx += 1
                written = 0
                out = open(f"{work}/chunks/c%02d.cg" % idx, "w",
                           encoding="utf-8")
            out.write(line)
            written += len(line.encode())
    out.close()
    print(f"*** {n} cohorts ({missing} unmatched types) in {idx + 1} chunks",
          file=sys.stderr)


def load_stem_map(work):
    """(type, canonical reading line) -> set of stems."""
    m = collections.defaultdict(lambda: collections.defaultdict(set))
    key = None
    with open(f"{work}/types.cohorts.marked.txt", encoding="utf-8") as f:
        for line in f:
            if line.startswith('"<'):
                key = line[2:line.rindex('>"')]
            elif line.startswith("\t") and key is not None:
                stem, rest = None, []
                for token in line.strip().split(" "):
                    if token.startswith(MARK):
                        stem = token[len(MARK):]
                    else:
                        rest.append(token)
                if stem is not None:
                    m[key][" ".join(rest)].add(stem)
    return m


# CG adds tags of its own to the readings it keeps.
ADDED = re.compile(r"^(@|<|#\d|&)")


def cmd_count(opts):
    m = load_stem_map(opts.work)
    stems = collections.Counter()
    amb = collections.Counter()
    stats = collections.Counter()

    def flush(key, readings):
        if key is None:
            return
        stats["cohorts"] += 1
        found = set()
        for tokens in readings:
            stats["readings"] += 1
            canonical = " ".join(t for t in tokens if not ADDED.match(t))
            candidates = m.get(key, {})
            got = candidates.get(canonical)
            if got is None and candidates:
                # CG may also add plain tags (`sentinit`); accept the longest
                # input reading that is a subsequence of the output.
                best = None
                for line, stem_set in candidates.items():
                    want = line.split(" ")
                    have = iter(tokens)
                    if all(x in have for x in want):
                        if best is None or len(want) > len(best[0]):
                            best = (want, stem_set)
                if best is not None:
                    got = best[1]
            if got is None:
                stats["unmatched"] += 1
            else:
                stats["matched"] += 1
                found |= got
        if not found:
            stats["unanalysed"] += 1
            return
        amb[len(found)] += 1
        share = 1.0 / len(found)
        for stem in found:
            stems[stem] += share

    for path in sorted(glob.glob(f"{opts.work}/cgout/c*.out")):
        key, readings = None, []
        with open(path, encoding="utf-8") as f:
            for line in f:
                if line.startswith('"<'):
                    flush(key, readings)
                    key = line[2:line.rindex('>"')] if '>"' in line else None
                    readings = []
                elif line.startswith((" ", "\t")) and key is not None:
                    readings.append(line.strip().split(" "))
        flush(key, readings)

    with open(opts.output, "w", encoding="utf-8") as o:
        for stem, count in stems.most_common():
            print(stem, f"{count:.4f}", sep="\t", file=o)
    total = sum(amb.values())
    print(f"*** disambiguated: {dict(stats)}", file=sys.stderr)
    print(f"*** {len(stems)} stems; stem-unique cohorts "
          f"{amb[1]}/{total} ({100 * amb[1] / max(total, 1):.1f}%); "
          f"histogram {sorted(amb.items())}", file=sys.stderr)


def cmd_count_undisambiguated(opts):
    """Baseline for comparison: every reading of every token counts, the
    token's mass split evenly over the stems its analyses propose. This is what
    a type-level lemma count without CG looks like."""
    counts = {}
    with open(f"{opts.work}/token.counts.tsv", encoding="utf-8") as f:
        for line in f:
            token, n = line.rstrip("\n").split("\t")
            counts[token] = int(n)
            counts.setdefault(token.replace(" ", "_"), int(n))
    stems_of = collections.defaultdict(set)
    key = None
    with open(f"{opts.work}/types.cohorts.marked.txt", encoding="utf-8") as f:
        for line in f:
            if line.startswith('"<'):
                key = line[2:line.rindex('>"')]
            elif line.startswith("\t") and key is not None:
                for token in line.strip().split(" "):
                    if token.startswith(MARK):
                        stems_of[key].add(token[len(MARK):])
    stems = collections.Counter()
    tokens = ambiguous = 0
    for form, found in stems_of.items():
        n = counts.get(form, 0)
        if not n or not found:
            continue
        tokens += n
        if len(found) > 1:
            ambiguous += n
        share = n / len(found)
        for stem in found:
            stems[stem] += share
    with open(opts.output, "w", encoding="utf-8") as o:
        for stem, count in stems.most_common():
            print(stem, f"{count:.4f}", sep="\t", file=o)
    print(f"*** undisambiguated: {len(stems)} stems over {tokens} tokens; "
          f"{ambiguous} ({100 * ambiguous / max(tokens, 1):.1f}%) "
          f"stem-ambiguous", file=sys.stderr)


def main():
    argp = ArgumentParser(description=__doc__)
    sub = argp.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("types")
    p.add_argument("-i", "--input", required=True)
    p.add_argument("-o", "--output", required=True)
    p.add_argument("--types-out", required=True)
    p.set_defaults(func=cmd_types)

    p = sub.add_parser("mark")
    p.add_argument("-i", "--input", required=True)
    p.add_argument("-o", "--output", required=True)
    p.set_defaults(func=cmd_mark)

    p = sub.add_parser("expand")
    p.add_argument("-w", "--work", required=True)
    p.add_argument("-j", "--jobs", type=int, default=8)
    p.set_defaults(func=cmd_expand)

    p = sub.add_parser("count")
    p.add_argument("-w", "--work", required=True)
    p.add_argument("-o", "--output", required=True)
    p.set_defaults(func=cmd_count)

    p = sub.add_parser("count-undisambiguated")
    p.add_argument("-w", "--work", required=True)
    p.add_argument("-o", "--output", required=True)
    p.set_defaults(func=cmd_count_undisambiguated)

    opts = argp.parse_args()
    opts.func(opts)


if __name__ == "__main__":
    main()
