const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "sqlite3",
        .target = target,
        .optimize = optimize,
    });
    lib.addCSourceFile("sqlite3.c", &.{
        "-std=c99",
    });
    lib.addIncludePath(".");
    lib.linkLibC();
    lib.installHeader("sqlite3.h", "sqlite3.h");
    lib.installHeader("sqlite3ext.h", "sqlite3ext.h");

    b.installArtifact(lib);
}
