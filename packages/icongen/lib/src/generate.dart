import 'dart:ffi';
import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:ffi/ffi.dart';
import 'package:harfbuzz/harfbuzz.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';
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
          final identifier =
              name ??
              "\$${iconGlyph.codePoint.toRadixString(16).toLowerCase()}";
          return _Icon(
            codePoint: codePoint,
            identifier: _sanitizeIconIdentifier(identifier),
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
          yield icon.copyWith(identifier: "${icon.identifier}\$$index");
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

    final ast = _buildDartLibrary(
      className: resolvedClassName,
      fontFamily: resolvedFontFamily,
      fontPackage: fontPackage,
      forceTreeShakeIconGlyph: resolvedForceTreeShakeIconGlyph,
      icons: icons,
    );

    final emitter = DartEmitter(
      allocator: .none,
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    final generatedCode = ast.accept(emitter).toString();

    final formatter = DartFormatter(languageVersion: .new(3, 12, 0));

    String formattedCode;
    try {
      formattedCode = formatter.format(generatedCode);
    } on Object {
      formattedCode = generatedCode;
    }

    final file = File(library.toFilePath());
    await file.parent.create(recursive: true);
    await file.writeAsString(formattedCode);
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

Library _buildDartLibrary({
  required String className,
  required String fontFamily,
  required String? fontPackage,
  required IconGlyph? forceTreeShakeIconGlyph,
  required List<_Icon> icons,
}) {
  final iconsClass = Class((b) {
    b
      ..name = className
      ..annotations.add(refer("staticIconProvider"))
      ..modifier = .final$
      ..abstract = true;
    if (forceTreeShakeIconGlyph != null) {
      b.methods.add(
        Method(
          (b) => b
            ..name = "forceCompileTimeTreeShaking"
            ..static = true
            ..returns = refer("void")
            ..annotations.add(refer("pragma(\"vm:entry-point\")"))
            ..body = Code(
              "// ignore: prefer_final_locals, unused_local_variable\n"
              "var forceTreeShake = const IconData("
              "0x${forceTreeShakeIconGlyph.codePoint.toRadixString(16)},"
              "fontFamily: \"$fontFamily\","
              "${fontPackage != null ? "fontPackage: \"$fontPackage\"" : ""}"
              ");",
            ),
        ),
      );
    }
    b.fields.addAll(
      icons.map(
        (icon) => Field(
          (b) => b
            ..name = icon.identifier
            ..static = true
            ..modifier = .constant
            ..type = refer("IconData")
            ..assignment = Code(
              "IconData("
              "0x${icon.codePoint.toRadixString(16)},"
              "fontFamily: \"$fontFamily\","
              "${fontPackage != null ? "fontPackage: \"$fontPackage\"" : ""}"
              ")",
            ),
        ),
      ),
    );
  });
  return Library(
    (b) => b
      ..comments.addAll([
        "GENERATED CODE - DO NOT MODIFY BY HAND",
        "ignore_for_file: constant_identifier_names",
        "ignore_for_file: non_constant_identifier_names",
      ])
      ..directives.add(Directive.import("package:flutter/widgets.dart"))
      ..body.add(iconsClass),
  );
}

extension type const _Icon._(({int codePoint, String identifier}) _)
    implements Object {
  const _Icon({required int codePoint, required String identifier})
    : _ = (codePoint: codePoint, identifier: identifier);

  int get codePoint => _.codePoint;

  String get identifier => _.identifier;

  _Icon copyWith({int? codePoint, String? identifier}) =>
      codePoint != null || identifier != null
      ? _Icon(
          codePoint: codePoint ?? this.codePoint,
          identifier: identifier ?? this.identifier,
        )
      : this;
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

String _sanitizeIconIdentifier(String name) {
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
  if (_keywords.contains(name)) {
    name = "$name\$";
  }
  if (RegExp(r"^\d").hasMatch(name) || name.isEmpty) {
    name = "\$$name";
  }
  return name;
}
