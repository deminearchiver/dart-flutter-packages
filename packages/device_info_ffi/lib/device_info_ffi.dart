library;

export 'device_info_ffi_platform_interface.dart';

export 'src/device_info_default.dart';

export 'src/device_info_android.dart'
    if (dart.library.js_interop) 'src/device_info_web.dart';
export 'src/device_info_linux.dart'
    if (dart.library.js_interop) 'src/device_info_web.dart';
export 'src/device_info_windows.dart'
    if (dart.library.js_interop) 'src/device_info_web.dart';

export 'src/device_info.dart';
