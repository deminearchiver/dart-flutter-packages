import 'package:flutter/foundation.dart';
import 'package:woff2_flutter/woff2_flutter.dart';

@immutable
class const Woff2FontLoaderFeature() implements FontLoaderFeature {
  @override
  Future<bool> tryLoadFont(Uint8List list, String family) async => false;
}
