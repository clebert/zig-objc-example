const std = @import("std");

const c = @cImport({
    @cInclude("objc/message.h");
});

pub const Id = c.id;

pub fn getClass(name: [*:0]const u8) !*c.struct_objc_class {
    return c.objc_getClass(name) orelse return error.ClassNotFound;
}

pub fn sendMessage(
    target: anytype,
    selector: [*:0]const u8,
    args: anytype,
    comptime ReturnType: type,
) ReturnType {
    const TargetType = @TypeOf(target);

    switch (@typeInfo(TargetType)) {
        .optional => @compileError("target cannot be optional"),
        else => {},
    }

    const RealReturnType = switch (@typeInfo(ReturnType)) {
        .optional => |optional| optional.child,
        else => ReturnType,
    };

    const msg_send_fn: *const MsgSendFn(TargetType, @TypeOf(args), RealReturnType) =
        @ptrCast(&c.objc_msgSend);

    const return_value = @call(
        .auto,
        msg_send_fn,
        .{ target, c.sel_registerName(selector) } ++ args,
    );

    return switch (@typeInfo(ReturnType)) {
        .optional => if (return_value == 0) null else return_value,
        else => return_value,
    };
}

fn MsgSendFn(
    comptime TargetType: type,
    comptime ArgsType: type,
    comptime ReturnType: type,
) type {
    const args_type_struct = @typeInfo(ArgsType).@"struct";

    if (!args_type_struct.is_tuple) {
        @compileError("arguments must be a tuple");
    }

    const params: []std.builtin.Type.Fn.Param = params: {
        var array: [args_type_struct.fields.len + 2]std.builtin.Type.Fn.Param = undefined;

        array[0] = .{ .is_generic = false, .is_noalias = false, .type = TargetType };
        array[1] = .{ .is_generic = false, .is_noalias = false, .type = c.SEL };

        for (args_type_struct.fields, 0..) |field, index| {
            switch (@typeInfo(field.type)) {
                .optional => @compileError("argument cannot be optional"),
                else => {},
            }

            array[index + 2] = .{ .is_generic = false, .is_noalias = false, .type = field.type };
        }

        break :params &array;
    };

    const @"fn" = std.builtin.Type.Fn{
        .calling_convention = .C,
        .is_generic = false,
        .is_var_args = false,
        .params = params,
        .return_type = ReturnType,
    };

    return @Type(.{ .@"fn" = @"fn" });
}
