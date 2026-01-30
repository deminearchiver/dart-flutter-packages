import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'embedded_photo_picker_method_channel.dart';

abstract class EmbeddedPhotoPickerPlatform extends PlatformInterface {
  /// Constructs a EmbeddedPhotoPickerPlatform.
  EmbeddedPhotoPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static EmbeddedPhotoPickerPlatform _instance = MethodChannelEmbeddedPhotoPicker();

  /// The default instance of [EmbeddedPhotoPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelEmbeddedPhotoPicker].
  static EmbeddedPhotoPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EmbeddedPhotoPickerPlatform] when
  /// they register themselves.
  static set instance(EmbeddedPhotoPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
