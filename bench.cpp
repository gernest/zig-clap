#include <benchmark/benchmark.h>
// All objs generated by zig should generate the same header. We therefor just use one
#include "debug-bench-inline.h"

static void BM_parse(benchmark::State& state) {
  for (auto _ : state) {
    benchmark::DoNotOptimize(parse());
  }
}
BENCHMARK(BM_parse);

static void BM_help(benchmark::State& state) {
  for (auto _ : state) {
      help();
  }
}
BENCHMARK(BM_help);

BENCHMARK_MAIN();
