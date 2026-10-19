part of 'color_spec.dart';

final class const _PrimaryPaletteKeyColor2026()
    extends _PrimaryPaletteKeyColor2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryPaletteKeyColor2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryPaletteKeyColor2026()
    extends _SecondaryPaletteKeyColor2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _SecondaryPaletteKeyColor2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryPaletteKeyColor2026()
    extends _TertiaryPaletteKeyColor2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryPaletteKeyColor2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _NeutralPaletteKeyColor2026()
    extends _NeutralPaletteKeyColor2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _NeutralPaletteKeyColor2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _NeutralVariantPaletteKeyColor2026()
    extends _NeutralVariantPaletteKeyColor2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _NeutralVariantPaletteKeyColor2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorPaletteKeyColor2026()
    extends _ErrorPaletteKeyColor2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorPaletteKeyColor2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Background2026()
    extends _Surface2026
    with _DynamicColors2026 {
  @override
  String get name => "background";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Background2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnBackground2026()
    extends _OnSurface2026
    with _DynamicColors2026 {
  @override
  String get name => "on_background";

  @override
  double tone(DynamicScheme scheme) =>
      scheme.platform == .watch ? 100.0 : _onSurface.getTone(scheme);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnBackground2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Surface2026() extends DynamicColor with _DynamicColors2026 {
  @override
  String get name => "surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 4.0
            : 98.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Surface2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceDim2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 4.0
            : 87.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 1.0
            : 1.7
      : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceBright2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_bright";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 18.0
            : 98.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 1.7
            : 1.0
      : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceBright2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerLowest2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_container_lowest";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 0.0
            : 100.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerLowest2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerLow2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_container_low";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 6.0
            : 96.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.25 : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerLow2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 9.0
            : 94.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.4 : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerHigh2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_container_high";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 12.0
            : 92.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.5 : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerHigh2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerHighest2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "surface_container_highest";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.variant == .cmf
      ? scheme.isDark
            ? 15.0
            : 90.0
      : 0.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.7 : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerHighest2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSurface2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.7 : 0.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      _getContrastCurve(scheme.isDark ? 11.0 : 9.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSurface2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceVariant2026()
    extends _SurfaceContainerHighest2026
    with _DynamicColors2026 {
  @override
  String get name => "surface_variant";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceVariant2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSurfaceVariant2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_surface_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.7 : 0.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      _getContrastCurve(scheme.isDark ? 6.0 : 4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSurfaceVariant2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Outline2026() extends DynamicColor with _DynamicColors2026 {
  @override
  String get name => "outline";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.7 : 0.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(3.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Outline2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OutlineVariant2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "outline_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.7 : 0.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(1.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OutlineVariant2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InverseSurface2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "inverse_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 98.0 : 4.0;

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) =>
      scheme.variant == .cmf ? 1.7 : 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InverseSurface2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InverseOnSurface2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "inverse_on_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _inverseSurface;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InverseOnSurface2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Shadow2026() extends _Shadow2025 with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Shadow2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Scrim2026() extends _Scrim2025 with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Scrim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceTint2026()
    extends _Primary2026
    with _DynamicColors2026 {
  @override
  String get name => "surface_tint";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceTint2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Primary2026() extends DynamicColor with _DynamicColors2026 {
  @override
  String get name => "primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.sourceColorHct.chroma <= 12.0
      ? scheme.isDark
            ? 80.0
            : 40.0
      : scheme.sourceColorHct.tone;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? ToneDeltaPair(
          roleA: _primaryContainer,
          roleB: _primary,
          delta: 5.0,
          polarity: .relativeLighter,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Primary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryDim2026() extends _Primary2026 {
  @override
  String get name => "primary_dim";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimary2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primary;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "primary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      !scheme.isDark && scheme.sourceColorHct.chroma <= 12
      ? 90.0
      : scheme.sourceColorHct.tone > 55
      ? MathUtils.clamp(scheme.sourceColorHct.tone, 61.0, 90.0)
      : MathUtils.clamp(scheme.sourceColorHct.tone, 30.0, 49.0);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_primary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryFixed2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "primary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => _primaryContainer.getTone(
    scheme.copyWith(isDark: false, contrastLevel: 0.0),
  );

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryFixed2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryFixedDim2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "primary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => _primaryFixed.getTone(scheme);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _primaryFixedDim,
    roleB: _primaryFixed,
    delta: 5.0,
    polarity: .darker,
    constraint: .exact,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryFixedDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryFixed2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_primary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _primaryFixed.getTone(scheme) > 57.0 ? _primaryFixedDim : _primaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryFixed2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryFixedVariant2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_primary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _primaryFixed.getTone(scheme) > 57.0 ? _primaryFixedDim : _primaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryFixedVariant2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InversePrimary2026()
    extends _InversePrimary2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InversePrimary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Secondary2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "secondary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? _tMinC(scheme.secondaryPalette)
      : _tMaxC(scheme.secondaryPalette);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? .new(
          roleA: _secondaryContainer,
          roleB: _secondary,
          delta: 5.0,
          polarity: .relativeLighter,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Secondary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryDim2026() extends _Secondary2026 {
  @override
  String get name => "secondary_dim";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondary2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_secondary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondary;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "secondary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? _tMinC(scheme.secondaryPalette, 20.0, 49.0)
      : _tMaxC(scheme.secondaryPalette, 61.0, 90.0);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_secondary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryFixed2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "secondary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => _secondaryContainer.getTone(
    scheme.copyWith(isDark: false, contrastLevel: 0.0),
  );

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryFixed2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryFixedDim2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "secondary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => _secondaryFixed.getTone(scheme);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _secondaryFixedDim,
    roleB: _secondaryFixed,
    delta: 5.0,
    polarity: .darker,
    constraint: .exact,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryFixedDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryFixed2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_secondary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _secondaryFixed.getTone(scheme) > 57.0
      ? _secondaryFixedDim
      : _secondaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryFixed2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryFixedVariant2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_secondary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _secondaryFixed.getTone(scheme) > 57.0
      ? _secondaryFixedDim
      : _secondaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryFixedVariant2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Tertiary2026() extends DynamicColor with _DynamicColors2026 {
  @override
  String get name => "tertiary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.sourceColorHctList.elementAtOrNull(1)?.tone ??
      scheme.sourceColorHct.tone;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? .new(
          roleA: _tertiaryContainer,
          roleB: _tertiary,
          delta: 5.0,
          polarity: .relativeLighter,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Tertiary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryDim2026() extends _Tertiary2026 {
  @override
  String get name => "tertiary_dim";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiary2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_tertiary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiary;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiary2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "tertiary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    final secondarySourceColorHct =
        scheme.sourceColorHctList.elementAtOrNull(1) ?? scheme.sourceColorHct;
    return secondarySourceColorHct.tone > 55.0
        ? MathUtils.clamp(secondarySourceColorHct.tone, 61.0, 90.0)
        : MathUtils.clamp(secondarySourceColorHct.tone, 20.0, 49.0);
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_tertiary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryFixed2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "tertiary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    final tempS = scheme.copyWith(isDark: false, contrastLevel: 0.0);
    return _tertiaryContainer.getTone(tempS);
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryFixed2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryFixedDim2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "tertiary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) => _tertiaryFixed.getTone(scheme);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _tertiaryFixedDim,
    roleB: _tertiaryFixed,
    delta: 5.0,
    polarity: .darker,
    constraint: .exact,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryFixedDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryFixed2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_tertiary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _tertiaryFixed.getTone(scheme) > 57.0
      ? _tertiaryFixedDim
      : _tertiaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryFixed2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryFixedVariant2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_tertiary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      _tertiaryFixed.getTone(scheme) > 57.0
      ? _tertiaryFixedDim
      : _tertiaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryFixedVariant2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Error2026() extends DynamicColor with _DynamicColors2026 {
  @override
  String get name => "error";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) => _tMaxC(scheme.errorPalette);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? .new(
          roleA: _errorContainer,
          roleB: _error,
          delta: 5.0,
          polarity: .relativeLighter,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Error2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorDim2026() extends _Error2026 {
  @override
  String get name => "error_dim";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorDim2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnError2026() extends DynamicColor with _DynamicColors2026 {
  @override
  String get name => "on_error";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _error;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnError2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "error_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.isDark ? _tMinC(scheme.errorPalette) : _tMaxC(scheme.errorPalette);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.contrastLevel > 0.0 ? _getContrastCurve(1.5) : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnErrorContainer2026()
    extends DynamicColor
    with _DynamicColors2026 {
  @override
  String get name => "on_error_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _errorContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(6.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnErrorContainer2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlActivated2026()
    extends _PrimaryContainer2026
    with _DynamicColors2026 {
  @override
  String get name => "control_activated";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlActivated2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlNormal2026()
    extends _OnSurfaceVariant2026
    with _DynamicColors2026 {
  @override
  String get name => "control_normal";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlNormal2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlHighlight2026()
    extends _ControlHighlight2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlHighlight2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextPrimaryInverse2026()
    extends _InverseOnSurface2026
    with _DynamicColors2026 {
  @override
  String get name => "text_primary_inverse";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TextPrimaryInverse2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextSecondaryAndTertiaryInverse2026()
    extends _TextSecondaryAndTertiaryInverse2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextSecondaryAndTertiaryInverse2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextPrimaryInverseDisableOnly2026()
    extends _TextPrimaryInverseDisableOnly2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextPrimaryInverseDisableOnly2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextSecondaryAndTertiaryInverseDisabled2026()
    extends _TextSecondaryAndTertiaryInverseDisabled2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextSecondaryAndTertiaryInverseDisabled2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextHintInverse2026()
    extends _TextHintInverse2025
    with _DynamicColors2026 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TextHintInverse2026;

  @override
  int get hashCode => runtimeType.hashCode;
}

const DynamicColor _primaryPaletteKeyColor2026 = .extended(
  _primaryPaletteKeyColor2025,
  .spec2026,
  _PrimaryPaletteKeyColor2026(),
);

const DynamicColor _secondaryPaletteKeyColor2026 = .extended(
  _secondaryPaletteKeyColor2025,
  .spec2026,
  _SecondaryPaletteKeyColor2026(),
);

const DynamicColor _tertiaryPaletteKeyColor2026 = .extended(
  _tertiaryPaletteKeyColor2025,
  .spec2026,
  _TertiaryPaletteKeyColor2026(),
);

const DynamicColor _neutralPaletteKeyColor2026 = .extended(
  _neutralPaletteKeyColor2025,
  .spec2026,
  _NeutralPaletteKeyColor2026(),
);

const DynamicColor _neutralVariantPaletteKeyColor2026 = .extended(
  _neutralVariantPaletteKeyColor2025,
  .spec2026,
  _NeutralVariantPaletteKeyColor2026(),
);

const DynamicColor _errorPaletteKeyColor2026 = .extended(
  _errorPaletteKeyColor2025,
  .spec2026,
  _ErrorPaletteKeyColor2026(),
);

const DynamicColor _background2026 = .extended(
  _background2025,
  .spec2026,
  _Background2026(),
);

const DynamicColor _onBackground2026 = .extended(
  _onBackground2025,
  .spec2026,
  _OnBackground2026(),
);

const DynamicColor _surface2026 = .extended(
  _surface2025,
  .spec2026,
  _Surface2026(),
);

const DynamicColor _surfaceDim2026 = .extended(
  _surfaceDim2025,
  .spec2026,
  _SurfaceDim2026(),
);

const DynamicColor _surfaceBright2026 = .extended(
  _surfaceBright2025,
  .spec2026,
  _SurfaceBright2026(),
);

const DynamicColor _surfaceContainerLowest2026 = .extended(
  _surfaceContainerLowest2025,
  .spec2026,
  _SurfaceContainerLowest2026(),
);

const DynamicColor _surfaceContainerLow2026 = .extended(
  _surfaceContainerLow2025,
  .spec2026,
  _SurfaceContainerLow2026(),
);

const DynamicColor _surfaceContainer2026 = .extended(
  _surfaceContainer2025,
  .spec2026,
  _SurfaceContainer2026(),
);

const DynamicColor _surfaceContainerHigh2026 = .extended(
  _surfaceContainerHigh2025,
  .spec2026,
  _SurfaceContainerHigh2026(),
);

const DynamicColor _surfaceContainerHighest2026 = .extended(
  _surfaceContainerHighest2025,
  .spec2026,
  _SurfaceContainerHighest2026(),
);

const DynamicColor _onSurface2026 = .extended(
  _onSurface2025,
  .spec2026,
  _OnSurface2026(),
);

const DynamicColor _surfaceVariant2026 = .extended(
  _surfaceVariant2025,
  .spec2026,
  _SurfaceVariant2026(),
);

const DynamicColor _onSurfaceVariant2026 = .extended(
  _onSurfaceVariant2025,
  .spec2026,
  _OnSurfaceVariant2026(),
);

const DynamicColor _outline2026 = .extended(
  _outline2025,
  .spec2026,
  _Outline2026(),
);

const DynamicColor _outlineVariant2026 = .extended(
  _outlineVariant2025,
  .spec2026,
  _OutlineVariant2026(),
);

const DynamicColor _inverseSurface2026 = .extended(
  _inverseSurface2025,
  .spec2026,
  _InverseSurface2026(),
);

const DynamicColor _inverseOnSurface2026 = .extended(
  _inverseOnSurface2025,
  .spec2026,
  _InverseOnSurface2026(),
);

const DynamicColor _shadow2026 = .extended(
  _shadow2025,
  .spec2026,
  _Shadow2026(),
);

const DynamicColor _scrim2026 = .extended(_scrim2025, .spec2026, _Scrim2026());

const DynamicColor _surfaceTint2026 = .extended(
  _surfaceTint2025,
  .spec2026,
  _SurfaceTint2026(),
);

const DynamicColor _primary2026 = .extended(
  _primary2025,
  .spec2026,
  _Primary2026(),
);

const DynamicColor _primaryDim2026 = .extended(
  _primaryDim2025,
  .spec2026,
  _PrimaryDim2026(),
);

const DynamicColor _onPrimary2026 = .extended(
  _onPrimary2025,
  .spec2026,
  _OnPrimary2026(),
);

const DynamicColor _primaryContainer2026 = .extended(
  _primaryContainer2025,
  .spec2026,
  _PrimaryContainer2026(),
);

const DynamicColor _onPrimaryContainer2026 = .extended(
  _onPrimaryContainer2025,
  .spec2026,
  _OnPrimaryContainer2026(),
);

const DynamicColor _primaryFixed2026 = .extended(
  _primaryFixed2025,
  .spec2026,
  _PrimaryFixed2026(),
);

const DynamicColor _primaryFixedDim2026 = .extended(
  _primaryFixedDim2025,
  .spec2026,
  _PrimaryFixedDim2026(),
);

const DynamicColor _onPrimaryFixed2026 = .extended(
  _onPrimaryFixed2025,
  .spec2026,
  _OnPrimaryFixed2026(),
);

const DynamicColor _onPrimaryFixedVariant2026 = .extended(
  _onPrimaryFixedVariant2025,
  .spec2026,
  _OnPrimaryFixedVariant2026(),
);

const DynamicColor _inversePrimary2026 = .extended(
  _inversePrimary2025,
  .spec2026,
  _InversePrimary2026(),
);

const DynamicColor _secondary2026 = .extended(
  _secondary2025,
  .spec2026,
  _Secondary2026(),
);

const DynamicColor _secondaryDim2026 = .extended(
  _secondaryDim2025,
  .spec2026,
  _SecondaryDim2026(),
);

const DynamicColor _onSecondary2026 = .extended(
  _onSecondary2025,
  .spec2026,
  _OnSecondary2026(),
);

const DynamicColor _secondaryContainer2026 = .extended(
  _secondaryContainer2025,
  .spec2026,
  _SecondaryContainer2026(),
);

const DynamicColor _onSecondaryContainer2026 = .extended(
  _onSecondaryContainer2025,
  .spec2026,
  _OnSecondaryContainer2026(),
);

const DynamicColor _secondaryFixed2026 = .extended(
  _secondaryFixed2025,
  .spec2026,
  _SecondaryFixed2026(),
);

const DynamicColor _secondaryFixedDim2026 = .extended(
  _secondaryFixedDim2025,
  .spec2026,
  _SecondaryFixedDim2026(),
);

const DynamicColor _onSecondaryFixed2026 = .extended(
  _onSecondaryFixed2025,
  .spec2026,
  _OnSecondaryFixed2026(),
);

const DynamicColor _onSecondaryFixedVariant2026 = .extended(
  _onSecondaryFixedVariant2025,
  .spec2026,
  _OnSecondaryFixedVariant2026(),
);

const DynamicColor _tertiary2026 = .extended(
  _tertiary2025,
  .spec2026,
  _Tertiary2026(),
);

const DynamicColor _tertiaryDim2026 = .extended(
  _tertiaryDim2025,
  .spec2026,
  _TertiaryDim2026(),
);

const DynamicColor _onTertiary2026 = .extended(
  _onTertiary2025,
  .spec2026,
  _OnTertiary2026(),
);

const DynamicColor _tertiaryContainer2026 = .extended(
  _tertiaryContainer2025,
  .spec2026,
  _TertiaryContainer2026(),
);

const DynamicColor _onTertiaryContainer2026 = .extended(
  _onTertiaryContainer2025,
  .spec2026,
  _OnTertiaryContainer2026(),
);

const DynamicColor _tertiaryFixed2026 = .extended(
  _tertiaryFixed2025,
  .spec2026,
  _TertiaryFixed2026(),
);

const DynamicColor _tertiaryFixedDim2026 = .extended(
  _tertiaryFixedDim2025,
  .spec2026,
  _TertiaryFixedDim2026(),
);

const DynamicColor _onTertiaryFixed2026 = .extended(
  _onTertiaryFixed2025,
  .spec2026,
  _OnTertiaryFixed2026(),
);

const DynamicColor _onTertiaryFixedVariant2026 = .extended(
  _onTertiaryFixedVariant2025,
  .spec2026,
  _OnTertiaryFixedVariant2026(),
);

const DynamicColor _error2026 = .extended(_error2025, .spec2026, _Error2026());

const DynamicColor _errorDim2026 = .extended(
  _errorDim2025,
  .spec2026,
  _ErrorDim2026(),
);

const DynamicColor _onError2026 = .extended(
  _onError2025,
  .spec2026,
  _OnError2026(),
);

const DynamicColor _errorContainer2026 = .extended(
  _errorContainer2025,
  .spec2026,
  _ErrorContainer2026(),
);

const DynamicColor _onErrorContainer2026 = .extended(
  _onErrorContainer2025,
  .spec2026,
  _OnErrorContainer2026(),
);

const DynamicColor _controlActivated2026 = .extended(
  _controlActivated2025,
  .spec2026,
  _ControlActivated2026(),
);

const DynamicColor _controlNormal2026 = .extended(
  _controlNormal2025,
  .spec2026,
  _ControlNormal2026(),
);

const DynamicColor _controlHighlight2026 = .extended(
  _controlHighlight2025,
  .spec2026,
  _ControlHighlight2026(),
);

const DynamicColor _textPrimaryInverse2026 = .extended(
  _textPrimaryInverse2025,
  .spec2026,
  _TextPrimaryInverse2026(),
);

const DynamicColor _textSecondaryAndTertiaryInverse2026 = .extended(
  _textSecondaryAndTertiaryInverse2025,
  .spec2026,
  _TextSecondaryAndTertiaryInverse2026(),
);

const DynamicColor _textPrimaryInverseDisableOnly2026 = .extended(
  _textPrimaryInverseDisableOnly2025,
  .spec2026,
  _TextPrimaryInverseDisableOnly2026(),
);

const DynamicColor _textSecondaryAndTertiaryInverseDisabled2026 = .extended(
  _textSecondaryAndTertiaryInverseDisabled2025,
  .spec2026,
  _TextSecondaryAndTertiaryInverseDisabled2026(),
);

const DynamicColor _textHintInverse2026 = .extended(
  _textHintInverse2025,
  .spec2026,
  _TextHintInverse2026(),
);

mixin _DynamicColors2026 implements _DynamicColors2025 {
  @override
  DynamicColor get _primaryPaletteKeyColor => _primaryPaletteKeyColor2026;

  @override
  DynamicColor get _secondaryPaletteKeyColor => _secondaryPaletteKeyColor2026;

  @override
  DynamicColor get _tertiaryPaletteKeyColor => _tertiaryPaletteKeyColor2026;

  @override
  DynamicColor get _neutralPaletteKeyColor => _neutralPaletteKeyColor2026;

  @override
  DynamicColor get _neutralVariantPaletteKeyColor =>
      _neutralVariantPaletteKeyColor2026;

  @override
  DynamicColor get _errorPaletteKeyColor => _errorPaletteKeyColor2026;

  @override
  DynamicColor get _background => _background2026;

  @override
  DynamicColor get _onBackground => _onBackground2026;

  @override
  DynamicColor get _surface => _surface2026;

  @override
  DynamicColor get _surfaceDim => _surfaceDim2026;

  @override
  DynamicColor get _surfaceBright => _surfaceBright2026;

  @override
  DynamicColor get _surfaceContainerLowest => _surfaceContainerLowest2026;

  @override
  DynamicColor get _surfaceContainerLow => _surfaceContainerLow2026;

  @override
  DynamicColor get _surfaceContainer => _surfaceContainer2026;

  @override
  DynamicColor get _surfaceContainerHigh => _surfaceContainerHigh2026;

  @override
  DynamicColor get _surfaceContainerHighest => _surfaceContainerHighest2026;

  @override
  DynamicColor get _onSurface => _onSurface2026;

  @override
  DynamicColor get _surfaceVariant => _surfaceVariant2026;

  @override
  DynamicColor get _onSurfaceVariant => _onSurfaceVariant2026;

  @override
  DynamicColor get _outline => _outline2026;

  @override
  DynamicColor get _outlineVariant => _outlineVariant2026;

  @override
  DynamicColor get _inverseSurface => _inverseSurface2026;

  @override
  DynamicColor get _inverseOnSurface => _inverseOnSurface2026;

  @override
  DynamicColor get _shadow => _shadow2026;

  @override
  DynamicColor get _scrim => _scrim2026;

  @override
  DynamicColor get _surfaceTint => _surfaceTint2026;

  @override
  DynamicColor get _primary => _primary2026;

  @override
  DynamicColor get _primaryDim => _primaryDim2026;

  @override
  DynamicColor get _onPrimary => _onPrimary2026;

  @override
  DynamicColor get _primaryContainer => _primaryContainer2026;

  @override
  DynamicColor get _onPrimaryContainer => _onPrimaryContainer2026;

  @override
  DynamicColor get _primaryFixed => _primaryFixed2026;

  @override
  DynamicColor get _primaryFixedDim => _primaryFixedDim2026;

  @override
  DynamicColor get _onPrimaryFixed => _onPrimaryFixed2026;

  @override
  DynamicColor get _onPrimaryFixedVariant => _onPrimaryFixedVariant2026;

  @override
  DynamicColor get _inversePrimary => _inversePrimary2026;

  @override
  DynamicColor get _secondary => _secondary2026;

  @override
  DynamicColor get _secondaryDim => _secondaryDim2026;

  @override
  DynamicColor get _onSecondary => _onSecondary2026;

  @override
  DynamicColor get _secondaryContainer => _secondaryContainer2026;

  @override
  DynamicColor get _onSecondaryContainer => _onSecondaryContainer2026;

  @override
  DynamicColor get _secondaryFixed => _secondaryFixed2026;

  @override
  DynamicColor get _secondaryFixedDim => _secondaryFixedDim2026;

  @override
  DynamicColor get _onSecondaryFixed => _onSecondaryFixed2026;

  @override
  DynamicColor get _onSecondaryFixedVariant => _onSecondaryFixedVariant2026;

  @override
  DynamicColor get _tertiary => _tertiary2026;

  @override
  DynamicColor get _tertiaryDim => _tertiaryDim2026;

  @override
  DynamicColor get _onTertiary => _onTertiary2026;

  @override
  DynamicColor get _tertiaryContainer => _tertiaryContainer2026;

  @override
  DynamicColor get _onTertiaryContainer => _onTertiaryContainer2026;

  @override
  DynamicColor get _tertiaryFixed => _tertiaryFixed2026;

  @override
  DynamicColor get _tertiaryFixedDim => _tertiaryFixedDim2026;

  @override
  DynamicColor get _onTertiaryFixed => _onTertiaryFixed2026;

  @override
  DynamicColor get _onTertiaryFixedVariant => _onTertiaryFixedVariant2026;

  @override
  DynamicColor get _error => _error2026;

  @override
  DynamicColor get _errorDim => _errorDim2026;

  @override
  DynamicColor get _onError => _onError2026;

  @override
  DynamicColor get _errorContainer => _errorContainer2026;

  @override
  DynamicColor get _onErrorContainer => _onErrorContainer2026;

  @override
  DynamicColor get _controlActivated => _controlActivated2026;

  @override
  DynamicColor get _controlNormal => _controlNormal2026;

  @override
  DynamicColor get _controlHighlight => _controlHighlight2026;

  @override
  DynamicColor get _textPrimaryInverse => _textPrimaryInverse2026;

  @override
  DynamicColor get _textSecondaryAndTertiaryInverse =>
      _textSecondaryAndTertiaryInverse2026;

  @override
  DynamicColor get _textPrimaryInverseDisableOnly =>
      _textPrimaryInverseDisableOnly2026;

  @override
  DynamicColor get _textSecondaryAndTertiaryInverseDisabled =>
      _textSecondaryAndTertiaryInverseDisabled2026;

  @override
  DynamicColor get _textHintInverse => _textHintInverse2026;

  @override
  DynamicColor _highestSurface(DynamicScheme scheme) =>
      scheme.isDark ? _surfaceBright : _surfaceDim;
}

/// [ColorSpec] implementation for the 2026 spec.
class const ColorSpec2026() extends ColorSpec2025 with _DynamicColors2026 {
  @override
  TonalPalette getPrimaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(sourceColor.asHct.hue, sourceColor.asHct.chroma),
    _ => super.getPrimaryPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getSecondaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma * 0.5,
    ),
    _ => super.getSecondaryPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getTertiaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => _tertiaryPalette(sourceColor),
    _ => super.getTertiaryPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getNeutralPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma * 0.2,
    ),
    _ => super.getNeutralPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getNeutralVariantPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma * 0.2,
    ),
    _ => super.getNeutralVariantPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  @override
  TonalPalette getErrorPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .cmf => .fromHueAndChroma(
      _getErrorHue(sourceColor.asHct.hue, _tertiaryPalette(sourceColor).hue),
      math.max(sourceColor.asHct.chroma, 50.0),
    ),
    _ => super.getErrorPalette(
      sourceColor,
      variant,
      isDark,
      contrastLevel,
      platform,
      specVersion,
    ),
  };

  static double _getErrorHue(double primaryHue, double tertiaryHue) {
    if (primaryHue <= 8.0) {
      return tertiaryHue <= 24.0
          ? 28.0
          : tertiaryHue <= 32.0
          ? 16.0
          : 20.0;
    } else if (primaryHue <= 16.0) {
      return tertiaryHue <= 24.0
          ? 32.0
          : tertiaryHue <= 32.0
          ? 20.0
          : 24.0;
    } else if (primaryHue <= 20.0) {
      return tertiaryHue <= 28.0
          ? 32.0
          : tertiaryHue <= 32.0
          ? 24.0
          : 28.0;
    } else if (primaryHue <= 28.0) {
      return tertiaryHue <= 24.0 ? 32.0 : 16.0;
    } else if (primaryHue <= 32.0) {
      return tertiaryHue <= 20.0
          ? 24.0
          : tertiaryHue <= 28.0
          ? 16.0
          : 20.0;
    } else if (primaryHue <= 40.0) {
      return tertiaryHue > 20.0 && tertiaryHue <= 28.0 ? 16.0 : 24.0;
    } else if (primaryHue <= 152.0) {
      return tertiaryHue > 24.0 && tertiaryHue <= 36.0 ? 20.0 : 32.0;
    } else if (primaryHue <= 272.0) {
      return tertiaryHue > 20.0 && tertiaryHue <= 28.0 ? 16.0 : 24.0;
    } else {
      return tertiaryHue > 12.0 && tertiaryHue <= 28.0 ? 32.0 : 16.0;
    }
  }

  static TonalPalette _tertiaryPalette(TonalPaletteSourceColor sourceColor) {
    final sourceColorHctList = sourceColor.asHctList;
    final sourceColorHct = sourceColor.asHct;
    final secondarySourceColorHct =
        sourceColorHctList.elementAtOrNull(1) ?? sourceColorHct;
    return sourceColorHct.toInt() == secondarySourceColorHct.toInt()
        ? .fromHueAndChroma(sourceColorHct.hue, sourceColorHct.chroma * 0.75)
        : .fromHueAndChroma(
            secondarySourceColorHct.hue,
            secondarySourceColorHct.chroma,
          );
  }
}
