import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> arguments) async {
  await build(arguments, (input, output) async {
    final packageName = input.packageName;
    final cBuilder = CBuilder.library(
      name: packageName,
      assetName: "src/ffi_bindings.dart",
      sources: [
        "third_party/lz4/lib/lz4.c",
        "third_party/lz4/lib/lz4frame.c",
        "third_party/lz4/lib/lz4hc.c",
        "third_party/lz4/lib/xxhash.c",
      ],
      // Ensure symbols are exported in dll.
      defines: {
        // if (input.config.code.targetOS == .windows)
        "LZ4_DLL_EXPORT": null,
      },
      optimizationLevel: .o3,
    );
    await cBuilder.run(input: input, output: output);
  });
}
