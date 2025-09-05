export type ValueType = "string" | "path";

export const _current = new Map<string, Command>();

export abstract class Entry {
  type: "entry" = "entry";
  value_type: ValueType;

  constructor(valueType: ValueType) {
    this.value_type = valueType;
  }
}

export class StringEntry extends Entry {
  constructor() {
    super("string");
  }
}

export class PathEntry extends Entry {
  constructor() {
    super("path");
  }
}

export class Arg {
  type: string;
  value: any;

  constructor(type: string, value: any) {
    this.type = type;
    this.value = value;
  }
}

export type InputSingle = Command | Entry | Ref;
export type Input = InputSingle | InputSingle[];

export class Command {
  type: "command" = "command";
  module: string;
  command: string;
  input: Input;
  returns: string;
  args?: { [key: string]: Arg };

  constructor(config: {
    id?: string;
    module: string;
    command: string;
    input: Input;
    returns: string;
    args?: { [key: string]: Arg };
  }) {
    this.module = config.module;
    this.command = config.command;
    this.input = config.input;
    this.returns = config.returns;
    if (config.args) {
      this.args = config.args;
    }

    // Store reference for pipeline processing - use provided ID or generate random one
    const id = config.id || Math.random().toString(16).substring(2);
    _current.set(id, this);
  }
}

export class Ref {
  type: "ref" = "ref";
  ref: string;

  constructor(something: InputSingle) {
    if (something instanceof Command) {
      // Find the command ID in our current map
      for (const [id, cmd] of _current.entries()) {
        if (cmd === something) {
          this.ref = id;
          return;
        }
      }
      // Fallback if not found (shouldn't happen)
      this.ref = Math.random().toString(16).substring(2);
    } else if (something instanceof Ref) {
      // If it's already a Ref, just use its ref
      this.ref = something.ref;
    } else {
      // It's an Entry
      this.ref = "#/entry";
    }
  }
}

export function merge(...inputs: InputSingle[]): Command {
  return new Command({
    input: inputs,
    module: "std",
    command: "merge",
    returns: "unknown", // This should be inferred from context
  });
}

export function toJson(
  entry: Entry,
  output: Ref,
  commands: { [key: string]: Command },
): string {
  return JSON.stringify(
    {
      commands,
      entry,
      output,
    },
    null,
    2,
  );
}

// Global function to convert pipeline to JSON - this will be called by Deno
(globalThis as any).__divvun_runtime_to_json = toJson;
