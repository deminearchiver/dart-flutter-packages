import 'package:jni/jni.dart';
import 'package:jni_flutter/jni_flutter.dart';
import 'package:device_info_ffi/device_info_ffi_platform_interface.dart';

import 'jni_bindings.dart' as jb;

class DeviceInfoAndroid extends DeviceInfoPlatform {
  DeviceInfoAndroid();

  /// This information does not change from call to call. Cache it.
  AndroidDeviceInfo? _cachedAndroidDeviceInfo;

  @override
  AndroidDeviceInfo deviceInfo() =>
      _cachedAndroidDeviceInfo ??= _androidDeviceInfo();

  static void registerWith() {
    DeviceInfoPlatform.instance = DeviceInfoAndroid();
  }

  static AndroidDeviceInfo _androidDeviceInfo() => androidApplicationContext
      .use(jb.DeviceInfoPlugin.getDeviceInfo)
      .use(_androidDeviceInfoFromNative);

  static AndroidBuildVersion _androidBuildVersionFromNative(
    jb.DeviceInfo$BuildVersion object,
  ) => AndroidBuildVersion(
    baseOS: object.baseOS?.toDartString(releaseOriginal: true),
    codename: object.codename.toDartString(releaseOriginal: true),
    incremental: object.incremental.toDartString(releaseOriginal: true),
    previewSdkInt: object.previewSdkInt?.toDartInt(releaseOriginal: true),
    release: object.release$1.toDartString(releaseOriginal: true),
    sdkInt: object.sdkInt,
    securityPatch: object.securityPatch?.toDartString(releaseOriginal: true),
  );

  static AndroidDeviceInfo _androidDeviceInfoFromNative(
    jb.DeviceInfo object,
  ) => AndroidDeviceInfo(
    version: object.version.use(_androidBuildVersionFromNative),
    board: object.board.toDartString(releaseOriginal: true),
    bootloader: object.bootloader.toDartString(releaseOriginal: true),
    brand: object.brand.toDartString(releaseOriginal: true),
    device: object.device.toDartString(releaseOriginal: true),
    display: object.display.toDartString(releaseOriginal: true),
    fingerprint: object.fingerprint.toDartString(releaseOriginal: true),
    hardware: object.hardware.toDartString(releaseOriginal: true),
    host: object.host.toDartString(releaseOriginal: true),
    id: object.id.toDartString(releaseOriginal: true),
    manufacturer: object.manufacturer.toDartString(releaseOriginal: true),
    model: object.model.toDartString(releaseOriginal: true),
    product: object.product.toDartString(releaseOriginal: true),
    name: object.name?.toDartString(releaseOriginal: true) ?? "",
    supported32BitAbis:
        object.supported32BitAbis?._toDartStringList(releaseOriginal: true) ??
        const [],
    supported64BitAbis:
        object.supported64BitAbis?._toDartStringList(releaseOriginal: true) ??
        const [],
    supportedAbis:
        object.supportedAbis?._toDartStringList(releaseOriginal: true) ??
        const [],
    tags: object.tags.toDartString(releaseOriginal: true),
    type: object.type$1.toDartString(releaseOriginal: true),
    isPhysicalDevice: object.isPhysicalDevice,
    freeDiskSize: object.freeDiskSize,
    totalDiskSize: object.totalDiskSize,
    systemFeatures: object.systemFeatures._toDartStringList(
      releaseOriginal: true,
    ),
    isLowRamDevice: object.isLowRamDevice,
    physicalRamSize: object.physicalRamSize,
    availableRamSize: object.availableRamSize,
  );
}

extension on JList<JString> {
  List<String> _toDartStringList({bool releaseOriginal = false}) {
    final length = size();
    final result = <String>[
      for (var i = 0; i < length; i++)
        get(i)!.toDartString(releaseOriginal: releaseOriginal),
    ];
    if (releaseOriginal) {
      release();
    }
    return result;
  }
}
