// ignore_for_file: avoid_print

import 'dart:io';

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

void main() async {
  final packageRoot = Platform.script.resolve("../");

  print("\nLoading input files...");

  final inputPath = packageRoot
      .resolve("../../wip/Google_Symbols_ORIGINAL.ttf")
      .toFilePath();

  final inputBytes = await File(inputPath).readAsBytes();

  print("\nSubsetting fonts...");

  // Returned value is the pure interface, not specific enum.
  final subsetResults = buildSubsets<_IconFontId>(
    bytes: inputBytes,
    // Upcast to enum so we can use dot shorthands on keys.
    entries: const <_GoogleSymbolsId, SubsetEntry>{
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
          subsetResult: subsetResult,
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
