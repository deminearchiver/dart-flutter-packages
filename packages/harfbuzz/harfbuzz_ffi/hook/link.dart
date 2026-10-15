import 'package:harfbuzz_ffi/src/hook_helpers/library.dart';
import 'package:hooks/hooks.dart';

Future<void> main(List<String> arguments) async {
  await link(
    arguments,
    (input, output) => harfbuzzLibrary.link(input: input, output: output),
  );
}
