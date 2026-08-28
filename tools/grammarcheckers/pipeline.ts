import * as cg3 from "./.divvun-rt/cg3.ts";
import * as divvun from "./.divvun-rt/divvun.ts";
import * as hfst from "./.divvun-rt/hfst.ts";
import { Command, StringEntry } from "./.divvun-rt/mod.ts";

// Held in step with tools/spellcheckers/config.json. These drifted apart: the
// beam comment below was written when the standalone speller used 28, and the
// accuracy work later took it to 80 and start_penalty to 10 without this copy
// following. The pipeline was then running a narrower beam than the standalone
// speller it claims to widen on, and lost the correct suggestion outright in
// 18 of 77 measured cases. Change both files together.
let spellcheckerConfig = {
        n_best: 100,             // Maks tal på forslag per ord
        max_weight: 10000.0,     // Maks vekt for forslag - alle forslag med høgare vekt blir automatisk fjerna
        beam: 80.0,              // Vektområde, meir enn for sjølvstendig stavekontroll - vi kan filtrera med cg-reglar
        reweight: {              // Ekstra straffepoeng for endringar etter posisjon
            start_penalty: 10.0,
            end_penalty: 10.0,
            mid_penalty: 5.0,
            curve: 12.0,         // Kor bratt start-/sluttstraffa fell av inn i ordet
        },
        search_budget: 1000000,  // Tak på søkjearbeid per ord; slår ikkje inn ved redigeringsavstand 2
        recase: true,            // Prøv å endra berre stor/liten bokstav først
    }
export default function smeGramRelease(entry: StringEntry): Command {
  let x = hfst.tokenize("tokenize", entry, { model_path: "tokeniser-gramcheck-gt-desc.pmhfst" });
  x = divvun.blanktag("whitespace", x, { model_path: "analyser-gt-whitespace.hfst" });
  x = cg3.vislcg3("valency", x, { model_path: "valency.bin" });
  x = cg3.vislcg3("mwe-dis", x, { model_path: "mwe-dis.bin" });
  x = cg3.mwesplit("mwesplit", x);
  x = divvun.blanktag("errorwhitespace", x, { model_path: "analyser-gt-errorwhitespace.hfst" });
  x = divvun.cgspell("speller", x, {
    acc_model_path: "acceptor.default.hfst",
    err_model_path: "errmodel.default.hfst",
    config: spellcheckerConfig,
  });
  x = cg3.vislcg3("postspell-valency", x, { model_path: "valency-postspell.bin" });
  x = cg3.vislcg3("grc-disamb", x, { model_path: "grc-disambiguator.bin" });
  x = cg3.vislcg3("spell-sugg-filtering", x, { model_path: "spellchecker.bin" });
  x = cg3.vislcg3("gramcheck", x, { model_path: "grammarchecker-release.bin" });
  return divvun.suggest("suggestions", x, { model_path: "generator-gramcheck-gt-norm.hfstol" });
}

export function smeGram(entry: StringEntry): Command {
  let x = hfst.tokenize("tokenize", entry, { model_path: "tokeniser-gramcheck-gt-desc.pmhfst" });
  x = divvun.blanktag("whitespace", x, { model_path: "analyser-gt-whitespace.hfst" });
  x = cg3.vislcg3("valency", x, { model_path: "valency.bin" });
  x = cg3.vislcg3("mwe-dis", x, { model_path: "mwe-dis.bin" });
  x = cg3.mwesplit("mwesplit", x);
  x = divvun.blanktag("errorwhitespace", x, { model_path: "analyser-gt-errorwhitespace.hfst" });
  x = divvun.cgspell("speller", x, {
    acc_model_path: "acceptor.default.hfst",
    err_model_path: "errmodel.default.hfst",
    config: spellcheckerConfig,
  });
  x = cg3.vislcg3("postspell-valency", x, { model_path: "valency-postspell.bin" });
  x = cg3.vislcg3("grc-disamb", x, { model_path: "grc-disambiguator.bin" });
  x = cg3.vislcg3("spell-sugg-filtering", x, { model_path: "spellchecker.bin" });
  x = cg3.vislcg3("gramcheck", x, { model_path: "grammarchecker.bin" });
  return divvun.suggest("suggestions", x, { model_path: "generator-gramcheck-gt-norm.hfstol" });
}

/**
 * Dev pipeline for testing with local models.
 */
export function localTest_dev(entry: StringEntry): Command {
  let x = hfst.tokenize("tokenize", entry, { model_path: "@./tokeniser-gramcheck-gt-desc.pmhfst" });
  x = divvun.blanktag("whitespace", x, { model_path: "@./analyser-gt-whitespace.hfst" });
  x = cg3.vislcg3("valency", x, { model_path: "@../../src/cg3/valency.cg3" });
  x = cg3.vislcg3("mwe-dis", x, { model_path: "@../tokenisers/mwe-dis.cg3" });
  x = cg3.mwesplit("mwesplit", x);
  x = divvun.blanktag("errorwhitespace", x, { model_path: "@./analyser-gt-errorwhitespace.hfst" });
  x = divvun.cgspell("speller", x, {
    acc_model_path: "@./acceptor.default.hfst",
    err_model_path: "@./errmodel.default.hfst",
    config: spellcheckerConfig,
  });
  x = cg3.vislcg3("postspell-valency", x, { model_path: "@./valency-postspell.cg3" });
  x = cg3.vislcg3("grc-disamb", x, { model_path: "@./grc-disambiguator.cg3" });
  x = cg3.vislcg3("spell-sugg-filtering", x, { model_path: "@./spellchecker.cg3" });
  x = cg3.vislcg3("gramcheck", x, { model_path: "@./grammarchecker.cg3" });
  return divvun.suggest("suggestions", x, { model_path: "@./generator-gramcheck-gt-norm.hfstol" });
}

/**
 * Dev pipeline for testing with local models, with tracing.
 */
export function localTestTrace_dev(entry: StringEntry): Command {
  let x = hfst.tokenize("tokenize", entry, { model_path: "@./tokeniser-gramcheck-gt-desc.pmhfst" });
  x = divvun.blanktag("whitespace", x, { model_path: "@./analyser-gt-whitespace.hfst" });
  x = cg3.vislcg3("valency", x, { model_path: "@../../src/cg3/valency.cg3", config: { trace: true } });
  x = cg3.vislcg3("mwe-dis", x, { model_path: "@../tokenisers/mwe-dis.cg3", config: { trace: true } });
  x = cg3.mwesplit("mwesplit", x);
  x = divvun.blanktag("errorwhitespace", x, { model_path: "@./analyser-gt-errorwhitespace.hfst" });
  x = divvun.cgspell("speller", x, {
    acc_model_path: "@./acceptor.default.hfst",
    err_model_path: "@./errmodel.default.hfst",
    config: spellcheckerConfig,
  });
  x = cg3.vislcg3("postspell-valency", x, { model_path: "@./valency-postspell.cg3", config: { trace: true } });
  x = cg3.vislcg3("grc-disamb", x, { model_path: "@./grc-disambiguator.cg3", config: { trace: true } });
  x = cg3.vislcg3("spell-sugg-filtering", x, { model_path: "@./spellchecker.cg3", config: { trace: true } });
  x = cg3.vislcg3("gramcheck", x, { model_path: "@./grammarchecker.cg3", config: { trace: true } });
  return divvun.suggest("suggestions", x, { model_path: "@./generator-gramcheck-gt-norm.hfstol" });
}
