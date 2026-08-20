import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:ffi_leak_tracker/ffi_leak_tracker.dart';
import 'package:flutter/foundation.dart';
import 'package:woff2_ffi/woff2_ffi_bindings.dart';
import 'package:woff2_flutter/woff2_flutter.dart';

bool _isWoff2(Uint8List bytes) =>
    bytes.length >= 4 &&
    bytes[0] == 0x77 &&
    bytes[1] == 0x4F &&
    bytes[2] == 0x46 &&
    bytes[3] == 0x32;

Uint8List? _tryConvertWoff2ToTtf(Uint8List bytes) {
  if (!_isWoff2(bytes)) return null;
  const allocator = adaptiveCalloc;
  return using((arena) {
    final bytesLength = bytes.length;
    final bytesPointer = arena<Uint8>(bytesLength);
    bytesPointer.asTypedList(bytesLength).setAll(0, bytes);

    final uncompressedSize = woff2_compute_final_size(
      bytesPointer,
      bytesLength,
    );
    if (uncompressedSize <= 0) return null;

    final uncompressedBytesPointer = allocator<Uint8>(uncompressedSize);
    var uncompressedBytesLoose = true;

    try {
      final memoryOutPointer = woff2_memory_out_create(
        uncompressedBytesPointer,
        uncompressedSize,
      );
      arena.onReleaseAll(() => woff2_memory_out_destroy(memoryOutPointer));

      final status = woff2_convert_to_ttf(
        bytesPointer,
        bytesLength,
        memoryOutPointer.cast<woff2_out_t>(),
      );
      if (!status) return null;

      final uncompressedBytesLength = woff2_memory_out_size(memoryOutPointer);
      if (uncompressedBytesLength <= 0) return null;

      final uncompressedBytes = uncompressedBytesPointer.asTypedList(
        uncompressedBytesLength,
        finalizer: allocator.nativeFree,
      );
      uncompressedBytesLoose = false;

      return uncompressedBytes;
    } finally {
      if (uncompressedBytesLoose) {
        allocator.free(uncompressedBytesPointer);
      }
    }
  }, allocator);
}

@immutable
class const Woff2FontLoaderFeature() implements FontLoaderFeature {
  @override
  Future<bool> tryLoadFont(Uint8List list, String family) async {
    final bytes = _tryConvertWoff2ToTtf(list);
    if (bytes == null) return false;
    const fallbackFeature = FallbackFontLoaderFeature();
    return await fallbackFeature.tryLoadFont(bytes, family);
  }
}
