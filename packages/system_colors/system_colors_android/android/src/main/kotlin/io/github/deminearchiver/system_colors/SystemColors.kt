@file:Suppress("unused")

package io.github.deminearchiver.system_colors

import android.content.Context
import android.content.res.Resources
import androidx.annotation.ColorInt
import androidx.annotation.ColorRes
import androidx.core.content.res.ResourcesCompat
import com.google.android.material.color.DynamicColors

@ColorInt
private const val DEFAULT_COLOR_SENTINEL: Int = 0

class TonalPalette private constructor(@JvmField @field:ColorInt @ColorInt var sentinel: Int) {
  @JvmField @ColorInt var primary0: Int = sentinel
  @JvmField @ColorInt var primary10: Int = sentinel
  @JvmField @ColorInt var primary20: Int = sentinel
  @JvmField @ColorInt var primary30: Int = sentinel
  @JvmField @ColorInt var primary40: Int = sentinel
  @JvmField @ColorInt var primary50: Int = sentinel
  @JvmField @ColorInt var primary60: Int = sentinel
  @JvmField @ColorInt var primary70: Int = sentinel
  @JvmField @ColorInt var primary80: Int = sentinel
  @JvmField @ColorInt var primary90: Int = sentinel
  @JvmField @ColorInt var primary95: Int = sentinel
  @JvmField @ColorInt var primary99: Int = sentinel
  @JvmField @ColorInt var primary100: Int = sentinel
  @JvmField @ColorInt var secondary0: Int = sentinel
  @JvmField @ColorInt var secondary10: Int = sentinel
  @JvmField @ColorInt var secondary20: Int = sentinel
  @JvmField @ColorInt var secondary30: Int = sentinel
  @JvmField @ColorInt var secondary40: Int = sentinel
  @JvmField @ColorInt var secondary50: Int = sentinel
  @JvmField @ColorInt var secondary60: Int = sentinel
  @JvmField @ColorInt var secondary70: Int = sentinel
  @JvmField @ColorInt var secondary80: Int = sentinel
  @JvmField @ColorInt var secondary90: Int = sentinel
  @JvmField @ColorInt var secondary95: Int = sentinel
  @JvmField @ColorInt var secondary99: Int = sentinel
  @JvmField @ColorInt var secondary100: Int = sentinel
  @JvmField @ColorInt var tertiary0: Int = sentinel
  @JvmField @ColorInt var tertiary10: Int = sentinel
  @JvmField @ColorInt var tertiary20: Int = sentinel
  @JvmField @ColorInt var tertiary30: Int = sentinel
  @JvmField @ColorInt var tertiary40: Int = sentinel
  @JvmField @ColorInt var tertiary50: Int = sentinel
  @JvmField @ColorInt var tertiary60: Int = sentinel
  @JvmField @ColorInt var tertiary70: Int = sentinel
  @JvmField @ColorInt var tertiary80: Int = sentinel
  @JvmField @ColorInt var tertiary90: Int = sentinel
  @JvmField @ColorInt var tertiary95: Int = sentinel
  @JvmField @ColorInt var tertiary99: Int = sentinel
  @JvmField @ColorInt var tertiary100: Int = sentinel
  @JvmField @ColorInt var neutral0: Int = sentinel
  @JvmField @ColorInt var neutral10: Int = sentinel
  @JvmField @ColorInt var neutral20: Int = sentinel
  @JvmField @ColorInt var neutral30: Int = sentinel
  @JvmField @ColorInt var neutral40: Int = sentinel
  @JvmField @ColorInt var neutral50: Int = sentinel
  @JvmField @ColorInt var neutral60: Int = sentinel
  @JvmField @ColorInt var neutral70: Int = sentinel
  @JvmField @ColorInt var neutral80: Int = sentinel
  @JvmField @ColorInt var neutral90: Int = sentinel
  @JvmField @ColorInt var neutral95: Int = sentinel
  @JvmField @ColorInt var neutral99: Int = sentinel
  @JvmField @ColorInt var neutral100: Int = sentinel
  @JvmField @ColorInt var neutralVariant0: Int = sentinel
  @JvmField @ColorInt var neutralVariant10: Int = sentinel
  @JvmField @ColorInt var neutralVariant20: Int = sentinel
  @JvmField @ColorInt var neutralVariant30: Int = sentinel
  @JvmField @ColorInt var neutralVariant40: Int = sentinel
  @JvmField @ColorInt var neutralVariant50: Int = sentinel
  @JvmField @ColorInt var neutralVariant60: Int = sentinel
  @JvmField @ColorInt var neutralVariant70: Int = sentinel
  @JvmField @ColorInt var neutralVariant80: Int = sentinel
  @JvmField @ColorInt var neutralVariant90: Int = sentinel
  @JvmField @ColorInt var neutralVariant95: Int = sentinel
  @JvmField @ColorInt var neutralVariant99: Int = sentinel
  @JvmField @ColorInt var neutralVariant100: Int = sentinel
  @JvmField @ColorInt var error0: Int = sentinel
  @JvmField @ColorInt var error10: Int = sentinel
  @JvmField @ColorInt var error20: Int = sentinel
  @JvmField @ColorInt var error30: Int = sentinel
  @JvmField @ColorInt var error40: Int = sentinel
  @JvmField @ColorInt var error50: Int = sentinel
  @JvmField @ColorInt var error60: Int = sentinel
  @JvmField @ColorInt var error70: Int = sentinel
  @JvmField @ColorInt var error80: Int = sentinel
  @JvmField @ColorInt var error90: Int = sentinel
  @JvmField @ColorInt var error95: Int = sentinel
  @JvmField @ColorInt var error99: Int = sentinel
  @JvmField @ColorInt var error100: Int = sentinel

