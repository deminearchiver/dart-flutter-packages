part of 'system_colors_android.dart';

abstract class _ColorSchemeDataPartial with Diagnosticable {
  const _ColorSchemeDataPartial();

  const factory _ColorSchemeDataPartial.from({
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? primaryPaletteKeyColorLight,
    Color? secondaryPaletteKeyColorLight,
    Color? tertiaryPaletteKeyColorLight,
    Color? neutralPaletteKeyColorLight,
    Color? neutralVariantPaletteKeyColorLight,
    Color? backgroundLight,
    Color? onBackgroundLight,
    Color? surfaceLight,
    Color? surfaceDimLight,
    Color? surfaceBrightLight,
    Color? surfaceContainerLowestLight,
    Color? surfaceContainerLowLight,
    Color? surfaceContainerLight,
    Color? surfaceContainerHighLight,
    Color? surfaceContainerHighestLight,
    Color? onSurfaceLight,
    Color? surfaceVariantLight,
    Color? onSurfaceVariantLight,
    Color? outlineLight,
    Color? outlineVariantLight,
    Color? inverseSurfaceLight,
    Color? inverseOnSurfaceLight,
    Color? shadowLight,
    Color? scrimLight,
    Color? surfaceTintLight,
    Color? primaryLight,
    Color? onPrimaryLight,
    Color? primaryContainerLight,
    Color? onPrimaryContainerLight,
    Color? inversePrimaryLight,
    Color? secondaryLight,
    Color? onSecondaryLight,
    Color? secondaryContainerLight,
    Color? onSecondaryContainerLight,
    Color? tertiaryLight,
    Color? onTertiaryLight,
    Color? tertiaryContainerLight,
    Color? onTertiaryContainerLight,
    Color? errorLight,
    Color? onErrorLight,
    Color? errorContainerLight,
    Color? onErrorContainerLight,
    Color? controlActivatedLight,
    Color? controlNormalLight,
    Color? controlHighlightLight,
    Color? textPrimaryInverseLight,
    Color? textSecondaryAndTertiaryInverseLight,
    Color? textPrimaryInverseDisableOnlyLight,
    Color? textSecondaryAndTertiaryInverseDisabledLight,
    Color? textHintInverseLight,
    Color? primaryPaletteKeyColorDark,
    Color? secondaryPaletteKeyColorDark,
    Color? tertiaryPaletteKeyColorDark,
    Color? neutralPaletteKeyColorDark,
    Color? neutralVariantPaletteKeyColorDark,
    Color? backgroundDark,
    Color? onBackgroundDark,
    Color? surfaceDark,
    Color? surfaceDimDark,
    Color? surfaceBrightDark,
    Color? surfaceContainerLowestDark,
    Color? surfaceContainerLowDark,
    Color? surfaceContainerDark,
    Color? surfaceContainerHighDark,
    Color? surfaceContainerHighestDark,
    Color? onSurfaceDark,
    Color? surfaceVariantDark,
    Color? onSurfaceVariantDark,
    Color? outlineDark,
    Color? outlineVariantDark,
    Color? inverseSurfaceDark,
    Color? inverseOnSurfaceDark,
    Color? shadowDark,
    Color? scrimDark,
    Color? surfaceTintDark,
    Color? primaryDark,
    Color? onPrimaryDark,
    Color? primaryContainerDark,
    Color? onPrimaryContainerDark,
    Color? inversePrimaryDark,
    Color? secondaryDark,
    Color? onSecondaryDark,
    Color? secondaryContainerDark,
    Color? onSecondaryContainerDark,
    Color? tertiaryDark,
    Color? onTertiaryDark,
    Color? tertiaryContainerDark,
    Color? onTertiaryContainerDark,
    Color? errorDark,
    Color? onErrorDark,
    Color? errorContainerDark,
    Color? onErrorContainerDark,
    Color? controlActivatedDark,
    Color? controlNormalDark,
    Color? controlHighlightDark,
    Color? textPrimaryInverseDark,
    Color? textSecondaryAndTertiaryInverseDark,
    Color? textPrimaryInverseDisableOnlyDark,
    Color? textSecondaryAndTertiaryInverseDisabledDark,
    Color? textHintInverseDark,
  }) = _ColorSchemeDataPartialFrom;

