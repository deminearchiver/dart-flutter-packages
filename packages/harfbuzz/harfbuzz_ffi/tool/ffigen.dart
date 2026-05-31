import 'dart:io';

import 'package:ffigen/ffigen.dart';

void main() {
  final packageRoot = Platform.script.resolve("../");
  FfiGenerator(
    output: Output(
      dartFile: packageRoot.resolve("lib/src/ffi_bindings.g.dart"),
      format: true,
      commentType: const .new(.any, .full),
    ),
    headers: Headers(
      entryPoints: [
        packageRoot.resolve("third_party/harfbuzz/src/hb.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-subset.h"),
      ],
      // compilerOptions: ["-DHB_HAS_SUBSET"],
    ),
    functions: .new(
      include: (declaration) => declaration.originalName.startsWith("hb_"),
    ),
    enums: .new(
      include: (declaration) => declaration.originalName.startsWith("hb_"),
    ),
  ).generate();
}
