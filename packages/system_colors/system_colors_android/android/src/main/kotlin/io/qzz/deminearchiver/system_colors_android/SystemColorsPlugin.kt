@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import androidx.annotation.ColorInt
import androidx.annotation.Keep

// Avoid exposing overrides: they get ugly $1, $2 suffixes or something similar.

// Activity inherits from Context - no need to create separate overloads.

@Keep
object SystemColorsPlugin {
    @JvmStatic
    fun isDynamicColorAvailable() = true

    @JvmStatic
    fun tonalPalettes(context: Context, @ColorInt sentinel: Int) =
        SystemColorsTonalPalettes.fromContext(context, sentinel)

    @JvmStatic
    fun colorScheme(context: Context, isDark: Boolean, @ColorInt sentinel: Int) =
        SystemColorsDynamicScheme.fromContext(context, isDark, sentinel)

    @JvmStatic
    fun lightColorScheme(context: Context, @ColorInt sentinel: Int) =
        SystemColorsDynamicScheme.lightFromContext(context, sentinel)

    @JvmStatic
    fun darkColorScheme(context: Context, @ColorInt sentinel: Int) =
        SystemColorsDynamicScheme.darkFromContext(context, sentinel)
}
