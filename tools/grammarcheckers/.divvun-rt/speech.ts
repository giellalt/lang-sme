import { Arg, Command, Input } from './mod.ts';

interface TtsOptions {
    voice_model: string;
    univnet_model: string;
    speaker: number;
    language: number;
    alphabet: string;
}

export function tts(id: string, input: Input, options: TtsOptions): Command;
export function tts(input: Input, options: TtsOptions): Command;
export function tts(arg1: string | Input, arg2: Input | TtsOptions, arg3?: TtsOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as TtsOptions;
    return new Command({
        id,
        module: "speech",
        command: "tts",
        input,
        returns: "bytes",
        args: {
            voice_model: new Arg("path", options.voice_model),
            univnet_model: new Arg("path", options.univnet_model),
            speaker: new Arg("int", options.speaker),
            language: new Arg("int", options.language),
            alphabet: new Arg("string", options.alphabet),
        }
    });
}

interface NormalizeOptions {
    normalizers: Record<string, string>;
    generator: string;
    analyzer: string;
}

export function normalize(id: string, input: Input, options: NormalizeOptions): Command;
export function normalize(input: Input, options: NormalizeOptions): Command;
export function normalize(arg1: string | Input, arg2: Input | NormalizeOptions, arg3?: NormalizeOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as NormalizeOptions;
    return new Command({
        id,
        module: "speech",
        command: "normalize",
        input,
        returns: "string | [string]",
        args: {
            normalizers: new Arg("{path}", options.normalizers),
            generator: new Arg("path", options.generator),
            analyzer: new Arg("path", options.analyzer),
        }
    });
}

interface PhonOptions {
    model: string;
    tag_models: Record<string, string>;
}

export function phon(id: string, input: Input, options: PhonOptions): Command;
export function phon(input: Input, options: PhonOptions): Command;
export function phon(arg1: string | Input, arg2: Input | PhonOptions, arg3?: PhonOptions): Command {
    const hasId = typeof arg1 === 'string';
    const id = hasId ? arg1 : undefined;
    const input = hasId ? arg2 as Input : arg1 as Input;
    const options = hasId ? arg3! : arg2 as PhonOptions;
    return new Command({
        id,
        module: "speech",
        command: "phon",
        input,
        returns: "string",
        args: {
            model: new Arg("path", options.model),
            tag_models: new Arg("{path}", options.tag_models),
        }
    });
}

