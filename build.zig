const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const lib = b.addStaticLibrary("sqlite3", null);
    lib.addCSourceFile("sqlite3.c", &.{
        "-std=c99",
    });
    lib.addIncludePath(".");
    lib.setBuildMode(mode);
    lib.linkLibC();
    lib.install();
    lib.installHeader("sqlite3.h", "sqlite3.h");
    lib.installHeader("sqlite3ext.h", "sqlite3ext.h");
}
