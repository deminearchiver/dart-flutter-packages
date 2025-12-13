// import 'package:flutter_test/flutter_test.dart';
// import 'package:package_info_ffi/package_info_ffi.dart';
// import 'package:package_info_ffi/package_info_ffi_platform_interface.dart';
// import 'package:package_info_ffi/package_info_ffi_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockPackageInfoFfiPlatform
//     with MockPlatformInterfaceMixin
//     implements PackageInfoFfiPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final PackageInfoFfiPlatform initialPlatform = PackageInfoFfiPlatform.instance;

//   test('$MethodChannelPackageInfoFfi is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelPackageInfoFfi>());
//   });

//   test('getPlatformVersion', () async {
//     PackageInfoFfi packageInfoFfiPlugin = PackageInfoFfi();
//     MockPackageInfoFfiPlatform fakePlatform = MockPackageInfoFfiPlatform();
//     PackageInfoFfiPlatform.instance = fakePlatform;

//     expect(await packageInfoFfiPlugin.getPlatformVersion(), '42');
//   });
// }
