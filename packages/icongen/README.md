# Icongen

Subsets icon fonts and generates Flutter bindings for them.

This utility utilizes HarfBuzz to strip unused glyph data from TrueType/OpenType font files and generates corresponding Dart source files containing static `IconData` definitions for Flutter applications.

## Features

* Subsets font files via HarfBuzz integration.

* Pins variable font axes or constrains them to designated value ranges.

* Parses glyph names out of font metadata to yield meaningful identifiers.

* Generates Dart classes containing static `IconData` constants for use in Flutter widgets.

* Sanitizes glyph names into valid Dart identifiers and resolves naming conflicts or duplicates.

* Ensures unused glyphs are removed by the Flutter tool during release builds.

## Getting Started

1. Add the bindings generator `package:icongen` as a `dev_dependency` to the pubspec of your app (or package).

   ```console
   dart pub add dev:icongen
   ```

2. Place your raw icon font file inside an internal development folder, e.g. `third_party/fonts/myicons/MyIcons-VariableFont.ttf`.

3. To generate the bindings, we will write a script using `package:icongen` and place it under `tool/icongen.dart`. The script describes the base font path, specifies targeted configuration subsets, pins specific axis coordinates, and initiates compilation.

   > Avoid using `.g.dart` suffixes for generated files. Many Dart lints packages are configured to automatically skip analyzing such files. `.g.dart` should be reserved for library parts, not for independent generated libraries.

   ```dart
   import 'dart:io';

   import 'package:icongen/icongen.dart';

   enum _MyIconsId {
     myIcons(
       asset: "assets/fonts/MyIcons.ttf",
       library: "lib/src/icons/my_icons.dart",
       className: "MyIcons",
       fontFamily: "My Icons",
     ),
     myIconsRounded(
       asset: "assets/fonts/MyIconsRounded.ttf",
       library: "lib/src/icons/my_icons_rounded.dart",
       className: "MyIconsRounded",
       fontFamily: "My Icons Rounded",
     ),
     myIconsSharp(
       asset: "assets/fonts/MyIconsSharp.ttf",
       library: "lib/src/icons/my_icons_sharp.dart",
       className: "MyIconsSharp",
       fontFamily: "My Icons Sharp",
     );

     const _MyIconsId({
       required this.asset,
       required this.library,
       required this.className,
       required this.fontFamily,
     });

     final String asset;

     final String library;

     final String className;

     final String fontFamily;

     String? get fontPackage => null;
   }

   void main() async {
     final packageRoot = Platform.script.resolve("../");

     // Load the input font bytes.
     final inputPath = packageRoot
         .resolve("third_party/fonts/MyIcons-VariableFont.ttf")
         .toFilePath();
     final inputBytes = await File(inputPath).readAsBytes();

     // Subset the input font.
     final subsetResults = buildSubsets<_MyIconsId>(
       bytes: inputBytes,
       entries: const <_MyIconsId, SubsetEntry>{
         .myIcons: .new(),
         .myIconsRounded: .new(
           variableAxisConstraints: {.rond: .fixed(at: 100.0)},
         ),
         .myIconsSharp: .new(variableAxisConstraints: {.rond: .fixed(at: 0.0)}),
       },
     );

     // Write font subsets to their respective files.
     await writeSubsets(
       entries: subsetResults.values.map(
         (subsetResult) =>
             .new(subsetResult, path: packageRoot.resolve(subsetResult.id.asset)),
       ),
     );

     // Generate bindings code.
     final bindingsResults = buildBindings(
       entries: {
         for (final MapEntry(key: id, value: subsetResult)
             in subsetResults.entries)
           id: .new(
             subsetResult,
             className: id.className,
             fontFamily: id.fontFamily,
             fontPackage: id.fontPackage,
           ),
       },
     );

     // Write bindings to their respective files.
     await writeBindings(
       entries: bindingsResults.values.map(
         (bindingsResult) => .new(
           bindingsResult,
           path: packageRoot.resolve(bindingsResult.id.library),
         ),
       ),
     );
   }
   ```

4. Run the script to generate the bindings. This will build the corresponding standalone font binaries, map valid Unicode addresses to names, and overwrite the generated targetsm, and create the output `lib/src/*.dart`. This command must be re-run whenever the Icongen configuration (in `tool/icongen.dart`) or the font binaries for which bindings are generated change.

   ```console
   dart run tool/icongen.dart
   ```

5. Import `my_icons.dart`, `my_icons_rounded.dart` or `my_icons_sharp.dart` in your Flutter app and reference the generated icon definitions to render icons directly via Flutter framework widgets:

   ```dart
   import 'package:flutter/widgets.dart';

   import 'src/icons/my_icons.dart';

   Widget build(BuildContext context) {
     return const Icon(MyIcons.home);
   }
   ```

6. Before we can run the app, we need to add the generated font subsets to the package's assets in `pubspec.yaml`.

   ```yaml
   flutter:
     fonts:
       - family: My Icons
         fonts:
           - asset: assets/fonts/MyIcons.ttf
       - family: My Icons Rounded
         fonts:
           - asset: assets/fonts/MyIconsRounded.ttf
       - family: My Icons Sharp
         fonts:
           - asset: assets/fonts/MyIconsSharp.ttf
   ```

That's it!

## License

This package is licensed under the **MIT License**.
