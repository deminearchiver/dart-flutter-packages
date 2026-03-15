package io.github.deminearchiver.system_colors_android

import androidx.annotation.FloatRange
import androidx.annotation.Keep
import com.google.android.material.color.DynamicColors

@Suppress("unused")
@Keep
object SystemColorsPlugin {
  @JvmStatic
  fun isDynamicColorAvailable(): Boolean {
    return DynamicColors.isDynamicColorAvailable()
  }
}
