import 'dart:convert';
import 'dart:ffi';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

import 'package:lz4_ffi/src/ffi_bindings.dart' as fb;

/// Constant used for RNG seed
const tutoneConstant = 8675309;

/// Return generated pseudo-random bytes
Uint8List generateRandomBytes(int length) {
  final random = math.Random(tutoneConstant);
  final list = Uint8List(length);
  for (var i = 0; i < length; i++) {
    list[i] = random.nextInt(256);
  }
  return list;
}

/// Return bytes with a single value
Uint8List generateConstantBytes(int length) =>
    Uint8List(length)..fillRange(0, length, 1);

void main() {
  final data = generateRandomBytes(1024 * 1024);
  final compressed = _compress(data);
  final decompressed = _decompress(compressed, data.lengthInBytes);

  // final value = List.filled(100, "Hello world!").join(" ");

  // final data = value.toUint8List();

  // final compressed = _compress(data);

  // print("Before: $data");
  // // print(compressed);

  // final decompressed = _decompress(compressed, data.lengthInBytes);

  // // print(decompressed);
  // print(" After: ${decompressed.toDartString()}");

  print(
    " Ratio: "
    "${compressed.lengthInBytes} / ${decompressed.lengthInBytes} = "
    "${compressed.lengthInBytes / data.lengthInBytes}",
  );
}

Uint8List _compress(Uint8List data, {Allocator allocator = malloc}) {
  final sourceSize = data.lengthInBytes;
  final source = allocator<Uint8>(sourceSize)
    ..asTypedList(sourceSize).setAll(0, data);

  final maxDestinationSize = fb.LZ4_compressBound(sourceSize);
  final destination = allocator<Uint8>(maxDestinationSize);

  final destinationSize = fb.LZ4_compress_default(
    source.cast(),
    destination.cast(),
    sourceSize,
    maxDestinationSize,
  );

  return destination.asTypedList(destinationSize);
}

Uint8List _decompress(
  Uint8List data,
  int maxDestinationSize, {
  Allocator allocator = malloc,
}) {
  final sourceSize = data.lengthInBytes;
  final source = allocator<Uint8>(sourceSize);
  source.asTypedList(sourceSize).setAll(0, data);

  final destination = allocator<Uint8>(maxDestinationSize);

  final destinationSize = fb.LZ4_decompress_safe(
    source.cast(),
    destination.cast(),
    sourceSize,
    maxDestinationSize,
  );

  return destination.asTypedList(destinationSize);
}

extension StringUint8List on String {
  Uint8List toUint8List() {
    final units = utf8.encode(this);
    final builder = BytesBuilder(copy: false)
      ..add(units)
      ..addByte(0);
    return builder.takeBytes();
  }
}

extension Uint8ListString on Uint8List {
  String toDartString() => utf8.decode(this);
}
