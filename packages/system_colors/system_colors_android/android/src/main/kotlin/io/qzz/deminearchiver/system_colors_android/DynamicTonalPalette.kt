@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import android.os.Build
import android.R.color.*
import androidx.annotation.ColorInt
import androidx.annotation.Keep

@Keep
class DynamicTonalPalette private constructor(
    @param:ColorInt @field:ColorInt @field:JvmField val primary0: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary10: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary20: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary30: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary40: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary50: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary60: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary70: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary80: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary90: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary95: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary99: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary100: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary0: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary10: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary20: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary30: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary40: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary50: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary60: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary70: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary80: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary90: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary95: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary99: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary100: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary0: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary10: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary20: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary30: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary40: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary50: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary60: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary70: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary80: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary90: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary95: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary99: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary100: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral0: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral10: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral20: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral30: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral40: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral50: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral60: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral70: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral80: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral90: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral95: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral99: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutral100: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant0: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant10: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant20: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant30: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant40: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant50: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant60: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant70: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant80: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant90: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant95: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant99: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariant100: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error0: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error10: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error20: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error30: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error40: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error50: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error60: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error70: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error80: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error90: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error95: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error99: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error100: Int,
) {
    private class Builder {
        @ColorInt
        var primary0: Int? = null

        @ColorInt
        var primary10: Int? = null

        @ColorInt
        var primary20: Int? = null

        @ColorInt
        var primary30: Int? = null

        @ColorInt
        var primary40: Int? = null

        @ColorInt
        var primary50: Int? = null

        @ColorInt
        var primary60: Int? = null

        @ColorInt
        var primary70: Int? = null

        @ColorInt
        var primary80: Int? = null

        @ColorInt
        var primary90: Int? = null

        @ColorInt
        var primary95: Int? = null

        @ColorInt
        var primary99: Int? = null

        @ColorInt
        var primary100: Int? = null

        @ColorInt
        var secondary0: Int? = null

        @ColorInt
        var secondary10: Int? = null

        @ColorInt
        var secondary20: Int? = null

        @ColorInt
        var secondary30: Int? = null

        @ColorInt
        var secondary40: Int? = null

        @ColorInt
        var secondary50: Int? = null

        @ColorInt
        var secondary60: Int? = null

        @ColorInt
        var secondary70: Int? = null

        @ColorInt
        var secondary80: Int? = null

        @ColorInt
        var secondary90: Int? = null

        @ColorInt
        var secondary95: Int? = null

        @ColorInt
        var secondary99: Int? = null

        @ColorInt
        var secondary100: Int? = null

        @ColorInt
        var tertiary0: Int? = null

        @ColorInt
        var tertiary10: Int? = null

        @ColorInt
        var tertiary20: Int? = null

        @ColorInt
        var tertiary30: Int? = null

        @ColorInt
        var tertiary40: Int? = null

        @ColorInt
        var tertiary50: Int? = null

        @ColorInt
        var tertiary60: Int? = null

        @ColorInt
        var tertiary70: Int? = null

        @ColorInt
        var tertiary80: Int? = null

        @ColorInt
        var tertiary90: Int? = null

        @ColorInt
        var tertiary95: Int? = null

        @ColorInt
        var tertiary99: Int? = null

        @ColorInt
        var tertiary100: Int? = null

        @ColorInt
        var neutral0: Int? = null

        @ColorInt
        var neutral10: Int? = null

        @ColorInt
        var neutral20: Int? = null

        @ColorInt
        var neutral30: Int? = null

        @ColorInt
        var neutral40: Int? = null

        @ColorInt
        var neutral50: Int? = null

        @ColorInt
        var neutral60: Int? = null

        @ColorInt
        var neutral70: Int? = null

        @ColorInt
        var neutral80: Int? = null

        @ColorInt
        var neutral90: Int? = null

        @ColorInt
        var neutral95: Int? = null

        @ColorInt
        var neutral99: Int? = null

        @ColorInt
        var neutral100: Int? = null

        @ColorInt
        var neutralVariant0: Int? = null

        @ColorInt
        var neutralVariant10: Int? = null

        @ColorInt
        var neutralVariant20: Int? = null

        @ColorInt
        var neutralVariant30: Int? = null

        @ColorInt
        var neutralVariant40: Int? = null

        @ColorInt
        var neutralVariant50: Int? = null

        @ColorInt
        var neutralVariant60: Int? = null

        @ColorInt
        var neutralVariant70: Int? = null

        @ColorInt
        var neutralVariant80: Int? = null

        @ColorInt
        var neutralVariant90: Int? = null

        @ColorInt
        var neutralVariant95: Int? = null

        @ColorInt
        var neutralVariant99: Int? = null

        @ColorInt
        var neutralVariant100: Int? = null

        @ColorInt
        var error0: Int? = null

        @ColorInt
        var error10: Int? = null

        @ColorInt
        var error20: Int? = null

        @ColorInt
        var error30: Int? = null

        @ColorInt
        var error40: Int? = null

        @ColorInt
        var error50: Int? = null

        @ColorInt
        var error60: Int? = null

        @ColorInt
        var error70: Int? = null

        @ColorInt
        var error80: Int? = null

        @ColorInt
        var error90: Int? = null

        @ColorInt
        var error95: Int? = null

        @ColorInt
        var error99: Int? = null

        @ColorInt
        var error100: Int? = null

        fun build(@ColorInt sentinel: Int) = DynamicTonalPalette(
            primary0 = primary0 ?: sentinel,
            primary10 = primary10 ?: sentinel,
            primary20 = primary20 ?: sentinel,
            primary30 = primary30 ?: sentinel,
            primary40 = primary40 ?: sentinel,
            primary50 = primary50 ?: sentinel,
            primary60 = primary60 ?: sentinel,
            primary70 = primary70 ?: sentinel,
            primary80 = primary80 ?: sentinel,
            primary90 = primary90 ?: sentinel,
            primary95 = primary95 ?: sentinel,
            primary99 = primary99 ?: sentinel,
            primary100 = primary100 ?: sentinel,
            secondary0 = secondary0 ?: sentinel,
            secondary10 = secondary10 ?: sentinel,
            secondary20 = secondary20 ?: sentinel,
            secondary30 = secondary30 ?: sentinel,
            secondary40 = secondary40 ?: sentinel,
            secondary50 = secondary50 ?: sentinel,
            secondary60 = secondary60 ?: sentinel,
            secondary70 = secondary70 ?: sentinel,
            secondary80 = secondary80 ?: sentinel,
            secondary90 = secondary90 ?: sentinel,
            secondary95 = secondary95 ?: sentinel,
            secondary99 = secondary99 ?: sentinel,
            secondary100 = secondary100 ?: sentinel,
            tertiary0 = tertiary0 ?: sentinel,
            tertiary10 = tertiary10 ?: sentinel,
            tertiary20 = tertiary20 ?: sentinel,
            tertiary30 = tertiary30 ?: sentinel,
            tertiary40 = tertiary40 ?: sentinel,
            tertiary50 = tertiary50 ?: sentinel,
            tertiary60 = tertiary60 ?: sentinel,
            tertiary70 = tertiary70 ?: sentinel,
            tertiary80 = tertiary80 ?: sentinel,
            tertiary90 = tertiary90 ?: sentinel,
            tertiary95 = tertiary95 ?: sentinel,
            tertiary99 = tertiary99 ?: sentinel,
            tertiary100 = tertiary100 ?: sentinel,
            neutral0 = neutral0 ?: sentinel,
            neutral10 = neutral10 ?: sentinel,
            neutral20 = neutral20 ?: sentinel,
            neutral30 = neutral30 ?: sentinel,
            neutral40 = neutral40 ?: sentinel,
            neutral50 = neutral50 ?: sentinel,
            neutral60 = neutral60 ?: sentinel,
            neutral70 = neutral70 ?: sentinel,
            neutral80 = neutral80 ?: sentinel,
            neutral90 = neutral90 ?: sentinel,
            neutral95 = neutral95 ?: sentinel,
            neutral99 = neutral99 ?: sentinel,
            neutral100 = neutral100 ?: sentinel,
            neutralVariant0 = neutralVariant0 ?: sentinel,
            neutralVariant10 = neutralVariant10 ?: sentinel,
            neutralVariant20 = neutralVariant20 ?: sentinel,
            neutralVariant30 = neutralVariant30 ?: sentinel,
            neutralVariant40 = neutralVariant40 ?: sentinel,
            neutralVariant50 = neutralVariant50 ?: sentinel,
            neutralVariant60 = neutralVariant60 ?: sentinel,
            neutralVariant70 = neutralVariant70 ?: sentinel,
            neutralVariant80 = neutralVariant80 ?: sentinel,
            neutralVariant90 = neutralVariant90 ?: sentinel,
            neutralVariant95 = neutralVariant95 ?: sentinel,
            neutralVariant99 = neutralVariant99 ?: sentinel,
            neutralVariant100 = neutralVariant100 ?: sentinel,
            error0 = error0 ?: sentinel,
            error10 = error10 ?: sentinel,
            error20 = error20 ?: sentinel,
            error30 = error30 ?: sentinel,
            error40 = error40 ?: sentinel,
            error50 = error50 ?: sentinel,
            error60 = error60 ?: sentinel,
            error70 = error70 ?: sentinel,
            error80 = error80 ?: sentinel,
            error90 = error90 ?: sentinel,
            error95 = error95 ?: sentinel,
            error99 = error99 ?: sentinel,
            error100 = error100 ?: sentinel,
        )
    }

    companion object {
        private fun build(sentinel: Int, block: Builder.() -> Unit) = Builder().apply(block).build(sentinel)

        @JvmStatic
        fun empty(@ColorInt sentinel: Int) = build(sentinel) {}

        @JvmStatic
        fun fromContext(context: Context, @ColorInt sentinel: Int) = build(sentinel) {
            ColorResourceHelper.run {
                // Palettes are entirely unavailable on pre-31 (A12, M3) API levels.
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return@build

                // Primary.
                primary0 = getColorById(context, system_accent1_1000)
                primary10 = getColorById(context, system_accent1_900)
                primary20 = getColorById(context, system_accent1_800)
                primary30 = getColorById(context, system_accent1_700)
                primary40 = getColorById(context, system_accent1_600)
                primary50 = getColorById(context, system_accent1_500)
                primary60 = getColorById(context, system_accent1_400)
                primary70 = getColorById(context, system_accent1_300)
                primary80 = getColorById(context, system_accent1_200)
                primary90 = getColorById(context, system_accent1_100)
                primary95 = getColorById(context, system_accent1_50)
                primary99 = getColorById(context, system_accent1_10)
                primary100 = getColorById(context, system_accent1_0)

                // Secondary.
                secondary0 = getColorById(context, system_accent2_1000)
                secondary10 = getColorById(context, system_accent2_900)
                secondary20 = getColorById(context, system_accent2_800)
                secondary30 = getColorById(context, system_accent2_700)
                secondary40 = getColorById(context, system_accent2_600)
                secondary50 = getColorById(context, system_accent2_500)
                secondary60 = getColorById(context, system_accent2_400)
                secondary70 = getColorById(context, system_accent2_300)
                secondary80 = getColorById(context, system_accent2_200)
                secondary90 = getColorById(context, system_accent2_100)
                secondary95 = getColorById(context, system_accent2_50)
                secondary99 = getColorById(context, system_accent2_10)
                secondary100 = getColorById(context, system_accent2_0)

                // Tertiary.
                tertiary0 = getColorById(context, system_accent3_1000)
                tertiary10 = getColorById(context, system_accent3_900)
                tertiary20 = getColorById(context, system_accent3_800)
                tertiary30 = getColorById(context, system_accent3_700)
                tertiary40 = getColorById(context, system_accent3_600)
                tertiary50 = getColorById(context, system_accent3_500)
                tertiary60 = getColorById(context, system_accent3_400)
                tertiary70 = getColorById(context, system_accent3_300)
                tertiary80 = getColorById(context, system_accent3_200)
                tertiary90 = getColorById(context, system_accent3_100)
                tertiary95 = getColorById(context, system_accent3_50)
                tertiary99 = getColorById(context, system_accent3_10)
                tertiary100 = getColorById(context, system_accent3_0)

                // Neutral.
                neutral0 = getColorById(context, system_neutral1_1000)
                neutral10 = getColorById(context, system_neutral1_900)
                neutral20 = getColorById(context, system_neutral1_800)
                neutral30 = getColorById(context, system_neutral1_700)
                neutral40 = getColorById(context, system_neutral1_600)
                neutral50 = getColorById(context, system_neutral1_500)
                neutral60 = getColorById(context, system_neutral1_400)
                neutral70 = getColorById(context, system_neutral1_300)
                neutral80 = getColorById(context, system_neutral1_200)
                neutral90 = getColorById(context, system_neutral1_100)
                neutral95 = getColorById(context, system_neutral1_50)
                neutral99 = getColorById(context, system_neutral1_10)
                neutral100 = getColorById(context, system_neutral1_0)

                // Neutral variant.
                neutralVariant0 = getColorById(context, system_neutral2_1000)
                neutralVariant10 = getColorById(context, system_neutral2_900)
                neutralVariant20 = getColorById(context, system_neutral2_800)
                neutralVariant30 = getColorById(context, system_neutral2_700)
                neutralVariant40 = getColorById(context, system_neutral2_600)
                neutralVariant50 = getColorById(context, system_neutral2_500)
                neutralVariant60 = getColorById(context, system_neutral2_400)
                neutralVariant70 = getColorById(context, system_neutral2_300)
                neutralVariant80 = getColorById(context, system_neutral2_200)
                neutralVariant90 = getColorById(context, system_neutral2_100)
                neutralVariant95 = getColorById(context, system_neutral2_50)
                neutralVariant99 = getColorById(context, system_neutral2_10)
                neutralVariant100 = getColorById(context, system_neutral2_0)

                // Error palette is unavailable on pre-35 (A15) API levels.
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.VANILLA_ICE_CREAM) return@build

                // Error.
                error0 = getColorById(context, system_error_1000)
                error10 = getColorById(context, system_error_900)
                error20 = getColorById(context, system_error_800)
                error30 = getColorById(context, system_error_700)
                error40 = getColorById(context, system_error_600)
                error50 = getColorById(context, system_error_500)
                error60 = getColorById(context, system_error_400)
                error70 = getColorById(context, system_error_300)
                error80 = getColorById(context, system_error_200)
                error90 = getColorById(context, system_error_100)
                error95 = getColorById(context, system_error_50)
                error99 = getColorById(context, system_error_10)
                error100 = getColorById(context, system_error_0)
            }
        }
    }
}


