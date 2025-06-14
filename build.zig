const std = @import("std");

pub fn build(b: *std.Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const exe = b.addExecutable(.{
        .name = "zoe",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.linkFramework("Foundation");
    exe.linkFramework("NaturalLanguage");
    exe.linkSystemLibrary("objc");

    b.installArtifact(exe);

    const run_exe = b.addRunArtifact(exe);

    if (b.args) |args| {
        run_exe.addArgs(args);
    }

    const run_step = b.step("run", "Run the application");

    run_step.dependOn(&run_exe.step);

    const check_step = b.step("check", "Check the application");

    check_step.dependOn(&exe.step);
}
