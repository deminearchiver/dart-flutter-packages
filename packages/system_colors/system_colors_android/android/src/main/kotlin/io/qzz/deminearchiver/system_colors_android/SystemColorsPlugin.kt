@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import android.os.Build
import androidx.annotation.ColorInt
import androidx.annotation.Keep

// Avoid exposing overrides: they get ugly $1, $2 suffixes or something similar.

// Activity inherits from Context - no need to create separate overloads.

@Keep
object SystemColorsPlugin {
    internal const val TAG = "SystemColorsPlugin"

    @JvmStatic
    fun isDynamicColorAvailable() = true

    @JvmStatic
    fun dynamicPalette(context: Context, @ColorInt sentinel: Int) =
        DynamicTonalPalette.fromContext(context, sentinel)

    @JvmStatic
    fun dynamicScheme(context: Context, isDark: Boolean, @ColorInt sentinel: Int) =
        DynamicColorScheme.fromContext(context, isDark, sentinel)

    @JvmStatic
    fun lightDynamicScheme(context: Context, @ColorInt sentinel: Int) =
        DynamicColorScheme.lightFromContext(context, sentinel)

    @JvmStatic
    fun darkDynamicScheme(context: Context, @ColorInt sentinel: Int) =
        DynamicColorScheme.darkFromContext(context, sentinel)
}
