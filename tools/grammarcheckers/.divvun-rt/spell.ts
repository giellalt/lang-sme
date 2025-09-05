import { Arg, Command, Input } from './mod.ts';

interface SuggestOptions {
    lexicon_path: string;
    mutator_path: string;
}

export function suggest(id: string, input: Input, options: SuggestOptions): Command;
export function suggest(input: Input, options: SuggestOptions): Command;
export function suggest(arg1: string | Input, arg2: Input | SuggestOptions, arg3?: SuggestOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as SuggestOptions;
    return new Command({
        id,
        module: "spell",
        command: "suggest",
        input,
        returns: "json",
        args: {
            lexicon_path: new Arg("path", options.lexicon_path),
            mutator_path: new Arg("path", options.mutator_path),
        }
    });
}

