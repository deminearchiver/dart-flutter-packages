import 'dart:io';

import 'package:icongen/icongen.dart';
import 'package:icongen_tools/pipeline.dart';

final _packageRoot = Platform.script.resolve("../");

enum _GoogleSymbolsEntry implements PipelineEntry {
  googleSymbols(
    assetPaths: {
      // WOFF2 asset path is not specified here, because this specific use case
      // produces a corrupted WOFF2 file.
      //
      // Here's what I've tried:
      // - Messing around with package:icongen conversion code:
      //   - results in the same corrupted file.
      // - Explicitly forcing subsetting by pinning ROND to 0..50..100 range:
      //   - results in the same corrupted file.
      // - Writing a C++ MRE (TTF -> HARFBUZZ -> WOFF2):
      //   - results in the same corrupted file.
      // - Converting original TTF to WOFF2 with FontTools:
      //   - results in the same corrupted file.
      // - Creating a FontTools TTX dump:
      //   - created successfully, without errors.
      // - Manually validating with FontTools:
      //   - no problems found.
      // - Sanitizing with ots-sanitize:
      //   - original TTF -> File sanitized successfully!
      //   - resulting WOFF2 -> ERROR: failed to convert WOFF 2.0 font to SFNT.
      //
      // I've identified the following potential causes:
      // - Actual problem with the original font (unlikely).
      // - Uncompressed SFNT footprint exceeds 30 MB (limit for web fonts).
      //
      // After all this, the priority of this issue has been lowered.
      // It will not be worked on in the near future.
      .ttf: "lib/fonts/GoogleSymbols.ttf",
    },
    libraryPath: "lib/src/google_symbols.dart",
    className: "GoogleSymbols",
    fontFamily: "Google Symbols",
  ),
  googleSymbolsOutlined(
    variableAxisConstraints: {.rond: .fixed(at: 50.0)},
    assetPaths: {
      .ttf: "lib/fonts/GoogleSymbolsOutlined.ttf",
      .woff2: "lib/fonts/GoogleSymbolsOutlined.woff2",
    },
    libraryPath: "lib/src/google_symbols_outlined.dart",
    className: "GoogleSymbolsOutlined",
    fontFamily: "Google Symbols Outlined",
  ),
  googleSymbolsRounded(
    variableAxisConstraints: {.rond: .fixed(at: 100.0)},
    assetPaths: {
      .ttf: "lib/fonts/GoogleSymbolsRounded.ttf",
      .woff2: "lib/fonts/GoogleSymbolsRounded.woff2",
    },
    libraryPath: "lib/src/google_symbols_rounded.dart",
    className: "GoogleSymbolsRounded",
    fontFamily: "Google Symbols Rounded",
  ),
  googleSymbolsSharp(
    variableAxisConstraints: {.rond: .fixed(at: 0.0)},
    assetPaths: {
      .ttf: "lib/fonts/GoogleSymbolsSharp.ttf",
      .woff2: "lib/fonts/GoogleSymbolsSharp.woff2",
    },
    libraryPath: "lib/src/google_symbols_sharp.dart",
    className: "GoogleSymbolsSharp",
    fontFamily: "Google Symbols Sharp",
  );

  const _GoogleSymbolsEntry({
    this.variableAxisConstraints = const {},
    required this.assetPaths,
    required this.libraryPath,
    required this.className,
    required this.fontFamily,
  });

  String get inputPath =>
      "third_party/fonts/googlesymbols/GoogleSymbols[FILL,GRAD,opsz,ROND,wght].ttf";

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
  String? get fontPackage => "google_symbols_icons";
}

void main() async {
  await Pipeline().run(entries: _GoogleSymbolsEntry.values);
}