  factory _ColorSchemeDataPartial.fromNative(jb.ColorScheme object) {
    final jb.ColorScheme(
      :sentinel,
      :primaryFixed,
      :primaryFixedDim,
      :onPrimaryFixed,
      :onPrimaryFixedVariant,
      :secondaryFixed,
      :secondaryFixedDim,
      :onSecondaryFixed,
      :onSecondaryFixedVariant,
      :tertiaryFixed,
      :tertiaryFixedDim,
      :onTertiaryFixed,
      :onTertiaryFixedVariant,
      :primaryPaletteKeyColorLight,
      :secondaryPaletteKeyColorLight,
      :tertiaryPaletteKeyColorLight,
      :neutralPaletteKeyColorLight,
      :neutralVariantPaletteKeyColorLight,
      :backgroundLight,
      :onBackgroundLight,
      :surfaceLight,
      :surfaceDimLight,
      :surfaceBrightLight,
      :surfaceContainerLowestLight,
      :surfaceContainerLowLight,
      :surfaceContainerLight,
      :surfaceContainerHighLight,
      :surfaceContainerHighestLight,
      :onSurfaceLight,
      :surfaceVariantLight,
      :onSurfaceVariantLight,
      :outlineLight,
      :outlineVariantLight,
      :inverseSurfaceLight,
      :inverseOnSurfaceLight,
      :shadowLight,
      :scrimLight,
      :surfaceTintLight,
      :primaryLight,
      :onPrimaryLight,
      :primaryContainerLight,
      :onPrimaryContainerLight,
      :inversePrimaryLight,
      :secondaryLight,
      :onSecondaryLight,
      :secondaryContainerLight,
      :onSecondaryContainerLight,
      :tertiaryLight,
      :onTertiaryLight,
      :tertiaryContainerLight,
      :onTertiaryContainerLight,
      :errorLight,
      :onErrorLight,
      :errorContainerLight,
      :onErrorContainerLight,
      :controlActivatedLight,
      :controlNormalLight,
      :controlHighlightLight,
      :textPrimaryInverseLight,
      :textSecondaryAndTertiaryInverseLight,
      :textPrimaryInverseDisableOnlyLight,
      :textSecondaryAndTertiaryInverseDisabledLight,
      :textHintInverseLight,
      :primaryPaletteKeyColorDark,
      :secondaryPaletteKeyColorDark,
      :tertiaryPaletteKeyColorDark,
      :neutralPaletteKeyColorDark,
      :neutralVariantPaletteKeyColorDark,
      :backgroundDark,
      :onBackgroundDark,
      :surfaceDark,
      :surfaceDimDark,
      :surfaceBrightDark,
      :surfaceContainerLowestDark,
      :surfaceContainerLowDark,
      :surfaceContainerDark,
      :surfaceContainerHighDark,
      :surfaceContainerHighestDark,
      :onSurfaceDark,
      :surfaceVariantDark,
      :onSurfaceVariantDark,
      :outlineDark,
      :outlineVariantDark,
      :inverseSurfaceDark,
      :inverseOnSurfaceDark,
      :shadowDark,
      :scrimDark,
      :surfaceTintDark,
      :primaryDark,
      :onPrimaryDark,
      :primaryContainerDark,
      :onPrimaryContainerDark,
      :inversePrimaryDark,
      :secondaryDark,
      :onSecondaryDark,
      :secondaryContainerDark,
      :onSecondaryContainerDark,
      :tertiaryDark,
      :onTertiaryDark,
      :tertiaryContainerDark,
      :onTertiaryContainerDark,
      :errorDark,
      :onErrorDark,
      :errorContainerDark,
      :onErrorContainerDark,
      :controlActivatedDark,
      :controlNormalDark,
      :controlHighlightDark,
      :textPrimaryInverseDark,
      :textSecondaryAndTertiaryInverseDark,
      :textPrimaryInverseDisableOnlyDark,
      :textSecondaryAndTertiaryInverseDisabledDark,
      :textHintInverseDark,
    ) = object;
    return .from(
      primaryFixed: primaryFixed != sentinel ? Color(primaryFixed) : null,
      primaryFixedDim: primaryFixedDim != sentinel
          ? Color(primaryFixedDim)
          : null,
      onPrimaryFixed: onPrimaryFixed != sentinel ? Color(onPrimaryFixed) : null,
      onPrimaryFixedVariant: onPrimaryFixedVariant != sentinel
          ? Color(onPrimaryFixedVariant)
          : null,
      secondaryFixed: secondaryFixed != sentinel ? Color(secondaryFixed) : null,
      secondaryFixedDim: secondaryFixedDim != sentinel
          ? Color(secondaryFixedDim)
          : null,
      onSecondaryFixed: onSecondaryFixed != sentinel
          ? Color(onSecondaryFixed)
          : null,
      onSecondaryFixedVariant: onSecondaryFixedVariant != sentinel
          ? Color(onSecondaryFixedVariant)
          : null,
      tertiaryFixed: tertiaryFixed != sentinel ? Color(tertiaryFixed) : null,
      tertiaryFixedDim: tertiaryFixedDim != sentinel
          ? Color(tertiaryFixedDim)
          : null,
      onTertiaryFixed: onTertiaryFixed != sentinel
          ? Color(onTertiaryFixed)
          : null,
      onTertiaryFixedVariant: onTertiaryFixedVariant != sentinel
          ? Color(onTertiaryFixedVariant)
          : null,
      primaryPaletteKeyColorLight: primaryPaletteKeyColorLight != sentinel
          ? Color(primaryPaletteKeyColorLight)
          : null,
      secondaryPaletteKeyColorLight: secondaryPaletteKeyColorLight != sentinel
          ? Color(secondaryPaletteKeyColorLight)
          : null,
      tertiaryPaletteKeyColorLight: tertiaryPaletteKeyColorLight != sentinel
          ? Color(tertiaryPaletteKeyColorLight)
          : null,
      neutralPaletteKeyColorLight: neutralPaletteKeyColorLight != sentinel
          ? Color(neutralPaletteKeyColorLight)
          : null,
      neutralVariantPaletteKeyColorLight:
          neutralVariantPaletteKeyColorLight != sentinel
          ? Color(neutralVariantPaletteKeyColorLight)
          : null,
      backgroundLight: backgroundLight != sentinel
          ? Color(backgroundLight)
          : null,
      onBackgroundLight: onBackgroundLight != sentinel
          ? Color(onBackgroundLight)
          : null,
      surfaceLight: surfaceLight != sentinel ? Color(surfaceLight) : null,
      surfaceDimLight: surfaceDimLight != sentinel
          ? Color(surfaceDimLight)
          : null,
      surfaceBrightLight: surfaceBrightLight != sentinel
          ? Color(surfaceBrightLight)
          : null,
      surfaceContainerLowestLight: surfaceContainerLowestLight != sentinel
          ? Color(surfaceContainerLowestLight)
          : null,
      surfaceContainerLowLight: surfaceContainerLowLight != sentinel
          ? Color(surfaceContainerLowLight)
          : null,
      surfaceContainerLight: surfaceContainerLight != sentinel
          ? Color(surfaceContainerLight)
          : null,
      surfaceContainerHighLight: surfaceContainerHighLight != sentinel
          ? Color(surfaceContainerHighLight)
          : null,
      surfaceContainerHighestLight: surfaceContainerHighestLight != sentinel
          ? Color(surfaceContainerHighestLight)
          : null,
      onSurfaceLight: onSurfaceLight != sentinel ? Color(onSurfaceLight) : null,
      surfaceVariantLight: surfaceVariantLight != sentinel
          ? Color(surfaceVariantLight)
          : null,
      onSurfaceVariantLight: onSurfaceVariantLight != sentinel
          ? Color(onSurfaceVariantLight)
          : null,
      outlineLight: outlineLight != sentinel ? Color(outlineLight) : null,
      outlineVariantLight: outlineVariantLight != sentinel
          ? Color(outlineVariantLight)
          : null,
      inverseSurfaceLight: inverseSurfaceLight != sentinel
          ? Color(inverseSurfaceLight)
          : null,
      inverseOnSurfaceLight: inverseOnSurfaceLight != sentinel
          ? Color(inverseOnSurfaceLight)
          : null,
      shadowLight: shadowLight != sentinel ? Color(shadowLight) : null,
      scrimLight: scrimLight != sentinel ? Color(scrimLight) : null,
      surfaceTintLight: surfaceTintLight != sentinel
          ? Color(surfaceTintLight)
          : null,
      primaryLight: primaryLight != sentinel ? Color(primaryLight) : null,
      onPrimaryLight: onPrimaryLight != sentinel ? Color(onPrimaryLight) : null,
      primaryContainerLight: primaryContainerLight != sentinel
          ? Color(primaryContainerLight)
          : null,
      onPrimaryContainerLight: onPrimaryContainerLight != sentinel
          ? Color(onPrimaryContainerLight)
          : null,
      inversePrimaryLight: inversePrimaryLight != sentinel
          ? Color(inversePrimaryLight)
          : null,
      secondaryLight: secondaryLight != sentinel ? Color(secondaryLight) : null,
      onSecondaryLight: onSecondaryLight != sentinel
          ? Color(onSecondaryLight)
          : null,
      secondaryContainerLight: secondaryContainerLight != sentinel
          ? Color(secondaryContainerLight)
          : null,
      onSecondaryContainerLight: onSecondaryContainerLight != sentinel
          ? Color(onSecondaryContainerLight)
          : null,
      tertiaryLight: tertiaryLight != sentinel ? Color(tertiaryLight) : null,
      onTertiaryLight: onTertiaryLight != sentinel
          ? Color(onTertiaryLight)
          : null,
      tertiaryContainerLight: tertiaryContainerLight != sentinel
          ? Color(tertiaryContainerLight)
          : null,
      onTertiaryContainerLight: onTertiaryContainerLight != sentinel
          ? Color(onTertiaryContainerLight)
          : null,
      errorLight: errorLight != sentinel ? Color(errorLight) : null,
      onErrorLight: onErrorLight != sentinel ? Color(onErrorLight) : null,
      errorContainerLight: errorContainerLight != sentinel
          ? Color(errorContainerLight)
          : null,
      onErrorContainerLight: onErrorContainerLight != sentinel
          ? Color(onErrorContainerLight)
          : null,
      controlActivatedLight: controlActivatedLight != sentinel
          ? Color(controlActivatedLight)
          : null,
      controlNormalLight: controlNormalLight != sentinel
          ? Color(controlNormalLight)
          : null,
      controlHighlightLight: controlHighlightLight != sentinel
          ? Color(controlHighlightLight)
          : null,
      textPrimaryInverseLight: textPrimaryInverseLight != sentinel
          ? Color(textPrimaryInverseLight)
          : null,
      textSecondaryAndTertiaryInverseLight:
          textSecondaryAndTertiaryInverseLight != sentinel
          ? Color(textSecondaryAndTertiaryInverseLight)
          : null,
      textPrimaryInverseDisableOnlyLight:
          textPrimaryInverseDisableOnlyLight != sentinel
          ? Color(textPrimaryInverseDisableOnlyLight)
          : null,
      textSecondaryAndTertiaryInverseDisabledLight:
          textSecondaryAndTertiaryInverseDisabledLight != sentinel
          ? Color(textSecondaryAndTertiaryInverseDisabledLight)
          : null,
      textHintInverseLight: textHintInverseLight != sentinel
          ? Color(textHintInverseLight)
          : null,
      primaryPaletteKeyColorDark: primaryPaletteKeyColorDark != sentinel
          ? Color(primaryPaletteKeyColorDark)
          : null,
      secondaryPaletteKeyColorDark: secondaryPaletteKeyColorDark != sentinel
          ? Color(secondaryPaletteKeyColorDark)
          : null,
      tertiaryPaletteKeyColorDark: tertiaryPaletteKeyColorDark != sentinel
          ? Color(tertiaryPaletteKeyColorDark)
          : null,
      neutralPaletteKeyColorDark: neutralPaletteKeyColorDark != sentinel
          ? Color(neutralPaletteKeyColorDark)
          : null,
      neutralVariantPaletteKeyColorDark:
          neutralVariantPaletteKeyColorDark != sentinel
          ? Color(neutralVariantPaletteKeyColorDark)
          : null,
      backgroundDark: backgroundDark != sentinel ? Color(backgroundDark) : null,
      onBackgroundDark: onBackgroundDark != sentinel
          ? Color(onBackgroundDark)
          : null,
      surfaceDark: surfaceDark != sentinel ? Color(surfaceDark) : null,
      surfaceDimDark: surfaceDimDark != sentinel ? Color(surfaceDimDark) : null,
      surfaceBrightDark: surfaceBrightDark != sentinel
          ? Color(surfaceBrightDark)
          : null,
      surfaceContainerLowestDark: surfaceContainerLowestDark != sentinel
          ? Color(surfaceContainerLowestDark)
          : null,
      surfaceContainerLowDark: surfaceContainerLowDark != sentinel
          ? Color(surfaceContainerLowDark)
          : null,
      surfaceContainerDark: surfaceContainerDark != sentinel
          ? Color(surfaceContainerDark)
          : null,
      surfaceContainerHighDark: surfaceContainerHighDark != sentinel
          ? Color(surfaceContainerHighDark)
          : null,
      surfaceContainerHighestDark: surfaceContainerHighestDark != sentinel
          ? Color(surfaceContainerHighestDark)
          : null,
      onSurfaceDark: onSurfaceDark != sentinel ? Color(onSurfaceDark) : null,
      surfaceVariantDark: surfaceVariantDark != sentinel
          ? Color(surfaceVariantDark)
          : null,
      onSurfaceVariantDark: onSurfaceVariantDark != sentinel
          ? Color(onSurfaceVariantDark)
          : null,
      outlineDark: outlineDark != sentinel ? Color(outlineDark) : null,
      outlineVariantDark: outlineVariantDark != sentinel
          ? Color(outlineVariantDark)
          : null,
      inverseSurfaceDark: inverseSurfaceDark != sentinel
          ? Color(inverseSurfaceDark)
          : null,
      inverseOnSurfaceDark: inverseOnSurfaceDark != sentinel
          ? Color(inverseOnSurfaceDark)
          : null,
      shadowDark: shadowDark != sentinel ? Color(shadowDark) : null,
      scrimDark: scrimDark != sentinel ? Color(scrimDark) : null,
      surfaceTintDark: surfaceTintDark != sentinel
          ? Color(surfaceTintDark)
          : null,
      primaryDark: primaryDark != sentinel ? Color(primaryDark) : null,
      onPrimaryDark: onPrimaryDark != sentinel ? Color(onPrimaryDark) : null,
      primaryContainerDark: primaryContainerDark != sentinel
          ? Color(primaryContainerDark)
          : null,
      onPrimaryContainerDark: onPrimaryContainerDark != sentinel
          ? Color(onPrimaryContainerDark)
          : null,
      inversePrimaryDark: inversePrimaryDark != sentinel
          ? Color(inversePrimaryDark)
          : null,
      secondaryDark: secondaryDark != sentinel ? Color(secondaryDark) : null,
      onSecondaryDark: onSecondaryDark != sentinel
          ? Color(onSecondaryDark)
          : null,
      secondaryContainerDark: secondaryContainerDark != sentinel
          ? Color(secondaryContainerDark)
          : null,
      onSecondaryContainerDark: onSecondaryContainerDark != sentinel
          ? Color(onSecondaryContainerDark)
          : null,
      tertiaryDark: tertiaryDark != sentinel ? Color(tertiaryDark) : null,
      onTertiaryDark: onTertiaryDark != sentinel ? Color(onTertiaryDark) : null,
      tertiaryContainerDark: tertiaryContainerDark != sentinel
          ? Color(tertiaryContainerDark)
          : null,
      onTertiaryContainerDark: onTertiaryContainerDark != sentinel
          ? Color(onTertiaryContainerDark)
          : null,
      errorDark: errorDark != sentinel ? Color(errorDark) : null,
      onErrorDark: onErrorDark != sentinel ? Color(onErrorDark) : null,
      errorContainerDark: errorContainerDark != sentinel
          ? Color(errorContainerDark)
          : null,
      onErrorContainerDark: onErrorContainerDark != sentinel
          ? Color(onErrorContainerDark)
          : null,
      controlActivatedDark: controlActivatedDark != sentinel
          ? Color(controlActivatedDark)
          : null,
      controlNormalDark: controlNormalDark != sentinel
          ? Color(controlNormalDark)
          : null,
      controlHighlightDark: controlHighlightDark != sentinel
          ? Color(controlHighlightDark)
          : null,
      textPrimaryInverseDark: textPrimaryInverseDark != sentinel
          ? Color(textPrimaryInverseDark)
          : null,
      textSecondaryAndTertiaryInverseDark:
          textSecondaryAndTertiaryInverseDark != sentinel
          ? Color(textSecondaryAndTertiaryInverseDark)
          : null,
      textPrimaryInverseDisableOnlyDark:
          textPrimaryInverseDisableOnlyDark != sentinel
          ? Color(textPrimaryInverseDisableOnlyDark)
          : null,
      textSecondaryAndTertiaryInverseDisabledDark:
          textSecondaryAndTertiaryInverseDisabledDark != sentinel
          ? Color(textSecondaryAndTertiaryInverseDisabledDark)
          : null,
      textHintInverseDark: textHintInverseDark != sentinel
          ? Color(textHintInverseDark)
          : null,
    );
  }

