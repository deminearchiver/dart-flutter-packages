import 'dart:io';

import 'package:ffigen/ffigen.dart';

void main() {
  final packageRoot = Platform.script.resolve("../");

  final identifierRegExp = RegExp("^woff2_", caseSensitive: false);

  bool include(Declaration declaration) =>
      identifierRegExp.hasMatch(declaration.originalName);

  FfiGenerator(
    output: .new(
      dartFile: packageRoot.resolve("lib/src/ffi_bindings.g.dart"),
      format: true,
      commentType: const .new(.any, .full),
    ),
    headers: .new(
      entryPoints: [
        // WOFF2 C API
        packageRoot.resolve("src/woff2_c_api.h"),
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
