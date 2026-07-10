import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:harfbuzz/harfbuzz.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';
import 'package:icongen/src/types.dart';

Future<Map<T, SubsetResult<T>>> generateFontSubsets<T extends Object?>({
  required Uri input,
  required Map<T, SubsetOutput> outputs,
}) => FontSubsetBuilder(input: input, outputs: outputs).generate();

class FontSubsetBuilder<T extends Object?> {
  FontSubsetBuilder({required this.input, required this.outputs});

  final Uri input;
  final Map<T, SubsetOutput> outputs;

  Future<Map<T, SubsetResult<T>>> generate() async {
    final inputFile = File(input.toFilePath());
    if (!inputFile.existsSync()) {
      throw FileSystemException(
        "Input font file does not exist.",
        inputFile.path,
      );
    }

    final inputBytes = await inputFile.readAsBytes();
    final inputBlob = HarfbuzzBlob.tryFromBytes(inputBytes);
    if (inputBlob == null) {
      throw Exception("Failed to create HarfBuzz blob from input font.");
    }

    final results = <T, SubsetResult<T>>{};

    try {
      for (final MapEntry(key: id, value: output) in outputs.entries) {
        await using((arena) async {
          final inputFace = hb_face_create(inputBlob.asNativeBlob, 0);
          if (inputFace == nullptr) {
            throw StateError("failed to create hb_face_t.");
          }
          arena.onReleaseAll(() => hb_face_destroy(inputFace));

          Pointer<hb_face_t> subsetFace;

          final isCircular = input == output.asset;
          if (isCircular) {
            if (output.axisConstraints.isNotEmpty) {
              throw ArgumentError(
                "Cannot subset when output asset is identical to the input font file.",
              );
            }
            subsetFace = inputFace;
          } else {
            subsetFace = _createSubset(inputFace, output, arena: arena);
            await _writeAssetFile(subsetFace, output, arena: arena);
          }

          results[id] = .new(
            outputId: id,
            output: output,
            fontFamily: _extractFontFamily(subsetFace, arena: arena),
            iconGlyphs: _extractIconGlyphs(subsetFace, arena: arena),
          );
        });
      }
    } finally {
      inputBlob.dispose();
    }

    return results;
  }
}

Pointer<hb_face_t> _createSubset(
  Pointer<hb_face_t> inputFace,
  SubsetOutput output, {
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

  for (final axisConstraint in output.axisConstraints) {
    final tag = _createNativeTag(axisConstraint.tag);
    switch (axisConstraint) {
      case SubsetAxisFixed(:final at):
        final result = hb_subset_input_pin_axis_location(
          subsetInput,
          inputFace,
          tag,
          at,
        );
        if (result == 0) {
          throw Exception("Failed to pin axis value for ${axisConstraint.tag}");
        }
      case SubsetAxisRange(:final from, :final to, :final defaultValue):
        if (from >= to) {
          throw ArgumentError.value(
            axisConstraint,
            null,
            "Axis constraint range cannot be empty.",
          );
        }
        if (defaultValue < from || defaultValue > to) {
          throw ArgumentError.value(
            axisConstraint,
            null,
            "Axis constraint default value must be in range.",
          );
        }
        final result = hb_subset_input_set_axis_range(
          subsetInput,
          inputFace,
          tag,
          from,
          to,
          defaultValue,
        );
        if (result == 0) {
          throw Exception("Failed to pin axis range for ${axisConstraint.tag}");
        }
    }
  }

  final subsetFace = hb_subset_or_fail(inputFace, subsetInput);
  if (subsetFace == nullptr) {
    throw StateError("HarfBuzz subsetting failed for $output.");
  }
  arena.onReleaseAll(() => hb_face_destroy(subsetFace));
  return subsetFace;
}

Uint8List _faceToBytesUnsafe(Pointer<hb_face_t> face, {required Arena arena}) {
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
  return data.cast<Uint8>().asTypedList(lengthPointer.value);
}

Future<void> _writeAssetFile(
  Pointer<hb_face_t> subsetFace,
  SubsetOutput output, {
  required Arena arena,
}) async {
  final subsetBytes = _faceToBytesUnsafe(subsetFace, arena: arena);

  final file = File(output.asset.toFilePath());

  // Recursively create path to file, if not exist.
  await file.parent.create(recursive: true);

  // Write bytes to file, overriding if exists.
  await file.writeAsBytes(subsetBytes);
}

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
      if (hb_font_get_glyph_name(
            font,
            glyphId,
            glyphNamePointer,
            glyphNameLength,
          ) !=
          0) {
        final glyphName = glyphNamePointer.cast<Utf8>().toDartString();
        if (glyphName.isNotEmpty && !glyphName.contains("uni")) {
          name = glyphName;
        }
      }
    }

    iconGlyphs.add(.new(codePoint: codePoint, name: name));
  }
  return iconGlyphs;
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

int _createNativeTag(String tag, [Allocator wrappedAllocator = calloc]) {
  if (tag.length != 4) {
    throw ArgumentError(
      "Variable font axis tags must be exactly 4 characters long.",
    );
  }
  return using((allocator) {
    final nativeString = tag.toNativeUtf8(allocator: allocator);
    return hb_tag_from_string(nativeString.cast(), tag.length);
  }, wrappedAllocator);
}
