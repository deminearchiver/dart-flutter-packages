// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:embedded_photo_picker/embedded_photo_picker_method_channel.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   MethodChannelEmbeddedPhotoPicker platform = MethodChannelEmbeddedPhotoPicker();
//   const MethodChannel channel = MethodChannel('embedded_photo_picker');

//   setUp(() {
//     TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
//         .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
//           return '42';
//         });
//   });

//   tearDown(() {
//     TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
//         .setMockMethodCallHandler(channel, null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await platform.getPlatformVersion(), '42');
//   });
// }
