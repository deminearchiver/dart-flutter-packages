import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';
import 'package:icongen/icongen.dart';
import 'package:meta/meta.dart';

@immutable
class SubsetBuilder {
  const SubsetBuilder({
    required this.inputBytes,
    this.variableAxisConstraints = const {},
  });

  final Uint8List inputBytes;

  final VariableAxisConstraints variableAxisConstraints;

  SubsetResult build() => using((arena) {
    final nativeBytes = arena<Uint8>(inputBytes.length);

    nativeBytes.asTypedList(inputBytes.length).setAll(0, inputBytes);

    final inputBlob = hb_blob_create_or_fail(
      nativeBytes.cast<Char>(),
      inputBytes.length,
      .HB_MEMORY_MODE_READONLY,
      nullptr,
      nullptr,
    );
    if (inputBlob == nullptr) {
      throw StateError("Failed to create hb_blob_t.");
    }
    arena.onReleaseAll(() => hb_blob_destroy(inputBlob));

    final inputFace = hb_face_create(inputBlob, 0);
    if (inputFace == nullptr) {
      throw StateError("Failed to create hb_face_t.");
    }
    arena.onReleaseAll(() => hb_face_destroy(inputFace));

    Pointer<hb_face_t> subsetFace;

    if (variableAxisConstraints.isEmpty) {
      subsetFace = inputFace;
    } else {
      subsetFace = _createSubset(
        inputFace,
        variableAxisConstraints,
        arena: arena,
      );
    }

    final subsetBytes = _faceToBytes(subsetFace, arena: arena);

    return SubsetResult(
      bytes: subsetBytes,
      fontFamily: _extractFontFamily(subsetFace, arena: arena),
      iconGlyphs: _extractIconGlyphs(subsetFace, arena: arena),
    );
  });
}

Pointer<hb_face_t> _createSubset(
  Pointer<hb_face_t> inputFace,
  VariableAxisConstraints variableAxisConstraints, {
  required Arena arena,
}) {
  final subsetInput = hb_subset_input_create_or_fail();
  if (subsetInput == nullptr) {
    throw StateError("Failed to create hb_subset_input_t.");
  }
  arena.onReleaseAll(() => hb_subset_input_destroy(subsetInput));

  final currentFlags = hb_subset_input_get_flags(subsetInput);
  hb_subset_input_set_flags(
    subsetInput,
    currentFlags.value |
        hb_subset_flags_t.HB_SUBSET_FLAGS_OPTIMIZE_IUP_DELTAS.value |
        hb_subset_flags_t.HB_SUBSET_FLAGS_GLYPH_NAMES.value |
        hb_subset_flags_t.HB_SUBSET_FLAGS_PASSTHROUGH_UNRECOGNIZED.value,
  );

  final unicodeSet = hb_subset_input_unicode_set(subsetInput);
  hb_set_clear(unicodeSet);
  hb_set_invert(unicodeSet);

  for (final MapEntry(key: tag, value: variableAxisConstraint)
      in variableAxisConstraints.entries) {
    final nativeTag = _createNativeTag(tag, arena: arena);
    switch (variableAxisConstraint) {
      case VariableAxisFixed(:final at):
        final status = hb_subset_input_pin_axis_location(
          subsetInput,
          inputFace,
          nativeTag,
          at,
        );
        if (status == 0) {
          throw StateError("Failed to pin axis value for $tag.");
        }
      case VariableAxisRange(:final from, :final to, :final defaultValue):
        if (from >= to) {
          throw ArgumentError.value(
            variableAxisConstraint,
            null,
            "Axis constraint range cannot be empty.",
          );
        }
        if (defaultValue < from || defaultValue > to) {
          throw ArgumentError.value(
            variableAxisConstraint,
            null,
            "Axis constraint default value must be in range.",
          );
        }
        final status = hb_subset_input_set_axis_range(
          subsetInput,
          inputFace,
          nativeTag,
          from,
          to,
          defaultValue,
        );
        if (status == 0) {
          throw StateError("Failed to pin axis range for $tag.");
        }
    }
  }

  final subsetFace = hb_subset_or_fail(inputFace, subsetInput);
  if (subsetFace == nullptr) {
    throw StateError("HarfBuzz subsetting failed.");
  }
  arena.onReleaseAll(() => hb_face_destroy(subsetFace));
  return subsetFace;
}

