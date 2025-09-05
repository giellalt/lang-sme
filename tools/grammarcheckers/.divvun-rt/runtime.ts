import { Arg, Command, Input } from './mod.ts';

interface ForwardOptions {
    pipeline_path: string;
}

export function forward(id: string, input: Input, options: ForwardOptions): Command;
export function forward(input: Input, options: ForwardOptions): Command;
export function forward(arg1: string | Input, arg2: Input | ForwardOptions, arg3?: ForwardOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as ForwardOptions;
    return new Command({
        id,
        module: "runtime",
        command: "forward",
        input,
        returns: "string",
        args: {
            pipeline_path: new Arg("path", options.pipeline_path),
        }
    });
}

