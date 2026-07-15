import 'dart:io';
import 'dart:typed_data';

import 'package:icongen/icongen.dart';

mixin _IconFontId {
  String get asset;

  String get library;

  String get className;

  String get fontFamily;

  String? get fontPackage;
}

enum _GoogleSymbolsId implements _IconFontId {
  googleSymbols(
    asset: "lib/fonts/GoogleSymbols.ttf",
    library: "lib/src/google_symbols.dart",
    className: "GoogleSymbols",
    fontFamily: "Google Symbols",
  ),
  googleSymbolsOutlined(
    asset: "lib/fonts/GoogleSymbolsOutlined.ttf",
    library: "lib/src/google_symbols_outlined.dart",
    className: "GoogleSymbolsOutlined",
    fontFamily: "Google Symbols Outlined",
  ),
  googleSymbolsRounded(
    asset: "lib/fonts/GoogleSymbolsRounded.ttf",
    library: "lib/src/google_symbols_rounded.dart",
    className: "GoogleSymbolsRounded",
    fontFamily: "Google Symbols Rounded",
  ),
  googleSymbolsSharp(
    asset: "lib/fonts/GoogleSymbolsSharp.ttf",
    library: "lib/src/google_symbols_sharp.dart",
    className: "GoogleSymbolsSharp",
    fontFamily: "Google Symbols Sharp",
  );

  const _GoogleSymbolsId({
    required this.asset,
    required this.library,
    required this.className,
    required this.fontFamily,
  });

  @override
  final String asset;

  @override
  final String library;

  @override
  final String className;

  @override
  final String fontFamily;

  @override
  String get fontPackage => "google_symbols_icons";
}

void main() async {
  final packageRoot = Platform.script.resolve("../");

  Future<Uint8List> loadBytes(String path) {
    final resolvedPath = packageRoot.resolve(path).toFilePath();
    return File(resolvedPath).readAsBytes();
  }

  final subsetResults = buildSubsets<_GoogleSymbolsId>(
    bytes: await loadBytes(
      "third_party/googlesymbols/GoogleSymbols[FILL,GRAD,opsz,ROND,wght].ttf",
    ),
    entries: const {
      .googleSymbols: .new(),
      .googleSymbolsOutlined: .new(
        variableAxisConstraints: {.rond: .fixed(at: 50.0)},
      ),
      .googleSymbolsRounded: .new(
        variableAxisConstraints: {.rond: .fixed(at: 100.0)},
      ),
      .googleSymbolsSharp: .new(
        variableAxisConstraints: {.rond: .fixed(at: 0.0)},
      ),
    },
  );

  await writeSubsets(
    entries: subsetResults.values.map(
      (subsetResult) =>
          .new(subsetResult, path: packageRoot.resolve(subsetResult.id.asset)),
    ),
  );

  final bindingsResults = buildBindings(
    entries: {
      for (final MapEntry(key: id, value: SubsetResult subsetResult)
          in subsetResults.entries)
        id: .new(
          subsetResult,
          className: id.className,
          fontFamily: id.fontFamily,
          fontPackage: id.fontPackage,
        ),
    },
  );

  await writeBindings(
    entries: bindingsResults.values.map(
      (bindingsResult) => .new(
        bindingsResult,
        path: packageRoot.resolve(bindingsResult.id.library),
      ),
    ),
  );
}
