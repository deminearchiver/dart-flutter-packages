import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi.dart';
import 'package:icongen/src/types.dart';

Future<void> generateIconBindings(
  SubsetResult subsetResult, {
  required Uri library,
  String? className,
  String? fontFamily,
  String? fontPackage,
  IconGlyph? forceTreeShakeIconGlyph,
}) => IconBindingsBuilder(
  subsetResult,
  library: library,
  className: className,
  fontFamily: fontFamily,
  fontPackage: fontPackage,
  forceTreeShakeIconGlyph: forceTreeShakeIconGlyph,
).generate();

class IconBindingsBuilder {
  IconBindingsBuilder(
    this.subsetResult, {
    required this.library,
    this.className,
    this.fontFamily,
    this.fontPackage,
    this.forceTreeShakeIconGlyph,
  });

  final SubsetResult subsetResult;
  final Uri library;
  final String? className;
  final String? fontFamily;
  final String? fontPackage;
  final IconGlyph? forceTreeShakeIconGlyph;

  Future<void> generate() async {
    final resolvedClassName = className ?? "Icons";
    final resolvedFontFamily =
        fontFamily ?? subsetResult.fontFamily ?? resolvedClassName;
    final resolvedForceTreeShakeIconGlyph =
        forceTreeShakeIconGlyph ??
        await _defaultForceTreeShakeIconGlyph(subsetResult);

    final reservedIdentifiers = <String>{
      "fontFamily",
      if (fontPackage != null) "fontPackage",
      "forceCompileTimeTreeShaking",
    };

    Iterable<IconGlyph> uniqueIconGlyphsByName(Iterable<IconGlyph> iconGlyphs) {
      final nameToIconGlyph = <String, IconGlyph>{};
      final unnamedIconGlyphs = <IconGlyph>[];
      for (final icon in iconGlyphs) {
        final name = icon.name;
        if (name != null && name.isNotEmpty) {
          nameToIconGlyph.putIfAbsent(name, () => icon);
        } else {
          unnamedIconGlyphs.add(icon);
        }
      }
      return nameToIconGlyph.values.followedBy(unnamedIconGlyphs);
    }

    Iterable<_Icon> identifyIcons(Iterable<IconGlyph> iconGlyphs) =>
        iconGlyphs.map((iconGlyph) {
          final IconGlyph(:codePoint, :name) = iconGlyph;
          final hex = iconGlyph.codePoint.toRadixString(16);
          final identifier = name ?? "\$${hex.toLowerCase()}";
          return _Icon(
            codePoint: codePoint,
            name: name,
            identifier: _sanitizeIconIdentifier(
              identifier,
              reservedIdentifiers: reservedIdentifiers,
            ),
          );
        });

    Iterable<_Icon> renameDuplicateIcons(Iterable<_Icon> icons) sync* {
      final identifierToCount = <String, int>{};
      for (final _Icon(:identifier) in icons) {
        identifierToCount.update(
          identifier,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }

      final identifierToIndex = <String, int>{};
      for (final icon in icons) {
        if (identifierToCount[icon.identifier]! > 1) {
          final index = identifierToIndex.update(
            icon.identifier,
            (value) => value + 1,
            ifAbsent: () => 0,
          );
          yield _Icon(
            codePoint: icon.codePoint,
            name: icon.name,
            identifier: "${icon.identifier}\$$index",
          );
        } else {
          yield icon;
        }
      }
    }

    final icons =
        renameDuplicateIcons(
            identifyIcons(uniqueIconGlyphsByName(subsetResult.iconGlyphs)),
          ).toList(growable: false)
          ..sort((a, b) => a.identifier.compareTo(b.identifier));

    final code = _generateCode(
      className: resolvedClassName,
      fontFamily: resolvedFontFamily,
      fontPackage: fontPackage,
      forceTreeShakeIconGlyph: resolvedForceTreeShakeIconGlyph,
      icons: icons,
    );

    // TODO: allow to configure formatting

    // final formatter = DartFormatter(languageVersion: .new(3, 12, 0));

    // String formattedCode;
    // try {
    //   formattedCode = formatter.format(rawCode);
    // } on Object {
    //   formattedCode = rawCode;
    // }

    final file = File(library.toFilePath());
    await file.parent.create(recursive: true);
    await file.writeAsString(code);
  }
}

Future<IconGlyph?> _defaultForceTreeShakeIconGlyph(
  SubsetResult subsetResult,
) async {
  if (subsetResult.iconGlyphs.isEmpty) return null;
  return using((arena) async {
    final subsetFile = File(subsetResult.output.asset.toFilePath());
    if (!subsetFile.existsSync()) {
      return null;
    }

    final subsetBytes = await subsetFile.readAsBytes();
    final subsetBlob = HarfbuzzBlob.tryFromBytes(subsetBytes);
    if (subsetBlob == null) {
      return null;
    }
    arena.onReleaseAll(subsetBlob.dispose);

    final subsetFace = hb_face_create(subsetBlob.asNativeBlob, 0);
    if (subsetFace == nullptr) {
      return null;
    }
    arena.onReleaseAll(() => hb_face_destroy(subsetFace));

    final subsetFont = hb_font_create(subsetFace);
    if (subsetFont == nullptr) {
      return null;
    }
    arena.onReleaseAll(() => hb_font_destroy(subsetFont));

    final extentsPointer = arena<hb_glyph_extents_t>();
    final glyphIdPointer = arena<Uint32>();

    IconGlyph? smallestIcon;
    int? smallestArea;

    for (final icon in subsetResult.iconGlyphs) {
      if (hb_font_get_nominal_glyph(
            subsetFont,
            icon.codePoint,
            glyphIdPointer,
          ) !=
          0) {
        if (hb_font_get_glyph_extents(
              subsetFont,
              glyphIdPointer.value,
              extentsPointer,
            ) !=
            0) {
          final width = extentsPointer.ref.width.abs();
          final height = extentsPointer.ref.height.abs();
          final area = width * height;
          if (area > 0) {
            if (smallestArea == null || area < smallestArea) {
              smallestArea = area;
              smallestIcon = icon;
            }
          }
        }
      }
    }

    return smallestIcon;
  });
}

String _generateCode({
  required String className,
  required String fontFamily,
  required String? fontPackage,
  required IconGlyph? forceTreeShakeIconGlyph,
  required List<_Icon> icons,
}) {
  final buffer = StringBuffer();

  // Top-level comments.
  {
    buffer
      ..writeln("// GENERATED CODE - DO NOT MODIFY BY HAND")
      ..writeln("// ignore_for_file: constant_identifier_names")
      ..writeln("// ignore_for_file: non_constant_identifier_names")
      ..writeln("// dart format off");
  }

  // Library.

  {
    buffer.writeln();

    const docs = <String>["@docImport 'package:flutter/material.dart';"];
    docs.map((line) => "/// $line").forEach(buffer.writeln);

    buffer.writeln("library;");
  }

  // Imports.
  {
    buffer
      ..writeln()
      ..writeln("import 'package:flutter/widgets.dart';");
  }

  // Class declaration.
  {
    // Class definition.
    {
      buffer.writeln();

      final docs = <String>[
        "A set of $fontFamily icons.",
        "",
        "In release builds, the Flutter tool will tree shake out of bundled fonts",
        "the code points (or instances of [IconData]) which are not referenced from",
        "Dart app code. See the [staticIconProvider] annotation for more details.",
        "",
        "See also",
        "",
        " * [Icon], for showing icon glyphs from a font.",
        " * [IconTheme], which provides ambient configuration for icons.",
        " * [IconButton], for interactive icons.",
        " * [ImageIcon], for showing icons from [AssetImage]s or other [ImageProvider]s.",
      ];
      docs.map((line) => "/// $line").forEach(buffer.writeln);

      buffer
        ..writeln("@staticIconProvider")
        ..writeln("abstract final class $className {");
    }

    // Font family declaration.
    {
      buffer
        ..writeln(
          "  /// The font family from which glyph for the icon will be selected.",
        )
        ..writeln("  static const String fontFamily = \"$fontFamily\";");
    }

    // Font package declaration.
    var fontPackageArgument = "";
    if (fontPackage != null) {
      fontPackageArgument = ", fontPackage: fontPackage";

      buffer.writeln();

      const docs = <String>[
        "The name of the package from which the font family is included.",
        "",
        "The name is used by the [Icon] widget when configuring the [TextStyle] so",
        "that the given [fontFamily] is obtained from the appropriate asset.",
        "",
        "See also:",
        "",
        " * [TextStyle], which describes how to use fonts from other packages.",
      ];
      docs.map((line) => "  /// $line").forEach(buffer.writeln);

      buffer.writeln("  static const String fontPackage = \"$fontPackage\";");
    }

    // Force tree shake declaration.
    if (forceTreeShakeIconGlyph != null) {
      buffer.writeln();

      // See: https://github.com/timmaffett/material_symbols_icons/blob/master/lib/symbols.dart
      const docs = <String>[
        "This routine exists to FORCE TREE SHAKING of the icon fonts that",
        "may not be referenced at all within the application. This is required",
        "because tree shaking DOES NOT OCCUR for fonts that are never referenced,",
        "so having a this method FORCES a reference to the fonts - and invokes",
        "tree shaking for each of the three fonts. In this way any unused fonts",
        "are reduced to around 2k, which the icon tree shake will report",
        "as 100.0% reduction. (Tree shaking occurs when a *const* declaration",
        "to an IconData() class occurs.)",
        "",
        "NOTE: VERY IMPORTANT - the `@pragma('vm:entry-point')` annotation is",
        "REQUIRED and it is being used to force the dart compilation process",
        "to believe that this method is required and that it CAN NOT tree-shake",
        "this method when it never finds a call to it in the dart source code.",
      ];
      docs.map((line) => "  /// $line").forEach(buffer.writeln);

      buffer
        ..writeln("  @pragma(\"vm:entry-point\")")
        ..writeln("  static void forceCompileTimeTreeShaking() {");

      {
        const comments = <String>[
          "These variables must be declared as var to trigger tree shaking,",
          "when declared as const then the tree shaking is not triggered.",
          "These are references to one of the smallest glyphs we can include.",
        ];
        comments.map((line) => "    // $line").forEach(buffer.writeln);
      }

      {
        buffer.writeln();

        final hex = forceTreeShakeIconGlyph.codePoint.toRadixString(16);
        final name = forceTreeShakeIconGlyph.name ?? "U+${hex.toUpperCase()}";
        final comments = <String>[
          "$fontFamily icon named \"$name\".",
          "ignore: prefer_final_locals, unused_local_variable",
        ];
        comments.map((line) => "    // $line").forEach(buffer.writeln);

        buffer.writeln(
          // Local variable: explicitly omit type.
          "    var forceTreeShake = const IconData("
          "0x${hex.toLowerCase()}, fontFamily: fontFamily$fontPackageArgument"
          ");",
        );
      }

      buffer.writeln("  }");
    }

    // Generated icons block.
    {
      // Begin generated icons marker.
      buffer
        ..writeln()
        ..writeln("  // BEGIN GENERATED ICONS");

      // Generated icons declarations.
      for (final icon in icons) {
        buffer.writeln();

        final hex = icon.codePoint.toRadixString(16);

        final name = icon.name ?? "U+${hex.toUpperCase()}";
        final docs = <String>["$fontFamily icon named \"$name\"."];
        docs.map((line) => "  /// $line").forEach(buffer.writeln);

        buffer.writeln(
          // Property: explicitly specify type.
          "  static const IconData ${icon.identifier} = IconData("
          "0x${hex.toLowerCase()}, fontFamily: fontFamily$fontPackageArgument"
          ");",
        );
      }

      // End generated icons marker.
      buffer
        ..writeln()
        ..writeln("  // END GENERATED ICONS");
    }

    // Close class declaration.
    buffer.writeln("}");
  }

  return buffer.toString();
}

extension type const _Icon._(
  ({int codePoint, String? name, String identifier}) _
) implements Object {
  const _Icon({
    required int codePoint,
    String? name,
    required String identifier,
  }) : _ = (codePoint: codePoint, name: name, identifier: identifier);

  int get codePoint => _.codePoint;

  String? get name => _.name;

  String get identifier => _.identifier;
}

// TODO: check if this list is exhaustive
const _keywords = <String>{
  "assert",
  "break",
  "case",
  "catch",
  "class",
  "const",
  "continue",
  "default",
  "do",
  "else",
  "enum",
  "extends",
  "false",
  "final",
  "finally",
  "for",
  "if",
  "in",
  "is",
  "new",
  "null",
  "rethrow",
  "return",
  "super",
  "switch",
  "this",
  "throw",
  "true",
  "try",
  "var",
  "void",
  "while",
  "with",
  "yield",
  "async",
  "await",
  "dynamic",
  "implements",
  "import",
  "library",
  "operator",
  "part",
  "set",
  "get",
  "static",
  "typedef",
  "late",
  "required",
  "covariant",
  "factory",
  "extension",
  "inline",
  "interface",
  "mixin",
};

const _ones = <String>[
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen",
];

const _tens = <String>[
  "",
  "",
  "twenty",
  "thirty",
  "forty",
  "fifty",
  "sixty",
  "seventy",
  "eighty",
  "ninety",
];

String _intToNaturalLanguage(int value) {
  if (value < 20) return _ones[value];
  if (value < 100) {
    final t = value ~/ 10;
    final r = value % 10;
    return _tens[t] + (r > 0 ? "_${_ones[r]}" : "");
  }
  if (value < 1000) {
    final h = value ~/ 100;
    final r = value % 100;
    if (r == 0) return "${_ones[h]}_hundred";
    if (r < 10) return "${_ones[h]}_o_${_ones[r]}";
    return "${_ones[h]}_${_intToNaturalLanguage(r)}";
  }
  return value.toString();
}

String _sanitizeIconIdentifier(
  String name, {
  Set<String> reservedIdentifiers = const {},
}) {
  name = name.replaceAll(RegExp(r"^_+"), "");
  name = name.replaceAll("-", "_");
  name = name.replaceAll(".", "_");
  final match = RegExp(r"^(\d+)(.*)").firstMatch(name);
  if (match != null) {
    final numStr = match.group(1)!;
    final rest = match.group(2)!;
    final words = _intToNaturalLanguage(int.parse(numStr));
    if (rest.isEmpty) {
      name = words;
    } else if (rest.startsWith('_')) {
      name = words + rest;
    } else {
      name = '${words}_$rest';
    }
  }
  if (_keywords.contains(name) || reservedIdentifiers.contains(name)) {
    name = "$name\$";
  }
  if (RegExp(r"^\d").hasMatch(name) || name.isEmpty) {
    name = "\$$name";
  }
  return name;
}
