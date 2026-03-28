package io.github.deminearchiver.system_colors_android

import android.content.Context
import android.content.res.Resources
import android.os.Build
import androidx.annotation.ColorInt
import androidx.annotation.ColorRes
import androidx.annotation.Keep
import androidx.annotation.RequiresApi
import com.google.android.material.color.DynamicColors
import kotlin.Int

@Suppress("unused")
@Keep
object SystemColorsPlugin {
  @JvmStatic
  fun isDynamicColorAvailable(): Boolean {
    return DynamicColors.isDynamicColorAvailable()
  }
}

@Suppress("unused")
@Keep
open class SystemCorePalette {
  companion object {
    @JvmStatic
    fun fromContext(context: Context): SystemCorePalette {
      return if (Build.VERSION.SDK_INT >= 35) {
        SystemCorePalette35.fromContext(context)
      } else if (Build.VERSION.SDK_INT >= 31) {
        SystemCorePalette31.fromContext(context)
      } else {
        SystemCorePalette()
      }
    }
  }
}

@Suppress("unused")
@Keep
open class SystemColorScheme {
  companion object {
    @JvmStatic
    fun fromContext(context: Context): SystemColorScheme {
      return if (Build.VERSION.SDK_INT >= 34) {
        SystemColorScheme34.fromContext(context)
      } else {
        SystemColorScheme()
      }
    }
  }
}

