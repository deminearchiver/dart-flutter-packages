import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';
import 'package:record_use/record_use.dart' as record_use;

import '../bindings/record_use_mapping.g.dart';

import 'hashes.dart';
import 'prebuilt_library.dart';
import 'symbols_resolver.dart';

const _libraryName = "harfbuzz";

const _assetName = "src/bindings/bindings.g.dart";

final harfbuzzLibrary = PrebuiltLibrary(
  name: _libraryName,
  assetName: _assetName,
  releaseConfig: .github(
    owner: "deminearchiver",
    repo: "dart-flutter-packages",
    tagPrefix: "harfbuzz_ffi-v",
    version: version,
    fileHashes: fileHashes,
    libraryName: _libraryName,
    assetPrefix: "harfbuzz_ffi",
  ),
  buildFromSource: (input, output, {required static, checkoutPath}) async {
    final targetOS = input.config.code.targetOS;
    final isDarwin = targetOS == .iOS || targetOS == .macOS;
    final isPosix =
        targetOS == .android ||
        targetOS == .iOS ||
        targetOS == .linux ||
        targetOS == .iOS;
    final isWindows = targetOS == .windows;
    final builderOutput = BuildOutputBuilder();
    await CBuilder.library(
      name: _libraryName,
      assetName: _assetName,
      language: .cpp,
      std: "c++11",
      linkModePreference: static ? .static : .dynamic,
      sources: ["third_party/harfbuzz/src/harfbuzz-world.cc"],
      includes: ["third_party/harfbuzz/src/"],
      cppLinkStdLib: switch (targetOS) {
        .android => "c++_static",
        _ => null,
      },
      flags: [
        if (isWindows) ...[
          "/O2",
          "/bigobj",
          "/utf-8",
          "/EHs-c-",
          "/GR-",
          "/Zc:threadSafeInit-",
          "/Gy",
          "/Gw",
          "/wd4244",
          "/wd4267",
          if (!static) "/GL",
        ] else ...[
          "-O2",
          "-fno-exceptions",
          "-fno-rtti",
          "-fno-threadsafe-statics",
          "-fvisibility=hidden",
          "-fvisibility-inlines-hidden",
          if (!isDarwin) ...[
            "-ffunction-sections",
            "-fdata-sections",
            if (!static) "-Wl,--as-needed",
          ],
        ],
      ],
      defines: {
        "NDEBUG": "1",
        "HB_NDEBUG": "1",
        "HB_NO_MT": "1",
        "HB_NO_PRAGMA_GCC_DIAGNOSTIC_WARNING": "1",
        "HB_HAS_SUBSET": "1",
        "HB_HAS_RASTER": "1",
        "HB_HAS_VECTOR": "1",
        "HB_HAS_GPU": "1",
        "HB_EXPERIMENTAL_API": "1",
        if (isWindows) ...{
          "_CRT_SECURE_NO_WARNINGS": "1",
          "_CRT_NONSTDC_NO_WARNINGS": "1",
          "_HAS_EXCEPTIONS": "0",
          if (!static) "HB_DLL_EXPORT": "1",
        } else ...{
          "HB_EXTERN": "__attribute__((visibility(\"default\"))) extern",
        },
        if (isPosix) ...{
          "HAVE_ATEXIT": "1",
          "HAVE_MPROTECT": "1",
          "HAVE_SYSCONF": "1",
          "HAVE_GETPAGESIZE": "1",
          "HAVE_MMAP": "1",
          "HAVE_ISATTY": "1",
          "HAVE_UNISTD_H": "1",
          "HAVE_SYS_MMAN_H": "1",
          "HAVE_STDBOOL_H": "1",
        },
      },
      libraries: switch (targetOS) {
        .windows => const [],
        _ => const ["m"],
      },
      optimizationLevel: .o2,
    ).run(input: input, output: builderOutput);
    final built = BuildOutput(builderOutput.json);
    output.dependencies.addAll(built.dependencies);
    return built.assets.code.single.file!;
  },
  usedSymbols: SymbolsResolvers.fromRecordUseMapping(
    const record_use.Library(
      "package:harfbuzz_ffi/src/bindings/bindings.g.dart",
    ),
    recordUseMapping,
  ),
);