  Color? get primaryFixed;
  Color? get primaryFixedDim;
  Color? get onPrimaryFixed;
  Color? get onPrimaryFixedVariant;
  Color? get secondaryFixed;
  Color? get secondaryFixedDim;
  Color? get onSecondaryFixed;
  Color? get onSecondaryFixedVariant;
  Color? get tertiaryFixed;
  Color? get tertiaryFixedDim;
  Color? get onTertiaryFixed;
  Color? get onTertiaryFixedVariant;
  Color? get primaryPaletteKeyColorLight;
  Color? get secondaryPaletteKeyColorLight;
  Color? get tertiaryPaletteKeyColorLight;
  Color? get neutralPaletteKeyColorLight;
  Color? get neutralVariantPaletteKeyColorLight;
  Color? get backgroundLight;
  Color? get onBackgroundLight;
  Color? get surfaceLight;
  Color? get surfaceDimLight;
  Color? get surfaceBrightLight;
  Color? get surfaceContainerLowestLight;
  Color? get surfaceContainerLowLight;
  Color? get surfaceContainerLight;
  Color? get surfaceContainerHighLight;
  Color? get surfaceContainerHighestLight;
  Color? get onSurfaceLight;
  Color? get surfaceVariantLight;
  Color? get onSurfaceVariantLight;
  Color? get outlineLight;
  Color? get outlineVariantLight;
  Color? get inverseSurfaceLight;
  Color? get inverseOnSurfaceLight;
  Color? get shadowLight;
  Color? get scrimLight;
  Color? get surfaceTintLight;
  Color? get primaryLight;
  Color? get onPrimaryLight;
  Color? get primaryContainerLight;
  Color? get onPrimaryContainerLight;
  Color? get inversePrimaryLight;
  Color? get secondaryLight;
  Color? get onSecondaryLight;
  Color? get secondaryContainerLight;
  Color? get onSecondaryContainerLight;
  Color? get tertiaryLight;
  Color? get onTertiaryLight;
  Color? get tertiaryContainerLight;
  Color? get onTertiaryContainerLight;
  Color? get errorLight;
  Color? get onErrorLight;
  Color? get errorContainerLight;
  Color? get onErrorContainerLight;
  Color? get controlActivatedLight;
  Color? get controlNormalLight;
  Color? get controlHighlightLight;
  Color? get textPrimaryInverseLight;
  Color? get textSecondaryAndTertiaryInverseLight;
  Color? get textPrimaryInverseDisableOnlyLight;
  Color? get textSecondaryAndTertiaryInverseDisabledLight;
  Color? get textHintInverseLight;
  Color? get primaryPaletteKeyColorDark;
  Color? get secondaryPaletteKeyColorDark;
  Color? get tertiaryPaletteKeyColorDark;
  Color? get neutralPaletteKeyColorDark;
  Color? get neutralVariantPaletteKeyColorDark;
  Color? get backgroundDark;
  Color? get onBackgroundDark;
  Color? get surfaceDark;
  Color? get surfaceDimDark;
  Color? get surfaceBrightDark;
  Color? get surfaceContainerLowestDark;
  Color? get surfaceContainerLowDark;
  Color? get surfaceContainerDark;
  Color? get surfaceContainerHighDark;
  Color? get surfaceContainerHighestDark;
  Color? get onSurfaceDark;
  Color? get surfaceVariantDark;
  Color? get onSurfaceVariantDark;
  Color? get outlineDark;
  Color? get outlineVariantDark;
  Color? get inverseSurfaceDark;
  Color? get inverseOnSurfaceDark;
  Color? get shadowDark;
  Color? get scrimDark;
  Color? get surfaceTintDark;
  Color? get primaryDark;
  Color? get onPrimaryDark;
  Color? get primaryContainerDark;
  Color? get onPrimaryContainerDark;
  Color? get inversePrimaryDark;
  Color? get secondaryDark;
  Color? get onSecondaryDark;
  Color? get secondaryContainerDark;
  Color? get onSecondaryContainerDark;
  Color? get tertiaryDark;
  Color? get onTertiaryDark;
  Color? get tertiaryContainerDark;
  Color? get onTertiaryContainerDark;
  Color? get errorDark;
  Color? get onErrorDark;
  Color? get errorContainerDark;
  Color? get onErrorContainerDark;
  Color? get controlActivatedDark;
  Color? get controlNormalDark;
  Color? get controlHighlightDark;
  Color? get textPrimaryInverseDark;
  Color? get textSecondaryAndTertiaryInverseDark;
  Color? get textPrimaryInverseDisableOnlyDark;
  Color? get textSecondaryAndTertiaryInverseDisabledDark;
  Color? get textHintInverseDark;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("primaryFixed", primaryFixed, defaultValue: null))
      ..add(
        ColorProperty("primaryFixedDim", primaryFixedDim, defaultValue: null),
      )
      ..add(ColorProperty("onPrimaryFixed", onPrimaryFixed, defaultValue: null))
      ..add(
        ColorProperty(
          "onPrimaryFixedVariant",
          onPrimaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("secondaryFixed", secondaryFixed, defaultValue: null))
      ..add(
        ColorProperty(
          "secondaryFixedDim",
          secondaryFixedDim,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("onSecondaryFixed", onSecondaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onSecondaryFixedVariant",
          onSecondaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiaryFixed", tertiaryFixed, defaultValue: null))
      ..add(
        ColorProperty("tertiaryFixedDim", tertiaryFixedDim, defaultValue: null),
      )
      ..add(
        ColorProperty("onTertiaryFixed", onTertiaryFixed, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onTertiaryFixedVariant",
          onTertiaryFixedVariant,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "primaryPaletteKeyColorLight",
          primaryPaletteKeyColorLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColorLight",
          secondaryPaletteKeyColorLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColorLight",
          tertiaryPaletteKeyColorLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralPaletteKeyColorLight",
          neutralPaletteKeyColorLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColorLight",
          neutralVariantPaletteKeyColorLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty("backgroundLight", backgroundLight, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "onBackgroundLight",
          onBackgroundLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("surfaceLight", surfaceLight, defaultValue: null))
      ..add(
        ColorProperty("surfaceDimLight", surfaceDimLight, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "surfaceBrightLight",
          surfaceBrightLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLowestLight",
          surfaceContainerLowestLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLowLight",
          surfaceContainerLowLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLight",
          surfaceContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighLight",
          surfaceContainerHighLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighestLight",
          surfaceContainerHighestLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("onSurfaceLight", onSurfaceLight, defaultValue: null))
      ..add(
        ColorProperty(
          "surfaceVariantLight",
          surfaceVariantLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSurfaceVariantLight",
          onSurfaceVariantLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("outlineLight", outlineLight, defaultValue: null))
      ..add(
        ColorProperty(
          "outlineVariantLight",
          outlineVariantLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "inverseSurfaceLight",
          inverseSurfaceLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "inverseOnSurfaceLight",
          inverseOnSurfaceLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("shadowLight", shadowLight, defaultValue: null))
      ..add(ColorProperty("scrimLight", scrimLight, defaultValue: null))
      ..add(
        ColorProperty("surfaceTintLight", surfaceTintLight, defaultValue: null),
      )
      ..add(ColorProperty("primaryLight", primaryLight, defaultValue: null))
      ..add(ColorProperty("onPrimaryLight", onPrimaryLight, defaultValue: null))
      ..add(
        ColorProperty(
          "primaryContainerLight",
          primaryContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onPrimaryContainerLight",
          onPrimaryContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "inversePrimaryLight",
          inversePrimaryLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("secondaryLight", secondaryLight, defaultValue: null))
      ..add(
        ColorProperty("onSecondaryLight", onSecondaryLight, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "secondaryContainerLight",
          secondaryContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSecondaryContainerLight",
          onSecondaryContainerLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiaryLight", tertiaryLight, defaultValue: null))
      ..add(
        ColorProperty("onTertiaryLight", onTertiaryLight, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "tertiaryContainerLight",
          tertiaryContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onTertiaryContainerLight",
          onTertiaryContainerLight,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("errorLight", errorLight, defaultValue: null))
      ..add(ColorProperty("onErrorLight", onErrorLight, defaultValue: null))
      ..add(
        ColorProperty(
          "errorContainerLight",
          errorContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onErrorContainerLight",
          onErrorContainerLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "controlActivatedLight",
          controlActivatedLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "controlNormalLight",
          controlNormalLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "controlHighlightLight",
          controlHighlightLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textPrimaryInverseLight",
          textPrimaryInverseLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseLight",
          textSecondaryAndTertiaryInverseLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textPrimaryInverseDisableOnlyLight",
          textPrimaryInverseDisableOnlyLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseDisabledLight",
          textSecondaryAndTertiaryInverseDisabledLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textHintInverseLight",
          textHintInverseLight,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "primaryPaletteKeyColorDark",
          primaryPaletteKeyColorDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColorDark",
          secondaryPaletteKeyColorDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColorDark",
          tertiaryPaletteKeyColorDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralPaletteKeyColorDark",
          neutralPaletteKeyColorDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColorDark",
          neutralVariantPaletteKeyColorDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("backgroundDark", backgroundDark, defaultValue: null))
      ..add(
        ColorProperty("onBackgroundDark", onBackgroundDark, defaultValue: null),
      )
      ..add(ColorProperty("surfaceDark", surfaceDark, defaultValue: null))
      ..add(ColorProperty("surfaceDimDark", surfaceDimDark, defaultValue: null))
      ..add(
        ColorProperty(
          "surfaceBrightDark",
          surfaceBrightDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLowestDark",
          surfaceContainerLowestDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerLowDark",
          surfaceContainerLowDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerDark",
          surfaceContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighDark",
          surfaceContainerHighDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighestDark",
          surfaceContainerHighestDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("onSurfaceDark", onSurfaceDark, defaultValue: null))
      ..add(
        ColorProperty(
          "surfaceVariantDark",
          surfaceVariantDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSurfaceVariantDark",
          onSurfaceVariantDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("outlineDark", outlineDark, defaultValue: null))
      ..add(
        ColorProperty(
          "outlineVariantDark",
          outlineVariantDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "inverseSurfaceDark",
          inverseSurfaceDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "inverseOnSurfaceDark",
          inverseOnSurfaceDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("shadowDark", shadowDark, defaultValue: null))
      ..add(ColorProperty("scrimDark", scrimDark, defaultValue: null))
      ..add(
        ColorProperty("surfaceTintDark", surfaceTintDark, defaultValue: null),
      )
      ..add(ColorProperty("primaryDark", primaryDark, defaultValue: null))
      ..add(ColorProperty("onPrimaryDark", onPrimaryDark, defaultValue: null))
      ..add(
        ColorProperty(
          "primaryContainerDark",
          primaryContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onPrimaryContainerDark",
          onPrimaryContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "inversePrimaryDark",
          inversePrimaryDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("secondaryDark", secondaryDark, defaultValue: null))
      ..add(
        ColorProperty("onSecondaryDark", onSecondaryDark, defaultValue: null),
      )
      ..add(
        ColorProperty(
          "secondaryContainerDark",
          secondaryContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onSecondaryContainerDark",
          onSecondaryContainerDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("tertiaryDark", tertiaryDark, defaultValue: null))
      ..add(ColorProperty("onTertiaryDark", onTertiaryDark, defaultValue: null))
      ..add(
        ColorProperty(
          "tertiaryContainerDark",
          tertiaryContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onTertiaryContainerDark",
          onTertiaryContainerDark,
          defaultValue: null,
        ),
      )
      ..add(ColorProperty("errorDark", errorDark, defaultValue: null))
      ..add(ColorProperty("onErrorDark", onErrorDark, defaultValue: null))
      ..add(
        ColorProperty(
          "errorContainerDark",
          errorContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "onErrorContainerDark",
          onErrorContainerDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "controlActivatedDark",
          controlActivatedDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "controlNormalDark",
          controlNormalDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "controlHighlightDark",
          controlHighlightDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textPrimaryInverseDark",
          textPrimaryInverseDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseDark",
          textSecondaryAndTertiaryInverseDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textPrimaryInverseDisableOnlyDark",
          textPrimaryInverseDisableOnlyDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseDisabledDark",
          textSecondaryAndTertiaryInverseDisabledDark,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty(
          "textHintInverseDark",
          textHintInverseDark,
          defaultValue: null,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorSchemeDataPartial &&
          primaryFixed == other.primaryFixed &&
          primaryFixedDim == other.primaryFixedDim &&
          onPrimaryFixed == other.onPrimaryFixed &&
          onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
          secondaryFixed == other.secondaryFixed &&
          secondaryFixedDim == other.secondaryFixedDim &&
          onSecondaryFixed == other.onSecondaryFixed &&
          onSecondaryFixedVariant == other.onSecondaryFixedVariant &&
          tertiaryFixed == other.tertiaryFixed &&
          tertiaryFixedDim == other.tertiaryFixedDim &&
          onTertiaryFixed == other.onTertiaryFixed &&
          onTertiaryFixedVariant == other.onTertiaryFixedVariant &&
          primaryPaletteKeyColorLight == other.primaryPaletteKeyColorLight &&
          secondaryPaletteKeyColorLight ==
              other.secondaryPaletteKeyColorLight &&
          tertiaryPaletteKeyColorLight == other.tertiaryPaletteKeyColorLight &&
          neutralPaletteKeyColorLight == other.neutralPaletteKeyColorLight &&
          neutralVariantPaletteKeyColorLight ==
              other.neutralVariantPaletteKeyColorLight &&
          backgroundLight == other.backgroundLight &&
          onBackgroundLight == other.onBackgroundLight &&
          surfaceLight == other.surfaceLight &&
          surfaceDimLight == other.surfaceDimLight &&
          surfaceBrightLight == other.surfaceBrightLight &&
          surfaceContainerLowestLight == other.surfaceContainerLowestLight &&
          surfaceContainerLowLight == other.surfaceContainerLowLight &&
          surfaceContainerLight == other.surfaceContainerLight &&
          surfaceContainerHighLight == other.surfaceContainerHighLight &&
          surfaceContainerHighestLight == other.surfaceContainerHighestLight &&
          onSurfaceLight == other.onSurfaceLight &&
          surfaceVariantLight == other.surfaceVariantLight &&
          onSurfaceVariantLight == other.onSurfaceVariantLight &&
          outlineLight == other.outlineLight &&
          outlineVariantLight == other.outlineVariantLight &&
          inverseSurfaceLight == other.inverseSurfaceLight &&
          inverseOnSurfaceLight == other.inverseOnSurfaceLight &&
          shadowLight == other.shadowLight &&
          scrimLight == other.scrimLight &&
          surfaceTintLight == other.surfaceTintLight &&
          primaryLight == other.primaryLight &&
          onPrimaryLight == other.onPrimaryLight &&
          primaryContainerLight == other.primaryContainerLight &&
          onPrimaryContainerLight == other.onPrimaryContainerLight &&
          inversePrimaryLight == other.inversePrimaryLight &&
          secondaryLight == other.secondaryLight &&
          onSecondaryLight == other.onSecondaryLight &&
          secondaryContainerLight == other.secondaryContainerLight &&
          onSecondaryContainerLight == other.onSecondaryContainerLight &&
          tertiaryLight == other.tertiaryLight &&
          onTertiaryLight == other.onTertiaryLight &&
          tertiaryContainerLight == other.tertiaryContainerLight &&
          onTertiaryContainerLight == other.onTertiaryContainerLight &&
          errorLight == other.errorLight &&
          onErrorLight == other.onErrorLight &&
          errorContainerLight == other.errorContainerLight &&
          onErrorContainerLight == other.onErrorContainerLight &&
          controlActivatedLight == other.controlActivatedLight &&
          controlNormalLight == other.controlNormalLight &&
          controlHighlightLight == other.controlHighlightLight &&
          textPrimaryInverseLight == other.textPrimaryInverseLight &&
          textSecondaryAndTertiaryInverseLight ==
              other.textSecondaryAndTertiaryInverseLight &&
          textPrimaryInverseDisableOnlyLight ==
              other.textPrimaryInverseDisableOnlyLight &&
          textSecondaryAndTertiaryInverseDisabledLight ==
              other.textSecondaryAndTertiaryInverseDisabledLight &&
          textHintInverseLight == other.textHintInverseLight &&
          primaryPaletteKeyColorDark == other.primaryPaletteKeyColorDark &&
          secondaryPaletteKeyColorDark == other.secondaryPaletteKeyColorDark &&
          tertiaryPaletteKeyColorDark == other.tertiaryPaletteKeyColorDark &&
          neutralPaletteKeyColorDark == other.neutralPaletteKeyColorDark &&
          neutralVariantPaletteKeyColorDark ==
              other.neutralVariantPaletteKeyColorDark &&
          backgroundDark == other.backgroundDark &&
          onBackgroundDark == other.onBackgroundDark &&
          surfaceDark == other.surfaceDark &&
          surfaceDimDark == other.surfaceDimDark &&
          surfaceBrightDark == other.surfaceBrightDark &&
          surfaceContainerLowestDark == other.surfaceContainerLowestDark &&
          surfaceContainerLowDark == other.surfaceContainerLowDark &&
          surfaceContainerDark == other.surfaceContainerDark &&
          surfaceContainerHighDark == other.surfaceContainerHighDark &&
          surfaceContainerHighestDark == other.surfaceContainerHighestDark &&
          onSurfaceDark == other.onSurfaceDark &&
          surfaceVariantDark == other.surfaceVariantDark &&
          onSurfaceVariantDark == other.onSurfaceVariantDark &&
          outlineDark == other.outlineDark &&
          outlineVariantDark == other.outlineVariantDark &&
          inverseSurfaceDark == other.inverseSurfaceDark &&
          inverseOnSurfaceDark == other.inverseOnSurfaceDark &&
          shadowDark == other.shadowDark &&
          scrimDark == other.scrimDark &&
          surfaceTintDark == other.surfaceTintDark &&
          primaryDark == other.primaryDark &&
          onPrimaryDark == other.onPrimaryDark &&
          primaryContainerDark == other.primaryContainerDark &&
          onPrimaryContainerDark == other.onPrimaryContainerDark &&
          inversePrimaryDark == other.inversePrimaryDark &&
          secondaryDark == other.secondaryDark &&
          onSecondaryDark == other.onSecondaryDark &&
          secondaryContainerDark == other.secondaryContainerDark &&
          onSecondaryContainerDark == other.onSecondaryContainerDark &&
          tertiaryDark == other.tertiaryDark &&
          onTertiaryDark == other.onTertiaryDark &&
          tertiaryContainerDark == other.tertiaryContainerDark &&
          onTertiaryContainerDark == other.onTertiaryContainerDark &&
          errorDark == other.errorDark &&
          onErrorDark == other.onErrorDark &&
          errorContainerDark == other.errorContainerDark &&
          onErrorContainerDark == other.onErrorContainerDark &&
          controlActivatedDark == other.controlActivatedDark &&
          controlNormalDark == other.controlNormalDark &&
          controlHighlightDark == other.controlHighlightDark &&
          textPrimaryInverseDark == other.textPrimaryInverseDark &&
          textSecondaryAndTertiaryInverseDark ==
              other.textSecondaryAndTertiaryInverseDark &&
          textPrimaryInverseDisableOnlyDark ==
              other.textPrimaryInverseDisableOnlyDark &&
          textSecondaryAndTertiaryInverseDisabledDark ==
              other.textSecondaryAndTertiaryInverseDisabledDark &&
          textHintInverseDark == other.textHintInverseDark;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    primaryPaletteKeyColorLight,
    secondaryPaletteKeyColorLight,
    tertiaryPaletteKeyColorLight,
    neutralPaletteKeyColorLight,
    neutralVariantPaletteKeyColorLight,
    backgroundLight,
    Object.hash(
      onBackgroundLight,
      surfaceLight,
      surfaceDimLight,
      surfaceBrightLight,
      surfaceContainerLowestLight,
      surfaceContainerLowLight,
      surfaceContainerLight,
      surfaceContainerHighLight,
      surfaceContainerHighestLight,
      onSurfaceLight,
      surfaceVariantLight,
      onSurfaceVariantLight,
      outlineLight,
      outlineVariantLight,
      inverseSurfaceLight,
      inverseOnSurfaceLight,
      shadowLight,
      scrimLight,
      surfaceTintLight,
      Object.hash(
        primaryLight,
        onPrimaryLight,
        primaryContainerLight,
        onPrimaryContainerLight,
        inversePrimaryLight,
        secondaryLight,
        onSecondaryLight,
        secondaryContainerLight,
        onSecondaryContainerLight,
        tertiaryLight,
        onTertiaryLight,
        tertiaryContainerLight,
        onTertiaryContainerLight,
        errorLight,
        onErrorLight,
        errorContainerLight,
        onErrorContainerLight,
        controlActivatedLight,
        controlNormalLight,
        Object.hash(
          controlHighlightLight,
          textPrimaryInverseLight,
          textSecondaryAndTertiaryInverseLight,
          textPrimaryInverseDisableOnlyLight,
          textSecondaryAndTertiaryInverseDisabledLight,
          textHintInverseLight,
          primaryPaletteKeyColorDark,
          secondaryPaletteKeyColorDark,
          tertiaryPaletteKeyColorDark,
          neutralPaletteKeyColorDark,
          neutralVariantPaletteKeyColorDark,
          backgroundDark,
          onBackgroundDark,
          surfaceDark,
          surfaceDimDark,
          surfaceBrightDark,
          surfaceContainerLowestDark,
          surfaceContainerLowDark,
          surfaceContainerDark,
          Object.hash(
            surfaceContainerHighDark,
            surfaceContainerHighestDark,
            onSurfaceDark,
            surfaceVariantDark,
            onSurfaceVariantDark,
            outlineDark,
            outlineVariantDark,
            inverseSurfaceDark,
            inverseOnSurfaceDark,
            shadowDark,
            scrimDark,
            surfaceTintDark,
            primaryDark,
            onPrimaryDark,
            primaryContainerDark,
            onPrimaryContainerDark,
            inversePrimaryDark,
            secondaryDark,
            onSecondaryDark,
            Object.hash(
              secondaryContainerDark,
              onSecondaryContainerDark,
              tertiaryDark,
              onTertiaryDark,
              tertiaryContainerDark,
              onTertiaryContainerDark,
              errorDark,
              onErrorDark,
              errorContainerDark,
              onErrorContainerDark,
              controlActivatedDark,
              controlNormalDark,
              controlHighlightDark,
              textPrimaryInverseDark,
              textSecondaryAndTertiaryInverseDark,
              textPrimaryInverseDisableOnlyDark,
              textSecondaryAndTertiaryInverseDisabledDark,
              textHintInverseDark,
            ),
          ),
        ),
      ),
    ),
  );
}

class _ColorSchemeDataPartialFrom extends _ColorSchemeDataPartial {
  const _ColorSchemeDataPartialFrom({
    this.primaryFixed,
    this.primaryFixedDim,
    this.onPrimaryFixed,
    this.onPrimaryFixedVariant,
    this.secondaryFixed,
    this.secondaryFixedDim,
    this.onSecondaryFixed,
    this.onSecondaryFixedVariant,
    this.tertiaryFixed,
    this.tertiaryFixedDim,
    this.onTertiaryFixed,
    this.onTertiaryFixedVariant,
    this.primaryPaletteKeyColorLight,
    this.secondaryPaletteKeyColorLight,
    this.tertiaryPaletteKeyColorLight,
    this.neutralPaletteKeyColorLight,
    this.neutralVariantPaletteKeyColorLight,
    this.backgroundLight,
    this.onBackgroundLight,
    this.surfaceLight,
    this.surfaceDimLight,
    this.surfaceBrightLight,
    this.surfaceContainerLowestLight,
    this.surfaceContainerLowLight,
    this.surfaceContainerLight,
    this.surfaceContainerHighLight,
    this.surfaceContainerHighestLight,
    this.onSurfaceLight,
    this.surfaceVariantLight,
    this.onSurfaceVariantLight,
    this.outlineLight,
    this.outlineVariantLight,
    this.inverseSurfaceLight,
    this.inverseOnSurfaceLight,
    this.shadowLight,
    this.scrimLight,
    this.surfaceTintLight,
    this.primaryLight,
    this.onPrimaryLight,
    this.primaryContainerLight,
    this.onPrimaryContainerLight,
    this.inversePrimaryLight,
    this.secondaryLight,
    this.onSecondaryLight,
    this.secondaryContainerLight,
    this.onSecondaryContainerLight,
    this.tertiaryLight,
    this.onTertiaryLight,
    this.tertiaryContainerLight,
    this.onTertiaryContainerLight,
    this.errorLight,
    this.onErrorLight,
    this.errorContainerLight,
    this.onErrorContainerLight,
    this.controlActivatedLight,
    this.controlNormalLight,
    this.controlHighlightLight,
    this.textPrimaryInverseLight,
    this.textSecondaryAndTertiaryInverseLight,
    this.textPrimaryInverseDisableOnlyLight,
    this.textSecondaryAndTertiaryInverseDisabledLight,
    this.textHintInverseLight,
    this.primaryPaletteKeyColorDark,
    this.secondaryPaletteKeyColorDark,
    this.tertiaryPaletteKeyColorDark,
    this.neutralPaletteKeyColorDark,
    this.neutralVariantPaletteKeyColorDark,
    this.backgroundDark,
    this.onBackgroundDark,
    this.surfaceDark,
    this.surfaceDimDark,
    this.surfaceBrightDark,
    this.surfaceContainerLowestDark,
    this.surfaceContainerLowDark,
    this.surfaceContainerDark,
    this.surfaceContainerHighDark,
    this.surfaceContainerHighestDark,
    this.onSurfaceDark,
    this.surfaceVariantDark,
    this.onSurfaceVariantDark,
    this.outlineDark,
    this.outlineVariantDark,
    this.inverseSurfaceDark,
    this.inverseOnSurfaceDark,
    this.shadowDark,
    this.scrimDark,
    this.surfaceTintDark,
    this.primaryDark,
    this.onPrimaryDark,
    this.primaryContainerDark,
    this.onPrimaryContainerDark,
    this.inversePrimaryDark,
    this.secondaryDark,
    this.onSecondaryDark,
    this.secondaryContainerDark,
    this.onSecondaryContainerDark,
    this.tertiaryDark,
    this.onTertiaryDark,
    this.tertiaryContainerDark,
    this.onTertiaryContainerDark,
    this.errorDark,
    this.onErrorDark,
    this.errorContainerDark,
    this.onErrorContainerDark,
    this.controlActivatedDark,
    this.controlNormalDark,
    this.controlHighlightDark,
    this.textPrimaryInverseDark,
    this.textSecondaryAndTertiaryInverseDark,
    this.textPrimaryInverseDisableOnlyDark,
    this.textSecondaryAndTertiaryInverseDisabledDark,
    this.textHintInverseDark,
  });

  @override
  final Color? primaryFixed;

  @override
  final Color? primaryFixedDim;

  @override
  final Color? onPrimaryFixed;

  @override
  final Color? onPrimaryFixedVariant;

  @override
  final Color? secondaryFixed;

  @override
  final Color? secondaryFixedDim;

  @override
  final Color? onSecondaryFixed;

  @override
  final Color? onSecondaryFixedVariant;

  @override
  final Color? tertiaryFixed;

  @override
  final Color? tertiaryFixedDim;

  @override
  final Color? onTertiaryFixed;

  @override
  final Color? onTertiaryFixedVariant;

  @override
  final Color? primaryPaletteKeyColorLight;

  @override
  final Color? secondaryPaletteKeyColorLight;

  @override
  final Color? tertiaryPaletteKeyColorLight;

  @override
  final Color? neutralPaletteKeyColorLight;

  @override
  final Color? neutralVariantPaletteKeyColorLight;

  @override
  final Color? backgroundLight;

  @override
  final Color? onBackgroundLight;

  @override
  final Color? surfaceLight;

  @override
  final Color? surfaceDimLight;

  @override
  final Color? surfaceBrightLight;

  @override
  final Color? surfaceContainerLowestLight;

  @override
  final Color? surfaceContainerLowLight;

  @override
  final Color? surfaceContainerLight;

  @override
  final Color? surfaceContainerHighLight;

  @override
  final Color? surfaceContainerHighestLight;

  @override
  final Color? onSurfaceLight;

  @override
  final Color? surfaceVariantLight;

  @override
  final Color? onSurfaceVariantLight;

  @override
  final Color? outlineLight;

  @override
  final Color? outlineVariantLight;

  @override
  final Color? inverseSurfaceLight;

  @override
  final Color? inverseOnSurfaceLight;

  @override
  final Color? shadowLight;

  @override
  final Color? scrimLight;

  @override
  final Color? surfaceTintLight;

  @override
  final Color? primaryLight;

  @override
  final Color? onPrimaryLight;

  @override
  final Color? primaryContainerLight;

  @override
  final Color? onPrimaryContainerLight;

  @override
  final Color? inversePrimaryLight;

  @override
  final Color? secondaryLight;

  @override
  final Color? onSecondaryLight;

  @override
  final Color? secondaryContainerLight;

  @override
  final Color? onSecondaryContainerLight;

  @override
  final Color? tertiaryLight;

  @override
  final Color? onTertiaryLight;

  @override
  final Color? tertiaryContainerLight;

  @override
  final Color? onTertiaryContainerLight;

  @override
  final Color? errorLight;

  @override
  final Color? onErrorLight;

  @override
  final Color? errorContainerLight;

  @override
  final Color? onErrorContainerLight;

  @override
  final Color? controlActivatedLight;

  @override
  final Color? controlNormalLight;

  @override
  final Color? controlHighlightLight;

  @override
  final Color? textPrimaryInverseLight;

  @override
  final Color? textSecondaryAndTertiaryInverseLight;

  @override
  final Color? textPrimaryInverseDisableOnlyLight;

  @override
  final Color? textSecondaryAndTertiaryInverseDisabledLight;

  @override
  final Color? textHintInverseLight;

  @override
  final Color? primaryPaletteKeyColorDark;

  @override
  final Color? secondaryPaletteKeyColorDark;

  @override
  final Color? tertiaryPaletteKeyColorDark;

  @override
  final Color? neutralPaletteKeyColorDark;

  @override
  final Color? neutralVariantPaletteKeyColorDark;

  @override
  final Color? backgroundDark;

  @override
  final Color? onBackgroundDark;

  @override
  final Color? surfaceDark;

  @override
  final Color? surfaceDimDark;

  @override
  final Color? surfaceBrightDark;

  @override
  final Color? surfaceContainerLowestDark;

  @override
  final Color? surfaceContainerLowDark;

  @override
  final Color? surfaceContainerDark;

  @override
  final Color? surfaceContainerHighDark;

  @override
  final Color? surfaceContainerHighestDark;

  @override
  final Color? onSurfaceDark;

  @override
  final Color? surfaceVariantDark;

  @override
  final Color? onSurfaceVariantDark;

  @override
  final Color? outlineDark;

  @override
  final Color? outlineVariantDark;

  @override
  final Color? inverseSurfaceDark;

  @override
  final Color? inverseOnSurfaceDark;

  @override
  final Color? shadowDark;

  @override
  final Color? scrimDark;

  @override
  final Color? surfaceTintDark;

  @override
  final Color? primaryDark;

  @override
  final Color? onPrimaryDark;

  @override
  final Color? primaryContainerDark;

  @override
  final Color? onPrimaryContainerDark;

  @override
  final Color? inversePrimaryDark;

  @override
  final Color? secondaryDark;

  @override
  final Color? onSecondaryDark;

  @override
  final Color? secondaryContainerDark;

  @override
  final Color? onSecondaryContainerDark;

  @override
  final Color? tertiaryDark;

  @override
  final Color? onTertiaryDark;

  @override
  final Color? tertiaryContainerDark;

  @override
  final Color? onTertiaryContainerDark;

  @override
  final Color? errorDark;

  @override
  final Color? onErrorDark;

  @override
  final Color? errorContainerDark;

  @override
  final Color? onErrorContainerDark;

  @override
  final Color? controlActivatedDark;

  @override
  final Color? controlNormalDark;

  @override
  final Color? controlHighlightDark;

  @override
  final Color? textPrimaryInverseDark;

  @override
  final Color? textSecondaryAndTertiaryInverseDark;

  @override
  final Color? textPrimaryInverseDisableOnlyDark;

  @override
  final Color? textSecondaryAndTertiaryInverseDisabledDark;

  @override
  final Color? textHintInverseDark;
}

abstract class _ColorSchemeData extends _ColorSchemeDataPartial {
  const _ColorSchemeData();

  const factory _ColorSchemeData.from({
    required Color primaryFixed,
    required Color primaryFixedDim,
    required Color onPrimaryFixed,
    required Color onPrimaryFixedVariant,
    required Color secondaryFixed,
    required Color secondaryFixedDim,
    required Color onSecondaryFixed,
    required Color onSecondaryFixedVariant,
    required Color tertiaryFixed,
    required Color tertiaryFixedDim,
    required Color onTertiaryFixed,
    required Color onTertiaryFixedVariant,
    required Color primaryPaletteKeyColorLight,
    required Color secondaryPaletteKeyColorLight,
    required Color tertiaryPaletteKeyColorLight,
    required Color neutralPaletteKeyColorLight,
    required Color neutralVariantPaletteKeyColorLight,
    required Color backgroundLight,
    required Color onBackgroundLight,
    required Color surfaceLight,
    required Color surfaceDimLight,
    required Color surfaceBrightLight,
    required Color surfaceContainerLowestLight,
    required Color surfaceContainerLowLight,
    required Color surfaceContainerLight,
    required Color surfaceContainerHighLight,
    required Color surfaceContainerHighestLight,
    required Color onSurfaceLight,
    required Color surfaceVariantLight,
    required Color onSurfaceVariantLight,
    required Color outlineLight,
    required Color outlineVariantLight,
    required Color inverseSurfaceLight,
    required Color inverseOnSurfaceLight,
    required Color shadowLight,
    required Color scrimLight,
    required Color surfaceTintLight,
    required Color primaryLight,
    required Color onPrimaryLight,
    required Color primaryContainerLight,
    required Color onPrimaryContainerLight,
    required Color inversePrimaryLight,
    required Color secondaryLight,
    required Color onSecondaryLight,
    required Color secondaryContainerLight,
    required Color onSecondaryContainerLight,
    required Color tertiaryLight,
    required Color onTertiaryLight,
    required Color tertiaryContainerLight,
    required Color onTertiaryContainerLight,
    required Color errorLight,
    required Color onErrorLight,
    required Color errorContainerLight,
    required Color onErrorContainerLight,
    required Color controlActivatedLight,
    required Color controlNormalLight,
    required Color controlHighlightLight,
    required Color textPrimaryInverseLight,
    required Color textSecondaryAndTertiaryInverseLight,
    required Color textPrimaryInverseDisableOnlyLight,
    required Color textSecondaryAndTertiaryInverseDisabledLight,
    required Color textHintInverseLight,
    required Color primaryPaletteKeyColorDark,
    required Color secondaryPaletteKeyColorDark,
    required Color tertiaryPaletteKeyColorDark,
    required Color neutralPaletteKeyColorDark,
    required Color neutralVariantPaletteKeyColorDark,
    required Color backgroundDark,
    required Color onBackgroundDark,
    required Color surfaceDark,
    required Color surfaceDimDark,
    required Color surfaceBrightDark,
    required Color surfaceContainerLowestDark,
    required Color surfaceContainerLowDark,
    required Color surfaceContainerDark,
    required Color surfaceContainerHighDark,
    required Color surfaceContainerHighestDark,
    required Color onSurfaceDark,
    required Color surfaceVariantDark,
    required Color onSurfaceVariantDark,
    required Color outlineDark,
    required Color outlineVariantDark,
    required Color inverseSurfaceDark,
    required Color inverseOnSurfaceDark,
    required Color shadowDark,
    required Color scrimDark,
    required Color surfaceTintDark,
    required Color primaryDark,
    required Color onPrimaryDark,
    required Color primaryContainerDark,
    required Color onPrimaryContainerDark,
    required Color inversePrimaryDark,
    required Color secondaryDark,
    required Color onSecondaryDark,
    required Color secondaryContainerDark,
    required Color onSecondaryContainerDark,
    required Color tertiaryDark,
    required Color onTertiaryDark,
    required Color tertiaryContainerDark,
    required Color onTertiaryContainerDark,
    required Color errorDark,
    required Color onErrorDark,
    required Color errorContainerDark,
    required Color onErrorContainerDark,
    required Color controlActivatedDark,
    required Color controlNormalDark,
    required Color controlHighlightDark,
    required Color textPrimaryInverseDark,
    required Color textSecondaryAndTertiaryInverseDark,
    required Color textPrimaryInverseDisableOnlyDark,
    required Color textSecondaryAndTertiaryInverseDisabledDark,
    required Color textHintInverseDark,
  }) = _ColorSchemeDataFrom;

  factory _ColorSchemeData.fromNative(jb.ColorScheme object) => .from(
    primaryFixed: Color(object.primaryFixed),
    primaryFixedDim: Color(object.primaryFixedDim),
    onPrimaryFixed: Color(object.onPrimaryFixed),
    onPrimaryFixedVariant: Color(object.onPrimaryFixedVariant),
    secondaryFixed: Color(object.secondaryFixed),
    secondaryFixedDim: Color(object.secondaryFixedDim),
    onSecondaryFixed: Color(object.onSecondaryFixed),
    onSecondaryFixedVariant: Color(object.onSecondaryFixedVariant),
    tertiaryFixed: Color(object.tertiaryFixed),
    tertiaryFixedDim: Color(object.tertiaryFixedDim),
    onTertiaryFixed: Color(object.onTertiaryFixed),
    onTertiaryFixedVariant: Color(object.onTertiaryFixedVariant),
    primaryPaletteKeyColorLight: Color(object.primaryPaletteKeyColorLight),
    secondaryPaletteKeyColorLight: Color(object.secondaryPaletteKeyColorLight),
    tertiaryPaletteKeyColorLight: Color(object.tertiaryPaletteKeyColorLight),
    neutralPaletteKeyColorLight: Color(object.neutralPaletteKeyColorLight),
    neutralVariantPaletteKeyColorLight: Color(
      object.neutralVariantPaletteKeyColorLight,
    ),
    backgroundLight: Color(object.backgroundLight),
    onBackgroundLight: Color(object.onBackgroundLight),
    surfaceLight: Color(object.surfaceLight),
    surfaceDimLight: Color(object.surfaceDimLight),
    surfaceBrightLight: Color(object.surfaceBrightLight),
    surfaceContainerLowestLight: Color(object.surfaceContainerLowestLight),
    surfaceContainerLowLight: Color(object.surfaceContainerLowLight),
    surfaceContainerLight: Color(object.surfaceContainerLight),
    surfaceContainerHighLight: Color(object.surfaceContainerHighLight),
    surfaceContainerHighestLight: Color(object.surfaceContainerHighestLight),
    onSurfaceLight: Color(object.onSurfaceLight),
    surfaceVariantLight: Color(object.surfaceVariantLight),
    onSurfaceVariantLight: Color(object.onSurfaceVariantLight),
    outlineLight: Color(object.outlineLight),
    outlineVariantLight: Color(object.outlineVariantLight),
    inverseSurfaceLight: Color(object.inverseSurfaceLight),
    inverseOnSurfaceLight: Color(object.inverseOnSurfaceLight),
    shadowLight: Color(object.shadowLight),
    scrimLight: Color(object.scrimLight),
    surfaceTintLight: Color(object.surfaceTintLight),
    primaryLight: Color(object.primaryLight),
    onPrimaryLight: Color(object.onPrimaryLight),
    primaryContainerLight: Color(object.primaryContainerLight),
    onPrimaryContainerLight: Color(object.onPrimaryContainerLight),
    inversePrimaryLight: Color(object.inversePrimaryLight),
    secondaryLight: Color(object.secondaryLight),
    onSecondaryLight: Color(object.onSecondaryLight),
    secondaryContainerLight: Color(object.secondaryContainerLight),
    onSecondaryContainerLight: Color(object.onSecondaryContainerLight),
    tertiaryLight: Color(object.tertiaryLight),
    onTertiaryLight: Color(object.onTertiaryLight),
    tertiaryContainerLight: Color(object.tertiaryContainerLight),
    onTertiaryContainerLight: Color(object.onTertiaryContainerLight),
    errorLight: Color(object.errorLight),
    onErrorLight: Color(object.onErrorLight),
    errorContainerLight: Color(object.errorContainerLight),
    onErrorContainerLight: Color(object.onErrorContainerLight),
    controlActivatedLight: Color(object.controlActivatedLight),
    controlNormalLight: Color(object.controlNormalLight),
    controlHighlightLight: Color(object.controlHighlightLight),
    textPrimaryInverseLight: Color(object.textPrimaryInverseLight),
    textSecondaryAndTertiaryInverseLight: Color(
      object.textSecondaryAndTertiaryInverseLight,
    ),
    textPrimaryInverseDisableOnlyLight: Color(
      object.textPrimaryInverseDisableOnlyLight,
    ),
    textSecondaryAndTertiaryInverseDisabledLight: Color(
      object.textSecondaryAndTertiaryInverseDisabledLight,
    ),
    textHintInverseLight: Color(object.textHintInverseLight),
    primaryPaletteKeyColorDark: Color(object.primaryPaletteKeyColorDark),
    secondaryPaletteKeyColorDark: Color(object.secondaryPaletteKeyColorDark),
    tertiaryPaletteKeyColorDark: Color(object.tertiaryPaletteKeyColorDark),
    neutralPaletteKeyColorDark: Color(object.neutralPaletteKeyColorDark),
    neutralVariantPaletteKeyColorDark: Color(
      object.neutralVariantPaletteKeyColorDark,
    ),
    backgroundDark: Color(object.backgroundDark),
    onBackgroundDark: Color(object.onBackgroundDark),
    surfaceDark: Color(object.surfaceDark),
    surfaceDimDark: Color(object.surfaceDimDark),
    surfaceBrightDark: Color(object.surfaceBrightDark),
    surfaceContainerLowestDark: Color(object.surfaceContainerLowestDark),
    surfaceContainerLowDark: Color(object.surfaceContainerLowDark),
    surfaceContainerDark: Color(object.surfaceContainerDark),
    surfaceContainerHighDark: Color(object.surfaceContainerHighDark),
    surfaceContainerHighestDark: Color(object.surfaceContainerHighestDark),
    onSurfaceDark: Color(object.onSurfaceDark),
    surfaceVariantDark: Color(object.surfaceVariantDark),
    onSurfaceVariantDark: Color(object.onSurfaceVariantDark),
    outlineDark: Color(object.outlineDark),
    outlineVariantDark: Color(object.outlineVariantDark),
    inverseSurfaceDark: Color(object.inverseSurfaceDark),
    inverseOnSurfaceDark: Color(object.inverseOnSurfaceDark),
    shadowDark: Color(object.shadowDark),
    scrimDark: Color(object.scrimDark),
    surfaceTintDark: Color(object.surfaceTintDark),
    primaryDark: Color(object.primaryDark),
    onPrimaryDark: Color(object.onPrimaryDark),
    primaryContainerDark: Color(object.primaryContainerDark),
    onPrimaryContainerDark: Color(object.onPrimaryContainerDark),
    inversePrimaryDark: Color(object.inversePrimaryDark),
    secondaryDark: Color(object.secondaryDark),
    onSecondaryDark: Color(object.onSecondaryDark),
    secondaryContainerDark: Color(object.secondaryContainerDark),
    onSecondaryContainerDark: Color(object.onSecondaryContainerDark),
    tertiaryDark: Color(object.tertiaryDark),
    onTertiaryDark: Color(object.onTertiaryDark),
    tertiaryContainerDark: Color(object.tertiaryContainerDark),
    onTertiaryContainerDark: Color(object.onTertiaryContainerDark),
    errorDark: Color(object.errorDark),
    onErrorDark: Color(object.onErrorDark),
    errorContainerDark: Color(object.errorContainerDark),
    onErrorContainerDark: Color(object.onErrorContainerDark),
    controlActivatedDark: Color(object.controlActivatedDark),
    controlNormalDark: Color(object.controlNormalDark),
    controlHighlightDark: Color(object.controlHighlightDark),
    textPrimaryInverseDark: Color(object.textPrimaryInverseDark),
    textSecondaryAndTertiaryInverseDark: Color(
      object.textSecondaryAndTertiaryInverseDark,
    ),
    textPrimaryInverseDisableOnlyDark: Color(
      object.textPrimaryInverseDisableOnlyDark,
    ),
    textSecondaryAndTertiaryInverseDisabledDark: Color(
      object.textSecondaryAndTertiaryInverseDisabledDark,
    ),
    textHintInverseDark: Color(object.textHintInverseDark),
  );

  @override
  Color get primaryFixed;

  @override
  Color get primaryFixedDim;

  @override
  Color get onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant;

  @override
  Color get secondaryFixed;

  @override
  Color get secondaryFixedDim;

  @override
  Color get onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant;

  @override
  Color get tertiaryFixed;

  @override
  Color get tertiaryFixedDim;

  @override
  Color get onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant;

  @override
  Color get primaryPaletteKeyColorLight;

  @override
  Color get secondaryPaletteKeyColorLight;

  @override
  Color get tertiaryPaletteKeyColorLight;

  @override
  Color get neutralPaletteKeyColorLight;

  @override
  Color get neutralVariantPaletteKeyColorLight;

  @override
  Color get backgroundLight;

  @override
  Color get onBackgroundLight;

  @override
  Color get surfaceLight;

  @override
  Color get surfaceDimLight;

  @override
  Color get surfaceBrightLight;

  @override
  Color get surfaceContainerLowestLight;

  @override
  Color get surfaceContainerLowLight;

  @override
  Color get surfaceContainerLight;

  @override
  Color get surfaceContainerHighLight;

  @override
  Color get surfaceContainerHighestLight;

  @override
  Color get onSurfaceLight;

  @override
  Color get surfaceVariantLight;

  @override
  Color get onSurfaceVariantLight;

  @override
  Color get outlineLight;

  @override
  Color get outlineVariantLight;

  @override
  Color get inverseSurfaceLight;

  @override
  Color get inverseOnSurfaceLight;

  @override
  Color get shadowLight;

  @override
  Color get scrimLight;

  @override
  Color get surfaceTintLight;

  @override
  Color get primaryLight;

  @override
  Color get onPrimaryLight;

  @override
  Color get primaryContainerLight;

  @override
  Color get onPrimaryContainerLight;

  @override
  Color get inversePrimaryLight;

  @override
  Color get secondaryLight;

  @override
  Color get onSecondaryLight;

  @override
  Color get secondaryContainerLight;

  @override
  Color get onSecondaryContainerLight;

  @override
  Color get tertiaryLight;

  @override
  Color get onTertiaryLight;

  @override
  Color get tertiaryContainerLight;

  @override
  Color get onTertiaryContainerLight;

  @override
  Color get errorLight;

  @override
  Color get onErrorLight;

  @override
  Color get errorContainerLight;

  @override
  Color get onErrorContainerLight;

  @override
  Color get controlActivatedLight;

  @override
  Color get controlNormalLight;

  @override
  Color get controlHighlightLight;

  @override
  Color get textPrimaryInverseLight;

  @override
  Color get textSecondaryAndTertiaryInverseLight;

  @override
  Color get textPrimaryInverseDisableOnlyLight;

  @override
  Color get textSecondaryAndTertiaryInverseDisabledLight;

  @override
  Color get textHintInverseLight;

  @override
  Color get primaryPaletteKeyColorDark;

  @override
  Color get secondaryPaletteKeyColorDark;

  @override
  Color get tertiaryPaletteKeyColorDark;

  @override
  Color get neutralPaletteKeyColorDark;

  @override
  Color get neutralVariantPaletteKeyColorDark;

  @override
  Color get backgroundDark;

  @override
  Color get onBackgroundDark;

  @override
  Color get surfaceDark;

  @override
  Color get surfaceDimDark;

  @override
  Color get surfaceBrightDark;

  @override
  Color get surfaceContainerLowestDark;

  @override
  Color get surfaceContainerLowDark;

  @override
  Color get surfaceContainerDark;

  @override
  Color get surfaceContainerHighDark;

  @override
  Color get surfaceContainerHighestDark;

  @override
  Color get onSurfaceDark;

  @override
  Color get surfaceVariantDark;

  @override
  Color get onSurfaceVariantDark;

  @override
  Color get outlineDark;

  @override
  Color get outlineVariantDark;

  @override
  Color get inverseSurfaceDark;

  @override
  Color get inverseOnSurfaceDark;

  @override
  Color get shadowDark;

  @override
  Color get scrimDark;

  @override
  Color get surfaceTintDark;

  @override
  Color get primaryDark;

  @override
  Color get onPrimaryDark;

  @override
  Color get primaryContainerDark;

  @override
  Color get onPrimaryContainerDark;

  @override
  Color get inversePrimaryDark;

  @override
  Color get secondaryDark;

  @override
  Color get onSecondaryDark;

  @override
  Color get secondaryContainerDark;

  @override
  Color get onSecondaryContainerDark;

  @override
  Color get tertiaryDark;

  @override
  Color get onTertiaryDark;

  @override
  Color get tertiaryContainerDark;

  @override
  Color get onTertiaryContainerDark;

  @override
  Color get errorDark;

  @override
  Color get onErrorDark;

  @override
  Color get errorContainerDark;

  @override
  Color get onErrorContainerDark;

  @override
  Color get controlActivatedDark;

  @override
  Color get controlNormalDark;

  @override
  Color get controlHighlightDark;

  @override
  Color get textPrimaryInverseDark;

  @override
  Color get textSecondaryAndTertiaryInverseDark;

  @override
  Color get textPrimaryInverseDisableOnlyDark;

  @override
  Color get textSecondaryAndTertiaryInverseDisabledDark;

  @override
  Color get textHintInverseDark;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(ColorProperty("primaryFixed", primaryFixed))
      ..add(ColorProperty("primaryFixedDim", primaryFixedDim))
      ..add(ColorProperty("onPrimaryFixed", onPrimaryFixed))
      ..add(ColorProperty("onPrimaryFixedVariant", onPrimaryFixedVariant))
      ..add(ColorProperty("secondaryFixed", secondaryFixed))
      ..add(ColorProperty("secondaryFixedDim", secondaryFixedDim))
      ..add(ColorProperty("onSecondaryFixed", onSecondaryFixed))
      ..add(ColorProperty("onSecondaryFixedVariant", onSecondaryFixedVariant))
      ..add(ColorProperty("tertiaryFixed", tertiaryFixed))
      ..add(ColorProperty("tertiaryFixedDim", tertiaryFixedDim))
      ..add(ColorProperty("onTertiaryFixed", onTertiaryFixed))
      ..add(ColorProperty("onTertiaryFixedVariant", onTertiaryFixedVariant))
      ..add(
        ColorProperty(
          "primaryPaletteKeyColorLight",
          primaryPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColorLight",
          secondaryPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColorLight",
          tertiaryPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "neutralPaletteKeyColorLight",
          neutralPaletteKeyColorLight,
        ),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColorLight",
          neutralVariantPaletteKeyColorLight,
        ),
      )
      ..add(ColorProperty("backgroundLight", backgroundLight))
      ..add(ColorProperty("onBackgroundLight", onBackgroundLight))
      ..add(ColorProperty("surfaceLight", surfaceLight))
      ..add(ColorProperty("surfaceDimLight", surfaceDimLight))
      ..add(ColorProperty("surfaceBrightLight", surfaceBrightLight))
      ..add(
        ColorProperty(
          "surfaceContainerLowestLight",
          surfaceContainerLowestLight,
        ),
      )
      ..add(ColorProperty("surfaceContainerLowLight", surfaceContainerLowLight))
      ..add(ColorProperty("surfaceContainerLight", surfaceContainerLight))
      ..add(
        ColorProperty("surfaceContainerHighLight", surfaceContainerHighLight),
      )
      ..add(
        ColorProperty(
          "surfaceContainerHighestLight",
          surfaceContainerHighestLight,
        ),
      )
      ..add(ColorProperty("onSurfaceLight", onSurfaceLight))
      ..add(ColorProperty("surfaceVariantLight", surfaceVariantLight))
      ..add(ColorProperty("onSurfaceVariantLight", onSurfaceVariantLight))
      ..add(ColorProperty("outlineLight", outlineLight))
      ..add(ColorProperty("outlineVariantLight", outlineVariantLight))
      ..add(ColorProperty("inverseSurfaceLight", inverseSurfaceLight))
      ..add(ColorProperty("inverseOnSurfaceLight", inverseOnSurfaceLight))
      ..add(ColorProperty("shadowLight", shadowLight))
      ..add(ColorProperty("scrimLight", scrimLight))
      ..add(ColorProperty("surfaceTintLight", surfaceTintLight))
      ..add(ColorProperty("primaryLight", primaryLight))
      ..add(ColorProperty("onPrimaryLight", onPrimaryLight))
      ..add(ColorProperty("primaryContainerLight", primaryContainerLight))
      ..add(ColorProperty("onPrimaryContainerLight", onPrimaryContainerLight))
      ..add(ColorProperty("inversePrimaryLight", inversePrimaryLight))
      ..add(ColorProperty("secondaryLight", secondaryLight))
      ..add(ColorProperty("onSecondaryLight", onSecondaryLight))
      ..add(ColorProperty("secondaryContainerLight", secondaryContainerLight))
      ..add(
        ColorProperty("onSecondaryContainerLight", onSecondaryContainerLight),
      )
      ..add(ColorProperty("tertiaryLight", tertiaryLight))
      ..add(ColorProperty("onTertiaryLight", onTertiaryLight))
      ..add(ColorProperty("tertiaryContainerLight", tertiaryContainerLight))
      ..add(ColorProperty("onTertiaryContainerLight", onTertiaryContainerLight))
      ..add(ColorProperty("errorLight", errorLight))
      ..add(ColorProperty("onErrorLight", onErrorLight))
      ..add(ColorProperty("errorContainerLight", errorContainerLight))
      ..add(ColorProperty("onErrorContainerLight", onErrorContainerLight))
      ..add(ColorProperty("controlActivatedLight", controlActivatedLight))
      ..add(ColorProperty("controlNormalLight", controlNormalLight))
      ..add(ColorProperty("controlHighlightLight", controlHighlightLight))
      ..add(ColorProperty("textPrimaryInverseLight", textPrimaryInverseLight))
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseLight",
          textSecondaryAndTertiaryInverseLight,
        ),
      )
      ..add(
        ColorProperty(
          "textPrimaryInverseDisableOnlyLight",
          textPrimaryInverseDisableOnlyLight,
        ),
      )
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseDisabledLight",
          textSecondaryAndTertiaryInverseDisabledLight,
        ),
      )
      ..add(ColorProperty("textHintInverseLight", textHintInverseLight))
      ..add(
        ColorProperty("primaryPaletteKeyColorDark", primaryPaletteKeyColorDark),
      )
      ..add(
        ColorProperty(
          "secondaryPaletteKeyColorDark",
          secondaryPaletteKeyColorDark,
        ),
      )
      ..add(
        ColorProperty(
          "tertiaryPaletteKeyColorDark",
          tertiaryPaletteKeyColorDark,
        ),
      )
      ..add(
        ColorProperty("neutralPaletteKeyColorDark", neutralPaletteKeyColorDark),
      )
      ..add(
        ColorProperty(
          "neutralVariantPaletteKeyColorDark",
          neutralVariantPaletteKeyColorDark,
        ),
      )
      ..add(ColorProperty("backgroundDark", backgroundDark))
      ..add(ColorProperty("onBackgroundDark", onBackgroundDark))
      ..add(ColorProperty("surfaceDark", surfaceDark))
      ..add(ColorProperty("surfaceDimDark", surfaceDimDark))
      ..add(ColorProperty("surfaceBrightDark", surfaceBrightDark))
      ..add(
        ColorProperty("surfaceContainerLowestDark", surfaceContainerLowestDark),
      )
      ..add(ColorProperty("surfaceContainerLowDark", surfaceContainerLowDark))
      ..add(ColorProperty("surfaceContainerDark", surfaceContainerDark))
      ..add(ColorProperty("surfaceContainerHighDark", surfaceContainerHighDark))
      ..add(
        ColorProperty(
          "surfaceContainerHighestDark",
          surfaceContainerHighestDark,
        ),
      )
      ..add(ColorProperty("onSurfaceDark", onSurfaceDark))
      ..add(ColorProperty("surfaceVariantDark", surfaceVariantDark))
      ..add(ColorProperty("onSurfaceVariantDark", onSurfaceVariantDark))
      ..add(ColorProperty("outlineDark", outlineDark))
      ..add(ColorProperty("outlineVariantDark", outlineVariantDark))
      ..add(ColorProperty("inverseSurfaceDark", inverseSurfaceDark))
      ..add(ColorProperty("inverseOnSurfaceDark", inverseOnSurfaceDark))
      ..add(ColorProperty("shadowDark", shadowDark))
      ..add(ColorProperty("scrimDark", scrimDark))
      ..add(ColorProperty("surfaceTintDark", surfaceTintDark))
      ..add(ColorProperty("primaryDark", primaryDark))
      ..add(ColorProperty("onPrimaryDark", onPrimaryDark))
      ..add(ColorProperty("primaryContainerDark", primaryContainerDark))
      ..add(ColorProperty("onPrimaryContainerDark", onPrimaryContainerDark))
      ..add(ColorProperty("inversePrimaryDark", inversePrimaryDark))
      ..add(ColorProperty("secondaryDark", secondaryDark))
      ..add(ColorProperty("onSecondaryDark", onSecondaryDark))
      ..add(ColorProperty("secondaryContainerDark", secondaryContainerDark))
      ..add(ColorProperty("onSecondaryContainerDark", onSecondaryContainerDark))
      ..add(ColorProperty("tertiaryDark", tertiaryDark))
      ..add(ColorProperty("onTertiaryDark", onTertiaryDark))
      ..add(ColorProperty("tertiaryContainerDark", tertiaryContainerDark))
      ..add(ColorProperty("onTertiaryContainerDark", onTertiaryContainerDark))
      ..add(ColorProperty("errorDark", errorDark))
      ..add(ColorProperty("onErrorDark", onErrorDark))
      ..add(ColorProperty("errorContainerDark", errorContainerDark))
      ..add(ColorProperty("onErrorContainerDark", onErrorContainerDark))
      ..add(ColorProperty("controlActivatedDark", controlActivatedDark))
      ..add(ColorProperty("controlNormalDark", controlNormalDark))
      ..add(ColorProperty("controlHighlightDark", controlHighlightDark))
      ..add(ColorProperty("textPrimaryInverseDark", textPrimaryInverseDark))
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseDark",
          textSecondaryAndTertiaryInverseDark,
        ),
      )
      ..add(
        ColorProperty(
          "textPrimaryInverseDisableOnlyDark",
          textPrimaryInverseDisableOnlyDark,
        ),
      )
      ..add(
        ColorProperty(
          "textSecondaryAndTertiaryInverseDisabledDark",
          textSecondaryAndTertiaryInverseDisabledDark,
        ),
      )
      ..add(ColorProperty("textHintInverseDark", textHintInverseDark));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorSchemeData &&
          primaryFixed == other.primaryFixed &&
          primaryFixedDim == other.primaryFixedDim &&
          onPrimaryFixed == other.onPrimaryFixed &&
          onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
          secondaryFixed == other.secondaryFixed &&
          secondaryFixedDim == other.secondaryFixedDim &&
          onSecondaryFixed == other.onSecondaryFixed &&
          onSecondaryFixedVariant == other.onSecondaryFixedVariant &&
          tertiaryFixed == other.tertiaryFixed &&
          tertiaryFixedDim == other.tertiaryFixedDim &&
          onTertiaryFixed == other.onTertiaryFixed &&
          onTertiaryFixedVariant == other.onTertiaryFixedVariant &&
          primaryPaletteKeyColorLight == other.primaryPaletteKeyColorLight &&
          secondaryPaletteKeyColorLight ==
              other.secondaryPaletteKeyColorLight &&
          tertiaryPaletteKeyColorLight == other.tertiaryPaletteKeyColorLight &&
          neutralPaletteKeyColorLight == other.neutralPaletteKeyColorLight &&
          neutralVariantPaletteKeyColorLight ==
              other.neutralVariantPaletteKeyColorLight &&
          backgroundLight == other.backgroundLight &&
          onBackgroundLight == other.onBackgroundLight &&
          surfaceLight == other.surfaceLight &&
          surfaceDimLight == other.surfaceDimLight &&
          surfaceBrightLight == other.surfaceBrightLight &&
          surfaceContainerLowestLight == other.surfaceContainerLowestLight &&
          surfaceContainerLowLight == other.surfaceContainerLowLight &&
          surfaceContainerLight == other.surfaceContainerLight &&
          surfaceContainerHighLight == other.surfaceContainerHighLight &&
          surfaceContainerHighestLight == other.surfaceContainerHighestLight &&
          onSurfaceLight == other.onSurfaceLight &&
          surfaceVariantLight == other.surfaceVariantLight &&
          onSurfaceVariantLight == other.onSurfaceVariantLight &&
          outlineLight == other.outlineLight &&
          outlineVariantLight == other.outlineVariantLight &&
          inverseSurfaceLight == other.inverseSurfaceLight &&
          inverseOnSurfaceLight == other.inverseOnSurfaceLight &&
          shadowLight == other.shadowLight &&
          scrimLight == other.scrimLight &&
          surfaceTintLight == other.surfaceTintLight &&
          primaryLight == other.primaryLight &&
          onPrimaryLight == other.onPrimaryLight &&
          primaryContainerLight == other.primaryContainerLight &&
          onPrimaryContainerLight == other.onPrimaryContainerLight &&
          inversePrimaryLight == other.inversePrimaryLight &&
          secondaryLight == other.secondaryLight &&
          onSecondaryLight == other.onSecondaryLight &&
          secondaryContainerLight == other.secondaryContainerLight &&
          onSecondaryContainerLight == other.onSecondaryContainerLight &&
          tertiaryLight == other.tertiaryLight &&
          onTertiaryLight == other.onTertiaryLight &&
          tertiaryContainerLight == other.tertiaryContainerLight &&
          onTertiaryContainerLight == other.onTertiaryContainerLight &&
          errorLight == other.errorLight &&
          onErrorLight == other.onErrorLight &&
          errorContainerLight == other.errorContainerLight &&
          onErrorContainerLight == other.onErrorContainerLight &&
          controlActivatedLight == other.controlActivatedLight &&
          controlNormalLight == other.controlNormalLight &&
          controlHighlightLight == other.controlHighlightLight &&
          textPrimaryInverseLight == other.textPrimaryInverseLight &&
          textSecondaryAndTertiaryInverseLight ==
              other.textSecondaryAndTertiaryInverseLight &&
          textPrimaryInverseDisableOnlyLight ==
              other.textPrimaryInverseDisableOnlyLight &&
          textSecondaryAndTertiaryInverseDisabledLight ==
              other.textSecondaryAndTertiaryInverseDisabledLight &&
          textHintInverseLight == other.textHintInverseLight &&
          primaryPaletteKeyColorDark == other.primaryPaletteKeyColorDark &&
          secondaryPaletteKeyColorDark == other.secondaryPaletteKeyColorDark &&
          tertiaryPaletteKeyColorDark == other.tertiaryPaletteKeyColorDark &&
          neutralPaletteKeyColorDark == other.neutralPaletteKeyColorDark &&
          neutralVariantPaletteKeyColorDark ==
              other.neutralVariantPaletteKeyColorDark &&
          backgroundDark == other.backgroundDark &&
          onBackgroundDark == other.onBackgroundDark &&
          surfaceDark == other.surfaceDark &&
          surfaceDimDark == other.surfaceDimDark &&
          surfaceBrightDark == other.surfaceBrightDark &&
          surfaceContainerLowestDark == other.surfaceContainerLowestDark &&
          surfaceContainerLowDark == other.surfaceContainerLowDark &&
          surfaceContainerDark == other.surfaceContainerDark &&
          surfaceContainerHighDark == other.surfaceContainerHighDark &&
          surfaceContainerHighestDark == other.surfaceContainerHighestDark &&
          onSurfaceDark == other.onSurfaceDark &&
          surfaceVariantDark == other.surfaceVariantDark &&
          onSurfaceVariantDark == other.onSurfaceVariantDark &&
          outlineDark == other.outlineDark &&
          outlineVariantDark == other.outlineVariantDark &&
          inverseSurfaceDark == other.inverseSurfaceDark &&
          inverseOnSurfaceDark == other.inverseOnSurfaceDark &&
          shadowDark == other.shadowDark &&
          scrimDark == other.scrimDark &&
          surfaceTintDark == other.surfaceTintDark &&
          primaryDark == other.primaryDark &&
          onPrimaryDark == other.onPrimaryDark &&
          primaryContainerDark == other.primaryContainerDark &&
          onPrimaryContainerDark == other.onPrimaryContainerDark &&
          inversePrimaryDark == other.inversePrimaryDark &&
          secondaryDark == other.secondaryDark &&
          onSecondaryDark == other.onSecondaryDark &&
          secondaryContainerDark == other.secondaryContainerDark &&
          onSecondaryContainerDark == other.onSecondaryContainerDark &&
          tertiaryDark == other.tertiaryDark &&
          onTertiaryDark == other.onTertiaryDark &&
          tertiaryContainerDark == other.tertiaryContainerDark &&
          onTertiaryContainerDark == other.onTertiaryContainerDark &&
          errorDark == other.errorDark &&
          onErrorDark == other.onErrorDark &&
          errorContainerDark == other.errorContainerDark &&
          onErrorContainerDark == other.onErrorContainerDark &&
          controlActivatedDark == other.controlActivatedDark &&
          controlNormalDark == other.controlNormalDark &&
          controlHighlightDark == other.controlHighlightDark &&
          textPrimaryInverseDark == other.textPrimaryInverseDark &&
          textSecondaryAndTertiaryInverseDark ==
              other.textSecondaryAndTertiaryInverseDark &&
          textPrimaryInverseDisableOnlyDark ==
              other.textPrimaryInverseDisableOnlyDark &&
          textSecondaryAndTertiaryInverseDisabledDark ==
              other.textSecondaryAndTertiaryInverseDisabledDark &&
          textHintInverseDark == other.textHintInverseDark;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    primaryPaletteKeyColorLight,
    secondaryPaletteKeyColorLight,
    tertiaryPaletteKeyColorLight,
    neutralPaletteKeyColorLight,
    neutralVariantPaletteKeyColorLight,
    backgroundLight,
    Object.hash(
      onBackgroundLight,
      surfaceLight,
      surfaceDimLight,
      surfaceBrightLight,
      surfaceContainerLowestLight,
      surfaceContainerLowLight,
      surfaceContainerLight,
      surfaceContainerHighLight,
      surfaceContainerHighestLight,
      onSurfaceLight,
      surfaceVariantLight,
      onSurfaceVariantLight,
      outlineLight,
      outlineVariantLight,
      inverseSurfaceLight,
      inverseOnSurfaceLight,
      shadowLight,
      scrimLight,
      surfaceTintLight,
      Object.hash(
        primaryLight,
        onPrimaryLight,
        primaryContainerLight,
        onPrimaryContainerLight,
        inversePrimaryLight,
        secondaryLight,
        onSecondaryLight,
        secondaryContainerLight,
        onSecondaryContainerLight,
        tertiaryLight,
        onTertiaryLight,
        tertiaryContainerLight,
        onTertiaryContainerLight,
        errorLight,
        onErrorLight,
        errorContainerLight,
        onErrorContainerLight,
        controlActivatedLight,
        controlNormalLight,
        Object.hash(
          controlHighlightLight,
          textPrimaryInverseLight,
          textSecondaryAndTertiaryInverseLight,
          textPrimaryInverseDisableOnlyLight,
          textSecondaryAndTertiaryInverseDisabledLight,
          textHintInverseLight,
          primaryPaletteKeyColorDark,
          secondaryPaletteKeyColorDark,
          tertiaryPaletteKeyColorDark,
          neutralPaletteKeyColorDark,
          neutralVariantPaletteKeyColorDark,
          backgroundDark,
          onBackgroundDark,
          surfaceDark,
          surfaceDimDark,
          surfaceBrightDark,
          surfaceContainerLowestDark,
          surfaceContainerLowDark,
          surfaceContainerDark,
          Object.hash(
            surfaceContainerHighDark,
            surfaceContainerHighestDark,
            onSurfaceDark,
            surfaceVariantDark,
            onSurfaceVariantDark,
            outlineDark,
            outlineVariantDark,
            inverseSurfaceDark,
            inverseOnSurfaceDark,
            shadowDark,
            scrimDark,
            surfaceTintDark,
            primaryDark,
            onPrimaryDark,
            primaryContainerDark,
            onPrimaryContainerDark,
            inversePrimaryDark,
            secondaryDark,
            onSecondaryDark,
            Object.hash(
              secondaryContainerDark,
              onSecondaryContainerDark,
              tertiaryDark,
              onTertiaryDark,
              tertiaryContainerDark,
              onTertiaryContainerDark,
              errorDark,
              onErrorDark,
              errorContainerDark,
              onErrorContainerDark,
              controlActivatedDark,
              controlNormalDark,
              controlHighlightDark,
              textPrimaryInverseDark,
              textSecondaryAndTertiaryInverseDark,
              textPrimaryInverseDisableOnlyDark,
              textSecondaryAndTertiaryInverseDisabledDark,
              textHintInverseDark,
            ),
          ),
        ),
      ),
    ),
  );
}

class _ColorSchemeDataFrom extends _ColorSchemeData {
  const _ColorSchemeDataFrom({
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.primaryPaletteKeyColorLight,
    required this.secondaryPaletteKeyColorLight,
    required this.tertiaryPaletteKeyColorLight,
    required this.neutralPaletteKeyColorLight,
    required this.neutralVariantPaletteKeyColorLight,
    required this.backgroundLight,
    required this.onBackgroundLight,
    required this.surfaceLight,
    required this.surfaceDimLight,
    required this.surfaceBrightLight,
    required this.surfaceContainerLowestLight,
    required this.surfaceContainerLowLight,
    required this.surfaceContainerLight,
    required this.surfaceContainerHighLight,
    required this.surfaceContainerHighestLight,
    required this.onSurfaceLight,
    required this.surfaceVariantLight,
    required this.onSurfaceVariantLight,
    required this.outlineLight,
    required this.outlineVariantLight,
    required this.inverseSurfaceLight,
    required this.inverseOnSurfaceLight,
    required this.shadowLight,
    required this.scrimLight,
    required this.surfaceTintLight,
    required this.primaryLight,
    required this.onPrimaryLight,
    required this.primaryContainerLight,
    required this.onPrimaryContainerLight,
    required this.inversePrimaryLight,
    required this.secondaryLight,
    required this.onSecondaryLight,
    required this.secondaryContainerLight,
    required this.onSecondaryContainerLight,
    required this.tertiaryLight,
    required this.onTertiaryLight,
    required this.tertiaryContainerLight,
    required this.onTertiaryContainerLight,
    required this.errorLight,
    required this.onErrorLight,
    required this.errorContainerLight,
    required this.onErrorContainerLight,
    required this.controlActivatedLight,
    required this.controlNormalLight,
    required this.controlHighlightLight,
    required this.textPrimaryInverseLight,
    required this.textSecondaryAndTertiaryInverseLight,
    required this.textPrimaryInverseDisableOnlyLight,
    required this.textSecondaryAndTertiaryInverseDisabledLight,
    required this.textHintInverseLight,
    required this.primaryPaletteKeyColorDark,
    required this.secondaryPaletteKeyColorDark,
    required this.tertiaryPaletteKeyColorDark,
    required this.neutralPaletteKeyColorDark,
    required this.neutralVariantPaletteKeyColorDark,
    required this.backgroundDark,
    required this.onBackgroundDark,
    required this.surfaceDark,
    required this.surfaceDimDark,
    required this.surfaceBrightDark,
    required this.surfaceContainerLowestDark,
    required this.surfaceContainerLowDark,
    required this.surfaceContainerDark,
    required this.surfaceContainerHighDark,
    required this.surfaceContainerHighestDark,
    required this.onSurfaceDark,
    required this.surfaceVariantDark,
    required this.onSurfaceVariantDark,
    required this.outlineDark,
    required this.outlineVariantDark,
    required this.inverseSurfaceDark,
    required this.inverseOnSurfaceDark,
    required this.shadowDark,
    required this.scrimDark,
    required this.surfaceTintDark,
    required this.primaryDark,
    required this.onPrimaryDark,
    required this.primaryContainerDark,
    required this.onPrimaryContainerDark,
    required this.inversePrimaryDark,
    required this.secondaryDark,
    required this.onSecondaryDark,
    required this.secondaryContainerDark,
    required this.onSecondaryContainerDark,
    required this.tertiaryDark,
    required this.onTertiaryDark,
    required this.tertiaryContainerDark,
    required this.onTertiaryContainerDark,
    required this.errorDark,
    required this.onErrorDark,
    required this.errorContainerDark,
    required this.onErrorContainerDark,
    required this.controlActivatedDark,
    required this.controlNormalDark,
    required this.controlHighlightDark,
    required this.textPrimaryInverseDark,
    required this.textSecondaryAndTertiaryInverseDark,
    required this.textPrimaryInverseDisableOnlyDark,
    required this.textSecondaryAndTertiaryInverseDisabledDark,
    required this.textHintInverseDark,
  });

  @override
  final Color primaryFixed;

  @override
  final Color primaryFixedDim;

  @override
  final Color onPrimaryFixed;

  @override
  final Color onPrimaryFixedVariant;

  @override
  final Color secondaryFixed;

  @override
  final Color secondaryFixedDim;

  @override
  final Color onSecondaryFixed;

  @override
  final Color onSecondaryFixedVariant;

  @override
  final Color tertiaryFixed;

  @override
  final Color tertiaryFixedDim;

  @override
  final Color onTertiaryFixed;

  @override
  final Color onTertiaryFixedVariant;

  @override
  final Color primaryPaletteKeyColorLight;

  @override
  final Color secondaryPaletteKeyColorLight;

  @override
  final Color tertiaryPaletteKeyColorLight;

  @override
  final Color neutralPaletteKeyColorLight;

  @override
  final Color neutralVariantPaletteKeyColorLight;

  @override
  final Color backgroundLight;

  @override
  final Color onBackgroundLight;

  @override
  final Color surfaceLight;

  @override
  final Color surfaceDimLight;

  @override
  final Color surfaceBrightLight;

  @override
  final Color surfaceContainerLowestLight;

  @override
  final Color surfaceContainerLowLight;

  @override
  final Color surfaceContainerLight;

  @override
  final Color surfaceContainerHighLight;

  @override
  final Color surfaceContainerHighestLight;

  @override
  final Color onSurfaceLight;

  @override
  final Color surfaceVariantLight;

  @override
  final Color onSurfaceVariantLight;

  @override
  final Color outlineLight;

  @override
  final Color outlineVariantLight;

  @override
  final Color inverseSurfaceLight;

  @override
  final Color inverseOnSurfaceLight;

  @override
  final Color shadowLight;

  @override
  final Color scrimLight;

  @override
  final Color surfaceTintLight;

  @override
  final Color primaryLight;

  @override
  final Color onPrimaryLight;

  @override
  final Color primaryContainerLight;

  @override
  final Color onPrimaryContainerLight;

  @override
  final Color inversePrimaryLight;

  @override
  final Color secondaryLight;

  @override
  final Color onSecondaryLight;

  @override
  final Color secondaryContainerLight;

  @override
  final Color onSecondaryContainerLight;

  @override
  final Color tertiaryLight;

  @override
  final Color onTertiaryLight;

  @override
  final Color tertiaryContainerLight;

  @override
  final Color onTertiaryContainerLight;

  @override
  final Color errorLight;

  @override
  final Color onErrorLight;

  @override
  final Color errorContainerLight;

  @override
  final Color onErrorContainerLight;

  @override
  final Color controlActivatedLight;

  @override
  final Color controlNormalLight;

  @override
  final Color controlHighlightLight;

  @override
  final Color textPrimaryInverseLight;

  @override
  final Color textSecondaryAndTertiaryInverseLight;

  @override
  final Color textPrimaryInverseDisableOnlyLight;

  @override
  final Color textSecondaryAndTertiaryInverseDisabledLight;

  @override
  final Color textHintInverseLight;

  @override
  final Color primaryPaletteKeyColorDark;

  @override
  final Color secondaryPaletteKeyColorDark;

  @override
  final Color tertiaryPaletteKeyColorDark;

  @override
  final Color neutralPaletteKeyColorDark;

  @override
  final Color neutralVariantPaletteKeyColorDark;

  @override
  final Color backgroundDark;

  @override
  final Color onBackgroundDark;

  @override
  final Color surfaceDark;

  @override
  final Color surfaceDimDark;

  @override
  final Color surfaceBrightDark;

  @override
  final Color surfaceContainerLowestDark;

  @override
  final Color surfaceContainerLowDark;

  @override
  final Color surfaceContainerDark;

  @override
  final Color surfaceContainerHighDark;

  @override
  final Color surfaceContainerHighestDark;

  @override
  final Color onSurfaceDark;

  @override
  final Color surfaceVariantDark;

  @override
  final Color onSurfaceVariantDark;

  @override
  final Color outlineDark;

  @override
  final Color outlineVariantDark;

  @override
  final Color inverseSurfaceDark;

  @override
  final Color inverseOnSurfaceDark;

  @override
  final Color shadowDark;

  @override
  final Color scrimDark;

  @override
  final Color surfaceTintDark;

  @override
  final Color primaryDark;

  @override
  final Color onPrimaryDark;

  @override
  final Color primaryContainerDark;

  @override
  final Color onPrimaryContainerDark;

  @override
  final Color inversePrimaryDark;

  @override
  final Color secondaryDark;

  @override
  final Color onSecondaryDark;

  @override
  final Color secondaryContainerDark;

  @override
  final Color onSecondaryContainerDark;

  @override
  final Color tertiaryDark;

  @override
  final Color onTertiaryDark;

  @override
  final Color tertiaryContainerDark;

  @override
  final Color onTertiaryContainerDark;

  @override
  final Color errorDark;

  @override
  final Color onErrorDark;

  @override
  final Color errorContainerDark;

  @override
  final Color onErrorContainerDark;

  @override
  final Color controlActivatedDark;

  @override
  final Color controlNormalDark;

  @override
  final Color controlHighlightDark;

  @override
  final Color textPrimaryInverseDark;

  @override
  final Color textSecondaryAndTertiaryInverseDark;

  @override
  final Color textPrimaryInverseDisableOnlyDark;

  @override
  final Color textSecondaryAndTertiaryInverseDisabledDark;

  @override
  final Color textHintInverseDark;
}
