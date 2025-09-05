import { Arg, Command, Input } from './mod.ts';

export function strip(id: string, input: Input): Command;
export function strip(input: Input): Command;
export function strip(arg1: string | Input, arg2?: Input): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2! : arg1 as Input;
    return new Command({
        id,
        module: "ssml",
        command: "strip",
        input,
        returns: "string",
    });
}

