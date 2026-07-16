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

enum _LuminousSymbolsId implements _IconFontId {
  luminousSymbols(
    asset: "lib/fonts/LuminousSymbols.ttf",
    library: "lib/src/luminous_symbols.dart",
    className: "LuminousSymbols",
    fontFamily: "Luminous Symbols",
  );

  const _LuminousSymbolsId({
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
  String get fontPackage => "luminous_symbols_icons";
}

void main() async {
  final packageRoot = Platform.script.resolve("../");

  Future<Uint8List> loadBytes(String path) {
    final resolvedPath = packageRoot.resolve(path).toFilePath();
    return File(resolvedPath).readAsBytes();
  }

  final subsetResults = buildSubsets<_LuminousSymbolsId>(
    inputBytes: await loadBytes(
      "third_party/luminoussymbols/LuminousSymbols[opsz,wght].woff2",
    ),
    entries: const {
      .luminousSymbols: .new(forceSubset: true, subsetFormat: .ttf),
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
      for (final MapEntry(key: id, value: SubsetResult(:bytes))
          in subsetResults.entries)
        id: .new(
          inputBytes: bytes,
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
