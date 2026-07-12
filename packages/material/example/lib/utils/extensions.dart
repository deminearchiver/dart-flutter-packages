import 'package:dynamic_color_ffi/dynamic_color_ffi.dart';
import 'package:material_example/flutter.dart';

// extension ScreenCornersDataExtension on ScreenCornersData {
//   CornersBorderDelegate get cornersDelegate => switch (defaultTargetPlatform) {
//     .android || .fuchsia || .linux || .windows => .rounded,
//     .iOS || .macOS => .superellipse,
//   };

//   Corners toCorners() => Corners.only(
//     topLeft: .circular(topLeft),
//     topRight: .circular(topRight),
//     bottomLeft: .circular(bottomLeft),
//     bottomRight: .circular(bottomRight),
//   );

//   CornersBorder toShape({BorderSide side = .none}) => CornersBorder(
//     delegate: cornersDelegate,
//     corners: toCorners(),
//     side: side,
//   );
// }

mixin ExternalChangeNotifier on ChangeNotifier {
  void notify() => notifyListeners();
}

extension<E extends Object?> on List<E> {
  List<E> unfold(int start, {bool growable = false}) {
    final size = length;
    if (size == 0) return .empty(growable: growable);
    final remaining = size - start;
    final result = List<E>.filled(size, first, growable: growable)
      ..setRange(0, remaining, this, start);
    if (remaining < size) result.setRange(remaining, size, this, 0);
    return result;
  }
}

extension DynamicColorSchemeToColorTheme on DynamicColorScheme {
  ColorThemeDataPartial toColorTheme() => .from(
    primaryPaletteKeyColor: primaryPaletteKeyColor,
    secondaryPaletteKeyColor: secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
    neutralPaletteKeyColor: neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
    errorPaletteKeyColor: errorPaletteKeyColor,
    background: background,
    onBackground: onBackground,
    surface: surface,
    surfaceDim: surfaceDim,
    surfaceBright: surfaceBright,
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    inverseSurface: inverseSurface,
    inverseOnSurface: inverseOnSurface,
    shadow: shadow,
    scrim: scrim,
    surfaceTint: surfaceTint,
    primary: primary,
    primaryDim: primaryDim,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    primaryFixed: primaryFixed,
    primaryFixedDim: primaryFixedDim,
    onPrimaryFixed: onPrimaryFixed,
    onPrimaryFixedVariant: onPrimaryFixedVariant,
    inversePrimary: inversePrimary,
    secondary: secondary,
    secondaryDim: secondaryDim,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    secondaryFixed: secondaryFixed,
    secondaryFixedDim: secondaryFixedDim,
    onSecondaryFixed: onSecondaryFixed,
    onSecondaryFixedVariant: onSecondaryFixedVariant,
    tertiary: tertiary,
    tertiaryDim: tertiaryDim,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    tertiaryFixed: tertiaryFixed,
    tertiaryFixedDim: tertiaryFixedDim,
    onTertiaryFixed: onTertiaryFixed,
    onTertiaryFixedVariant: onTertiaryFixedVariant,
    error: error,
    errorDim: errorDim,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
  );
}
