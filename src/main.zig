const std = @import("std");
const builtin = @import("builtin");

const AutoreleasePool = @import("AutoreleasePool.zig");
const Embedding = @import("embedding.zig");
const Language = @import("language.zig").Language;
const objc = @import("objc.zig");
const String = @import("String.zig");

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

    var autorelease_pool = try AutoreleasePool.init();

    defer autorelease_pool.deinit();

    var input_string = try String.init("Hello, World!");

    defer input_string.deinit();

    std.debug.print("input: {s}\n", .{input_string.getUtf8String()});

    const language = try Language.recognize(input_string) orelse return error.UnrecognizedLanguage;

    std.debug.print("language: {}\n", .{language});

    var embedding = try Embedding.init(language);

    defer embedding.deinit();

    const vector = try embedding.getVector(allocator, input_string);

    defer allocator.free(vector);

    std.debug.print("vector[0]: {d}\n", .{vector[0]});
    std.debug.print("vector[{d}]: {d}\n", .{ vector.len - 1, vector[vector.len - 1] });
}