Uint8List _faceToBytes(Pointer<hb_face_t> face, {required Arena arena}) {
  final blob = hb_face_reference_blob(face);
  if (blob == nullptr) {
    throw StateError("Failed to reference face hb_blob_t.");
  }
  arena.onReleaseAll(() => hb_blob_destroy(blob));

  final lengthPointer = arena<UnsignedInt>();
  final data = hb_blob_get_data(blob, lengthPointer);
  if (data == nullptr) {
    throw StateError("Failed to extract data from face blob.");
  }

  final view = data.cast<Uint8>().asTypedList(lengthPointer.value);
  return .fromList(view);
}

String? _extractFontFamily(Pointer<hb_face_t> face, {required Arena arena}) {
  final nameId = hb_ot_name_id_predefined_t.HB_OT_NAME_ID_FONT_FAMILY.value;

  final length = hb_ot_name_get_utf8(
    face,
    nameId,
    hb_language_get_default(),
    nullptr,
    nullptr,
  );
  if (length <= 0) return null;

  final size = length + 1;
  final lengthPointer = arena<UnsignedInt>()..value = size;
  final stringPointer = arena<Char>(size);

  hb_ot_name_get_utf8(
    face,
    nameId,
    hb_language_get_default(),
    lengthPointer,
    stringPointer,
  );

  return stringPointer.cast<Utf8>().toDartString(length: length);
}

final _uniRegExp = RegExp(r"^u(ni)?[0-9a-fA-F]{4,}$");

List<IconGlyph> _extractIconGlyphs(
  Pointer<hb_face_t> face, {
  required Arena arena,
}) {
  final font = hb_font_create(face);
  if (font == nullptr) {
    throw StateError("Failed to create hb_font_t.");
  }
  arena.onReleaseAll(() => hb_font_destroy(font));

  final unicodeSet = hb_set_create();
  if (unicodeSet == nullptr) {
    throw StateError("Failed to create hb_set_t for unicodes.");
  }
  arena.onReleaseAll(() => hb_set_destroy(unicodeSet));

  hb_face_collect_unicodes(face, unicodeSet);

  final codePointPointer = arena<Uint32>()..value = HB_SET_VALUE_INVALID;

  final glyphIdPointer = arena<Uint32>();

  // According to the OpenType specification, glyph names are limited
  // to 63 characters and can only contain (a subset of) ASCII.
  const glyphNameLength = 64;
  final glyphNamePointer = arena<Char>(glyphNameLength);

  final iconGlyphs = <IconGlyph>[];

  while (hb_set_next(unicodeSet, codePointPointer) != 0) {
    final codePoint = codePointPointer.value;

    String? name;
    if (hb_font_get_nominal_glyph(font, codePoint, glyphIdPointer) != 0) {
      final glyphId = glyphIdPointer.value;
      final status = hb_font_get_glyph_name(
        font,
        glyphId,
        glyphNamePointer,
        glyphNameLength,
      );
      if (status != 0) {
        final glyphName = glyphNamePointer.cast<Utf8>().toDartString();
        if (glyphName.isNotEmpty && !_uniRegExp.hasMatch(glyphName)) {
          name = glyphName;
        }
      }
    }

    iconGlyphs.add(.new(codePoint: codePoint, name: name));
  }
  return iconGlyphs;
}

int _createNativeTag(String tag, {required Arena arena}) {
  if (tag.length != 4) {
    throw ArgumentError(
      "Variable font axis tag must be exactly 4 characters long.",
    );
  }
  final nativeString = tag.toNativeUtf8(allocator: arena);
  return hb_tag_from_string(nativeString.cast<Char>(), tag.length);
}
