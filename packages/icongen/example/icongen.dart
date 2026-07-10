import 'dart:io';

import 'package:icongen/icongen.dart';

enum _Variant {
  outlined(
    fileName: "google_symbols_outlined",
    className: "GoogleSymbolsOutlined",
    fontFamily: "Google Symbols Outlined",
  ),
  rounded(
    fileName: "google_symbols_rounded",
    className: "GoogleSymbolsRounded",
    fontFamily: "Google Symbols Rounded",
  ),
  sharp(
    fileName: "google_symbols_sharp",
    className: "GoogleSymbolsSharp",
    fontFamily: "Google Symbols Sharp",
  );

  const _Variant({
    required this.fileName,
    required this.className,
    required this.fontFamily,
  });

  final String fileName;

  final String className;

  final String fontFamily;
}

void main() async {
  final packageRoot = Platform.script.resolve("../");
  final subsetResults = await generateFontSubsets<_Variant>(
    input: packageRoot.resolve("../../wip/Google_Symbols_ORIGINAL.ttf"),
    outputs: {
      .outlined: SubsetOutput(
        asset: packageRoot.resolve("assets/fonts/GoogleSymbolsOutlined.ttf"),
        axisConstraints: const [.fixed("ROND", at: 50.0)],
      ),
      .rounded: SubsetOutput(
        asset: packageRoot.resolve("assets/fonts/GoogleSymbolsRounded.ttf"),
        axisConstraints: const [.fixed("ROND", at: 100.0)],
      ),
      .sharp: SubsetOutput(
        asset: packageRoot.resolve("assets/fonts/GoogleSymbolsSharp.ttf"),
        axisConstraints: const [.fixed("ROND", at: 0.0)],
      ),
    },
  );

  for (final subsetResult in subsetResults.values) {
    final variant = subsetResult.outputId;
    await generateIconBindings(
      subsetResult,
      library: packageRoot.resolve("example/src/${variant.fileName}.dart"),
      className: variant.className,
      fontPackage: "icongen",
      fontFamily: variant.fontFamily,
    );
  }
}
