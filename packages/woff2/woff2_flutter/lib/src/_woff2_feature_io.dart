import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:woff2_ffi/woff2_ffi_bindings.dart';
import 'package:woff2_flutter/woff2_flutter.dart';

@immutable
class Woff2FontLoaderFeature implements FontLoaderFeature {
  const Woff2FontLoaderFeature();

  @override
  Future<bool> tryLoadFont(Uint8List list, String family) async {
    const Allocator allocator = calloc;
    final nativeFree = calloc.nativeFree;
    return using((arena) async {
      final bytesLength = list.length;
      final bytesPointer = arena<Uint8>(bytesLength);
      bytesPointer.asTypedList(bytesLength).setAll(0, list);

      final uncompressedSize = woff2_compute_final_size(
        bytesPointer,
        bytesLength,
      );
      if (uncompressedSize <= 0) return false;

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
        if (!status) return false;

        final uncompressedBytesLength = woff2_memory_out_size(memoryOutPointer);
        if (uncompressedBytesLength <= 0) return false;

        final uncompressedBytes = uncompressedBytesPointer.asTypedList(
          uncompressedBytesLength,
          finalizer: nativeFree,
        );
        uncompressedBytesLoose = false;

        const fallbackFeature = FallbackFontLoaderFeature();
        return fallbackFeature.tryLoadFont(uncompressedBytes, family);
      } finally {
        if (uncompressedBytesLoose) {
          allocator.free(uncompressedBytesPointer);
        }
      }
    }, allocator);
  }
}
