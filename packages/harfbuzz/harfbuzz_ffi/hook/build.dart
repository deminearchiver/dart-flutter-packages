import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:logging/logging.dart';
import 'package:native_toolchain_ninja/native_toolchain_ninja.dart';

void main(List<String> arguments) async {
  await build(arguments, (input, output) async {
    final packageName = input.packageName;
    final isWindows = input.config.code.targetOS == .windows;
    final ninjaBuilder = NinjaBuilder.library(
      name: packageName,
      assetName: "src/ffi_bindings.g.dart",
      sources: ["third_party/harfbuzz/src/harfbuzz-world.cc"],
      defines: {
        "HB_EXTERN": isWindows
            ? "__declspec(dllexport)"
            : "__attribute__((visibility(\"default\")))",
        "HB_HAS_SUBSET": null,
        "HB_NO_MT": "1",
        "HB_NO_PRAGMA_GCC_DIAGNOSTIC": "1",
        if (isWindows) "_HAS_EXCEPTIONS": "0",
      },
      flags: [
        if (isWindows) "/bigobj",
        if (isWindows) "/GR-" else ...["-fno-exceptions", "-fno-rtti"],
      ],
      optimizationLevel: .o2,
    );
    await ninjaBuilder.run(
      input: input,
      output: output,
      logger: Logger('')
        ..level = .WARNING
        // ignore: avoid_print
        ..onRecord.listen((r) => print(r.message)),
    );
  });
}