@Suppress("unused")
@Keep
open class SystemCorePalette31(
  val primary0: Int,
  val primary10: Int,
  val primary50: Int,
  val primary100: Int,
  val primary200: Int,
  val primary300: Int,
  val primary400: Int,
  val primary500: Int,
  val primary600: Int,
  val primary700: Int,
  val primary800: Int,
  val primary900: Int,
  val primary1000: Int,
  val secondary0: Int,
  val secondary10: Int,
  val secondary50: Int,
  val secondary100: Int,
  val secondary200: Int,
  val secondary300: Int,
  val secondary400: Int,
  val secondary500: Int,
  val secondary600: Int,
  val secondary700: Int,
  val secondary800: Int,
  val secondary900: Int,
  val secondary1000: Int,
  val tertiary0: Int,
  val tertiary10: Int,
  val tertiary50: Int,
  val tertiary100: Int,
  val tertiary200: Int,
  val tertiary300: Int,
  val tertiary400: Int,
  val tertiary500: Int,
  val tertiary600: Int,
  val tertiary700: Int,
  val tertiary800: Int,
  val tertiary900: Int,
  val tertiary1000: Int,
  val neutral0: Int,
  val neutral10: Int,
  val neutral50: Int,
  val neutral100: Int,
  val neutral200: Int,
  val neutral300: Int,
  val neutral400: Int,
  val neutral500: Int,
  val neutral600: Int,
  val neutral700: Int,
  val neutral800: Int,
  val neutral900: Int,
  val neutral1000: Int,
  val neutralVariant0: Int,
  val neutralVariant10: Int,
  val neutralVariant50: Int,
  val neutralVariant100: Int,
  val neutralVariant200: Int,
  val neutralVariant300: Int,
  val neutralVariant400: Int,
  val neutralVariant500: Int,
  val neutralVariant600: Int,
  val neutralVariant700: Int,
  val neutralVariant800: Int,
  val neutralVariant900: Int,
  val neutralVariant1000: Int,
) : SystemCorePalette() {
  companion object {
    @RequiresApi(31)
    @JvmStatic
    fun fromContext(context: Context): SystemCorePalette31 {
      return SystemCorePalette31(
        primary0 = context.color(R.color.android_ref_palette_primary_0),
        primary10 = context.color(R.color.android_ref_palette_primary_10),
        primary50 = context.color(R.color.android_ref_palette_primary_50),
        primary100 = context.color(R.color.android_ref_palette_primary_100),
        primary200 = context.color(R.color.android_ref_palette_primary_200),
        primary300 = context.color(R.color.android_ref_palette_primary_300),
        primary400 = context.color(R.color.android_ref_palette_primary_400),
        primary500 = context.color(R.color.android_ref_palette_primary_500),
        primary600 = context.color(R.color.android_ref_palette_primary_600),
        primary700 = context.color(R.color.android_ref_palette_primary_700),
        primary800 = context.color(R.color.android_ref_palette_primary_800),
        primary900 = context.color(R.color.android_ref_palette_primary_900),
        primary1000 = context.color(R.color.android_ref_palette_primary_1000),
        secondary0 = context.color(R.color.android_ref_palette_secondary_0),
        secondary10 = context.color(R.color.android_ref_palette_secondary_10),
        secondary50 = context.color(R.color.android_ref_palette_secondary_50),
        secondary100 = context.color(R.color.android_ref_palette_secondary_100),
        secondary200 = context.color(R.color.android_ref_palette_secondary_200),
        secondary300 = context.color(R.color.android_ref_palette_secondary_300),
        secondary400 = context.color(R.color.android_ref_palette_secondary_400),
        secondary500 = context.color(R.color.android_ref_palette_secondary_500),
        secondary600 = context.color(R.color.android_ref_palette_secondary_600),
        secondary700 = context.color(R.color.android_ref_palette_secondary_700),
        secondary800 = context.color(R.color.android_ref_palette_secondary_800),
        secondary900 = context.color(R.color.android_ref_palette_secondary_900),
        secondary1000 = context.color(R.color.android_ref_palette_secondary_1000),
        tertiary0 = context.color(R.color.android_ref_palette_tertiary_0),
        tertiary10 = context.color(R.color.android_ref_palette_tertiary_10),
        tertiary50 = context.color(R.color.android_ref_palette_tertiary_50),
        tertiary100 = context.color(R.color.android_ref_palette_tertiary_100),
        tertiary200 = context.color(R.color.android_ref_palette_tertiary_200),
        tertiary300 = context.color(R.color.android_ref_palette_tertiary_300),
        tertiary400 = context.color(R.color.android_ref_palette_tertiary_400),
        tertiary500 = context.color(R.color.android_ref_palette_tertiary_500),
        tertiary600 = context.color(R.color.android_ref_palette_tertiary_600),
        tertiary700 = context.color(R.color.android_ref_palette_tertiary_700),
        tertiary800 = context.color(R.color.android_ref_palette_tertiary_800),
        tertiary900 = context.color(R.color.android_ref_palette_tertiary_900),
        tertiary1000 = context.color(R.color.android_ref_palette_tertiary_1000),
        neutral0 = context.color(R.color.android_ref_palette_neutral_0),
        neutral10 = context.color(R.color.android_ref_palette_neutral_10),
        neutral50 = context.color(R.color.android_ref_palette_neutral_50),
        neutral100 = context.color(R.color.android_ref_palette_neutral_100),
        neutral200 = context.color(R.color.android_ref_palette_neutral_200),
        neutral300 = context.color(R.color.android_ref_palette_neutral_300),
        neutral400 = context.color(R.color.android_ref_palette_neutral_400),
        neutral500 = context.color(R.color.android_ref_palette_neutral_500),
        neutral600 = context.color(R.color.android_ref_palette_neutral_600),
        neutral700 = context.color(R.color.android_ref_palette_neutral_700),
        neutral800 = context.color(R.color.android_ref_palette_neutral_800),
        neutral900 = context.color(R.color.android_ref_palette_neutral_900),
        neutral1000 = context.color(R.color.android_ref_palette_neutral_1000),
        neutralVariant0 = context.color(R.color.android_ref_palette_neutral_variant_0),
        neutralVariant10 = context.color(R.color.android_ref_palette_neutral_variant_10),
        neutralVariant50 = context.color(R.color.android_ref_palette_neutral_variant_50),
        neutralVariant100 = context.color(R.color.android_ref_palette_neutral_variant_100),
        neutralVariant200 = context.color(R.color.android_ref_palette_neutral_variant_200),
        neutralVariant300 = context.color(R.color.android_ref_palette_neutral_variant_300),
        neutralVariant400 = context.color(R.color.android_ref_palette_neutral_variant_400),
        neutralVariant500 = context.color(R.color.android_ref_palette_neutral_variant_500),
        neutralVariant600 = context.color(R.color.android_ref_palette_neutral_variant_600),
        neutralVariant700 = context.color(R.color.android_ref_palette_neutral_variant_700),
        neutralVariant800 = context.color(R.color.android_ref_palette_neutral_variant_800),
        neutralVariant900 = context.color(R.color.android_ref_palette_neutral_variant_900),
        neutralVariant1000 = context.color(R.color.android_ref_palette_neutral_variant_1000),
      )
    }
  }
}

