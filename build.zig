
const builtin = @import("builtin");
const std     = @import("std");

const fmt = std.fmt;

const Builder = std.build.Builder;
const Step = std.build.Step;

pub fn build(b: &Builder) void {
    const benchmarks = [][]const u8 {
        "bench-parse-inline",
        "bench-parse-no-inline",
        "bench-help-inline",
        "bench-help-no-inline",
    };

    const debug_bench = b.addCExecutable("debug-bench");
    const safe_bench  = b.addCExecutable("safe-bench");
    const fast_bench  = b.addCExecutable("fast-bench");
    debug_bench.addSourceFile("cpp-src/bench.cpp");
    safe_bench .addSourceFile("cpp-src/bench.cpp");
    fast_bench .addSourceFile("cpp-src/bench.cpp");

    const libs = [][]const u8 { "benchmark", "stdc++", "m", "pthread" };
    for (libs) |lib| {
        debug_bench.linkSystemLibrary(lib);
        safe_bench .linkSystemLibrary(lib);
        fast_bench .linkSystemLibrary(lib);
    }

    inline for (benchmarks) |bench| {
        const path = fmt.allocPrint(b.allocator, "zig-src/{}.zig", bench) catch unreachable;
        const debug_obj = b.addObject(fmt.allocPrint(b.allocator, "debug-{}", bench) catch unreachable, path);
        const safe_obj  = b.addObject(fmt.allocPrint(b.allocator, "safe-{}", bench) catch unreachable, path);
        const fast_obj  = b.addObject(fmt.allocPrint(b.allocator, "fast-{}", bench) catch unreachable, path);

        debug_obj.setBuildMode(builtin.Mode.Debug);
        safe_obj .setBuildMode(builtin.Mode.ReleaseSafe);
        fast_obj .setBuildMode(builtin.Mode.ReleaseFast);

        debug_bench.addObject(debug_obj);
        safe_bench .addObject(safe_obj);
        fast_bench .addObject(fast_obj);
    }

    b.default_step.dependOn(&debug_bench.step);
    b.default_step.dependOn(&safe_bench.step);
    b.default_step.dependOn(&fast_bench.step);

    const run_debug = b.step("run-debug", "Run debug benchmark.");
    const run_debug_bench = b.addCommand(".", b.env_map, [][]const u8{ debug_bench.getOutputPath() });
    run_debug.dependOn(&run_debug_bench.step);

    const run_safe = b.step("run-safe", "Run safe benchmark.");
    const run_safe_bench = b.addCommand(".", b.env_map, [][]const u8{ safe_bench.getOutputPath() });
    run_safe.dependOn(&run_safe_bench.step);

    const run_fast = b.step("run-fast", "Run fast benchmark.");
    const run_fast_bench = b.addCommand(".", b.env_map, [][]const u8{ fast_bench.getOutputPath() });
    run_fast.dependOn(&run_fast_bench.step);

    const run_all = b.step("run-all", "Run all benchmarks");
    run_all.dependOn(run_debug);
    run_all.dependOn(run_safe);
    run_all.dependOn(run_fast);
}
