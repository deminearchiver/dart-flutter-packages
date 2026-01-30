
import 'embedded_photo_picker_platform_interface.dart';

class EmbeddedPhotoPicker {
  Future<String?> getPlatformVersion() {
    return EmbeddedPhotoPickerPlatform.instance.getPlatformVersion();
  }
}
