import 'dart:io';

import 'package:icongen/icongen.dart';
import 'package:icongen_tools/pipeline.dart';

final _packageRoot = Platform.script.resolve("../");

enum _LuminousSymbolsEntry implements PipelineEntry {
  luminousSymbols(
    assetPaths: {
      .ttf: "lib/fonts/LuminousSymbols.ttf",
      .woff2: "lib/fonts/LuminousSymbols.woff2",
    },
    libraryPath: "lib/src/luminous_symbols.dart",
    className: "LuminousSymbols",
    fontFamily: "Luminous Symbols",
  );

  const _LuminousSymbolsEntry({
    this.variableAxisConstraints = const {},
    required this.assetPaths,
    required this.libraryPath,
    required this.className,
    required this.fontFamily,
  });

  String get inputPath =>
      "third_party/fonts/luminoussymbols/LuminousSymbols[opsz,wght].woff2";

  @override
  Uri get input => _packageRoot.resolve(inputPath);

  @override
  final VariableAxisConstraints variableAxisConstraints;

  final Map<SubsetFormat, String> assetPaths;

  @override
  Map<SubsetFormat, Uri> get assets => {
    for (final MapEntry(key: subsetFormat, value: path) in assetPaths.entries)
      subsetFormat: _packageRoot.resolve(path),
  };

  final String libraryPath;

  @override
  Uri get library => _packageRoot.resolve(libraryPath);

  @override
  final String className;

  @override
  final String fontFamily;

  @override
  String? get fontPackage => "luminous_symbols_icons";
}

void main() async {
  await Pipeline().run(entries: _LuminousSymbolsEntry.values);
}
