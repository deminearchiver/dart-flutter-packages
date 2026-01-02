import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'package:lz4_ffi/lz4_ffi.dart' as lz4;

void main() {
  print(lz4.LZ4_versionNumber());
}
