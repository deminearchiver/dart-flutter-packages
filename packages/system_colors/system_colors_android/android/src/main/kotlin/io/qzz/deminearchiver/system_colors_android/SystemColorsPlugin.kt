@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import androidx.annotation.Keep

// Avoid exposing overrides: they get ugly $1, $2 suffixes or something similar.

// Activity inherits from Context - no need to create separate overloads.

@Keep
object SystemColorsPlugin {
    @JvmStatic
    fun isDynamicColorAvailable() = true

    @JvmStatic
    fun tonalPalettes(context: Context, sentinel: Int) = SystemColorsTonalPalettes.fromContext(context, sentinel)

    @JvmStatic
    fun lightColorScheme(context: Context, sentinel: Int) = SystemColorsDynamicScheme.lightFromContext(context, sentinel)

    @JvmStatic
    fun darkColorScheme(context: Context, sentinel: Int) = SystemColorsDynamicScheme.darkFromContext(context, sentinel)
}
