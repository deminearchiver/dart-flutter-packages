#include "include/package_info_ffi/package_info_ffi_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "package_info_ffi_plugin.h"

void PackageInfoFfiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  package_info_ffi::PackageInfoFfiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
