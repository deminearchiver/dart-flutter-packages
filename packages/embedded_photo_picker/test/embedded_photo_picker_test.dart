// import 'package:flutter_test/flutter_test.dart';
// import 'package:embedded_photo_picker/embedded_photo_picker.dart';
// import 'package:embedded_photo_picker/embedded_photo_picker_platform_interface.dart';
// import 'package:embedded_photo_picker/embedded_photo_picker_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockEmbeddedPhotoPickerPlatform
//     with MockPlatformInterfaceMixin
//     implements EmbeddedPhotoPickerPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final EmbeddedPhotoPickerPlatform initialPlatform = EmbeddedPhotoPickerPlatform.instance;

//   test('$MethodChannelEmbeddedPhotoPicker is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelEmbeddedPhotoPicker>());
//   });

//   test('getPlatformVersion', () async {
//     EmbeddedPhotoPicker embeddedPhotoPickerPlugin = EmbeddedPhotoPicker();
//     MockEmbeddedPhotoPickerPlatform fakePlatform = MockEmbeddedPhotoPickerPlatform();
//     EmbeddedPhotoPickerPlatform.instance = fakePlatform;

//     expect(await embeddedPhotoPickerPlugin.getPlatformVersion(), '42');
//   });
// }