@Suppress("unused")
@Keep
open class SystemColorScheme34(
  val primaryFixed: Int,
  val primaryFixedDim: Int,
  val onPrimaryFixed: Int,
  val onPrimaryFixedVariant: Int,
  val secondaryFixed: Int,
  val secondaryFixedDim: Int,
  val onSecondaryFixed: Int,
  val onSecondaryFixedVariant: Int,
  val tertiaryFixed: Int,
  val tertiaryFixedDim: Int,
  val onTertiaryFixed: Int,
  val onTertiaryFixedVariant: Int,
  val primaryPaletteKeyColorLight: Int,
  val secondaryPaletteKeyColorLight: Int,
  val tertiaryPaletteKeyColorLight: Int,
  val neutralPaletteKeyColorLight: Int,
  val neutralVariantPaletteKeyColorLight: Int,
  val backgroundLight: Int,
  val onBackgroundLight: Int,
  val surfaceLight: Int,
  val surfaceDimLight: Int,
  val surfaceBrightLight: Int,
  val surfaceContainerLowestLight: Int,
  val surfaceContainerLowLight: Int,
  val surfaceContainerLight: Int,
  val surfaceContainerHighLight: Int,
  val surfaceContainerHighestLight: Int,
  val onSurfaceLight: Int,
  val surfaceVariantLight: Int,
  val onSurfaceVariantLight: Int,
  val outlineLight: Int,
  val outlineVariantLight: Int,
  val inverseSurfaceLight: Int,
  val inverseOnSurfaceLight: Int,
  val shadowLight: Int,
  val scrimLight: Int,
  val surfaceTintLight: Int,
  val primaryLight: Int,
  val onPrimaryLight: Int,
  val primaryContainerLight: Int,
  val onPrimaryContainerLight: Int,
  val inversePrimaryLight: Int,
  val secondaryLight: Int,
  val onSecondaryLight: Int,
  val secondaryContainerLight: Int,
  val onSecondaryContainerLight: Int,
  val tertiaryLight: Int,
  val onTertiaryLight: Int,
  val tertiaryContainerLight: Int,
  val onTertiaryContainerLight: Int,
  val errorLight: Int,
  val onErrorLight: Int,
  val errorContainerLight: Int,
  val onErrorContainerLight: Int,
  val primaryPaletteKeyColorDark: Int,
  val secondaryPaletteKeyColorDark: Int,
  val tertiaryPaletteKeyColorDark: Int,
  val neutralPaletteKeyColorDark: Int,
  val neutralVariantPaletteKeyColorDark: Int,
  val backgroundDark: Int,
  val onBackgroundDark: Int,
  val surfaceDark: Int,
  val surfaceDimDark: Int,
  val surfaceBrightDark: Int,
  val surfaceContainerLowestDark: Int,
  val surfaceContainerLowDark: Int,
  val surfaceContainerDark: Int,
  val surfaceContainerHighDark: Int,
  val surfaceContainerHighestDark: Int,
  val onSurfaceDark: Int,
  val surfaceVariantDark: Int,
  val onSurfaceVariantDark: Int,
  val outlineDark: Int,
  val outlineVariantDark: Int,
  val inverseSurfaceDark: Int,
  val inverseOnSurfaceDark: Int,
  val shadowDark: Int,
  val scrimDark: Int,
  val surfaceTintDark: Int,
  val primaryDark: Int,
  val onPrimaryDark: Int,
  val primaryContainerDark: Int,
  val onPrimaryContainerDark: Int,
  val inversePrimaryDark: Int,
  val secondaryDark: Int,
  val onSecondaryDark: Int,
  val secondaryContainerDark: Int,
  val onSecondaryContainerDark: Int,
  val tertiaryDark: Int,
  val onTertiaryDark: Int,
  val tertiaryContainerDark: Int,
  val onTertiaryContainerDark: Int,
  val errorDark: Int,
  val onErrorDark: Int,
  val errorContainerDark: Int,
  val onErrorContainerDark: Int,
) : SystemColorScheme() {
  companion object {
    @RequiresApi(34)
    @JvmStatic
    fun fromContext(context: Context): SystemColorScheme34 {
      return SystemColorScheme34(
        primaryFixed = context.color(R.color.android_sys_color_primary_fixed),
        primaryFixedDim = context.color(R.color.android_sys_color_primary_fixed_dim),
        onPrimaryFixed = context.color(R.color.android_sys_color_on_primary_fixed),
        onPrimaryFixedVariant = context.color(R.color.android_sys_color_on_primary_fixed_variant),
        secondaryFixed = context.color(R.color.android_sys_color_secondary_fixed),
        secondaryFixedDim = context.color(R.color.android_sys_color_secondary_fixed_dim),
        onSecondaryFixed = context.color(R.color.android_sys_color_on_secondary_fixed),
        onSecondaryFixedVariant = context.color(R.color.android_sys_color_on_secondary_fixed_variant),
        tertiaryFixed = context.color(R.color.android_sys_color_tertiary_fixed),
        tertiaryFixedDim = context.color(R.color.android_sys_color_tertiary_fixed_dim),
        onTertiaryFixed = context.color(R.color.android_sys_color_on_tertiary_fixed),
        onTertiaryFixedVariant = context.color(R.color.android_sys_color_on_tertiary_fixed_variant),
        primaryPaletteKeyColorLight = context.color(R.color.android_sys_color_primary_palette_key_color_light),
        secondaryPaletteKeyColorLight = context.color(R.color.android_sys_color_secondary_palette_key_color_light),
        tertiaryPaletteKeyColorLight = context.color(R.color.android_sys_color_tertiary_palette_key_color_light),
        neutralPaletteKeyColorLight = context.color(R.color.android_sys_color_neutral_palette_key_color_light),
        neutralVariantPaletteKeyColorLight = context.color(R.color.android_sys_color_neutral_variant_palette_key_color_light),
        backgroundLight = context.color(R.color.android_sys_color_background_light),
        onBackgroundLight = context.color(R.color.android_sys_color_on_background_light),
        surfaceLight = context.color(R.color.android_sys_color_surface_light),
        surfaceDimLight = context.color(R.color.android_sys_color_surface_dim_light),
        surfaceBrightLight = context.color(R.color.android_sys_color_surface_bright_light),
        surfaceContainerLowestLight = context.color(R.color.android_sys_color_surface_container_lowest_light),
        surfaceContainerLowLight = context.color(R.color.android_sys_color_surface_container_low_light),
        surfaceContainerLight = context.color(R.color.android_sys_color_surface_container_light),
        surfaceContainerHighLight = context.color(R.color.android_sys_color_surface_container_high_light),
        surfaceContainerHighestLight = context.color(R.color.android_sys_color_surface_container_highest_light),
        onSurfaceLight = context.color(R.color.android_sys_color_on_surface_light),
        surfaceVariantLight = context.color(R.color.android_sys_color_surface_variant_light),
        onSurfaceVariantLight = context.color(R.color.android_sys_color_on_surface_variant_light),
        outlineLight = context.color(R.color.android_sys_color_outline_light),
        outlineVariantLight = context.color(R.color.android_sys_color_outline_variant_light),
        inverseSurfaceLight = context.color(R.color.android_sys_color_inverse_surface_light),
        inverseOnSurfaceLight = context.color(R.color.android_sys_color_inverse_on_surface_light),
        shadowLight = context.color(R.color.android_sys_color_shadow_light),
        scrimLight = context.color(R.color.android_sys_color_scrim_light),
        surfaceTintLight = context.color(R.color.android_sys_color_surface_tint_light),
        primaryLight = context.color(R.color.android_sys_color_primary_light),
        onPrimaryLight = context.color(R.color.android_sys_color_on_primary_light),
        primaryContainerLight = context.color(R.color.android_sys_color_primary_container_light),
        onPrimaryContainerLight = context.color(R.color.android_sys_color_on_primary_container_light),
        inversePrimaryLight = context.color(R.color.android_sys_color_inverse_primary_light),
        secondaryLight = context.color(R.color.android_sys_color_secondary_light),
        onSecondaryLight = context.color(R.color.android_sys_color_on_secondary_light),
        secondaryContainerLight = context.color(R.color.android_sys_color_secondary_container_light),
        onSecondaryContainerLight = context.color(R.color.android_sys_color_on_secondary_container_light),
        tertiaryLight = context.color(R.color.android_sys_color_tertiary_light),
        onTertiaryLight = context.color(R.color.android_sys_color_on_tertiary_light),
        tertiaryContainerLight = context.color(R.color.android_sys_color_tertiary_container_light),
        onTertiaryContainerLight = context.color(R.color.android_sys_color_on_tertiary_container_light),
        errorLight = context.color(R.color.android_sys_color_error_light),
        onErrorLight = context.color(R.color.android_sys_color_on_error_light),
        errorContainerLight = context.color(R.color.android_sys_color_error_container_light),
        onErrorContainerLight = context.color(R.color.android_sys_color_on_error_container_light),
        primaryPaletteKeyColorDark = context.color(R.color.android_sys_color_primary_palette_key_color_dark),
        secondaryPaletteKeyColorDark = context.color(R.color.android_sys_color_secondary_palette_key_color_dark),
        tertiaryPaletteKeyColorDark = context.color(R.color.android_sys_color_tertiary_palette_key_color_dark),
        neutralPaletteKeyColorDark = context.color(R.color.android_sys_color_neutral_palette_key_color_dark),
        neutralVariantPaletteKeyColorDark = context.color(R.color.android_sys_color_neutral_variant_palette_key_color_dark),
        backgroundDark = context.color(R.color.android_sys_color_background_dark),
        onBackgroundDark = context.color(R.color.android_sys_color_on_background_dark),
        surfaceDark = context.color(R.color.android_sys_color_surface_dark),
        surfaceDimDark = context.color(R.color.android_sys_color_surface_dim_dark),
        surfaceBrightDark = context.color(R.color.android_sys_color_surface_bright_dark),
        surfaceContainerLowestDark = context.color(R.color.android_sys_color_surface_container_lowest_dark),
        surfaceContainerLowDark = context.color(R.color.android_sys_color_surface_container_low_dark),
        surfaceContainerDark = context.color(R.color.android_sys_color_surface_container_dark),
        surfaceContainerHighDark = context.color(R.color.android_sys_color_surface_container_high_dark),
        surfaceContainerHighestDark = context.color(R.color.android_sys_color_surface_container_highest_dark),
        onSurfaceDark = context.color(R.color.android_sys_color_on_surface_dark),
        surfaceVariantDark = context.color(R.color.android_sys_color_surface_variant_dark),
        onSurfaceVariantDark = context.color(R.color.android_sys_color_on_surface_variant_dark),
        outlineDark = context.color(R.color.android_sys_color_outline_dark),
        outlineVariantDark = context.color(R.color.android_sys_color_outline_variant_dark),
        inverseSurfaceDark = context.color(R.color.android_sys_color_inverse_surface_dark),
        inverseOnSurfaceDark = context.color(R.color.android_sys_color_inverse_on_surface_dark),
        shadowDark = context.color(R.color.android_sys_color_shadow_dark),
        scrimDark = context.color(R.color.android_sys_color_scrim_dark),
        surfaceTintDark = context.color(R.color.android_sys_color_surface_tint_dark),
        primaryDark = context.color(R.color.android_sys_color_primary_dark),
        onPrimaryDark = context.color(R.color.android_sys_color_on_primary_dark),
        primaryContainerDark = context.color(R.color.android_sys_color_primary_container_dark),
        onPrimaryContainerDark = context.color(R.color.android_sys_color_on_primary_container_dark),
        inversePrimaryDark = context.color(R.color.android_sys_color_inverse_primary_dark),
        secondaryDark = context.color(R.color.android_sys_color_secondary_dark),
        onSecondaryDark = context.color(R.color.android_sys_color_on_secondary_dark),
        secondaryContainerDark = context.color(R.color.android_sys_color_secondary_container_dark),
        onSecondaryContainerDark = context.color(R.color.android_sys_color_on_secondary_container_dark),
        tertiaryDark = context.color(R.color.android_sys_color_tertiary_dark),
        onTertiaryDark = context.color(R.color.android_sys_color_on_tertiary_dark),
        tertiaryContainerDark = context.color(R.color.android_sys_color_tertiary_container_dark),
        onTertiaryContainerDark = context.color(R.color.android_sys_color_on_tertiary_container_dark),
        errorDark = context.color(R.color.android_sys_color_error_dark),
        onErrorDark = context.color(R.color.android_sys_color_on_error_dark),
        errorContainerDark = context.color(R.color.android_sys_color_error_container_dark),
        onErrorContainerDark = context.color(R.color.android_sys_color_on_error_container_dark),
      )
    }
  }
}

