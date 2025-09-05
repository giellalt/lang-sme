import { Arg, Command, Input } from './mod.ts';

interface BlanktagOptions {
    model_path: string;
}

export function blanktag(id: string, input: Input, options: BlanktagOptions): Command;
export function blanktag(input: Input, options: BlanktagOptions): Command;
export function blanktag(arg1: string | Input, arg2: Input | BlanktagOptions, arg3?: BlanktagOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as BlanktagOptions;
    return new Command({
        id,
        module: "divvun",
        command: "blanktag",
        input,
        returns: "string",
        args: {
            model_path: new Arg("path", options.model_path),
        }
    });
}

interface CgspellOptions {
    err_model_path: string;
    acc_model_path: string;
}

export function cgspell(id: string, input: Input, options: CgspellOptions): Command;
export function cgspell(input: Input, options: CgspellOptions): Command;
export function cgspell(arg1: string | Input, arg2: Input | CgspellOptions, arg3?: CgspellOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as CgspellOptions;
    return new Command({
        id,
        module: "divvun",
        command: "cgspell",
        input,
        returns: "string",
        args: {
            err_model_path: new Arg("path", options.err_model_path),
            acc_model_path: new Arg("path", options.acc_model_path),
        }
    });
}

interface SuggestOptions {
    model_path: string;
    error_xml_path: string;
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
        module: "divvun",
        command: "suggest",
        input,
        returns: "json",
        args: {
            model_path: new Arg("path", options.model_path),
            error_xml_path: new Arg("path", options.error_xml_path),
        }
    });
}

