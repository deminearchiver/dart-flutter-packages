import 'dart:io';

import 'package:icongen/icongen.dart';

mixin _IconFontId {
  String get library;

  String get className;

  String get fontFamily;

  String? get fontPackage;
}

enum _GoogleSymbolsId implements _IconFontId {
  googleSymbols(
    library: "example/src/google_symbols.dart",
    className: "GoogleSymbols",
    fontFamily: "Google Symbols",
  ),
  googleSymbolsOutlined(
    library: "example/src/google_symbols_outlined.dart",
    className: "GoogleSymbolsOutlined",
    fontFamily: "Google Symbols Outlined",
  ),
  googleSymbolsRounded(
    library: "example/src/google_symbols_rounded.dart",
    className: "GoogleSymbolsRounded",
    fontFamily: "Google Symbols Rounded",
  ),
  googleSymbolsSharp(
    library: "example/src/google_symbols_sharp.dart",
    className: "GoogleSymbolsSharp",
    fontFamily: "Google Symbols Sharp",
  );

  const _GoogleSymbolsId({
    required this.library,
    required this.className,
    required this.fontFamily,
  });

  @override
  final String library;

  @override
  final String className;

  @override
  final String fontFamily;

  @override
  String get fontPackage => "icongen";
}

void main() async {
  final packageRoot = Platform.script.resolve("../");
  final subsetResults = await generateFontSubsets<_GoogleSymbolsId>(
    input: packageRoot.resolve("../../wip/Google_Symbols_ORIGINAL.ttf"),
    outputs: {
      .googleSymbols: SubsetOutput(
        asset: packageRoot.resolve("example/fonts/GoogleSymbols.ttf"),
      ),
      .googleSymbolsOutlined: SubsetOutput(
        asset: packageRoot.resolve("example/fonts/GoogleSymbolsOutlined.ttf"),
        axisConstraints: const [.fixed("ROND", at: 50.0)],
      ),
      .googleSymbolsRounded: SubsetOutput(
        asset: packageRoot.resolve("example/fonts/GoogleSymbolsRounded.ttf"),
        axisConstraints: const [.fixed("ROND", at: 100.0)],
      ),
      .googleSymbolsSharp: SubsetOutput(
        asset: packageRoot.resolve("example/fonts/GoogleSymbolsSharp.ttf"),
        axisConstraints: const [.fixed("ROND", at: 0.0)],
      ),
    },
  );

  for (final subsetResult in subsetResults.values) {
    final id = subsetResult.outputId;
    await generateIconBindings(
      subsetResult,
      library: packageRoot.resolve(id.library),
      className: id.className,
      fontFamily: id.fontFamily,
      fontPackage: id.fontPackage,
    );
  }
}
