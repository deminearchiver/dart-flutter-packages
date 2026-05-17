// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:io';

import 'package:args/args.dart';
import 'package:ffi/ffi.dart';
import 'package:harfbuzz/harfbuzz.dart';
import 'package:harfbuzz_ffi/harfbuzz_ffi_bindings.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption("font-file", abbr: "f", help: "Input font file path")
    ..addOption("output-file", abbr: "o", help: "Output subset font path")
    ..addOption("rond");

  final ArgResults results;
  try {
    results = parser.parse(arguments);
  } catch (e) {
    print(e);
    print(parser.usage);
    exit(1);
  }

  final fontPath = results.option("font-file");
  final outputPath = results.option("output-file");
  if (fontPath == null || outputPath == null) {
    print("Error: --font-file and --output-file are required.");
    print(parser.usage);
    exit(1);
  }

  final rondString = results.option("rond");
  final rond = rondString != null ? double.tryParse(rondString) : null;

  print("Subsetting $fontPath -> $outputPath");

  // 1. Load the Font Face
  final file = File(fontPath);
  if (!file.existsSync()) {
    print("Error: File $fontPath does not exist.");
    exit(1);
  }

  final bytes = file.readAsBytesSync();
  final blob = HarfbuzzBlob.tryFromBytes(bytes);
  if (blob == null) {
    print("Failed to create HarfBuzz blob.");
    exit(1);
  }

  final face = hb_face_create(blob.asNativeBlob, 0);

  final input = hb_subset_input_create_or_fail();

  final currentFlags = hb_subset_input_get_flags(input);
  hb_subset_input_set_flags(
    input,
    currentFlags.value |
        hb_subset_flags_t.HB_SUBSET_FLAGS_OPTIMIZE_IUP_DELTAS.value |
        hb_subset_flags_t.HB_SUBSET_FLAGS_GLYPH_NAMES.value |
        hb_subset_flags_t.HB_SUBSET_FLAGS_PASSTHROUGH_UNRECOGNIZED.value,
  );

  final unicodeSet = hb_subset_input_unicode_set(input);

  hb_set_clear(unicodeSet);
  hb_set_invert(unicodeSet);

  if (rond != null) {
    const tagString = "ROND";
    final tag = using((allocator) {
      final tagStringPointer = tagString.toNativeUtf8(allocator: allocator);
      return hb_tag_from_string(tagStringPointer.cast(), tagString.length);
    }, malloc);
    hb_subset_input_pin_axis_location(input, face, tag, rond);
  }

  final newFace = hb_subset_or_fail(face, input);
  if (newFace == nullptr) {
    print("Subsetting failed. Check the input font and options.");
    exit(1);
  }

  final resultBlob = hb_face_reference_blob(newFace);
  final lengthPtr = calloc<UnsignedInt>();
  final resultData = hb_blob_get_data(resultBlob, lengthPtr);

  File(
    outputPath,
  ).writeAsBytesSync(resultData.cast<Uint8>().asTypedList(lengthPtr.value));
  print("Saved to $outputPath");

  calloc.free(lengthPtr);
  hb_blob_destroy(resultBlob);
  hb_face_destroy(newFace);
  hb_subset_input_destroy(input);
  hb_face_destroy(face);
  blob.dispose();
}
