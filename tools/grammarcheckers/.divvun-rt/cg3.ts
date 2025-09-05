import { Arg, Command, Input } from './mod.ts';

interface StreamcmdOptions {
    key: string;
}

export function streamcmd(id: string, input: Input, options: StreamcmdOptions): Command;
export function streamcmd(input: Input, options: StreamcmdOptions): Command;
export function streamcmd(arg1: string | Input, arg2: Input | StreamcmdOptions, arg3?: StreamcmdOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as StreamcmdOptions;
    return new Command({
        id,
        module: "cg3",
        command: "streamcmd",
        input,
        returns: "string",
        args: {
            key: new Arg("string", options.key),
        }
    });
}

export function mwesplit(id: string, input: Input): Command;
export function mwesplit(input: Input): Command;
export function mwesplit(arg1: string | Input, arg2?: Input): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2! : arg1 as Input;
    return new Command({
        id,
        module: "cg3",
        command: "mwesplit",
        input,
        returns: "string",
    });
}

export function to_json(id: string, input: Input): Command;
export function to_json(input: Input): Command;
export function to_json(arg1: string | Input, arg2?: Input): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2! : arg1 as Input;
    return new Command({
        id,
        module: "cg3",
        command: "to_json",
        input,
        returns: "json",
    });
}

interface Vislcg3Options {
    model_path: string;
}

export function vislcg3(id: string, input: Input, options: Vislcg3Options): Command;
export function vislcg3(input: Input, options: Vislcg3Options): Command;
export function vislcg3(arg1: string | Input, arg2: Input | Vislcg3Options, arg3?: Vislcg3Options): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as Vislcg3Options;
    return new Command({
        id,
        module: "cg3",
        command: "vislcg3",
        input,
        returns: "string",
        args: {
            model_path: new Arg("path", options.model_path),
        }
    });
}

interface SentencesOptions {
    mode: string;
}

export function sentences(id: string, input: Input, options: SentencesOptions): Command;
export function sentences(input: Input, options: SentencesOptions): Command;
export function sentences(arg1: string | Input, arg2: Input | SentencesOptions, arg3?: SentencesOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as SentencesOptions;
    return new Command({
        id,
        module: "cg3",
        command: "sentences",
        input,
        returns: "[string]",
        args: {
            mode: new Arg("string", options.mode),
        }
    });
}

