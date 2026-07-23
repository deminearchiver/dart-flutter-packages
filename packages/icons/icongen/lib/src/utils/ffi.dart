import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:ffi_leak_tracker/ffi_leak_tracker.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';
import 'package:icongen/src/icongen.dart';
import 'package:meta/meta.dart';
import 'package:woff2_ffi/woff2_ffi_bindings.dart';

bool _isWoff2(Uint8List bytes) =>
    bytes.length >= 4 &&
    bytes[0] == 0x77 &&
    bytes[1] == 0x4F &&
    bytes[2] == 0x46 &&
    bytes[3] == 0x32;

@internal
(SubsetFormat, Pointer<hb_blob_t>)? tryCreateBlob(
  Uint8List bytes, {
  required Arena arena,
}) {
  final nativeBytesPointer = arena<Uint8>(bytes.length);
  nativeBytesPointer.asTypedList(bytes.length).setAll(0, bytes);

  SubsetFormat format = .ttf;
  var resolvedBytesPointer = nativeBytesPointer;
  var resolvedBytesLength = bytes.length;

  Pointer<Void> userData = nullptr;
  hb_destroy_func_t destroyFunction = nullptr;

  if (_isWoff2(bytes)) {
    final uncompressedSize = woff2_compute_final_size(
      nativeBytesPointer,
      bytes.length,
    );
    if (uncompressedSize > 0) {
      final uncompressedBytesPointer = adaptiveCalloc<Uint8>(uncompressedSize);
      var uncompressedBytesLoose = true;

      try {
        final memoryOutPointer = woff2_memory_out_create(
          uncompressedBytesPointer,
          uncompressedSize,
        );
        arena.onReleaseAll(() => woff2_memory_out_destroy(memoryOutPointer));

        final status = woff2_convert_to_ttf(
          nativeBytesPointer,
          bytes.length,
          memoryOutPointer.cast<woff2_out_t>(),
        );
        if (status) {
          format = .woff2;
          resolvedBytesPointer = uncompressedBytesPointer;
          resolvedBytesLength = woff2_memory_out_size(memoryOutPointer);

          userData = uncompressedBytesPointer.cast<Void>();
          destroyFunction = adaptiveCalloc.nativeFree;
          uncompressedBytesLoose = false;
        }
      } finally {
        if (uncompressedBytesLoose) {
          adaptiveCalloc.free(uncompressedBytesPointer);
        }
      }
    }
  }

  // [transfer full]:
  // The caller owns the data, and is responsible for freeing it.
  final blob = hb_blob_create_or_fail(
    resolvedBytesPointer.cast<Char>(),
    resolvedBytesLength,
    .HB_MEMORY_MODE_READONLY,
    userData,
    destroyFunction,
  );
  if (blob == nullptr) {
    if (userData != nullptr) {
      adaptiveCalloc.free(userData);
    }
    return null;
  }
  arena.onReleaseAll(() => hb_blob_destroy(blob));
  return (format, blob);
}

@internal
(SubsetFormat, Pointer<hb_blob_t>) createBlob(
  Uint8List bytes,
  String errorMessage, {
  required Arena arena,
}) {
  final result = tryCreateBlob(bytes, arena: arena);
  if (result == null) {
    throw Exception(errorMessage);
  }
  return result;
}

@internal
Pointer<hb_face_t>? tryCreateFace(
  Pointer<hb_blob_t> blob, {
  required Arena arena,
}) {
  // [transfer full]:
  // The caller owns the data, and is responsible for freeing it.
  final face = hb_face_create(blob, 0);
  if (face == nullptr) return null;
  arena.onReleaseAll(() => hb_face_destroy(face));
  return face;
}

@internal
Pointer<hb_face_t> createFace(
  Pointer<hb_blob_t> blob,
  String errorMessage, {
  required Arena arena,
}) {
  final face = tryCreateFace(blob, arena: arena);
  if (face == null) {
    throw Exception(errorMessage);
  }
  return face;
}

@internal
Pointer<hb_face_t> createFaceSubset(
  Pointer<hb_face_t> inputFace,
  VariableAxisConstraints variableAxisConstraints, {
  required Arena arena,
}) {
  // [transfer full]:
  // The caller owns the data, and is responsible for freeing it.
  final subsetInput = hb_subset_input_create_or_fail();
  if (subsetInput == nullptr) {
    throw StateError("Failed to create hb_subset_input_t.");
  }
  arena.onReleaseAll(() => hb_subset_input_destroy(subsetInput));

  var flags = hb_subset_input_get_flags(subsetInput).value;
  final additionalFlags = <hb_subset_flags_t>{
    .HB_SUBSET_FLAGS_PASSTHROUGH_UNRECOGNIZED,
    .HB_SUBSET_FLAGS_GLYPH_NAMES,
    .HB_SUBSET_FLAGS_OPTIMIZE_IUP_DELTAS,
  };
  for (final additionalFlag in additionalFlags) {
    flags |= additionalFlag.value;
  }
  hb_subset_input_set_flags(subsetInput, flags);

  final unicodeSet = hb_subset_input_unicode_set(subsetInput);
  hb_set_clear(unicodeSet);
  hb_set_invert(unicodeSet);

  for (final MapEntry(key: tag, value: variableAxisConstraint)
      in variableAxisConstraints.entries) {
    final nativeTag = createTag(tag, arena: arena);
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
    throw StateError("Failed to create subset hb_face_t.");
  }
  arena.onReleaseAll(() => hb_face_destroy(subsetFace));
  return subsetFace;
}

