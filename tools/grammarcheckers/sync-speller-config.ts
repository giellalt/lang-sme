#!/usr/bin/env -S deno run --allow-read --allow-write
/**
 * Regenerate the SPELLER_BASE block in this directory's pipelines from the
 * tuned speller config at tools/spellcheckers/config.json.
 *
 * The pipelines cannot simply import that file. divvun-runtime bundles a
 * pipeline by copying its source text into a temporary directory of its own
 * (cli/src/deno_rt.rs, dump_ast), so every relative import except ./.divvun-rt/
 * fails to resolve there, JSON and TypeScript alike. The base is therefore
 * generated into the pipeline source, and this script is what keeps the copy
 * honest: tools/spellcheckers/config.json stays the only place a tuned value is
 * written down.
 *
 * Keys are normalised from the JSON's kebab-case to snake_case. divvunspell's
 * SpellerConfig accepts either (kebab-case names with snake_case serde
 * aliases), but the TypeScript interface divvun-runtime generates is snake_case
 * only, so kebab-case keys fail `deno check`.
 *
 *   deno run --allow-read --allow-write sync-speller-config.ts    # rewrite
 *   deno run --allow-read sync-speller-config.ts --check          # verify only
 *
 * Values the pipeline deliberately departs from are overridden below the
 * generated block, where they stay visible as departures.
 */

const BEGIN = "// --- BEGIN GENERATED from tools/spellcheckers/config.json ---";
const END = "// --- END GENERATED ---";

/** Fields the generated divvun-runtime TypeScript interface accepts. */
const KNOWN_FIELDS = new Set([
  "n_best",
  "max_weight",
  "beam",
  "reweight",
  "node_pool_size",
  "continuation_marker",
  "recase",
  "search_budget",
  "word_split_weight",
]);

const KNOWN_REWEIGHT_FIELDS = new Set([
  "start_penalty",
  "end_penalty",
  "mid_penalty",
  "curve",
]);

const configUrl = new URL("../spellcheckers/config.json", import.meta.url);

function snake(key: string): string {
  return key.replaceAll("-", "_");
}

function renderFields(
  source: Record<string, unknown>,
  known: Set<string>,
  indent: string,
  where: string,
): string[] {
  const lines: string[] = [];
  for (const [rawKey, value] of Object.entries(source)) {
    // null means "leave it at the runtime default", which is what omitting it
    // does, and some of those keys have no TypeScript field to be written to.
    if (value === null) continue;
    const key = snake(rawKey);
    if (!known.has(key)) {
      throw new Error(
        `${where}: "${rawKey}" is not a field divvun-runtime's SpellerConfig ` +
          `TypeScript interface declares. Either divvun-runtime needs updating ` +
          `or this script's field list does.`,
      );
    }
    if (key === "reweight") {
      lines.push(`${indent}reweight: {`);
      lines.push(
        ...renderFields(
          value as Record<string, unknown>,
          KNOWN_REWEIGHT_FIELDS,
          `${indent}    `,
          `${where} reweight`,
        ),
      );
      lines.push(`${indent}},`);
      continue;
    }
    lines.push(`${indent}${key}: ${JSON.stringify(value)},`);
  }
  return lines;
}

function render(config: Record<string, unknown>): string {
  return [
    BEGIN,
    "const SPELLER_BASE = {",
    ...renderFields(config, KNOWN_FIELDS, "    ", "config.json"),
    "};",
    END,
  ].join("\n");
}

function splice(source: string, block: string, path: string): string {
  const start = source.indexOf(BEGIN);
  const end = source.indexOf(END);
  if (start === -1 || end === -1 || end < start) {
    throw new Error(`${path}: generated block markers are missing or reversed`);
  }
  return source.slice(0, start) + block + source.slice(end + END.length);
}

const check = Deno.args.includes("--check");
const config = JSON.parse(await Deno.readTextFile(configUrl));
const block = render(config);

const here = new URL(".", import.meta.url);
const targets: string[] = [];
for await (const entry of Deno.readDir(here)) {
  if (!entry.isFile || !entry.name.endsWith(".ts")) continue;
  const path = new URL(entry.name, here);
  if (path.href === import.meta.url) continue; // this file names the markers too
  if ((await Deno.readTextFile(path)).includes(BEGIN)) targets.push(entry.name);
}
targets.sort();

let drifted = 0;
for (const name of targets) {
  const path = new URL(name, here);
  const before = await Deno.readTextFile(path);
  const after = splice(before, block, name);
  if (before === after) {
    console.log(`  up to date  ${name}`);
    continue;
  }
  drifted += 1;
  if (check) {
    console.error(`  out of date ${name}`);
    continue;
  }
  await Deno.writeTextFile(path, after);
  console.log(`  rewrote     ${name}`);
}

if (targets.length === 0) {
  console.error("No pipeline carries a generated block. Nothing to do.");
  Deno.exit(1);
}
if (check && drifted > 0) {
  console.error(
    `\n${drifted} pipeline(s) disagree with tools/spellcheckers/config.json. ` +
      `Run this script without --check.`,
  );
  Deno.exit(1);
}
