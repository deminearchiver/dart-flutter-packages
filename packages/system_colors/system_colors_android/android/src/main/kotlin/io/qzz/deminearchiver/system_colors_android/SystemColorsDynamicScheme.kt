@file:Suppress("unused")

package io.qzz.deminearchiver.system_colors_android

import android.content.Context
import android.os.Build
import androidx.annotation.ColorInt
import androidx.annotation.Keep

@Keep
class SystemColorsDynamicScheme private constructor(
    @param:ColorInt @field:ColorInt @field:JvmField val primaryPaletteKeyColor: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondaryPaletteKeyColor: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiaryPaletteKeyColor: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralPaletteKeyColor: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val neutralVariantPaletteKeyColor: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val errorPaletteKeyColor: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val background: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onBackground: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surface: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceBright: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceContainerLowest: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceContainerLow: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceContainerHigh: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceContainerHighest: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onSurface: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceVariant: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onSurfaceVariant: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val outline: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val outlineVariant: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val inverseSurface: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val inverseOnSurface: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val shadow: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val scrim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val surfaceTint: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primaryDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onPrimary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primaryContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onPrimaryContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primaryFixed: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val primaryFixedDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onPrimaryFixed: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onPrimaryFixedVariant: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val inversePrimary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondaryDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onSecondary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondaryContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onSecondaryContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondaryFixed: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val secondaryFixedDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onSecondaryFixed: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onSecondaryFixedVariant: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiaryDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onTertiary: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiaryContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onTertiaryContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiaryFixed: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val tertiaryFixedDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onTertiaryFixed: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onTertiaryFixedVariant: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val error: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val errorDim: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onError: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val errorContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val onErrorContainer: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val controlActivated: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val controlNormal: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val controlHighlight: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val textPrimaryInverse: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val textSecondaryAndTertiaryInverse: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val textPrimaryInverseDisableOnly: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val textSecondaryAndTertiaryInverseDisabled: Int,
    @param:ColorInt @field:ColorInt @field:JvmField val textHintInverse: Int,
) {
    private class Builder {
        @ColorInt
        var primaryPaletteKeyColor: Int? = null

        @ColorInt
        var secondaryPaletteKeyColor: Int? = null

        @ColorInt
        var tertiaryPaletteKeyColor: Int? = null

        @ColorInt
        var neutralPaletteKeyColor: Int? = null

        @ColorInt
        var neutralVariantPaletteKeyColor: Int? = null

        @ColorInt
        var errorPaletteKeyColor: Int? = null

        @ColorInt
        var background: Int? = null

        @ColorInt
        var onBackground: Int? = null

        @ColorInt
        var surface: Int? = null

        @ColorInt
        var surfaceDim: Int? = null

        @ColorInt
        var surfaceBright: Int? = null

        @ColorInt
        var surfaceContainerLowest: Int? = null

        @ColorInt
        var surfaceContainerLow: Int? = null

        @ColorInt
        var surfaceContainer: Int? = null

        @ColorInt
        var surfaceContainerHigh: Int? = null

        @ColorInt
        var surfaceContainerHighest: Int? = null

        @ColorInt
        var onSurface: Int? = null

        @ColorInt
        var surfaceVariant: Int? = null

        @ColorInt
        var onSurfaceVariant: Int? = null

        @ColorInt
        var outline: Int? = null

        @ColorInt
        var outlineVariant: Int? = null

        @ColorInt
        var inverseSurface: Int? = null

        @ColorInt
        var inverseOnSurface: Int? = null

        @ColorInt
        var shadow: Int? = null

        @ColorInt
        var scrim: Int? = null

        @ColorInt
        var surfaceTint: Int? = null

        @ColorInt
        var primary: Int? = null

        @ColorInt
        var primaryDim: Int? = null

        @ColorInt
        var onPrimary: Int? = null

        @ColorInt
        var primaryContainer: Int? = null

        @ColorInt
        var onPrimaryContainer: Int? = null

        @ColorInt
        var primaryFixed: Int? = null

        @ColorInt
        var primaryFixedDim: Int? = null

        @ColorInt
        var onPrimaryFixed: Int? = null

        @ColorInt
        var onPrimaryFixedVariant: Int? = null

        @ColorInt
        var inversePrimary: Int? = null

        @ColorInt
        var secondary: Int? = null

        @ColorInt
        var secondaryDim: Int? = null

        @ColorInt
        var onSecondary: Int? = null

        @ColorInt
        var secondaryContainer: Int? = null

        @ColorInt
        var onSecondaryContainer: Int? = null

        @ColorInt
        var secondaryFixed: Int? = null

        @ColorInt
        var secondaryFixedDim: Int? = null

        @ColorInt
        var onSecondaryFixed: Int? = null

        @ColorInt
        var onSecondaryFixedVariant: Int? = null

        @ColorInt
        var tertiary: Int? = null

        @ColorInt
        var tertiaryDim: Int? = null

        @ColorInt
        var onTertiary: Int? = null

        @ColorInt
        var tertiaryContainer: Int? = null

        @ColorInt
        var onTertiaryContainer: Int? = null

        @ColorInt
        var tertiaryFixed: Int? = null

        @ColorInt
        var tertiaryFixedDim: Int? = null

        @ColorInt
        var onTertiaryFixed: Int? = null

        @ColorInt
        var onTertiaryFixedVariant: Int? = null

        @ColorInt
        var error: Int? = null

        @ColorInt
        var errorDim: Int? = null

        @ColorInt
        var onError: Int? = null

        @ColorInt
        var errorContainer: Int? = null

        @ColorInt
        var onErrorContainer: Int? = null

        @ColorInt
        var controlActivated: Int? = null

        @ColorInt
        var controlNormal: Int? = null

        @ColorInt
        var controlHighlight: Int? = null

        @ColorInt
        var textPrimaryInverse: Int? = null

        @ColorInt
        var textSecondaryAndTertiaryInverse: Int? = null

        @ColorInt
        var textPrimaryInverseDisableOnly: Int? = null

        @ColorInt
        var textSecondaryAndTertiaryInverseDisabled: Int? = null

        @ColorInt
        var textHintInverse: Int? = null

        fun build(@ColorInt sentinel: Int) = SystemColorsDynamicScheme(
            primaryPaletteKeyColor = primaryPaletteKeyColor ?: sentinel,
            secondaryPaletteKeyColor = secondaryPaletteKeyColor ?: sentinel,
            tertiaryPaletteKeyColor = tertiaryPaletteKeyColor ?: sentinel,
            neutralPaletteKeyColor = neutralPaletteKeyColor ?: sentinel,
            neutralVariantPaletteKeyColor = neutralVariantPaletteKeyColor ?: sentinel,
            errorPaletteKeyColor = errorPaletteKeyColor ?: sentinel,
            background = background ?: sentinel,
            onBackground = onBackground ?: sentinel,
            surface = surface ?: sentinel,
            surfaceDim = surfaceDim ?: sentinel,
            surfaceBright = surfaceBright ?: sentinel,
            surfaceContainerLowest = surfaceContainerLowest ?: sentinel,
            surfaceContainerLow = surfaceContainerLow ?: sentinel,
            surfaceContainer = surfaceContainer ?: sentinel,
            surfaceContainerHigh = surfaceContainerHigh ?: sentinel,
            surfaceContainerHighest = surfaceContainerHighest ?: sentinel,
            onSurface = onSurface ?: sentinel,
            surfaceVariant = surfaceVariant ?: sentinel,
            onSurfaceVariant = onSurfaceVariant ?: sentinel,
            outline = outline ?: sentinel,
            outlineVariant = outlineVariant ?: sentinel,
            inverseSurface = inverseSurface ?: sentinel,
            inverseOnSurface = inverseOnSurface ?: sentinel,
            shadow = shadow ?: sentinel,
            scrim = scrim ?: sentinel,
            surfaceTint = surfaceTint ?: sentinel,
            primary = primary ?: sentinel,
            primaryDim = primaryDim ?: sentinel,
            onPrimary = onPrimary ?: sentinel,
            primaryContainer = primaryContainer ?: sentinel,
            onPrimaryContainer = onPrimaryContainer ?: sentinel,
            primaryFixed = primaryFixed ?: sentinel,
            primaryFixedDim = primaryFixedDim ?: sentinel,
            onPrimaryFixed = onPrimaryFixed ?: sentinel,
            onPrimaryFixedVariant = onPrimaryFixedVariant ?: sentinel,
            inversePrimary = inversePrimary ?: sentinel,
            secondary = secondary ?: sentinel,
            secondaryDim = secondaryDim ?: sentinel,
            onSecondary = onSecondary ?: sentinel,
            secondaryContainer = secondaryContainer ?: sentinel,
            onSecondaryContainer = onSecondaryContainer ?: sentinel,
            secondaryFixed = secondaryFixed ?: sentinel,
            secondaryFixedDim = secondaryFixedDim ?: sentinel,
            onSecondaryFixed = onSecondaryFixed ?: sentinel,
            onSecondaryFixedVariant = onSecondaryFixedVariant ?: sentinel,
            tertiary = tertiary ?: sentinel,
            tertiaryDim = tertiaryDim ?: sentinel,
            onTertiary = onTertiary ?: sentinel,
            tertiaryContainer = tertiaryContainer ?: sentinel,
            onTertiaryContainer = onTertiaryContainer ?: sentinel,
            tertiaryFixed = tertiaryFixed ?: sentinel,
            tertiaryFixedDim = tertiaryFixedDim ?: sentinel,
            onTertiaryFixed = onTertiaryFixed ?: sentinel,
            onTertiaryFixedVariant = onTertiaryFixedVariant ?: sentinel,
            error = error ?: sentinel,
            errorDim = errorDim ?: sentinel,
            onError = onError ?: sentinel,
            errorContainer = errorContainer ?: sentinel,
            onErrorContainer = onErrorContainer ?: sentinel,
            controlActivated = controlActivated ?: sentinel,
            controlNormal = controlNormal ?: sentinel,
            controlHighlight = controlHighlight ?: sentinel,
            textPrimaryInverse = textPrimaryInverse ?: sentinel,
            textSecondaryAndTertiaryInverse = textSecondaryAndTertiaryInverse ?: sentinel,
            textPrimaryInverseDisableOnly = textPrimaryInverseDisableOnly ?: sentinel,
            textSecondaryAndTertiaryInverseDisabled = textSecondaryAndTertiaryInverseDisabled ?: sentinel,
            textHintInverse = textHintInverse ?: sentinel,
        )
    }

    companion object {
        private fun build(sentinel: Int, block: Builder.() -> Unit) = Builder().apply(block).build(sentinel)

        @JvmStatic
        fun empty(@ColorInt sentinel: Int) = build(sentinel) {}

        @JvmStatic
        fun fromContext(context: Context, isDark: Boolean, @ColorInt sentinel: Int) =
            if (isDark) darkFromContext(context, sentinel) else lightFromContext(context, sentinel)

        @JvmStatic
        fun lightFromContext(context: Context, @ColorInt sentinel: Int) = build(sentinel) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) return@build

            ColorResourceHelper.run {
                primaryPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_primary_light)
                secondaryPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_secondary_light)
                tertiaryPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_tertiary_light)
                neutralPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_neutral_light)
                neutralVariantPaletteKeyColor =
                    getById(context, android.R.color.system_palette_key_color_neutral_variant_light)
                //                errorPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_error_light)
                background = getById(context, android.R.color.system_background_light)
                onBackground = getById(context, android.R.color.system_on_background_light)
                surface = getById(context, android.R.color.system_surface_light)
                surfaceDim = getById(context, android.R.color.system_surface_dim_light)
                surfaceBright = getById(context, android.R.color.system_surface_bright_light)
                surfaceContainerLowest = getById(context, android.R.color.system_surface_container_lowest_light)
                surfaceContainerLow = getById(context, android.R.color.system_surface_container_low_light)
                surfaceContainer = getById(context, android.R.color.system_surface_container_light)
                surfaceContainerHigh = getById(context, android.R.color.system_surface_container_high_light)
                surfaceContainerHighest = getById(context, android.R.color.system_surface_container_highest_light)
                onSurface = getById(context, android.R.color.system_on_surface_light)
                surfaceVariant = getById(context, android.R.color.system_surface_variant_light)
                onSurfaceVariant = getById(context, android.R.color.system_on_surface_variant_light)
                outline = getById(context, android.R.color.system_outline_light)
                outlineVariant = getById(context, android.R.color.system_outline_variant_light)
                inverseSurface = getById(context, android.R.color.system_surface_dark)
                inverseOnSurface = getById(context, android.R.color.system_on_surface_dark)
                //                shadow = getById(context, android.R.color.system_shadow_light)
                //                scrim = getById(context, android.R.color.system_scrim_light)
                surfaceTint = getById(context, android.R.color.system_primary_light)
                primary = getById(context, android.R.color.system_primary_light)
                //                primaryDim = getById(context, android.R.color.system_primary_dim_light)
                onPrimary = getById(context, android.R.color.system_on_primary_light)
                primaryContainer = getById(context, android.R.color.system_primary_container_light)
                onPrimaryContainer = getById(context, android.R.color.system_on_primary_container_light)
                primaryFixed = getById(context, android.R.color.system_primary_fixed)
                primaryFixedDim = getById(context, android.R.color.system_primary_fixed_dim)
                onPrimaryFixed = getById(context, android.R.color.system_on_primary_fixed)
                onPrimaryFixedVariant = getById(context, android.R.color.system_on_primary_fixed_variant)
                inversePrimary = getById(context, android.R.color.system_primary_dark)
                secondary = getById(context, android.R.color.system_secondary_light)
                //                secondaryDim = getById(context, android.R.color.system_secondary_dim_light)
                onSecondary = getById(context, android.R.color.system_on_secondary_light)
                secondaryContainer = getById(context, android.R.color.system_secondary_container_light)
                onSecondaryContainer = getById(context, android.R.color.system_on_secondary_container_light)
                secondaryFixed = getById(context, android.R.color.system_secondary_fixed)
                secondaryFixedDim = getById(context, android.R.color.system_secondary_fixed_dim)
                onSecondaryFixed = getById(context, android.R.color.system_on_secondary_fixed)
                onSecondaryFixedVariant = getById(context, android.R.color.system_on_secondary_fixed_variant)
                tertiary = getById(context, android.R.color.system_tertiary_light)
                //                tertiaryDim = getById(context, android.R.color.system_tertiary_dim_light)
                onTertiary = getById(context, android.R.color.system_on_tertiary_light)
                tertiaryContainer = getById(context, android.R.color.system_tertiary_container_light)
                onTertiaryContainer = getById(context, android.R.color.system_on_tertiary_container_light)
                tertiaryFixed = getById(context, android.R.color.system_tertiary_fixed)
                tertiaryFixedDim = getById(context, android.R.color.system_tertiary_fixed_dim)
                onTertiaryFixed = getById(context, android.R.color.system_on_tertiary_fixed)
                onTertiaryFixedVariant = getById(context, android.R.color.system_on_tertiary_fixed_variant)
                error = getById(context, android.R.color.system_error_light)
                //                errorDim = getById(context, android.R.color.system_error_dim_light)
                onError = getById(context, android.R.color.system_on_error_light)
                errorContainer = getById(context, android.R.color.system_error_container_light)
                onErrorContainer = getById(context, android.R.color.system_on_error_container_light)
                controlActivated = getById(context, android.R.color.system_control_activated_light)
                controlNormal = getById(context, android.R.color.system_control_normal_light)
                controlHighlight = getById(context, android.R.color.system_control_highlight_light)
                textPrimaryInverse = getById(context, android.R.color.system_text_primary_inverse_light)
                textSecondaryAndTertiaryInverse =
                    getById(context, android.R.color.system_text_secondary_and_tertiary_inverse_light)
                textPrimaryInverseDisableOnly =
                    getById(context, android.R.color.system_text_primary_inverse_disable_only_light)
                textSecondaryAndTertiaryInverseDisabled =
                    getById(context, android.R.color.system_text_secondary_and_tertiary_inverse_disabled_light)
                textHintInverse = getById(context, android.R.color.system_text_hint_inverse_light)
            }
        }

        @JvmStatic
        fun darkFromContext(context: Context, @ColorInt sentinel: Int) = build(sentinel) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.UPSIDE_DOWN_CAKE) return@build

            ColorResourceHelper.run {
                primaryPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_primary_dark)
                secondaryPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_secondary_dark)
                tertiaryPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_tertiary_dark)
                neutralPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_neutral_dark)
                neutralVariantPaletteKeyColor =
                    getById(context, android.R.color.system_palette_key_color_neutral_variant_dark)
                //                errorPaletteKeyColor = getById(context, android.R.color.system_palette_key_color_error_dark)
                background = getById(context, android.R.color.system_background_dark)
                onBackground = getById(context, android.R.color.system_on_background_dark)
                surface = getById(context, android.R.color.system_surface_dark)
                surfaceDim = getById(context, android.R.color.system_surface_dim_dark)
                surfaceBright = getById(context, android.R.color.system_surface_bright_dark)
                surfaceContainerLowest = getById(context, android.R.color.system_surface_container_lowest_dark)
                surfaceContainerLow = getById(context, android.R.color.system_surface_container_low_dark)
                surfaceContainer = getById(context, android.R.color.system_surface_container_dark)
                surfaceContainerHigh = getById(context, android.R.color.system_surface_container_high_dark)
                surfaceContainerHighest = getById(context, android.R.color.system_surface_container_highest_dark)
                onSurface = getById(context, android.R.color.system_on_surface_dark)
                surfaceVariant = getById(context, android.R.color.system_surface_variant_dark)
                onSurfaceVariant = getById(context, android.R.color.system_on_surface_variant_dark)
                outline = getById(context, android.R.color.system_outline_dark)
                outlineVariant = getById(context, android.R.color.system_outline_variant_dark)
                inverseSurface = getById(context, android.R.color.system_surface_light)
                inverseOnSurface = getById(context, android.R.color.system_on_surface_light)
                //                shadow = getById(context, android.R.color.system_shadow_dark)
                //                scrim = getById(context, android.R.color.system_scrim_dark)
                surfaceTint = getById(context, android.R.color.system_primary_dark)
                primary = getById(context, android.R.color.system_primary_dark)
                //                primaryDim = getById(context, android.R.color.system_primary_dim_dark)
                onPrimary = getById(context, android.R.color.system_on_primary_dark)
                primaryContainer = getById(context, android.R.color.system_primary_container_dark)
                onPrimaryContainer = getById(context, android.R.color.system_on_primary_container_dark)
                primaryFixed = getById(context, android.R.color.system_primary_fixed)
                primaryFixedDim = getById(context, android.R.color.system_primary_fixed_dim)
                onPrimaryFixed = getById(context, android.R.color.system_on_primary_fixed)
                onPrimaryFixedVariant = getById(context, android.R.color.system_on_primary_fixed_variant)
                inversePrimary = getById(context, android.R.color.system_primary_dark)
                secondary = getById(context, android.R.color.system_secondary_dark)
                //                secondaryDim = getById(context, android.R.color.system_secondary_dim_dark)
                onSecondary = getById(context, android.R.color.system_on_secondary_dark)
                secondaryContainer = getById(context, android.R.color.system_secondary_container_dark)
                onSecondaryContainer = getById(context, android.R.color.system_on_secondary_container_dark)
                secondaryFixed = getById(context, android.R.color.system_secondary_fixed)
                secondaryFixedDim = getById(context, android.R.color.system_secondary_fixed_dim)
                onSecondaryFixed = getById(context, android.R.color.system_on_secondary_fixed)
                onSecondaryFixedVariant = getById(context, android.R.color.system_on_secondary_fixed_variant)
                tertiary = getById(context, android.R.color.system_tertiary_dark)
                //                tertiaryDim = getById(context, android.R.color.system_tertiary_dim_dark)
                onTertiary = getById(context, android.R.color.system_on_tertiary_dark)
                tertiaryContainer = getById(context, android.R.color.system_tertiary_container_dark)
                onTertiaryContainer = getById(context, android.R.color.system_on_tertiary_container_dark)
                tertiaryFixed = getById(context, android.R.color.system_tertiary_fixed)
                tertiaryFixedDim = getById(context, android.R.color.system_tertiary_fixed_dim)
                onTertiaryFixed = getById(context, android.R.color.system_on_tertiary_fixed)
                onTertiaryFixedVariant = getById(context, android.R.color.system_on_tertiary_fixed_variant)
                error = getById(context, android.R.color.system_error_dark)
                //                errorDim = getById(context, android.R.color.system_error_dim_dark)
                onError = getById(context, android.R.color.system_on_error_dark)
                errorContainer = getById(context, android.R.color.system_error_container_dark)
                onErrorContainer = getById(context, android.R.color.system_on_error_container_dark)
                controlActivated = getById(context, android.R.color.system_control_activated_dark)
                controlNormal = getById(context, android.R.color.system_control_normal_dark)
                controlHighlight = getById(context, android.R.color.system_control_highlight_dark)
                textPrimaryInverse = getById(context, android.R.color.system_text_primary_inverse_dark)
                textSecondaryAndTertiaryInverse =
                    getById(context, android.R.color.system_text_secondary_and_tertiary_inverse_dark)
                textPrimaryInverseDisableOnly =
                    getById(context, android.R.color.system_text_primary_inverse_disable_only_dark)
                textSecondaryAndTertiaryInverseDisabled =
                    getById(context, android.R.color.system_text_secondary_and_tertiary_inverse_disabled_dark)
                textHintInverse = getById(context, android.R.color.system_text_hint_inverse_dark)
            }
        }
    }
}
