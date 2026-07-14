// ignore_for_file: avoid_print

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
    asset: "example/fonts/GoogleSymbols.ttf",
    library: "example/src/google_symbols.dart",
    className: "GoogleSymbols",
    fontFamily: "Google Symbols",
  ),
  googleSymbolsOutlined(
    asset: "example/fonts/GoogleSymbolsOutlined.ttf",
    library: "example/src/google_symbols_outlined.dart",
    className: "GoogleSymbolsOutlined",
    fontFamily: "Google Symbols Outlined",
  ),
  googleSymbolsRounded(
    asset: "example/fonts/GoogleSymbolsRounded.ttf",
    library: "example/src/google_symbols_rounded.dart",
    className: "GoogleSymbolsRounded",
    fontFamily: "Google Symbols Rounded",
  ),
  googleSymbolsSharp(
    asset: "example/fonts/GoogleSymbolsSharp.ttf",
    library: "example/src/google_symbols_sharp.dart",
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

enum _LuminousSymbolsId implements _IconFontId {
  luminousSymbols(
    asset: "example/fonts/LuminousSymbols.woff2",
    library: "example/src/luminous_symbols.dart",
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

  print("\nLoading input files...");

  Future<Uint8List> loadBytes(String path) {
    final resolvedPath = packageRoot.resolve(path).toFilePath();
    return File(resolvedPath).readAsBytes();
  }

  print("\nSubsetting fonts...");

  // Returned value is the pure interface, not specific enum.
  final SubsetIdToResultMap<_IconFontId> subsetResults = {
    // Upcast to _GoogleSymbolsId so we can use dot shorthands.
    ...buildSubsets<_GoogleSymbolsId>(
      bytes: await loadBytes("../../wip/Google_Symbols_ORIGINAL.ttf"),
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
    ),
    // Upcast to _LuminousSymbolsId so we can use dot shorthands.
    ...buildSubsets<_LuminousSymbolsId>(
      bytes: await loadBytes("../../wip/LuminousSymbols.woff2"),
      entries: const {
        .luminousSymbols: .new(
          variableAxisConstraints: {.wght: .fixed(at: 200.0)},
        ),
      },
    ),
  };

  print("Writing font subsets...");

  await writeSubsets(
    entries: subsetResults.values.map(
      (subsetResult) =>
          .new(subsetResult, path: packageRoot.resolve(subsetResult.id.asset)),
    ),
  );

  print("\nGenerating icon bindings...");

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

  print("Writing generated code...");

  await writeBindings(
    entries: bindingsResults.values.map(
      (bindingsResult) => .new(
        bindingsResult,
        path: packageRoot.resolve(bindingsResult.id.library),
      ),
    ),
  );

  print("\nDone!");
}
