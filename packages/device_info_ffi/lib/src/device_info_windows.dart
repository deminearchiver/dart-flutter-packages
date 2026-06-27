import 'dart:ffi';
import 'dart:developer' as developer;

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:device_info_ffi/device_info_ffi.dart';
import 'package:win32/win32.dart';
import 'package:win32_registry/win32_registry.dart';

class DeviceInfoWindows extends DeviceInfoPlatform {
  DeviceInfoWindows();

  WindowsDeviceInfo? _cachedWindowsDeviceInfo;

  @override
  WindowsDeviceInfo deviceInfo() => _cachedWindowsDeviceInfo ??= getInfo();

  final void Function(Pointer<OSVERSIONINFOEX>) _rtlGetVersion =
      DynamicLibrary.open("ntdll.dll").lookupFunction<
        Void Function(Pointer<OSVERSIONINFOEX>),
        void Function(Pointer<OSVERSIONINFOEX>)
      >("RtlGetVersion");

  @visibleForTesting
  WindowsDeviceInfo getInfo() {
    final systemInfo = calloc<SYSTEM_INFO>();
    final osVersionInfo = calloc<OSVERSIONINFOEX>()
      ..ref.dwOSVersionInfoSize = sizeOf<OSVERSIONINFOEX>();

    try {
      final currentVersionKey = LOCAL_MACHINE.open(
        r"SOFTWARE\Microsoft\Windows NT\CurrentVersion",
      );
      final buildLab = currentVersionKey.getString("BuildLab") ?? "";
      final buildLabEx = currentVersionKey.getString("BuildLabEx") ?? "";
      final digitalProductId =
          currentVersionKey.getBinary("DigitalProductId") ??
          Uint8List.fromList([]);
      final displayVersion =
          currentVersionKey.getString("DisplayVersion") ?? "";
      final editionId = currentVersionKey.getString("EditionID") ?? "";
      final installDate = DateTime.fromMillisecondsSinceEpoch(
        1000 * (currentVersionKey.getInt("InstallDate") ?? 0),
      );
      final productId = currentVersionKey.getString("ProductID") ?? "";
      var productName = currentVersionKey.getString("ProductName") ?? "";
      final registeredOwner =
          currentVersionKey.getString("RegisteredOwner") ?? "";
      final releaseId = currentVersionKey.getString("ReleaseId") ?? "";

      final sqmClientKey = LOCAL_MACHINE.open(r"SOFTWARE\Microsoft\SQMClient");
      final machineId = sqmClientKey.getString("MachineId") ?? "";

      GetSystemInfo(systemInfo);

      // Use `RtlGetVersion` from `ntdll.dll` to get the Windows version.
      _rtlGetVersion(osVersionInfo);

      // Handle [productName] for Windows 11 separately (as per Raymond Chen's comment).
      // https://stackoverflow.com/questions/69460588/how-can-i-find-the-windows-product-name-in-windows-11
      if (osVersionInfo.ref.dwBuildNumber >= 22000) {
        productName = productName.replaceAll("10", "11");
      }
      final data = WindowsDeviceInfo(
        numberOfCores: systemInfo.ref.dwNumberOfProcessors,
        computerName: getComputerName(),
        systemMemoryInMegabytes: getSystemMemoryInMegabytes(),
        userName: getUserName(),
        majorVersion: osVersionInfo.ref.dwMajorVersion,
        minorVersion: osVersionInfo.ref.dwMinorVersion,
        buildNumber: osVersionInfo.ref.dwBuildNumber,
        platformId: osVersionInfo.ref.dwPlatformId,
        csdVersion: osVersionInfo.ref.szCSDVersion,
        servicePackMajor: osVersionInfo.ref.wServicePackMajor,
        servicePackMinor: osVersionInfo.ref.wServicePackMinor,
        suitMask: osVersionInfo.ref.wSuiteMask,
        productType: osVersionInfo.ref.wProductType,
        reserved: 0,
        buildLab: buildLab,
        buildLabEx: buildLabEx,
        digitalProductId: digitalProductId,
        displayVersion: displayVersion,
        editionId: editionId,
        installDate: installDate,
        productId: productId,
        productName: productName,
        registeredOwner: registeredOwner,
        releaseId: releaseId,
        deviceId: machineId,
      );
      return data;
    } finally {
      free(systemInfo);
      free(osVersionInfo);
    }
  }

  @visibleForTesting
  int getSystemMemoryInMegabytes() {
    final memoryInKilobytes = calloc<ULONGLONG>();
    try {
      final result = GetPhysicallyInstalledSystemMemory(memoryInKilobytes);
      if (result.value) {
        return memoryInKilobytes.value ~/ 1024;
      } else {
        developer.log("Failed to get system memory", error: result.error);
        return 0;
      }
    } finally {
      free(memoryInKilobytes);
    }
  }

  @visibleForTesting
  String getComputerName() {
    // We call this a first time to get the length of the string in characters,
    // so we can allocate sufficient memory.
    final nSize = calloc<DWORD>();
    GetComputerNameEx(ComputerNameDnsFullyQualified, null, nSize);

    // Now allocate memory for a native string and call this a second time.
    final lpBuffer = wsalloc(nSize.value);
    try {
      final result = GetComputerNameEx(
        ComputerNameDnsFullyQualified,
        lpBuffer,
        nSize,
      );

      if (result.value) {
        return lpBuffer.toDartString();
      } else {
        developer.log("Failed to get computer name", error: result.error);
        return "";
      }
    } finally {
      free(lpBuffer);
      free(nSize);
    }
  }

  @visibleForTesting
  String getUserName() {
    const maxLength = 256; // defined as UNLEN in Lmcons.h
    final lpBuffer = wsalloc(maxLength + 1); // allow for terminating null
    final pcbBuffer = calloc<DWORD>()..value = maxLength + 1;
    try {
      final result = GetUserName(lpBuffer, pcbBuffer);
      if (result.value) {
        return lpBuffer.toDartString();
      } else {
        developer.log("Failed to get user name", error: result.error);
        return "";
      }
    } finally {
      free(pcbBuffer);
      free(lpBuffer);
    }
  }

  static void registerWith() {
    DeviceInfoPlatform.instance = DeviceInfoWindows();
  }
}
