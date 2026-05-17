import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> arguments) async {
  await build(arguments, (input, output) async {
    final packageName = input.packageName;
    final isWindows = input.config.code.targetOS == OS.windows;
    final cBuilder = CBuilder.library(
      name: packageName,
      assetName: "src/ffi_bindings.g.dart",
      sources: ["third_party/harfbuzz/src/harfbuzz-world.cc"],
      defines: {
        "HB_EXTERN": isWindows
            ? "__declspec(dllexport)"
            : "__attribute__((visibility(\"default\")))",
        "HB_HAS_SUBSET": null,
      },
      flags: [if (isWindows) "/bigobj" else "-bigobj"],
      optimizationLevel: .o2,
    );
    await cBuilder.run(input: input, output: output);
  });
}
