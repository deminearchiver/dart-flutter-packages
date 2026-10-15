import 'dart:io';

import 'package:ffigen/ffigen.dart';

Future<void> main() async {
  final packageRoot = Platform.script.resolve("../");
  final resourceDir = _clangResourceDir();

  final identifierRegExp = RegExp("^hb", caseSensitive: false);
  bool include(NamedNode node) => identifierRegExp.hasMatch(node.originalName);

  await FfiGenerator(
    input: .new(
      entryPoints: [
        packageRoot.resolve("third_party/harfbuzz/src/hb.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-subset.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-subset-serialize.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-depend.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-raster.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-vector.h"),
        packageRoot.resolve("third_party/harfbuzz/src/hb-gpu.h"),
      ],
      compilerOptions: [
        if (resourceDir != null) ...["-resource-dir", resourceDir],
        "-I${packageRoot.resolve("third_party/harfbuzz/src/").toFilePath()}",
        "-DHB_HAS_SUBSET=1",
        "-DHB_HAS_RASTER=1",
        "-DHB_HAS_VECTOR=1",
        "-DHB_HAS_GPU=1",
        "-DHB_EXPERIMENTAL_API=1",
      ],
      include: (header) => header.path.startsWith(
        packageRoot.resolve("third_party/harfbuzz/src/").path,
      ),
    ),
    output: .new(
      dart: .new(path: packageRoot.resolve("lib/src/bindings/bindings.g.dart")),
      recordUseMapping: packageRoot.resolve(
        "lib/src/bindings/record_use_mapping.g.dart",
      ),
      format: true,
      commentType: const .new(.any, .full),
    ),
    visitors: [
      .new(
        func: (node) => node
          ..isIncluded = include(node)
          ..recordUse = true,
        struct: (node) => node.isIncluded = include(node),
        union: (node) => node.isIncluded = include(node),
        enumClass: (node) => node.isIncluded = include(node),
        global: (node) => node.isIncluded = include(node),
        macroConstant: (node) => node.isIncluded = include(node),
        typealias: (node) => node.isIncluded = include(node) ? .always : .never,
        objCInterface: (node) => node.isIncluded = include(node),
        objCProtocol: (node) => node.isIncluded = include(node),
        objCCategory: (node) => node.isIncluded = include(node),
        cppClass: (node) => node.isIncluded = include(node),
        unnamedEnumConstant: (node) => node.isIncluded = include(node),
        objCMethod: (node) => node.isIncluded = include(node),
        cppMethod: (node) => node.isIncluded = include(node),
      ),
    ],
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