@Suppress("unused")
@Keep
open class SystemCorePalette35(
  primary0: Int,
  primary10: Int,
  primary50: Int,
  primary100: Int,
  primary200: Int,
  primary300: Int,
  primary400: Int,
  primary500: Int,
  primary600: Int,
  primary700: Int,
  primary800: Int,
  primary900: Int,
  primary1000: Int,
  secondary0: Int,
  secondary10: Int,
  secondary50: Int,
  secondary100: Int,
  secondary200: Int,
  secondary300: Int,
  secondary400: Int,
  secondary500: Int,
  secondary600: Int,
  secondary700: Int,
  secondary800: Int,
  secondary900: Int,
  secondary1000: Int,
  tertiary0: Int,
  tertiary10: Int,
  tertiary50: Int,
  tertiary100: Int,
  tertiary200: Int,
  tertiary300: Int,
  tertiary400: Int,
  tertiary500: Int,
  tertiary600: Int,
  tertiary700: Int,
  tertiary800: Int,
  tertiary900: Int,
  tertiary1000: Int,
  neutral0: Int,
  neutral10: Int,
  neutral50: Int,
  neutral100: Int,
  neutral200: Int,
  neutral300: Int,
  neutral400: Int,
  neutral500: Int,
  neutral600: Int,
  neutral700: Int,
  neutral800: Int,
  neutral900: Int,
  neutral1000: Int,
  neutralVariant0: Int,
  neutralVariant10: Int,
  neutralVariant50: Int,
  neutralVariant100: Int,
  neutralVariant200: Int,
  neutralVariant300: Int,
  neutralVariant400: Int,
  neutralVariant500: Int,
  neutralVariant600: Int,
  neutralVariant700: Int,
  neutralVariant800: Int,
  neutralVariant900: Int,
  neutralVariant1000: Int,
  val error0: Int,
  val error10: Int,
  val error50: Int,
  val error100: Int,
  val error200: Int,
  val error300: Int,
  val error400: Int,
  val error500: Int,
  val error600: Int,
  val error700: Int,
  val error800: Int,
  val error900: Int,
  val error1000: Int,
) : SystemCorePalette31(
  primary0 = primary0,
  primary10 = primary10,
  primary50 = primary50,
  primary100 = primary100,
  primary200 = primary200,
  primary300 = primary300,
  primary400 = primary400,
  primary500 = primary500,
  primary600 = primary600,
  primary700 = primary700,
  primary800 = primary800,
  primary900 = primary900,
  primary1000 = primary1000,
  secondary0 = secondary0,
  secondary10 = secondary10,
  secondary50 = secondary50,
  secondary100 = secondary100,
  secondary200 = secondary200,
  secondary300 = secondary300,
  secondary400 = secondary400,
  secondary500 = secondary500,
  secondary600 = secondary600,
  secondary700 = secondary700,
  secondary800 = secondary800,
  secondary900 = secondary900,
  secondary1000 = secondary1000,
  tertiary0 = tertiary0,
  tertiary10 = tertiary10,
  tertiary50 = tertiary50,
  tertiary100 = tertiary100,
  tertiary200 = tertiary200,
  tertiary300 = tertiary300,
  tertiary400 = tertiary400,
  tertiary500 = tertiary500,
  tertiary600 = tertiary600,
  tertiary700 = tertiary700,
  tertiary800 = tertiary800,
  tertiary900 = tertiary900,
  tertiary1000 = tertiary1000,
  neutral0 = neutral0,
  neutral10 = neutral10,
  neutral50 = neutral50,
  neutral100 = neutral100,
  neutral200 = neutral200,
  neutral300 = neutral300,
  neutral400 = neutral400,
  neutral500 = neutral500,
  neutral600 = neutral600,
  neutral700 = neutral700,
  neutral800 = neutral800,
  neutral900 = neutral900,
  neutral1000 = neutral1000,
  neutralVariant0 = neutralVariant0,
  neutralVariant10 = neutralVariant10,
  neutralVariant50 = neutralVariant50,
  neutralVariant100 = neutralVariant100,
  neutralVariant200 = neutralVariant200,
  neutralVariant300 = neutralVariant300,
  neutralVariant400 = neutralVariant400,
  neutralVariant500 = neutralVariant500,
  neutralVariant600 = neutralVariant600,
  neutralVariant700 = neutralVariant700,
  neutralVariant800 = neutralVariant800,
  neutralVariant900 = neutralVariant900,
  neutralVariant1000 = neutralVariant1000,
) {
  companion object {
    @RequiresApi(35)
    @JvmStatic
    fun fromContext(context: Context): SystemCorePalette35 {
      val corePalette31 = SystemCorePalette31.fromContext(context)
      return SystemCorePalette35(
        primary0 = corePalette31.primary0,
        primary10 = corePalette31.primary10,
        primary50 = corePalette31.primary50,
        primary100 = corePalette31.primary100,
        primary200 = corePalette31.primary200,
        primary300 = corePalette31.primary300,
        primary400 = corePalette31.primary400,
        primary500 = corePalette31.primary500,
        primary600 = corePalette31.primary600,
        primary700 = corePalette31.primary700,
        primary800 = corePalette31.primary800,
        primary900 = corePalette31.primary900,
        primary1000 = corePalette31.primary1000,
        secondary0 = corePalette31.secondary0,
        secondary10 = corePalette31.secondary10,
        secondary50 = corePalette31.secondary50,
        secondary100 = corePalette31.secondary100,
        secondary200 = corePalette31.secondary200,
        secondary300 = corePalette31.secondary300,
        secondary400 = corePalette31.secondary400,
        secondary500 = corePalette31.secondary500,
        secondary600 = corePalette31.secondary600,
        secondary700 = corePalette31.secondary700,
        secondary800 = corePalette31.secondary800,
        secondary900 = corePalette31.secondary900,
        secondary1000 = corePalette31.secondary1000,
        tertiary0 = corePalette31.tertiary0,
        tertiary10 = corePalette31.tertiary10,
        tertiary50 = corePalette31.tertiary50,
        tertiary100 = corePalette31.tertiary100,
        tertiary200 = corePalette31.tertiary200,
        tertiary300 = corePalette31.tertiary300,
        tertiary400 = corePalette31.tertiary400,
        tertiary500 = corePalette31.tertiary500,
        tertiary600 = corePalette31.tertiary600,
        tertiary700 = corePalette31.tertiary700,
        tertiary800 = corePalette31.tertiary800,
        tertiary900 = corePalette31.tertiary900,
        tertiary1000 = corePalette31.tertiary1000,
        neutral0 = corePalette31.neutral0,
        neutral10 = corePalette31.neutral10,
        neutral50 = corePalette31.neutral50,
        neutral100 = corePalette31.neutral100,
        neutral200 = corePalette31.neutral200,
        neutral300 = corePalette31.neutral300,
        neutral400 = corePalette31.neutral400,
        neutral500 = corePalette31.neutral500,
        neutral600 = corePalette31.neutral600,
        neutral700 = corePalette31.neutral700,
        neutral800 = corePalette31.neutral800,
        neutral900 = corePalette31.neutral900,
        neutral1000 = corePalette31.neutral1000,
        neutralVariant0 = corePalette31.neutralVariant0,
        neutralVariant10 = corePalette31.neutralVariant10,
        neutralVariant50 = corePalette31.neutralVariant50,
        neutralVariant100 = corePalette31.neutralVariant100,
        neutralVariant200 = corePalette31.neutralVariant200,
        neutralVariant300 = corePalette31.neutralVariant300,
        neutralVariant400 = corePalette31.neutralVariant400,
        neutralVariant500 = corePalette31.neutralVariant500,
        neutralVariant600 = corePalette31.neutralVariant600,
        neutralVariant700 = corePalette31.neutralVariant700,
        neutralVariant800 = corePalette31.neutralVariant800,
        neutralVariant900 = corePalette31.neutralVariant900,
        neutralVariant1000 = corePalette31.neutralVariant1000,
        error0 = context.color(R.color.android_ref_palette_error_0),
        error10 = context.color(R.color.android_ref_palette_error_10),
        error50 = context.color(R.color.android_ref_palette_error_50),
        error100 = context.color(R.color.android_ref_palette_error_100),
        error200 = context.color(R.color.android_ref_palette_error_200),
        error300 = context.color(R.color.android_ref_palette_error_300),
        error400 = context.color(R.color.android_ref_palette_error_400),
        error500 = context.color(R.color.android_ref_palette_error_500),
        error600 = context.color(R.color.android_ref_palette_error_600),
        error700 = context.color(R.color.android_ref_palette_error_700),
        error800 = context.color(R.color.android_ref_palette_error_800),
        error900 = context.color(R.color.android_ref_palette_error_900),
        error1000 = context.color(R.color.android_ref_palette_error_1000),
      )
    }
  }
}


