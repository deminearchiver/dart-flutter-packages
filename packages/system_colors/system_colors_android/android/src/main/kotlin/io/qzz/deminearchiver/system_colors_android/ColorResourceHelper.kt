@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import androidx.annotation.ColorInt
import androidx.annotation.Keep


internal object ColorResourceHelper {

}

@Keep
class SystemTonalPalettes private constructor(@field:JvmField var sentinel: Int) {
    @ColorInt @JvmField var primary0: Int = sentinel
    @ColorInt @JvmField var primary10: Int = sentinel
    @ColorInt @JvmField var primary20: Int = sentinel
    @ColorInt @JvmField var primary30: Int = sentinel
    @ColorInt @JvmField var primary40: Int = sentinel
    @ColorInt @JvmField var primary50: Int = sentinel
    @ColorInt @JvmField var primary60: Int = sentinel
    @ColorInt @JvmField var primary70: Int = sentinel
    @ColorInt @JvmField var primary80: Int = sentinel
    @ColorInt @JvmField var primary90: Int = sentinel
    @ColorInt @JvmField var primary95: Int = sentinel
    @ColorInt @JvmField var primary99: Int = sentinel
    @ColorInt @JvmField var primary100: Int = sentinel
    @ColorInt @JvmField var secondary0: Int = sentinel
    @ColorInt @JvmField var secondary10: Int = sentinel
    @ColorInt @JvmField var secondary20: Int = sentinel
    @ColorInt @JvmField var secondary30: Int = sentinel
    @ColorInt @JvmField var secondary40: Int = sentinel
    @ColorInt @JvmField var secondary50: Int = sentinel
    @ColorInt @JvmField var secondary60: Int = sentinel
    @ColorInt @JvmField var secondary70: Int = sentinel
    @ColorInt @JvmField var secondary80: Int = sentinel
    @ColorInt @JvmField var secondary90: Int = sentinel
    @ColorInt @JvmField var secondary95: Int = sentinel
    @ColorInt @JvmField var secondary99: Int = sentinel
    @ColorInt @JvmField var secondary100: Int = sentinel
    @ColorInt @JvmField var tertiary0: Int = sentinel
    @ColorInt @JvmField var tertiary10: Int = sentinel
    @ColorInt @JvmField var tertiary20: Int = sentinel
    @ColorInt @JvmField var tertiary30: Int = sentinel
    @ColorInt @JvmField var tertiary40: Int = sentinel
    @ColorInt @JvmField var tertiary50: Int = sentinel
    @ColorInt @JvmField var tertiary60: Int = sentinel
    @ColorInt @JvmField var tertiary70: Int = sentinel
    @ColorInt @JvmField var tertiary80: Int = sentinel
    @ColorInt @JvmField var tertiary90: Int = sentinel
    @ColorInt @JvmField var tertiary95: Int = sentinel
    @ColorInt @JvmField var tertiary99: Int = sentinel
    @ColorInt @JvmField var tertiary100: Int = sentinel
    @ColorInt @JvmField var neutral0: Int = sentinel
    @ColorInt @JvmField var neutral10: Int = sentinel
    @ColorInt @JvmField var neutral20: Int = sentinel
    @ColorInt @JvmField var neutral30: Int = sentinel
    @ColorInt @JvmField var neutral40: Int = sentinel
    @ColorInt @JvmField var neutral50: Int = sentinel
    @ColorInt @JvmField var neutral60: Int = sentinel
    @ColorInt @JvmField var neutral70: Int = sentinel
    @ColorInt @JvmField var neutral80: Int = sentinel
    @ColorInt @JvmField var neutral90: Int = sentinel
    @ColorInt @JvmField var neutral95: Int = sentinel
    @ColorInt @JvmField var neutral99: Int = sentinel
    @ColorInt @JvmField var neutral100: Int = sentinel
    @ColorInt @JvmField var neutralVariant0: Int = sentinel
    @ColorInt @JvmField var neutralVariant10: Int = sentinel
    @ColorInt @JvmField var neutralVariant20: Int = sentinel
    @ColorInt @JvmField var neutralVariant30: Int = sentinel
    @ColorInt @JvmField var neutralVariant40: Int = sentinel
    @ColorInt @JvmField var neutralVariant50: Int = sentinel
    @ColorInt @JvmField var neutralVariant60: Int = sentinel
    @ColorInt @JvmField var neutralVariant70: Int = sentinel
    @ColorInt @JvmField var neutralVariant80: Int = sentinel
    @ColorInt @JvmField var neutralVariant90: Int = sentinel
    @ColorInt @JvmField var neutralVariant95: Int = sentinel
    @ColorInt @JvmField var neutralVariant99: Int = sentinel
    @ColorInt @JvmField var neutralVariant100: Int = sentinel
    @ColorInt @JvmField var error0: Int = sentinel
    @ColorInt @JvmField var error10: Int = sentinel
    @ColorInt @JvmField var error20: Int = sentinel
    @ColorInt @JvmField var error30: Int = sentinel
    @ColorInt @JvmField var error40: Int = sentinel
    @ColorInt @JvmField var error50: Int = sentinel
    @ColorInt @JvmField var error60: Int = sentinel
    @ColorInt @JvmField var error70: Int = sentinel
    @ColorInt @JvmField var error80: Int = sentinel
    @ColorInt @JvmField var error90: Int = sentinel
    @ColorInt @JvmField var error95: Int = sentinel
    @ColorInt @JvmField var error99: Int = sentinel
    @ColorInt @JvmField var error100: Int = sentinel

