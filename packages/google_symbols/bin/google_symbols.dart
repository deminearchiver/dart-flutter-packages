// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:harfbuzz_ffi/harfbuzz_ffi.dart';
import 'package:ffi/ffi.dart';

Future<void> main(List<String> arguments) async {
  final nativeVersion = hb_version_string();
  if (nativeVersion == nullptr) return;
  final version = nativeVersion.cast<Utf8>().toDartString();
  print("Using HarfBuzz version $version!");
}
