import * as cg3 from "./.divvun-rt/cg3.ts";
import * as divvun from "./.divvun-rt/divvun.ts";
import * as hfst from "./.divvun-rt/hfst.ts";
import { Command, StringEntry } from "./.divvun-rt/mod.ts";

// CONTROL for spell-disamb.ts: identical but with no disambiguation
// stage, so a difference between the two is the disambiguator and nothing else.
//
// A speller, not a grammar checker.
//
// The point of this pipeline is to find out whether CG disambiguation improves
// the speller's suggestions. That question cannot be asked of the grammar
// checker pipeline: its tokeniser-analyser is descriptive and recognises many
// misspellings outright as Err/Orth, so they are corrected normatively and
// never reach the speller at all. Measuring the speller through it measures
// mostly something else.
//
// So: tokenise, put the Err-only cohorts back on the speller's footing, spell
// them, and only then disambiguate -- with the suggestions in the stream, so
// the disambiguator prunes them against the sentence around them.

// Keys are kebab-case because that is what divvun_fst::speller::SpellerConfig
// deserializes; the generated TypeScript type says n_best/max_weight, but those
// spellings are silently dropped and the defaults used instead -- n-best falls
// back to 10 where a pipeline asks for 100. Values here match
// tools/spellcheckers/config.json, so the speller behaves as it does standalone.
let spellerConfig = {
    "n-best": 100,
    "max-weight": 10000.0,
    "beam": 80.0,
    "search-budget": 1000000,
    "reweight": {
        "start-penalty": 10.0,
        "end-penalty": 10.0,
        "mid-penalty": 5.0,
        "curve": 12.0,
    },
    "word-split-weight": 65.0,
    "recase": true,
};

export default function smeSpellNoDisamb(entry: StringEntry): Command {
    let x = hfst.tokenize("tokenize", entry, {
        model_path: "tokeniser-gramcheck-gt-desc.pmhfst",
    });
    x = divvun.blanktag("whitespace", x, {
        model_path: "analyser-gt-whitespace.hfst",
    });
    // Everything the analyser knows only as an error becomes an unknown, so the
    // speller sees the same words it would see on its own.
    x = cg3.vislcg3("err-to-unknown", x, { model_path: "err-to-unknown.bin" });
    x = divvun.cgspell("speller", x, {
        acc_model_path: "acceptor.default.hfst",
        err_model_path: "errmodel.default.hfst",
        config: spellerConfig,
    });
    // valency tags scoped to <spelled> readings, so the disambiguator has the
    // same evidence for a suggestion as it would for an ordinary word.
    x = cg3.vislcg3("postspell-valency", x, {
        model_path: "valency-postspell.bin",
    });
    x = cg3.vislcg3("spell-sugg-filtering", x, {
        model_path: "spellchecker.bin",
    });
    // Tag the survivors so divvun.suggest will report them; the grammar
    // checker gets this from grammarchecker.cg3, which this pipeline omits.
    x = cg3.vislcg3("spell-emit", x, { model_path: "spell-emit.bin" });
    return divvun.suggest("suggestions", x, {
        model_path: "generator-gramcheck-gt-norm.hfstol",
    });
}
