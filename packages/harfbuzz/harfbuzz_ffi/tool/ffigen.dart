import 'dart:io';

import 'package:ffigen/ffigen.dart';

void main() {
  final packageRoot = Platform.script.resolve("../");

  final identifierRegExp = RegExp("^hb_", caseSensitive: false);

  bool include(Declaration declaration) =>
      identifierRegExp.hasMatch(declaration.originalName);

  final resourceDir = _clangResourceDir();

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
      compilerOptions: [
        "-DHB_HAS_SUBSET",
        "-DHB_EXPERIMENTAL_API",
        if (resourceDir != null) ...["-resource-dir", resourceDir],
      ],
    ),
    functions: .new(include: include),
    enums: .new(include: include),
    structs: .new(include: include),
    globals: .new(include: include),
    macros: .new(include: include),
    typedefs: .new(include: include),
    unions: .new(include: include),
  ).generate();
}

String? _clangResourceDir() {
  try {
    final result = Process.runSync("clang", const ["-print-resource-dir"]);
    return result.exitCode == 0 ? (result.stdout as String).trim() : null;
  } on ProcessException {
    return null;
  }
}
