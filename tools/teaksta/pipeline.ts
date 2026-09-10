import * as cg3 from "./.divvun-rt/cg3.ts";
import * as divvun from "./.divvun-rt/divvun.ts";
import * as hfst from "./.divvun-rt/hfst.ts";
import { Command, StringEntry } from "./.divvun-rt/mod.ts";

// Pipelines for teaksta (Konteaksta), the North Sámi ICALL reading
// companion. The `analyze` pipeline replaces the legacy shell chain
// `preprocess | lookup analyser-disamb | lookup2cg | vislcg3
// disambiguator.cg3 | vislcg3 konteaksta.cg3`: tokenisation and
// analysis come from the pmhfst tokeniser, and the konteaksta syntax
// grammar (from shared-smi) assigns the @-function tags the teaksta
// enhancers match on.

function tokenized(entry: StringEntry): Command {
  let x = hfst.tokenize("tokenize", entry, {
    model_path: "tokeniser-gramcheck-gt-desc.pmhfst",
  });
  return divvun.blanktag("whitespace", x, {
    model_path: "analyser-gt-whitespace.hfst",
  });
}

export default function analyze(entry: StringEntry): Command {
  let x = tokenized(entry);
  x = cg3.vislcg3("mwe-dis", x, { model_path: "mwe-dis.bin" });
  x = cg3.mwesplit("mwesplit", x);
  x = cg3.vislcg3("disamb", x, { model_path: "disambiguator.cg3" });
  // konteaksta.cg3 INCLUDEs functions.cg3 itself, exactly as the legacy
  // deployment applied it standalone after disambiguation.
  return cg3.vislcg3("konteaksta", x, { model_path: "konteaksta.cg3" });
}

export function tokenize(entry: StringEntry): Command {
  return tokenized(entry);
}

export function sentences(entry: StringEntry): Command {
  let x = tokenized(entry);
  return cg3.sentences("sentences", x, { mode: "surface" });
}
