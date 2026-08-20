import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:logging/logging.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> arguments) async {
  await build(arguments, (input, output) async {
    if (!input.config.buildCodeAssets) return;

    final packageName = input.packageName;
    final targetOS = input.config.code.targetOS;

    final cBuilder = CBuilder.library(
      name: packageName,
      assetName: "src/ffi_bindings.g.dart",
      sources: ["third_party/harfbuzz/src/harfbuzz-world.cc"],
      language: .cpp,
      std: "c++17",
      optimizationLevel: .o2,
      flags: switch (targetOS) {
        .windows => const [
          // MSVC / clang-cl: no exceptions or RTTI (matches HB_NO_* build).
          "/EHs-",
          "/GR-",
          "/bigobj",
        ],
        .linux => const [
          "-fno-exceptions",
          "-fno-rtti",
          // Embed libstdc++/libgcc so the .so does not depend on the host's
          // shared C++ runtime (AppImage / older distros).
          "-static-libstdc++",
          "-static-libgcc",
        ],
        _ => const ["-fno-exceptions", "-fno-rtti"],
      },
      libraries: switch (targetOS) {
        .windows => const [],
        _ => const ["m"],
      },
      defines: {
        "HB_EXTERN": targetOS == .windows
            ? "__declspec(dllexport)"
            : "__attribute__((visibility(\"default\")))",
        "HB_HAS_SUBSET": "",
        "HB_EXPERIMENTAL_API": "",
        "HB_NO_MT": "1",
        "HB_NO_PRAGMA_GCC_DIAGNOSTIC": "1",
        if (targetOS == .windows) "_HAS_EXCEPTIONS": "0",
      },
      cppLinkStdLib: switch (targetOS) {
        .android => "c++_static",
        .iOS || .macOS || .fuchsia => "c++",
        .linux => "stdc++",
        .windows => null,
        _ => null,
      },
    );
    final logger = Logger("")
      ..level = .WARNING
      // ignore: avoid_print
      ..onRecord.listen((r) => print(r.message));
    await cBuilder.run(input: input, output: output, logger: logger);
  });
}
