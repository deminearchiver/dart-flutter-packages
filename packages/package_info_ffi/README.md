# Package Info FFI

An FFI-based version of the package_info_plus plugin.

## Getting started

```sh
flutter pub add package_info_ffi
```

## Usage


You can use the PackageInfo to query information about the application package.
```dart
import 'package:package_info_ffi/package_info_ffi.dart';

...

// Be sure to add this line if `PackageInfo.fromPlatform()` is called before runApp()
WidgetsFlutterBinding.ensureInitialized();

...

final packageInfo = PackageInfo.fromPlatform();

final appName = packageInfo.appName;
final packageName = packageInfo.packageName;
final version = packageInfo.version;
final buildNumber = packageInfo.buildNumber;
```


### Installer Store

The `installerStore` property indicates which app store installed the application.
This is useful for directing users to the appropriate store page for ratings or updates.

```dart
final packageInfo = PackageInfo.fromPlatform();
final installerStore = packageInfo.installerStore;
```

#### Android

On Android, the value is the package name of the app store that installed the application, obtained via `PackageManager.getInstallSourceInfo()` (Android 11+) or `PackageManager.getInstallerPackageName()` (older versions).

| Store | `installerStore` value |
|-------|------------------------|
| Google Play Store | `com.android.vending` |
| Amazon Appstore | `com.amazon.venezia` |
| Samsung Galaxy Store | `com.sec.android.app.samsungapps` |
| Huawei AppGallery | `com.huawei.appmarket` |
| Xiaomi GetApps | `com.xiaomi.mipicks` |
| OPPO App Market | `com.oppo.market` |
| VIVO App Store | `com.vivo.appstore` |
| Manual/ADB install | `null` |

**Note:** Some stores may not properly implement the installer package name API, which could result in `null` being returned even for store installations.

## Additional information