  companion object {
    @JvmOverloads
    @JvmStatic
    fun empty(sentinel: Int = DEFAULT_COLOR_SENTINEL) = TonalPalette(sentinel)

    @JvmOverloads
    @JvmStatic
    fun fromContext(context: Context, sentinel: Int = DEFAULT_COLOR_SENTINEL) = TonalPalette(sentinel).apply {
      val resources = context.resources
      val theme = context.theme

      primary0 = resources.getColorOr(R.color.android_ref_palette_primary_0, theme, sentinel)
      primary10 = resources.getColorOr(R.color.android_ref_palette_primary_10, theme, sentinel)
      primary20 = resources.getColorOr(R.color.android_ref_palette_primary_20, theme, sentinel)
      primary30 = resources.getColorOr(R.color.android_ref_palette_primary_30, theme, sentinel)
      primary40 = resources.getColorOr(R.color.android_ref_palette_primary_40, theme, sentinel)
      primary50 = resources.getColorOr(R.color.android_ref_palette_primary_50, theme, sentinel)
      primary60 = resources.getColorOr(R.color.android_ref_palette_primary_60, theme, sentinel)
      primary70 = resources.getColorOr(R.color.android_ref_palette_primary_70, theme, sentinel)
      primary80 = resources.getColorOr(R.color.android_ref_palette_primary_80, theme, sentinel)
      primary90 = resources.getColorOr(R.color.android_ref_palette_primary_90, theme, sentinel)
      primary95 = resources.getColorOr(R.color.android_ref_palette_primary_95, theme, sentinel)
      primary99 = resources.getColorOr(R.color.android_ref_palette_primary_99, theme, sentinel)
      primary100 = resources.getColorOr(R.color.android_ref_palette_primary_100, theme, sentinel)
      secondary0 = resources.getColorOr(R.color.android_ref_palette_secondary_0, theme, sentinel)
      secondary10 = resources.getColorOr(R.color.android_ref_palette_secondary_10, theme, sentinel)
      secondary20 = resources.getColorOr(R.color.android_ref_palette_secondary_20, theme, sentinel)
      secondary30 = resources.getColorOr(R.color.android_ref_palette_secondary_30, theme, sentinel)
      secondary40 = resources.getColorOr(R.color.android_ref_palette_secondary_40, theme, sentinel)
      secondary50 = resources.getColorOr(R.color.android_ref_palette_secondary_50, theme, sentinel)
      secondary60 = resources.getColorOr(R.color.android_ref_palette_secondary_60, theme, sentinel)
      secondary70 = resources.getColorOr(R.color.android_ref_palette_secondary_70, theme, sentinel)
      secondary80 = resources.getColorOr(R.color.android_ref_palette_secondary_80, theme, sentinel)
      secondary90 = resources.getColorOr(R.color.android_ref_palette_secondary_90, theme, sentinel)
      secondary95 = resources.getColorOr(R.color.android_ref_palette_secondary_95, theme, sentinel)
      secondary99 = resources.getColorOr(R.color.android_ref_palette_secondary_99, theme, sentinel)
      secondary100 = resources.getColorOr(R.color.android_ref_palette_secondary_100, theme, sentinel)
      tertiary0 = resources.getColorOr(R.color.android_ref_palette_tertiary_0, theme, sentinel)
      tertiary10 = resources.getColorOr(R.color.android_ref_palette_tertiary_10, theme, sentinel)
      tertiary20 = resources.getColorOr(R.color.android_ref_palette_tertiary_20, theme, sentinel)
      tertiary30 = resources.getColorOr(R.color.android_ref_palette_tertiary_30, theme, sentinel)
      tertiary40 = resources.getColorOr(R.color.android_ref_palette_tertiary_40, theme, sentinel)
      tertiary50 = resources.getColorOr(R.color.android_ref_palette_tertiary_50, theme, sentinel)
      tertiary60 = resources.getColorOr(R.color.android_ref_palette_tertiary_60, theme, sentinel)
      tertiary70 = resources.getColorOr(R.color.android_ref_palette_tertiary_70, theme, sentinel)
      tertiary80 = resources.getColorOr(R.color.android_ref_palette_tertiary_80, theme, sentinel)
      tertiary90 = resources.getColorOr(R.color.android_ref_palette_tertiary_90, theme, sentinel)
      tertiary95 = resources.getColorOr(R.color.android_ref_palette_tertiary_95, theme, sentinel)
      tertiary99 = resources.getColorOr(R.color.android_ref_palette_tertiary_99, theme, sentinel)
      tertiary100 = resources.getColorOr(R.color.android_ref_palette_tertiary_100, theme, sentinel)
      neutral0 = resources.getColorOr(R.color.android_ref_palette_neutral_0, theme, sentinel)
      neutral10 = resources.getColorOr(R.color.android_ref_palette_neutral_10, theme, sentinel)
      neutral20 = resources.getColorOr(R.color.android_ref_palette_neutral_20, theme, sentinel)
      neutral30 = resources.getColorOr(R.color.android_ref_palette_neutral_30, theme, sentinel)
      neutral40 = resources.getColorOr(R.color.android_ref_palette_neutral_40, theme, sentinel)
      neutral50 = resources.getColorOr(R.color.android_ref_palette_neutral_50, theme, sentinel)
      neutral60 = resources.getColorOr(R.color.android_ref_palette_neutral_60, theme, sentinel)
      neutral70 = resources.getColorOr(R.color.android_ref_palette_neutral_70, theme, sentinel)
      neutral80 = resources.getColorOr(R.color.android_ref_palette_neutral_80, theme, sentinel)
      neutral90 = resources.getColorOr(R.color.android_ref_palette_neutral_90, theme, sentinel)
      neutral95 = resources.getColorOr(R.color.android_ref_palette_neutral_95, theme, sentinel)
      neutral99 = resources.getColorOr(R.color.android_ref_palette_neutral_99, theme, sentinel)
      neutral100 = resources.getColorOr(R.color.android_ref_palette_neutral_100, theme, sentinel)
      neutralVariant0 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_0, theme, sentinel)
      neutralVariant10 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_10, theme, sentinel)
      neutralVariant20 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_20, theme, sentinel)
      neutralVariant30 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_30, theme, sentinel)
      neutralVariant40 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_40, theme, sentinel)
      neutralVariant50 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_50, theme, sentinel)
      neutralVariant60 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_60, theme, sentinel)
      neutralVariant70 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_70, theme, sentinel)
      neutralVariant80 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_80, theme, sentinel)
      neutralVariant90 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_90, theme, sentinel)
      neutralVariant95 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_95, theme, sentinel)
      neutralVariant99 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_99, theme, sentinel)
      neutralVariant100 = resources.getColorOr(R.color.android_ref_palette_neutral_variant_100, theme, sentinel)
      error0 = resources.getColorOr(R.color.android_ref_palette_error_0, theme, sentinel)
      error10 = resources.getColorOr(R.color.android_ref_palette_error_10, theme, sentinel)
      error20 = resources.getColorOr(R.color.android_ref_palette_error_20, theme, sentinel)
      error30 = resources.getColorOr(R.color.android_ref_palette_error_30, theme, sentinel)
      error40 = resources.getColorOr(R.color.android_ref_palette_error_40, theme, sentinel)
      error50 = resources.getColorOr(R.color.android_ref_palette_error_50, theme, sentinel)
      error60 = resources.getColorOr(R.color.android_ref_palette_error_60, theme, sentinel)
      error70 = resources.getColorOr(R.color.android_ref_palette_error_70, theme, sentinel)
      error80 = resources.getColorOr(R.color.android_ref_palette_error_80, theme, sentinel)
      error90 = resources.getColorOr(R.color.android_ref_palette_error_90, theme, sentinel)
      error95 = resources.getColorOr(R.color.android_ref_palette_error_95, theme, sentinel)
      error99 = resources.getColorOr(R.color.android_ref_palette_error_99, theme, sentinel)
      error100 = resources.getColorOr(R.color.android_ref_palette_error_100, theme, sentinel)
    }
  }
}

