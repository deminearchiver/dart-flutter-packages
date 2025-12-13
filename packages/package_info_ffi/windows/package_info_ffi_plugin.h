#ifndef FLUTTER_PLUGIN_PACKAGE_INFO_FFI_PLUGIN_H_
#define FLUTTER_PLUGIN_PACKAGE_INFO_FFI_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace package_info_ffi {

class PackageInfoFfiPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PackageInfoFfiPlugin();

  virtual ~PackageInfoFfiPlugin();

  // Disallow copy and assign.
  PackageInfoFfiPlugin(const PackageInfoFfiPlugin&) = delete;
  PackageInfoFfiPlugin& operator=(const PackageInfoFfiPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace package_info_ffi

#endif  // FLUTTER_PLUGIN_PACKAGE_INFO_FFI_PLUGIN_H_