@internal
Uint8List faceToBytes(
  Pointer<hb_face_t> face,
  SubsetFormat format, {
  required Arena arena,
}) {
  // [transfer full]:
  // The caller owns the data, and is responsible for freeing it.
  final blobPointer = hb_face_reference_blob(face);
  if (blobPointer == nullptr) {
    throw StateError("Failed to reference face hb_blob_t.");
  }
  arena.onReleaseAll(() => hb_blob_destroy(blobPointer));

  final lengthPointer = arena<UnsignedInt>();
  final dataPointer = hb_blob_get_data(blobPointer, lengthPointer);
  if (dataPointer == nullptr) {
    throw StateError("Failed to extract data from face blob.");
  }

  final dataBytes = dataPointer.cast<Uint8>().asTypedList(lengthPointer.value);
  switch (format) {
    case .ttf:
      return .fromList(dataBytes);
    case .woff2:
      final maxCompressedSize = woff2_max_compressed_size(
        dataPointer.cast<Uint8>(),
        lengthPointer.value,
      );

      final compressedBytesPointer = adaptiveCalloc<Uint8>(maxCompressedSize);
      var compressedBytesLoose = true;

      try {
        final compressedSizePointer = arena<Size>()..value = maxCompressedSize;

        final status = woff2_convert_from_ttf(
          dataPointer.cast<Uint8>(),
          dataBytes.length,
          compressedBytesPointer,
          compressedSizePointer,
        );
        if (!status) {
          throw StateError("Failed to convert TTF to WOFF2.");
        }

        compressedBytesLoose = false;
        return compressedBytesPointer.asTypedList(
          compressedSizePointer.value,
          finalizer: adaptiveCalloc.nativeFree,
        );
      } finally {
        if (compressedBytesLoose) {
          adaptiveCalloc.free(compressedBytesPointer);
        }
      }
  }
}

@internal
Pointer<hb_font_t>? tryCreateFont(
  Pointer<hb_face_t> face, {
  required Arena arena,
}) {
  // [transfer full]:
  // The caller owns the data, and is responsible for freeing it.
  final font = hb_font_create(face);
  if (font == nullptr) return null;
  arena.onReleaseAll(() => hb_font_destroy(font));
  return font;
}

@internal
Pointer<hb_font_t> createFont(
  Pointer<hb_face_t> face,
  String errorMessage, {
  required Arena arena,
}) {
  final font = tryCreateFont(face, arena: arena);
  if (font == null) {
    throw Exception(errorMessage);
  }
  return font;
}

@internal
int? tryCreateTag(String tag, {required Arena arena}) {
  if (tag.length != 4) return null;
  final nativeString = tag.toNativeUtf8(allocator: arena);
  return hb_tag_from_string(nativeString.cast<Char>(), tag.length);
}

@internal
int createTag(String tag, {required Arena arena}) {
  if (tag.length != 4) {
    throw ArgumentError(
      "Variable font axis tag must be exactly 4 characters long.",
    );
  }
  final result = tryCreateTag(tag, arena: arena);
  if (result == null) {
    throw Exception("Failed to create hb_tag_t.");
  }
  return result;
}

@internal
String? extractFontFamily(Pointer<hb_face_t> face, {required Arena arena}) {
  if (face == nullptr) return null;

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

@internal
List<IconGlyph> extractIconGlyphs(
  Pointer<hb_font_t> font, {
  required Arena arena,
}) {
  if (font == nullptr) return [];

  // [transfer none]:
  // The data is owned by the callee, which is responsible of freeing it.
  final face = hb_font_get_face(font);

  final unicodeSet = hb_set_create();
  if (unicodeSet == nullptr) {
    throw Exception("Failed to create hb_set_t.");
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
      if (status == 0) continue;

      final glyphName = glyphNamePointer.cast<Utf8>().toDartString();
      if (glyphName.isNotEmpty && !_uniRegExp.hasMatch(glyphName)) {
        name = glyphName;
      }
    }

    iconGlyphs.add(.new(codePoint: codePoint, name: name));
  }
  return iconGlyphs;
}

@internal
IconGlyph? extractSmallestIconGlyph(
  Pointer<hb_font_t> font,
  List<IconGlyph> iconGlyphs, {
  required Arena arena,
}) {
  if (iconGlyphs.isEmpty) return null;

  final extentsPointer = arena<hb_glyph_extents_t>();
  final glyphIdPointer = arena<Uint32>();

  IconGlyph? smallestIcon;
  int? smallestArea;

  for (final icon in iconGlyphs) {
    var status = hb_font_get_nominal_glyph(
      font,
      icon.codePoint,
      glyphIdPointer,
    );
    if (status == 0) continue;

    status = hb_font_get_glyph_extents(
      font,
      glyphIdPointer.value,
      extentsPointer,
    );
    if (status == 0) continue;

    final width = extentsPointer.ref.width.abs();
    final height = extentsPointer.ref.height.abs();

    final area = width * height;
    if (area <= 0) continue;

    if (smallestArea == null || area < smallestArea) {
      smallestArea = area;
      smallestIcon = icon;
    }
  }

  return smallestIcon;
}
