import { Arg, Command, Input } from './mod.ts';

export function reverse(id: string, input: Input): Command;
export function reverse(input: Input): Command;
export function reverse(arg1: string | Input, arg2?: Input): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2! : arg1 as Input;
    return new Command({
        id,
        module: "example",
        command: "reverse",
        input,
        returns: "string",
    });
}

export function upper(id: string, input: Input): Command;
export function upper(input: Input): Command;
export function upper(arg1: string | Input, arg2?: Input): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2! : arg1 as Input;
    return new Command({
        id,
        module: "example",
        command: "upper",
        input,
        returns: "string",
    });
}

