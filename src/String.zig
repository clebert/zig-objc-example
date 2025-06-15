const objc = @import("objc.zig");

const Self = @This();

instance: objc.Id,

pub fn init(utf8_string: [*:0]const u8) !Self {
    const instance = objc.sendMessage(
        try objc.getClass("NSString"),
        "stringWithUTF8String:",
        .{utf8_string},
        objc.Id,
    );

    objc.sendMessage(instance, "retain", .{}, void);

    return .{ .instance = instance };
}

pub fn deinit(self: *Self) void {
    objc.sendMessage(self.instance, "release", .{}, void);

    self.* = undefined;
}

pub fn getUtf8String(self: Self) [*:0]const u8 {
    return objc.sendMessage(self.instance, "UTF8String", .{}, [*:0]const u8);
}
