#include <benchmark/benchmark.h>
// All objs generated by zig should generate the same header. We therefor just use one
#include "debug-bench-inline.h"

// Zig outputs the wrong names to the generated headers, so we forward declare the functions instead:
struct ManyFields clap_inline_parse();
struct ManyFields clap_no_inline_parse();
struct ManyFields clap_inline_help();
struct ManyFields clap_no_inline_help();

static void BM_clap_inline_parse(benchmark::State& state) {
  for (auto _ : state) {
    benchmark::DoNotOptimize(clap_inline_parse());
  }
}
BENCHMARK(BM_clap_inline_parse);

static void BM_clap_no_inline_parse(benchmark::State& state) {
  for (auto _ : state) {
    benchmark::DoNotOptimize(clap_no_inline_parse());
  }
}
BENCHMARK(BM_clap_no_inline_parse);

static void BM_clap_inline_help(benchmark::State& state) {
  for (auto _ : state) {
      clap_inline_help();
  }
}
BENCHMARK(BM_clap_inline_help);

static void BM_clap_no_inline_help(benchmark::State& state) {
  for (auto _ : state) {
      clap_no_inline_help();
  }
}
BENCHMARK(BM_clap_no_inline_help);

BENCHMARK_MAIN();
