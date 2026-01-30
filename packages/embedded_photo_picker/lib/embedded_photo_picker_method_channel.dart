import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'embedded_photo_picker_platform_interface.dart';

/// An implementation of [EmbeddedPhotoPickerPlatform] that uses method channels.
class MethodChannelEmbeddedPhotoPicker extends EmbeddedPhotoPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('embedded_photo_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