@Suppress("unused")
@Keep
open class SystemColors(
  open val corePalette: SystemCorePalette = SystemCorePalette(),
  open val colorScheme: SystemColorScheme = SystemColorScheme(),
) {
  companion object {
    @JvmStatic
    fun fromContext(context: Context): SystemColors = SystemColors(
      corePalette = SystemCorePalette.fromContext(context),
      colorScheme = SystemColorScheme.fromContext(context),
    )
  }
}

//@Suppress("unused")
//@Keep
//open class SystemColors31(
//  override val corePalette: SystemCorePalette31,
//) : SystemColors()
//
//@Suppress("unused")
//@Keep
//open class SystemColors34(
//  tonalPalette: SystemCorePalette31,
//  override val colorScheme: SystemColorScheme34
//) : SystemColors31(
//  corePalette = tonalPalette
//)
//
//@Suppress("unused")
//@Keep
//open class SystemColors35(
//  override val corePalette: SystemCorePalette35,
//  colorScheme: SystemColorScheme34,
//) : SystemColors34(
//  tonalPalette = corePalette,
//  colorScheme = colorScheme
//)

@ColorInt
private fun Context.color(@ColorRes id: Int): Int {
  return if (id == Resources.ID_NULL) {
    0
  } else try {
    resources.getColor(id, theme)
  } catch (_: Resources.NotFoundException) {
    0
  }
}
