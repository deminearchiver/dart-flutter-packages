import 'package:harfbuzz_ffi/src/hook_helpers/library.dart';
import 'package:hooks/hooks.dart';

Future<void> main(List<String> arguments) async {
  await build(
    arguments,
    (input, output) => harfbuzzLibrary.build(input: input, output: output),
  );
}
