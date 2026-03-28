#ifndef FLUTTER_PLUGIN_SYSTEM_COLORS_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_SYSTEM_COLORS_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace system_colors_windows {

class SystemColorsWindowsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SystemColorsWindowsPlugin();

  virtual ~SystemColorsWindowsPlugin();

  // Disallow copy and assign.
  SystemColorsWindowsPlugin(const SystemColorsWindowsPlugin&) = delete;
  SystemColorsWindowsPlugin& operator=(const SystemColorsWindowsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace system_colors_windows

#endif  // FLUTTER_PLUGIN_SYSTEM_COLORS_WINDOWS_PLUGIN_H_
