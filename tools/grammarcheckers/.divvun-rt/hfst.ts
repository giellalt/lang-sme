import { Arg, Command, Input } from './mod.ts';

interface TokenizeOptions {
    model_path: string;
}

export function tokenize(id: string, input: Input, options: TokenizeOptions): Command;
export function tokenize(input: Input, options: TokenizeOptions): Command;
export function tokenize(arg1: string | Input, arg2: Input | TokenizeOptions, arg3?: TokenizeOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as TokenizeOptions;
    return new Command({
        id,
        module: "hfst",
        command: "tokenize",
        input,
        returns: "string",
        args: {
            model_path: new Arg("path", options.model_path),
        }
    });
}