class ColorScheme private constructor(@JvmField @field:ColorInt @ColorInt var sentinel: Int) {
  @JvmField @ColorInt var primaryFixed: Int = sentinel
  @JvmField @ColorInt var primaryFixedDim: Int = sentinel
  @JvmField @ColorInt var onPrimaryFixed: Int = sentinel
  @JvmField @ColorInt var onPrimaryFixedVariant: Int = sentinel
  @JvmField @ColorInt var secondaryFixed: Int = sentinel
  @JvmField @ColorInt var secondaryFixedDim: Int = sentinel
  @JvmField @ColorInt var onSecondaryFixed: Int = sentinel
  @JvmField @ColorInt var onSecondaryFixedVariant: Int = sentinel
  @JvmField @ColorInt var tertiaryFixed: Int = sentinel
  @JvmField @ColorInt var tertiaryFixedDim: Int = sentinel
  @JvmField @ColorInt var onTertiaryFixed: Int = sentinel
  @JvmField @ColorInt var onTertiaryFixedVariant: Int = sentinel
  @JvmField @ColorInt var primaryPaletteKeyColorLight: Int = sentinel
  @JvmField @ColorInt var secondaryPaletteKeyColorLight: Int = sentinel
  @JvmField @ColorInt var tertiaryPaletteKeyColorLight: Int = sentinel
  @JvmField @ColorInt var neutralPaletteKeyColorLight: Int = sentinel
  @JvmField @ColorInt var neutralVariantPaletteKeyColorLight: Int = sentinel
  @JvmField @ColorInt var backgroundLight: Int = sentinel
  @JvmField @ColorInt var onBackgroundLight: Int = sentinel
  @JvmField @ColorInt var surfaceLight: Int = sentinel
  @JvmField @ColorInt var surfaceDimLight: Int = sentinel
  @JvmField @ColorInt var surfaceBrightLight: Int = sentinel
  @JvmField @ColorInt var surfaceContainerLowestLight: Int = sentinel
  @JvmField @ColorInt var surfaceContainerLowLight: Int = sentinel
  @JvmField @ColorInt var surfaceContainerLight: Int = sentinel
  @JvmField @ColorInt var surfaceContainerHighLight: Int = sentinel
  @JvmField @ColorInt var surfaceContainerHighestLight: Int = sentinel
  @JvmField @ColorInt var onSurfaceLight: Int = sentinel
  @JvmField @ColorInt var surfaceVariantLight: Int = sentinel
  @JvmField @ColorInt var onSurfaceVariantLight: Int = sentinel
  @JvmField @ColorInt var outlineLight: Int = sentinel
  @JvmField @ColorInt var outlineVariantLight: Int = sentinel
  @JvmField @ColorInt var inverseSurfaceLight: Int = sentinel
  @JvmField @ColorInt var inverseOnSurfaceLight: Int = sentinel
  @JvmField @ColorInt var shadowLight: Int = sentinel
  @JvmField @ColorInt var scrimLight: Int = sentinel
  @JvmField @ColorInt var surfaceTintLight: Int = sentinel
  @JvmField @ColorInt var primaryLight: Int = sentinel
  @JvmField @ColorInt var onPrimaryLight: Int = sentinel
  @JvmField @ColorInt var primaryContainerLight: Int = sentinel
  @JvmField @ColorInt var onPrimaryContainerLight: Int = sentinel
  @JvmField @ColorInt var inversePrimaryLight: Int = sentinel
  @JvmField @ColorInt var secondaryLight: Int = sentinel
  @JvmField @ColorInt var onSecondaryLight: Int = sentinel
  @JvmField @ColorInt var secondaryContainerLight: Int = sentinel
  @JvmField @ColorInt var onSecondaryContainerLight: Int = sentinel
  @JvmField @ColorInt var tertiaryLight: Int = sentinel
  @JvmField @ColorInt var onTertiaryLight: Int = sentinel
  @JvmField @ColorInt var tertiaryContainerLight: Int = sentinel
  @JvmField @ColorInt var onTertiaryContainerLight: Int = sentinel
  @JvmField @ColorInt var errorLight: Int = sentinel
  @JvmField @ColorInt var onErrorLight: Int = sentinel
  @JvmField @ColorInt var errorContainerLight: Int = sentinel
  @JvmField @ColorInt var onErrorContainerLight: Int = sentinel
  @JvmField @ColorInt var controlActivatedLight: Int = sentinel
  @JvmField @ColorInt var controlNormalLight: Int = sentinel
  @JvmField @ColorInt var controlHighlightLight: Int = sentinel
  @JvmField @ColorInt var textPrimaryInverseLight: Int = sentinel
  @JvmField @ColorInt var textSecondaryAndTertiaryInverseLight: Int = sentinel
  @JvmField @ColorInt var textPrimaryInverseDisableOnlyLight: Int = sentinel
  @JvmField @ColorInt var textSecondaryAndTertiaryInverseDisabledLight: Int = sentinel
  @JvmField @ColorInt var textHintInverseLight: Int = sentinel
  @JvmField @ColorInt var primaryPaletteKeyColorDark: Int = sentinel
  @JvmField @ColorInt var secondaryPaletteKeyColorDark: Int = sentinel
  @JvmField @ColorInt var tertiaryPaletteKeyColorDark: Int = sentinel
  @JvmField @ColorInt var neutralPaletteKeyColorDark: Int = sentinel
  @JvmField @ColorInt var neutralVariantPaletteKeyColorDark: Int = sentinel
  @JvmField @ColorInt var backgroundDark: Int = sentinel
  @JvmField @ColorInt var onBackgroundDark: Int = sentinel
  @JvmField @ColorInt var surfaceDark: Int = sentinel
  @JvmField @ColorInt var surfaceDimDark: Int = sentinel
  @JvmField @ColorInt var surfaceBrightDark: Int = sentinel
  @JvmField @ColorInt var surfaceContainerLowestDark: Int = sentinel
  @JvmField @ColorInt var surfaceContainerLowDark: Int = sentinel
  @JvmField @ColorInt var surfaceContainerDark: Int = sentinel
  @JvmField @ColorInt var surfaceContainerHighDark: Int = sentinel
  @JvmField @ColorInt var surfaceContainerHighestDark: Int = sentinel
  @JvmField @ColorInt var onSurfaceDark: Int = sentinel
  @JvmField @ColorInt var surfaceVariantDark: Int = sentinel
  @JvmField @ColorInt var onSurfaceVariantDark: Int = sentinel
  @JvmField @ColorInt var outlineDark: Int = sentinel
  @JvmField @ColorInt var outlineVariantDark: Int = sentinel
  @JvmField @ColorInt var inverseSurfaceDark: Int = sentinel
  @JvmField @ColorInt var inverseOnSurfaceDark: Int = sentinel
  @JvmField @ColorInt var shadowDark: Int = sentinel
  @JvmField @ColorInt var scrimDark: Int = sentinel
  @JvmField @ColorInt var surfaceTintDark: Int = sentinel
  @JvmField @ColorInt var primaryDark: Int = sentinel
  @JvmField @ColorInt var onPrimaryDark: Int = sentinel
  @JvmField @ColorInt var primaryContainerDark: Int = sentinel
  @JvmField @ColorInt var onPrimaryContainerDark: Int = sentinel
  @JvmField @ColorInt var inversePrimaryDark: Int = sentinel
  @JvmField @ColorInt var secondaryDark: Int = sentinel
  @JvmField @ColorInt var onSecondaryDark: Int = sentinel
  @JvmField @ColorInt var secondaryContainerDark: Int = sentinel
  @JvmField @ColorInt var onSecondaryContainerDark: Int = sentinel
  @JvmField @ColorInt var tertiaryDark: Int = sentinel
  @JvmField @ColorInt var onTertiaryDark: Int = sentinel
  @JvmField @ColorInt var tertiaryContainerDark: Int = sentinel
  @JvmField @ColorInt var onTertiaryContainerDark: Int = sentinel
  @JvmField @ColorInt var errorDark: Int = sentinel
  @JvmField @ColorInt var onErrorDark: Int = sentinel
  @JvmField @ColorInt var errorContainerDark: Int = sentinel
  @JvmField @ColorInt var onErrorContainerDark: Int = sentinel
  @JvmField @ColorInt var controlActivatedDark: Int = sentinel
  @JvmField @ColorInt var controlNormalDark: Int = sentinel
  @JvmField @ColorInt var controlHighlightDark: Int = sentinel
  @JvmField @ColorInt var textPrimaryInverseDark: Int = sentinel
  @JvmField @ColorInt var textSecondaryAndTertiaryInverseDark: Int = sentinel
  @JvmField @ColorInt var textPrimaryInverseDisableOnlyDark: Int = sentinel
  @JvmField @ColorInt var textSecondaryAndTertiaryInverseDisabledDark: Int = sentinel
  @JvmField @ColorInt var textHintInverseDark: Int = sentinel

