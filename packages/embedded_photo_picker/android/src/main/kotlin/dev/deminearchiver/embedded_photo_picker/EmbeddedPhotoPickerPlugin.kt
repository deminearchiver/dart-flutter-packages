package dev.deminearchiver.embedded_photo_picker

import androidx.annotation.Keep
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

@Keep
class EmbeddedPhotoPickerPlugin : FlutterPlugin, MethodCallHandler {
  // The MethodChannel that will the communication between Flutter and native Android
  //
  // This local reference serves to register the plugin with the Flutter Engine and unregister it
  // when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    flutterPluginBinding.platformViewRegistry.registerViewFactory("embedded_photo_picker",
      EmbeddedPhotoPickerPlatformViewFactory()
    )
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "embedded_photo_picker")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(
      call: MethodCall,
      result: Result
  ) {
    if (call.method == "getPlatformVersion") {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
        result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
