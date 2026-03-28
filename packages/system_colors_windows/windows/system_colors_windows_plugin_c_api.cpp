#include "include/system_colors_windows/system_colors_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "system_colors_windows_plugin.h"

void SystemColorsWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  system_colors_windows::SystemColorsWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
