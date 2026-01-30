package dev.deminearchiver.embedded_photo_picker

import android.content.Context
import android.os.Build
import android.view.View
import androidx.annotation.RequiresExtension
import androidx.photopicker.EmbeddedPhotoPickerView
import androidx.photopicker.ExperimentalPhotoPickerApi
import io.flutter.plugin.platform.PlatformView

@OptIn(ExperimentalPhotoPickerApi::class)
@RequiresExtension(extension = Build.VERSION_CODES.UPSIDE_DOWN_CAKE, version = 15)
class EmbeddedPhotoPickerPlatformView(context: Context) : PlatformView {
  private val picker: EmbeddedPhotoPickerView = EmbeddedPhotoPickerView(context)

  override fun getView(): View = picker

  override fun dispose() {}

}
