#include "include/permissions_ffi/permissions_ffi_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "permissions_ffi_plugin.h"

void PermissionsFfiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  permissions_ffi::PermissionsFfiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
