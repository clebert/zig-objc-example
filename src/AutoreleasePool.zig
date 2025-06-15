const objc = @import("objc.zig");

const Self = @This();

instance: objc.Id,

pub fn init() !Self {
    const instance = objc.sendMessage(
        objc.sendMessage(try objc.getClass("NSAutoreleasePool"), "alloc", .{}, objc.Id),
        "init",
        .{},
        objc.Id,
    );

    return .{ .instance = instance };
}

pub fn deinit(self: *Self) void {
    objc.sendMessage(self.instance, "drain", .{}, void);

    self.* = undefined;
}
