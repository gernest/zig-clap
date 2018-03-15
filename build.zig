
const builtin = @import("builtin");
const std     = @import("std");

const Builder = std.build.Builder;
const Step = std.build.Step;

pub fn build(b: &Builder) void {
    const run_all = b.step("run-all", "Run all benchmarks");
    addBenchmark(b, run_all, "bench-inline");
    addBenchmark(b, run_all, "bench-no-inline");
}

fn addBenchmark(b: &Builder, run_all_step: &Step, comptime name: []const u8) void {
    const file_name = name ++ ".zig";
    const debug_obj = b.addObject("debug-" ++ name, file_name);
    const safe_obj  = b.addObject("safe-"  ++ name, file_name);
    const fast_obj  = b.addObject("fast-"  ++ name, file_name);

    debug_obj.setBuildMode(builtin.Mode.Debug);
    safe_obj .setBuildMode(builtin.Mode.ReleaseSafe);
    fast_obj .setBuildMode(builtin.Mode.ReleaseFast);

    const debug_bench = b.addCExecutable("debug-" ++ name);
    const safe_bench  = b.addCExecutable("safe-"  ++ name);
    const fast_bench  = b.addCExecutable("fast-"  ++ name);

    debug_bench.addSourceFile("bench.cpp");
    safe_bench .addSourceFile("bench.cpp");
    fast_bench .addSourceFile("bench.cpp");

    debug_bench.addObject(debug_obj);
    safe_bench .addObject(safe_obj);
    fast_bench .addObject(fast_obj);

    const libs = [][]const u8 { "benchmark", "stdc++", "m", "pthread" };
    for (libs) |lib| {
        debug_bench.linkSystemLibrary(lib);
        safe_bench .linkSystemLibrary(lib);
        fast_bench .linkSystemLibrary(lib);
    }

    b.default_step.dependOn(&debug_bench.step);
    b.default_step.dependOn(&safe_bench.step);
    b.default_step.dependOn(&fast_bench.step);

    const run = b.step("run-" ++ name, "Run benchmark \"" ++ name ++ "\"");
    const run_debug_bench = b.addCommand(".", b.env_map, [][]const u8{ debug_bench.getOutputPath() });
    const run_safe_bench  = b.addCommand(".", b.env_map, [][]const u8{ safe_bench.getOutputPath() });
    const run_fast_bench  = b.addCommand(".", b.env_map, [][]const u8{ fast_bench.getOutputPath() });

    run.dependOn(&run_debug_bench.step);
    run.dependOn(&run_safe_bench.step);
    run.dependOn(&run_fast_bench.step);
    run_all_step.dependOn(run);
}
