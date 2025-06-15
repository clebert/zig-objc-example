const std = @import("std");
const builtin = @import("builtin");

const objc = @import("objc.zig");

pub fn main() !void {
    var debug_allocator: std.heap.DebugAllocator(.{}) = .init;

    // https://github.com/ziglang/zig/pull/22808
    const allocator, const is_debug = allocator: {
        if (builtin.os.tag == .wasi) break :allocator .{ std.heap.wasm_allocator, false };

        break :allocator switch (builtin.mode) {
            .Debug, .ReleaseSafe => .{ debug_allocator.allocator(), true },
            .ReleaseFast, .ReleaseSmall => .{ std.heap.smp_allocator, false },
        };
    };

    defer if (is_debug and debug_allocator.deinit() == .leak) unreachable;

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

    const vector = try allocator.alloc(f32, dimension);

    defer allocator.free(vector);

    if (!objc.sendMessage(sentence_embedding, "getVector:forString:", .{
        vector.ptr,
        input_string,
    }, bool)) return error.FailedToGetVector;

    std.debug.print("vector[0]: {d}\n", .{vector[0]});
    std.debug.print("vector[{d}]: {d}\n", .{ dimension - 1, vector[dimension - 1] });
}