  companion object {
    @JvmOverloads
    @JvmStatic
    fun empty(sentinel: Int = DEFAULT_COLOR_SENTINEL) = ColorScheme(sentinel)

    @JvmOverloads
    @JvmStatic
    fun fromContext(context: Context, sentinel: Int = DEFAULT_COLOR_SENTINEL) = ColorScheme(sentinel).apply {
      val resources = context.resources
      val theme = context.theme

      primaryFixed = resources.getColorOr(R.color.android_sys_color_primary_fixed, theme, sentinel)
      primaryFixedDim = resources.getColorOr(R.color.android_sys_color_primary_fixed_dim, theme, sentinel)
      onPrimaryFixed = resources.getColorOr(R.color.android_sys_color_on_primary_fixed, theme, sentinel)
      onPrimaryFixedVariant = resources.getColorOr(R.color.android_sys_color_on_primary_fixed_variant, theme, sentinel)
      secondaryFixed = resources.getColorOr(R.color.android_sys_color_secondary_fixed, theme, sentinel)
      secondaryFixedDim = resources.getColorOr(R.color.android_sys_color_secondary_fixed_dim, theme, sentinel)
      onSecondaryFixed = resources.getColorOr(R.color.android_sys_color_on_secondary_fixed, theme, sentinel)
      onSecondaryFixedVariant = resources.getColorOr(R.color.android_sys_color_on_secondary_fixed_variant, theme, sentinel)
      tertiaryFixed = resources.getColorOr(R.color.android_sys_color_tertiary_fixed, theme, sentinel)
      tertiaryFixedDim = resources.getColorOr(R.color.android_sys_color_tertiary_fixed_dim, theme, sentinel)
      onTertiaryFixed = resources.getColorOr(R.color.android_sys_color_on_tertiary_fixed, theme, sentinel)
      onTertiaryFixedVariant = resources.getColorOr(R.color.android_sys_color_on_tertiary_fixed_variant, theme, sentinel)
      primaryPaletteKeyColorLight = resources.getColorOr(R.color.android_sys_color_primary_palette_key_color_light, theme, sentinel)
      secondaryPaletteKeyColorLight = resources.getColorOr(R.color.android_sys_color_secondary_palette_key_color_light, theme, sentinel)
      tertiaryPaletteKeyColorLight = resources.getColorOr(R.color.android_sys_color_tertiary_palette_key_color_light, theme, sentinel)
      neutralPaletteKeyColorLight = resources.getColorOr(R.color.android_sys_color_neutral_palette_key_color_light, theme, sentinel)
      neutralVariantPaletteKeyColorLight = resources.getColorOr(R.color.android_sys_color_neutral_variant_palette_key_color_light, theme, sentinel)
      backgroundLight = resources.getColorOr(R.color.android_sys_color_background_light, theme, sentinel)
      onBackgroundLight = resources.getColorOr(R.color.android_sys_color_on_background_light, theme, sentinel)
      surfaceLight = resources.getColorOr(R.color.android_sys_color_surface_light, theme, sentinel)
      surfaceDimLight = resources.getColorOr(R.color.android_sys_color_surface_dim_light, theme, sentinel)
      surfaceBrightLight = resources.getColorOr(R.color.android_sys_color_surface_bright_light, theme, sentinel)
      surfaceContainerLowestLight = resources.getColorOr(R.color.android_sys_color_surface_container_lowest_light, theme, sentinel)
      surfaceContainerLowLight = resources.getColorOr(R.color.android_sys_color_surface_container_low_light, theme, sentinel)
      surfaceContainerLight = resources.getColorOr(R.color.android_sys_color_surface_container_light, theme, sentinel)
      surfaceContainerHighLight = resources.getColorOr(R.color.android_sys_color_surface_container_high_light, theme, sentinel)
      surfaceContainerHighestLight = resources.getColorOr(R.color.android_sys_color_surface_container_highest_light, theme, sentinel)
      onSurfaceLight = resources.getColorOr(R.color.android_sys_color_on_surface_light, theme, sentinel)
      surfaceVariantLight = resources.getColorOr(R.color.android_sys_color_surface_variant_light, theme, sentinel)
      onSurfaceVariantLight = resources.getColorOr(R.color.android_sys_color_on_surface_variant_light, theme, sentinel)
      outlineLight = resources.getColorOr(R.color.android_sys_color_outline_light, theme, sentinel)
      outlineVariantLight = resources.getColorOr(R.color.android_sys_color_outline_variant_light, theme, sentinel)
      inverseSurfaceLight = resources.getColorOr(R.color.android_sys_color_inverse_surface_light, theme, sentinel)
      inverseOnSurfaceLight = resources.getColorOr(R.color.android_sys_color_inverse_on_surface_light, theme, sentinel)
      shadowLight = resources.getColorOr(R.color.android_sys_color_shadow_light, theme, sentinel)
      scrimLight = resources.getColorOr(R.color.android_sys_color_scrim_light, theme, sentinel)
      surfaceTintLight = resources.getColorOr(R.color.android_sys_color_surface_tint_light, theme, sentinel)
      primaryLight = resources.getColorOr(R.color.android_sys_color_primary_light, theme, sentinel)
      onPrimaryLight = resources.getColorOr(R.color.android_sys_color_on_primary_light, theme, sentinel)
      primaryContainerLight = resources.getColorOr(R.color.android_sys_color_primary_container_light, theme, sentinel)
      onPrimaryContainerLight = resources.getColorOr(R.color.android_sys_color_on_primary_container_light, theme, sentinel)
      inversePrimaryLight = resources.getColorOr(R.color.android_sys_color_inverse_primary_light, theme, sentinel)
      secondaryLight = resources.getColorOr(R.color.android_sys_color_secondary_light, theme, sentinel)
      onSecondaryLight = resources.getColorOr(R.color.android_sys_color_on_secondary_light, theme, sentinel)
      secondaryContainerLight = resources.getColorOr(R.color.android_sys_color_secondary_container_light, theme, sentinel)
      onSecondaryContainerLight = resources.getColorOr(R.color.android_sys_color_on_secondary_container_light, theme, sentinel)
      tertiaryLight = resources.getColorOr(R.color.android_sys_color_tertiary_light, theme, sentinel)
      onTertiaryLight = resources.getColorOr(R.color.android_sys_color_on_tertiary_light, theme, sentinel)
      tertiaryContainerLight = resources.getColorOr(R.color.android_sys_color_tertiary_container_light, theme, sentinel)
      onTertiaryContainerLight = resources.getColorOr(R.color.android_sys_color_on_tertiary_container_light, theme, sentinel)
      errorLight = resources.getColorOr(R.color.android_sys_color_error_light, theme, sentinel)
      onErrorLight = resources.getColorOr(R.color.android_sys_color_on_error_light, theme, sentinel)
      errorContainerLight = resources.getColorOr(R.color.android_sys_color_error_container_light, theme, sentinel)
      onErrorContainerLight = resources.getColorOr(R.color.android_sys_color_on_error_container_light, theme, sentinel)
      controlActivatedLight = resources.getColorOr(R.color.android_sys_color_control_activated_light, theme, sentinel)
      controlNormalLight = resources.getColorOr(R.color.android_sys_color_control_normal_light, theme, sentinel)
      controlHighlightLight = resources.getColorOr(R.color.android_sys_color_control_highlight_light, theme, sentinel)
      textPrimaryInverseLight = resources.getColorOr(R.color.android_sys_color_text_primary_inverse_light, theme, sentinel)
      textSecondaryAndTertiaryInverseLight = resources.getColorOr(R.color.android_sys_color_text_secondary_and_tertiary_inverse_light, theme, sentinel)
      textPrimaryInverseDisableOnlyLight = resources.getColorOr(R.color.android_sys_color_text_primary_inverse_disable_only_light, theme, sentinel)
      textSecondaryAndTertiaryInverseDisabledLight = resources.getColorOr(R.color.android_sys_color_text_secondary_and_tertiary_inverse_disabled_light, theme, sentinel)
      textHintInverseLight = resources.getColorOr(R.color.android_sys_color_text_hint_inverse_light, theme, sentinel)
      primaryPaletteKeyColorDark = resources.getColorOr(R.color.android_sys_color_primary_palette_key_color_dark, theme, sentinel)
      secondaryPaletteKeyColorDark = resources.getColorOr(R.color.android_sys_color_secondary_palette_key_color_dark, theme, sentinel)
      tertiaryPaletteKeyColorDark = resources.getColorOr(R.color.android_sys_color_tertiary_palette_key_color_dark, theme, sentinel)
      neutralPaletteKeyColorDark = resources.getColorOr(R.color.android_sys_color_neutral_palette_key_color_dark, theme, sentinel)
      neutralVariantPaletteKeyColorDark = resources.getColorOr(R.color.android_sys_color_neutral_variant_palette_key_color_dark, theme, sentinel)
      backgroundDark = resources.getColorOr(R.color.android_sys_color_background_dark, theme, sentinel)
      onBackgroundDark = resources.getColorOr(R.color.android_sys_color_on_background_dark, theme, sentinel)
      surfaceDark = resources.getColorOr(R.color.android_sys_color_surface_dark, theme, sentinel)
      surfaceDimDark = resources.getColorOr(R.color.android_sys_color_surface_dim_dark, theme, sentinel)
      surfaceBrightDark = resources.getColorOr(R.color.android_sys_color_surface_bright_dark, theme, sentinel)
      surfaceContainerLowestDark = resources.getColorOr(R.color.android_sys_color_surface_container_lowest_dark, theme, sentinel)
      surfaceContainerLowDark = resources.getColorOr(R.color.android_sys_color_surface_container_low_dark, theme, sentinel)
      surfaceContainerDark = resources.getColorOr(R.color.android_sys_color_surface_container_dark, theme, sentinel)
      surfaceContainerHighDark = resources.getColorOr(R.color.android_sys_color_surface_container_high_dark, theme, sentinel)
      surfaceContainerHighestDark = resources.getColorOr(R.color.android_sys_color_surface_container_highest_dark, theme, sentinel)
      onSurfaceDark = resources.getColorOr(R.color.android_sys_color_on_surface_dark, theme, sentinel)
      surfaceVariantDark = resources.getColorOr(R.color.android_sys_color_surface_variant_dark, theme, sentinel)
      onSurfaceVariantDark = resources.getColorOr(R.color.android_sys_color_on_surface_variant_dark, theme, sentinel)
      outlineDark = resources.getColorOr(R.color.android_sys_color_outline_dark, theme, sentinel)
      outlineVariantDark = resources.getColorOr(R.color.android_sys_color_outline_variant_dark, theme, sentinel)
      inverseSurfaceDark = resources.getColorOr(R.color.android_sys_color_inverse_surface_dark, theme, sentinel)
      inverseOnSurfaceDark = resources.getColorOr(R.color.android_sys_color_inverse_on_surface_dark, theme, sentinel)
      shadowDark = resources.getColorOr(R.color.android_sys_color_shadow_dark, theme, sentinel)
      scrimDark = resources.getColorOr(R.color.android_sys_color_scrim_dark, theme, sentinel)
      surfaceTintDark = resources.getColorOr(R.color.android_sys_color_surface_tint_dark, theme, sentinel)
      primaryDark = resources.getColorOr(R.color.android_sys_color_primary_dark, theme, sentinel)
      onPrimaryDark = resources.getColorOr(R.color.android_sys_color_on_primary_dark, theme, sentinel)
      primaryContainerDark = resources.getColorOr(R.color.android_sys_color_primary_container_dark, theme, sentinel)
      onPrimaryContainerDark = resources.getColorOr(R.color.android_sys_color_on_primary_container_dark, theme, sentinel)
      inversePrimaryDark = resources.getColorOr(R.color.android_sys_color_inverse_primary_dark, theme, sentinel)
      secondaryDark = resources.getColorOr(R.color.android_sys_color_secondary_dark, theme, sentinel)
      onSecondaryDark = resources.getColorOr(R.color.android_sys_color_on_secondary_dark, theme, sentinel)
      secondaryContainerDark = resources.getColorOr(R.color.android_sys_color_secondary_container_dark, theme, sentinel)
      onSecondaryContainerDark = resources.getColorOr(R.color.android_sys_color_on_secondary_container_dark, theme, sentinel)
      tertiaryDark = resources.getColorOr(R.color.android_sys_color_tertiary_dark, theme, sentinel)
      onTertiaryDark = resources.getColorOr(R.color.android_sys_color_on_tertiary_dark, theme, sentinel)
      tertiaryContainerDark = resources.getColorOr(R.color.android_sys_color_tertiary_container_dark, theme, sentinel)
      onTertiaryContainerDark = resources.getColorOr(R.color.android_sys_color_on_tertiary_container_dark, theme, sentinel)
      errorDark = resources.getColorOr(R.color.android_sys_color_error_dark, theme, sentinel)
      onErrorDark = resources.getColorOr(R.color.android_sys_color_on_error_dark, theme, sentinel)
      errorContainerDark = resources.getColorOr(R.color.android_sys_color_error_container_dark, theme, sentinel)
      onErrorContainerDark = resources.getColorOr(R.color.android_sys_color_on_error_container_dark, theme, sentinel)
      controlActivatedDark = resources.getColorOr(R.color.android_sys_color_control_activated_dark, theme, sentinel)
      controlNormalDark = resources.getColorOr(R.color.android_sys_color_control_normal_dark, theme, sentinel)
      controlHighlightDark = resources.getColorOr(R.color.android_sys_color_control_highlight_dark, theme, sentinel)
      textPrimaryInverseDark = resources.getColorOr(R.color.android_sys_color_text_primary_inverse_dark, theme, sentinel)
      textSecondaryAndTertiaryInverseDark = resources.getColorOr(R.color.android_sys_color_text_secondary_and_tertiary_inverse_dark, theme, sentinel)
      textPrimaryInverseDisableOnlyDark = resources.getColorOr(R.color.android_sys_color_text_primary_inverse_disable_only_dark, theme, sentinel)
      textSecondaryAndTertiaryInverseDisabledDark = resources.getColorOr(R.color.android_sys_color_text_secondary_and_tertiary_inverse_disabled_dark, theme, sentinel)
      textHintInverseDark = resources.getColorOr(R.color.android_sys_color_text_hint_inverse_dark, theme, sentinel)
    }
  }
}

object SystemColors {
  @JvmStatic
  val isDynamicColorAvailable get() = DynamicColors.isDynamicColorAvailable()
}

@ColorInt
internal fun Resources.getColorOr(
  @ColorRes id: Int,
  theme: Resources.Theme,
  sentinel: Int = DEFAULT_COLOR_SENTINEL
) = if (id == 0) sentinel else try {
  ResourcesCompat.getColor(this, id, theme)
} catch(_: Resources.NotFoundException) {
  sentinel
}