    companion object {
        @JvmStatic
        fun empty(sentinel: Int) = SystemTonalPalettes(sentinel)


        @JvmStatic
        fun fromContext(context: Context, sentinel: Int) {

        }
    }
}

@Keep
class SystemColorScheme private constructor(@field:JvmField var sentinel: Int) {
    @ColorInt @JvmField var primaryPaletteKeyColor: Int = sentinel
    @ColorInt @JvmField var secondaryPaletteKeyColor: Int = sentinel
    @ColorInt @JvmField var tertiaryPaletteKeyColor: Int = sentinel
    @ColorInt @JvmField var neutralPaletteKeyColor: Int = sentinel
    @ColorInt @JvmField var neutralVariantPaletteKeyColor: Int = sentinel
    @ColorInt @JvmField var errorPaletteKeyColor: Int = sentinel
    @ColorInt @JvmField var background: Int = sentinel
    @ColorInt @JvmField var onBackground: Int = sentinel
    @ColorInt @JvmField var surface: Int = sentinel
    @ColorInt @JvmField var surfaceDim: Int = sentinel
    @ColorInt @JvmField var surfaceBright: Int = sentinel
    @ColorInt @JvmField var surfaceContainerLowest: Int = sentinel
    @ColorInt @JvmField var surfaceContainerLow: Int = sentinel
    @ColorInt @JvmField var surfaceContainer: Int = sentinel
    @ColorInt @JvmField var surfaceContainerHigh: Int = sentinel
    @ColorInt @JvmField var surfaceContainerHighest: Int = sentinel
    @ColorInt @JvmField var onSurface: Int = sentinel
    @ColorInt @JvmField var surfaceVariant: Int = sentinel
    @ColorInt @JvmField var onSurfaceVariant: Int = sentinel
    @ColorInt @JvmField var outline: Int = sentinel
    @ColorInt @JvmField var outlineVariant: Int = sentinel
    @ColorInt @JvmField var inverseSurface: Int = sentinel
    @ColorInt @JvmField var inverseOnSurface: Int = sentinel
    @ColorInt @JvmField var shadow: Int = sentinel
    @ColorInt @JvmField var scrim: Int = sentinel
    @ColorInt @JvmField var surfaceTint: Int = sentinel
    @ColorInt @JvmField var primary: Int = sentinel
    @ColorInt @JvmField var primaryDim: Int = sentinel
    @ColorInt @JvmField var onPrimary: Int = sentinel
    @ColorInt @JvmField var primaryContainer: Int = sentinel
    @ColorInt @JvmField var onPrimaryContainer: Int = sentinel
    @ColorInt @JvmField var primaryFixed: Int = sentinel
    @ColorInt @JvmField var primaryFixedDim: Int = sentinel
    @ColorInt @JvmField var onPrimaryFixed: Int = sentinel
    @ColorInt @JvmField var onPrimaryFixedVariant: Int = sentinel
    @ColorInt @JvmField var inversePrimary: Int = sentinel
    @ColorInt @JvmField var secondary: Int = sentinel
    @ColorInt @JvmField var secondaryDim: Int = sentinel
    @ColorInt @JvmField var onSecondary: Int = sentinel
    @ColorInt @JvmField var secondaryContainer: Int = sentinel
    @ColorInt @JvmField var onSecondaryContainer: Int = sentinel
    @ColorInt @JvmField var secondaryFixed: Int = sentinel
    @ColorInt @JvmField var secondaryFixedDim: Int = sentinel
    @ColorInt @JvmField var onSecondaryFixed: Int = sentinel
    @ColorInt @JvmField var onSecondaryFixedVariant: Int = sentinel
    @ColorInt @JvmField var tertiary: Int = sentinel
    @ColorInt @JvmField var tertiaryDim: Int = sentinel
    @ColorInt @JvmField var onTertiary: Int = sentinel
    @ColorInt @JvmField var tertiaryContainer: Int = sentinel
    @ColorInt @JvmField var onTertiaryContainer: Int = sentinel
    @ColorInt @JvmField var tertiaryFixed: Int = sentinel
    @ColorInt @JvmField var tertiaryFixedDim: Int = sentinel
    @ColorInt @JvmField var onTertiaryFixed: Int = sentinel
    @ColorInt @JvmField var onTertiaryFixedVariant: Int = sentinel
    @ColorInt @JvmField var error: Int = sentinel
    @ColorInt @JvmField var errorDim: Int = sentinel
    @ColorInt @JvmField var onError: Int = sentinel
    @ColorInt @JvmField var errorContainer: Int = sentinel
    @ColorInt @JvmField var onErrorContainer: Int = sentinel
    @ColorInt @JvmField var controlActivated: Int = sentinel
    @ColorInt @JvmField var controlNormal: Int = sentinel
    @ColorInt @JvmField var controlHighlight: Int = sentinel
    @ColorInt @JvmField var textPrimaryInverse: Int = sentinel
    @ColorInt @JvmField var textSecondaryAndTertiaryInverse: Int = sentinel
    @ColorInt @JvmField var textPrimaryInverseDisableOnly: Int = sentinel
    @ColorInt @JvmField var textSecondaryAndTertiaryInverseDisabled: Int = sentinel
    @ColorInt @JvmField var textHintInverse: Int = sentinel

    companion object {
        @JvmStatic
        fun empty(sentinel: Int) = SystemColorScheme(sentinel)

        @JvmStatic
        fun lightFromContext(context: Context, sentinel: Int) {

        }

        @JvmStatic
        fun darkFromContext(context: Context, sentinel: Int) {

        }
    }
}
