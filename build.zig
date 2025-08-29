const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const module = b.addModule("zlm", .{
        .root_source_file = b.path("src/zlm.zig"),
        .target = target,
        .optimize = optimize,
    });

    const test_exe = b.addTest(.{
        .root_module = module,
    });

    const test_run = b.addRunArtifact(test_exe);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&test_run.step);
    b.getInstallStep().dependOn(&test_run.step);
}
