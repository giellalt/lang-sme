import * as cg3 from "./.divvun-rt/cg3.ts";
import * as divvun from "./.divvun-rt/divvun.ts";
import * as hfst from "./.divvun-rt/hfst.ts";
import { Command, PipelineValue, StringEntry } from "./.divvun-rt/mod.ts";

// Pipelines for the sentence-context rank harness.
//
// Everything is an @./ local path so a .cg3 edit takes effect on the next run
// with no bundle rebuild -- which is the whole point, since the harness exists
// to price .cg3 edits. Stage ids are the handles the harness passes to
// `divvun-runtime run --break-after`, so renaming one breaks the harness.
//
// The tail of the product pipeline (grammarchecker.cg3 + divvun.suggest) is
// absent. The harness reads the candidate order straight out of the CG stream,
// which is where the ranking lives; py/cohort.py reproduces the ordering and
// dedup divvun.suggest would have applied. grammarchecker.cg3 runs after the
// stage under test and the generator is the one asset this tree cannot cheaply
// build.
//
// Keys are kebab-case because that is what divvun_fst::speller::SpellerConfig
// deserializes; n_best/max_weight are silently dropped and the defaults used.
//
// Values are the grammar checker's, copied verbatim from
// tools/grammarcheckers/pipeline.ts, NOT the standalone speller's: the question
// is what spellchecker.cg3 does to the cohort it is actually given. The
// difference is not cosmetic. beam 80 (the standalone speller's) puts ~250
// readings in a misspelling's cohort and costs 17.8 s a sentence through the
// two CG stages; beam 38 costs 0.6 s. Widening the beam here would measure a
// cohort the product never builds, thirty times slower.
let spellerConfig = {
    "n-best": 100,
    "max-weight": 10000.0,
    "beam": 38.0,
    "reweight": {
        "start-penalty": 20.0,
        "end-penalty": 10.0,
        "mid-penalty": 5.0,
    },
    "recase": true,
};

// Everything up to and including mwesplit, shared by both pipelines.
function front(entry: StringEntry): PipelineValue {
    let x = hfst.tokenize("tokenize", entry, {
        model_path: "@./tokeniser-gramcheck-gt-desc.pmhfst",
    });
    x = divvun.blanktag("whitespace", x, {
        model_path: "@./analyser-gt-whitespace.hfst",
    });
    x = cg3.vislcg3("valency", x, { model_path: "@./valency.cg3" });
    x = cg3.vislcg3("mwe-dis", x, { model_path: "@./mwe-dis.cg3" });
    return cg3.mwesplit("mwesplit", x);
}

// Everything from cgspell on, shared by both pipelines.
function back(x: PipelineValue): Command {
    let y = divvun.cgspell("speller", x, {
        acc_model_path: "@./acceptor.default.hfst",
        err_model_path: "@./errmodel.default.hfst",
        config: spellerConfig,
    });
    // valency tags scoped to <spelled> readings, so the disambiguator has the
    // same evidence for a suggestion as for an ordinary word.
    y = cg3.vislcg3("postspell-valency", y, {
        model_path: "@./valency-postspell.cg3",
    });
    // The PROTECTing disambiguator: a disambiguated CONTEXT with the
    // suggestions left alone. De-PROTECTing was measured and destroys the gold
    // in over half of rows -- see ../README.md.
    y = cg3.vislcg3("disamb", y, { model_path: "@./grc-disambiguator.cg3" });
    // The stage under test. `--break-after disamb` is BEFORE, `--break-after
    // spell-sugg-filtering` is AFTER.
    return cg3.vislcg3("spell-sugg-filtering", y, {
        model_path: "@./spellchecker.cg3",
    });
}

/**
 * The product grammar checker, stage for stage, up to the stage under test.
 * This is the baseline: what spellchecker.cg3 does to the cohorts the shipped
 * pipeline actually hands it.
 */
export function prod_dev(entry: StringEntry): Command {
    let x = front(entry);
    x = divvun.blanktag("errorwhitespace", x, {
        model_path: "@./analyser-gt-errorwhitespace.hfst",
    });
    return back(x);
}

/**
 * The same, but with every Err-only cohort forced to the speller.
 *
 * The grammar checker's tokeniser-analyser is descriptive and recognises a
 * great many misspellings outright as Err/Orth, so they are corrected
 * normatively and never reach cgspell at all. That is right for a grammar
 * checker and wrong for measuring a speller: on typos-context.tsv it is most
 * of the rows. err-to-unknown.cg3 puts those cohorts back on the speller's
 * footing, which buys sample size at the cost of no longer being the shipped
 * pipeline. Report which one a number came from.
 */
export function spell_dev(entry: StringEntry): Command {
    let x = front(entry);
    x = divvun.blanktag("errorwhitespace", x, {
        model_path: "@./analyser-gt-errorwhitespace.hfst",
    });
    x = cg3.vislcg3("err-to-unknown", x, {
        model_path: "@./err-to-unknown.cg3",
    });
    return back(x);
}
