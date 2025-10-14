import { assertEquals, load } from "jsr:@divvun/runtime@0.0.1/test";
import { GrammarOutput } from "../.divvun-rt/divvun.ts";

const bundle = load();

async function runGrammar(text: string): Promise<GrammarOutput> {
  const pipe = await bundle().create();
  const res = await pipe.forward(text);
  return (await res.json()) as unknown as GrammarOutput;
}

Deno.test(`"Sjur" => ”Sjur”`, async () => {
  const result = await runGrammar('"Sjur"');
  assertEquals(result.errors[0].suggestions[0], "”Sjur”");
  assertEquals(result.errors[0].error_id, "quotation-marks");
  assertEquals(result.errors[0].title, "Quotation marks");
});

Deno.test("namma  lea => namma lea", async () => {
  const result = await runGrammar("namma  lea");
  assertEquals(result.errors[0].suggestions[0], "namma lea");
});

Deno.test(`Lea  "Sjur"`, async () => {
  const result = await runGrammar(`Lea  "Sjur"`);
  console.log(result);
  assertEquals(result.errors.length, 2);
  assertEquals(result.errors[0].start, 0, "start value incorrect");
  assertEquals(result.errors[0].end, 11, "end value incorrect");

  assertEquals(result.errors[1].start, 5, "start value incorrect");
  assertEquals(result.errors[1].end, 11, "end value incorrect");
  assertEquals(
    result.errors[1].error_id,
    "quotation-marks",
    "error_id value incorrect"
  );
  assertEquals(
    result.errors[1].title,
    "Quotation marks",
    "title value incorrect"
  );
  assertEquals(
    result.errors[1].suggestions[0],
    "”Sjur”",
    "suggestion value incorrect"
  );
});
