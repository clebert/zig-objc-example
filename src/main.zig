const std = @import("std");

const objc = @import("objc.zig");

pub fn main() !void {
    const pool = objc.sendMessage(
        objc.sendMessage(try objc.getClass("NSAutoreleasePool"), "alloc", .{}, objc.Id),
        "init",
        .{},
        objc.Id,
    );

    defer objc.sendMessage(pool, "drain", .{}, void);

    const input = "Hello, World!";

    std.debug.print("input: {s}\n", .{input});

    const input_string = objc.sendMessage(
        try objc.getClass("NSString"),
        "stringWithUTF8String:",
        .{input},
        objc.Id,
    );

    const dominant_language_string = objc.sendMessage(
        try objc.getClass("NLLanguageRecognizer"),
        "dominantLanguageForString:",
        .{input_string},
        objc.Id,
    );

    const dominant_language = objc.sendMessage(
        dominant_language_string,
        "UTF8String",
        .{},
        [*:0]const u8,
    );

    std.debug.print("dominant_language: {s}\n", .{dominant_language});

    const sentence_embedding = objc.sendMessage(
        try objc.getClass("NLEmbedding"),
        "sentenceEmbeddingForLanguage:revision:",
        .{ dominant_language_string, @as(u64, 1) },
        ?objc.Id,
    ) orelse return error.EmbeddingNotFound;

    const dimension = objc.sendMessage(sentence_embedding, "dimension", .{}, u64);

    std.debug.print("dimension: {d}\n", .{dimension});

    const vector = objc.sendMessage(
        sentence_embedding,
        "vectorForString:",
        .{input_string},
        ?objc.Id,
    ) orelse return error.VectorNotFound;

    const vector_size = objc.sendMessage(vector, "count", .{}, u64);

    std.debug.print("vector_size: {d}\n", .{vector_size});
}
