const std = @import("std");

const Language = @import("language.zig").Language;
const objc = @import("objc.zig");
const String = @import("String.zig");

const Self = @This();

instance: objc.Id,

pub fn init(language: Language) !?Self {
    const instance = objc.sendMessage(
        try objc.getClass("NLEmbedding"),
        "sentenceEmbeddingForLanguage:revision:",
        .{ language.getInstance(), @as(u64, 1) },
        ?objc.Id,
    ) orelse return null;

    objc.sendMessage(instance, "retain", .{}, void);

    return .{ .instance = instance };
}

pub fn deinit(self: *Self) void {
    objc.sendMessage(self.instance, "release", .{}, void);

    self.* = undefined;
}

pub fn getVector(self: Self, allocator: std.mem.Allocator, input_string: String) ![]f32 {
    const vector = try allocator.alloc(f32, objc.sendMessage(self.instance, "dimension", .{}, u64));

    errdefer allocator.free(vector);

    if (!objc.sendMessage(self.instance, "getVector:forString:", .{
        vector.ptr,
        input_string.instance,
    }, bool)) return error.FailedToCopyVector;

    return vector;
}
