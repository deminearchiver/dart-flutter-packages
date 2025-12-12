#ifndef FLUTTER_PLUGIN_PERMISSIONS_FFI_PLUGIN_H_
#define FLUTTER_PLUGIN_PERMISSIONS_FFI_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace permissions_ffi {

class PermissionsFfiPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PermissionsFfiPlugin();

  virtual ~PermissionsFfiPlugin();

  // Disallow copy and assign.
  PermissionsFfiPlugin(const PermissionsFfiPlugin&) = delete;
  PermissionsFfiPlugin& operator=(const PermissionsFfiPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace permissions_ffi

#endif  // FLUTTER_PLUGIN_PERMISSIONS_FFI_PLUGIN_H_
