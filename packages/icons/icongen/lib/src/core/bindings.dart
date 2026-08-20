import 'dart:collection';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:ffi_leak_tracker/ffi_leak_tracker.dart';
import 'package:icongen/src/icongen.dart';
import 'package:meta/meta.dart';

@immutable
class const BindingsResult({required final String code}) {
  @override
  String toString() => "BindingsResult(code: $code)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is BindingsResult &&
          code == other.code;

  @override
  int get hashCode => Object.hash(runtimeType, code);
}

@internal
typedef BindingsBuilderResultFactory<ResultType extends Object?> =
    ResultType Function({required String code});

@immutable
final class const BindingsBuilder({
  required final Uint8List inputBytes,
  required final String className,
  final String? fontFamily,
  final String? fontPackage,
  final IconGlyph? forceTreeShakeIconGlyph,
}) {
  List<_Icon> _buildIcons(List<IconGlyph> iconGlyphs) {
    final uniqueIconGlyphs = _uniqueIconGlyphsByName(iconGlyphs);

    final identifiedIcons = _identifyIcons(
      uniqueIconGlyphs,
      reservedIdentifiers: <String>{
        // A class member can't have the same name as the enclosing class.
        className,
        // A class member can't share a name with another member.
        "fontFamily",
        if (fontPackage != null) "fontPackage",
        "forceCompileTimeTreeShaking",
      },
    );

    final renamedIcons = _renameDuplicateIcons(identifiedIcons);

    return renamedIcons.toList(growable: false)
      ..sort((a, b) => a.identifier.compareTo(b.identifier));
  }

  @internal
  ResultType buildInternal<ResultType extends Object?>(
    BindingsBuilderResultFactory<ResultType> factory,
  ) => using((arena) {
    final (inputFormat, inputBlob) = createBlob(
      inputBytes,
      "Unsupported font format or failed to create hb_blob_t.",
      arena: arena,
    );

    final inputFace = createFace(
      inputBlob,
      "Unsupported font format or failed to create hb_face_t.",
      arena: arena,
    );

    final inputFont = createFont(
      inputFace,
      "Unsupported font format or failed to create hb_font_t.",
      arena: arena,
    );

    final fontFamily =
        this.fontFamily ??
        extractFontFamily(inputFace, arena: arena) ??
        className;

    final iconGlyphs = extractIconGlyphs(inputFont, arena: arena);

    final forceTreeShakeIconGlyph =
        this.forceTreeShakeIconGlyph ??
        extractSmallestIconGlyph(inputFont, iconGlyphs, arena: arena);

    final code = _generateCode(
      className: className,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
      forceTreeShakeIconGlyph: forceTreeShakeIconGlyph,
      icons: _buildIcons(iconGlyphs),
    );

    // TODO: allow to configure formatting

    // final formatter = DartFormatter(languageVersion: .new(3, 12, 0));

    // String formattedCode;
    // try {
    //   formattedCode = formatter.format(rawCode);
    // } on Object {
    //   formattedCode = rawCode;
    // }

    return factory(code: code);
  }, adaptiveCalloc);

  BindingsResult build() => buildInternal(BindingsResult.new);
}

Iterable<IconGlyph> _uniqueIconGlyphsByName(
  Iterable<IconGlyph> iconGlyphs,
) sync* {
  final seen = HashSet<String>();
  for (final iconGlyph in iconGlyphs) {
    final name = iconGlyph.name;
    if (name == null || name.isEmpty || seen.add(name)) {
      yield iconGlyph;
    }
  }
}

Iterable<_Icon> _identifyIcons(
  Iterable<IconGlyph> iconGlyphs, {
  Set<String> reservedIdentifiers = const {},
}) => iconGlyphs.map((iconGlyph) {
  final IconGlyph(:codePoint, :name) = iconGlyph;
  final hex = iconGlyph.codePoint.toRadixString(16);
  final rawIdentifier = name ?? "\$${hex.toLowerCase()}";
  return _Icon(
    codePoint: codePoint,
    name: name,
    identifier: sanitizeIconIdentifier(
      rawIdentifier,
      reservedIdentifiers: reservedIdentifiers,
    ),
  );
});

Iterable<_Icon> _renameDuplicateIcons(Iterable<_Icon> icons) sync* {
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
    final identifier = icon.identifier;
    final count = identifierToCount[identifier]!;
    if (count > 1) {
      final index = identifierToIndex.update(
        identifier,
        (value) => value + 1,
        ifAbsent: () => 0,
      );
      yield _Icon(
        codePoint: icon.codePoint,
        name: icon.name,
        identifier: "$identifier\$$index",
      );
    } else {
      yield icon;
    }
  }
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
  ({int codePoint, String? name, String identifier}) _,
) implements Object {
  const new({required int codePoint, String? name, required String identifier})
    : _ = (codePoint: codePoint, name: name, identifier: identifier);

  int get codePoint => _.codePoint;

  String? get name => _.name;

  String get identifier => _.identifier;
}
