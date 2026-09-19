import 'package:code_assets/code_assets.dart';
import 'package:harfbuzz_ffi/src/c_library.dart';
import 'package:harfbuzz_ffi/src/record_use_mapping.dart';
import 'package:hooks/hooks.dart';
import 'package:record_use/record_use.dart';

Future<void> main(List<String> arguments) async {
  await link(arguments, (input, output) async {
    if (!input.config.buildCodeAssets) return;
    await createCLibrary(
      packageName: input.packageName,
      targetOS: input.config.code.targetOS,
    ).link(
      input: input,
      output: output,
      linkerOptions: .treeshake(
        symbolsToKeep: input.recordedUses?.calls.keys.cast<Method>().map(
          (e) => recordUseMapping[e.name]!,
        ),
      ),
      logger: .new("")
        ..level = .WARNING
        // ignore: avoid_print
        ..onRecord.listen((record) => print(record.message)),
    );
  });
}
