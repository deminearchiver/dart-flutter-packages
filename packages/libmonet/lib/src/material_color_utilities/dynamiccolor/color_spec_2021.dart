part of 'color_spec.dart';

double _findDesiredChromaByTone(
  double hue,
  double chroma,
  double tone,
  bool byDecreasingTone,
) {
  var answer = tone;
  var closestToChroma = Hct.from(hue, chroma, tone);
  if (closestToChroma.chroma < chroma) {
    var chromaPeak = closestToChroma.chroma;
    while (closestToChroma.chroma < chroma) {
      answer += byDecreasingTone ? -1.0 : 1.0;
      final potentialSolution = Hct.from(hue, chroma, answer);
      if (chromaPeak > potentialSolution.chroma) {
        break;
      }
      if ((potentialSolution.chroma - chroma).abs() < 0.4) {
        break;
      }

      final potentialDelta = (potentialSolution.chroma - chroma).abs();
      final currentDelta = (closestToChroma.chroma - chroma).abs();
      if (potentialDelta < currentDelta) {
        closestToChroma = potentialSolution;
      }
      chromaPeak = math.max(chromaPeak, potentialSolution.chroma);
    }
  }
  return answer;
}

final class const _PrimaryPaletteKeyColor2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "primary_palette_key_color";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.primaryPalette.keyColor.tone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryPaletteKeyColor2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryPaletteKeyColor2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "secondary_palette_key_color";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.secondaryPalette.keyColor.tone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _SecondaryPaletteKeyColor2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryPaletteKeyColor2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "tertiary_palette_key_color";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.tertiaryPalette.keyColor.tone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryPaletteKeyColor2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _NeutralPaletteKeyColor2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "neutral_palette_key_color";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.neutralPalette.keyColor.tone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _NeutralPaletteKeyColor2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _NeutralVariantPaletteKeyColor2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "neutral_variant_palette_key_color";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.neutralVariantPalette.keyColor.tone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _NeutralVariantPaletteKeyColor2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorPaletteKeyColor2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "error_palette_key_color";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.errorPalette.keyColor.tone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorPaletteKeyColor2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Background2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "background";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 6.0 : 98.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Background2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnBackground2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_background";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 90.0 : 10.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _background;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 3.0, 4.5, 7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnBackground2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Surface2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 6.0 : 98.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Surface2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceDim2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? 6.0
      : const ContrastCurve(87.0, 87.0, 80.0, 75.0).get(scheme.contrastLevel);

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceDim2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceBright2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_bright";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? const ContrastCurve(24.0, 24.0, 29.0, 34.0).get(scheme.contrastLevel)
      : 98.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceBright2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerLowest2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_container_lowest";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? const ContrastCurve(4.0, 4.0, 2.0, 0.0).get(scheme.contrastLevel)
      : 100.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerLowest2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerLow2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_container_low";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? const ContrastCurve(10.0, 10.0, 11.0, 12.0).get(scheme.contrastLevel)
      : const ContrastCurve(96.0, 96.0, 96.0, 95.0).get(scheme.contrastLevel);

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerLow2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? const ContrastCurve(12.0, 12.0, 16.0, 20.0).get(scheme.contrastLevel)
      : const ContrastCurve(94.0, 94.0, 92.0, 90.0).get(scheme.contrastLevel);

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerHigh2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_container_high";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? const ContrastCurve(17.0, 17.0, 21.0, 25.0).get(scheme.contrastLevel)
      : const ContrastCurve(92.0, 92.0, 88.0, 85.0).get(scheme.contrastLevel);

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerHigh2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerHighest2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_container_highest";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark
      ? const ContrastCurve(22.0, 22.0, 26.0, 30.0).get(scheme.contrastLevel)
      : const ContrastCurve(90.0, 90.0, 84.0, 80.0).get(scheme.contrastLevel);

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerHighest2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSurface2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 90.0 : 10.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSurface2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceVariant2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 30.0 : 90.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceVariant2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSurfaceVariant2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_surface_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 80.0 : 30.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSurfaceVariant2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InverseSurface2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "inverse_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 90.0 : 20.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InverseSurface2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InverseOnSurface2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "inverse_on_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 20.0 : 95.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _inverseSurface;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InverseOnSurface2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Outline2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "outline";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 60.0 : 50.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.5, 3.0, 4.5, 7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Outline2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OutlineVariant2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "outline_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 30.0 : 80.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OutlineVariant2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Shadow2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "shadow";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Shadow2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Scrim2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "scrim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => 0.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Scrim2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceTint2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "surface_tint";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 80.0 : 40.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceTint2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Primary2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 100.0 : 0.0;
    }
    return scheme.isDark ? 80.0 : 40.0;
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 7.0);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _primaryContainer,
    roleB: _primary,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Primary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimary2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 10.0 : 90.0;
    }
    return scheme.isDark ? 20.0 : 100.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _primary;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "primary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .fidelity || scheme.variant == .content) {
      return scheme.sourceColorHct.tone;
    }
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 85.0 : 25.0;
    }
    return scheme.isDark ? 30.0 : 90.0;
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _primaryContainer,
    roleB: _primary,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_primary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .fidelity || scheme.variant == .content) {
      return DynamicColor.foregroundTone(_primaryContainer.tone(scheme), 4.5);
    }
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 0.0 : 100.0;
    }
    return scheme.isDark ? 90.0 : 30.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InversePrimary2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "inverse_primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 40.0 : 80.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _inverseSurface;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InversePrimary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Secondary2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "secondary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 80.0 : 40.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 7.0);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _secondaryContainer,
    roleB: _secondary,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Secondary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondary2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_secondary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 10.0 : 100.0;
    }
    return scheme.isDark ? 20.0 : 100.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondary;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "secondary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 30.0 : 85.0;
    }
    final initialTone = scheme.isDark ? 30.0 : 90.0;
    if (!(scheme.variant == .fidelity || scheme.variant == .content)) {
      return initialTone;
    }
    return _findDesiredChromaByTone(
      scheme.secondaryPalette.hue,
      scheme.secondaryPalette.chroma,
      initialTone,
      !scheme.isDark,
    );
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _secondaryContainer,
    roleB: _secondary,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_secondary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 90.0 : 10.0;
    }
    if (!(scheme.variant == .fidelity || scheme.variant == .content)) {
      return scheme.isDark ? 90.0 : 30.0;
    }
    return DynamicColor.foregroundTone(_secondaryContainer.tone(scheme), 4.5);
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Tertiary2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "tertiary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 90.0 : 25.0;
    }
    return scheme.isDark ? 80.0 : 40.0;
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 7.0);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _tertiaryContainer,
    roleB: _tertiary,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Tertiary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiary2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_tertiary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 10.0 : 90.0;
    }
    return scheme.isDark ? 20.0 : 100.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiary;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiary2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "tertiary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 60.0 : 49.0;
    }
    if (!(scheme.variant == .fidelity || scheme.variant == .content)) {
      return scheme.isDark ? 30.0 : 90.0;
    }
    final proposedHct = scheme.tertiaryPalette.getHct(
      scheme.sourceColorHct.tone,
    );
    return DislikeAnalyzer.fixIfDisliked(proposedHct).tone;
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _tertiaryContainer,
    roleB: _tertiary,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_tertiary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 0.0 : 100.0;
    }
    if (!(scheme.variant == .fidelity || scheme.variant == .content)) {
      return scheme.isDark ? 90.0 : 30.0;
    }
    return DynamicColor.foregroundTone(_tertiaryContainer.tone(scheme), 4.5);
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Error2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "error";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 80.0 : 40.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 7.0);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _errorContainer,
    roleB: _error,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Error2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnError2021() extends DynamicColor with _DynamicColors2021 {
  @override
  String get name => "on_error";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 20.0 : 100.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _error;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnError2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "error_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 30.0 : 90.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _errorContainer,
    roleB: _error,
    delta: 10.0,
    polarity: .relativeLighter,
    stayTogether: false,
    constraint: .nearer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnErrorContainer2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_error_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .monochrome) {
      return scheme.isDark ? 90.0 : 10.0;
    }
    return scheme.isDark ? 90.0 : 30.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) => _errorContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnErrorContainer2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryFixed2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "primary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 40.0 : 90.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _primaryFixed,
    roleB: _primaryFixedDim,
    delta: 10.0,
    polarity: .lighter,
    stayTogether: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryFixed2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryFixedDim2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "primary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 30.0 : 80.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _primaryFixed,
    roleB: _primaryFixedDim,
    delta: 10.0,
    polarity: .lighter,
    stayTogether: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryFixedDim2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryFixed2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_primary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 100.0 : 10.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryFixedDim;

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) => _primaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryFixed2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryFixedVariant2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_primary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 90.0 : 30.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryFixedDim;

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) => _primaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryFixedVariant2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryFixed2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "secondary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 80.0 : 90.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _secondaryFixed,
    roleB: _secondaryFixedDim,
    delta: 10.0,
    polarity: .lighter,
    stayTogether: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryFixed2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryFixedDim2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "secondary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 70.0 : 80.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _secondaryFixed,
    roleB: _secondaryFixedDim,
    delta: 10.0,
    polarity: .lighter,
    stayTogether: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryFixedDim2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryFixed2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_secondary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => 10.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryFixedDim;

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) => _secondaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryFixed2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryFixedVariant2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_secondary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 25.0 : 30.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryFixedDim;

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) => _secondaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryFixedVariant2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryFixed2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "tertiary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 40.0 : 90.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _tertiaryFixed,
    roleB: _tertiaryFixedDim,
    delta: 10.0,
    polarity: .lighter,
    stayTogether: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryFixed2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryFixedDim2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "tertiary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 30.0 : 80.0;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(1.0, 1.0, 3.0, 4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _tertiaryFixed,
    roleB: _tertiaryFixedDim,
    delta: 10.0,
    polarity: .lighter,
    stayTogether: true,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryFixedDim2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryFixed2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_tertiary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 100.0 : 10.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryFixedDim;

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) => _tertiaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(4.5, 7.0, 11.0, 21.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryFixed2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryFixedVariant2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "on_tertiary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) =>
      scheme.variant == .monochrome ? 90.0 : 30.0;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryFixedDim;

  @override
  DynamicColor? secondBackground(DynamicScheme scheme) => _tertiaryFixed;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      const .new(3.0, 4.5, 7.0, 11.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryFixedVariant2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlActivated2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "control_activated";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 30.0 : 90.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlActivated2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlNormal2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "control_normal";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 80.0 : 30.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlNormal2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlHighlight2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "control_highlight";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 100.0 : 0.0;

  @override
  double? opacity(DynamicScheme scheme) => scheme.isDark ? 0.20 : 0.12;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlHighlight2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextPrimaryInverse2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "text_primary_inverse";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 10.0 : 90.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TextPrimaryInverse2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextSecondaryAndTertiaryInverse2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "text_secondary_and_tertiary_inverse";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralVariantPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 30.0 : 80.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextSecondaryAndTertiaryInverse2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextPrimaryInverseDisableOnly2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "text_primary_inverse_disable_only";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 10.0 : 90.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextPrimaryInverseDisableOnly2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextSecondaryAndTertiaryInverseDisabled2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "text_secondary_and_tertiary_inverse_disabled";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 10.0 : 90.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextSecondaryAndTertiaryInverseDisabled2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextHintInverse2021()
    extends DynamicColor
    with _DynamicColors2021 {
  @override
  String get name => "text_hint_inverse";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 10.0 : 90.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TextHintInverse2021;

  @override
  int get hashCode => runtimeType.hashCode;
}

const DynamicColor _primaryPaletteKeyColor2021 = _PrimaryPaletteKeyColor2021();
const DynamicColor _secondaryPaletteKeyColor2021 =
    _SecondaryPaletteKeyColor2021();
const DynamicColor _tertiaryPaletteKeyColor2021 =
    _TertiaryPaletteKeyColor2021();
const DynamicColor _neutralPaletteKeyColor2021 = _NeutralPaletteKeyColor2021();
const DynamicColor _neutralVariantPaletteKeyColor2021 =
    _NeutralVariantPaletteKeyColor2021();
const DynamicColor _errorPaletteKeyColor2021 = _ErrorPaletteKeyColor2021();
const DynamicColor _background2021 = _Background2021();
const DynamicColor _onBackground2021 = _OnBackground2021();
const DynamicColor _surface2021 = _Surface2021();
const DynamicColor _surfaceDim2021 = _SurfaceDim2021();
const DynamicColor _surfaceBright2021 = _SurfaceBright2021();
const DynamicColor _surfaceContainerLowest2021 = _SurfaceContainerLowest2021();
const DynamicColor _surfaceContainerLow2021 = _SurfaceContainerLow2021();
const DynamicColor _surfaceContainer2021 = _SurfaceContainer2021();
const DynamicColor _surfaceContainerHigh2021 = _SurfaceContainerHigh2021();
const DynamicColor _surfaceContainerHighest2021 =
    _SurfaceContainerHighest2021();
const DynamicColor _onSurface2021 = _OnSurface2021();
const DynamicColor _surfaceVariant2021 = _SurfaceVariant2021();
const DynamicColor _onSurfaceVariant2021 = _OnSurfaceVariant2021();
const DynamicColor _outline2021 = _Outline2021();
const DynamicColor _outlineVariant2021 = _OutlineVariant2021();
const DynamicColor _inverseSurface2021 = _InverseSurface2021();
const DynamicColor _inverseOnSurface2021 = _InverseOnSurface2021();
const DynamicColor _shadow2021 = _Shadow2021();
const DynamicColor _scrim2021 = _Scrim2021();
const DynamicColor _surfaceTint2021 = _SurfaceTint2021();
const DynamicColor _primary2021 = _Primary2021();
const DynamicColor _onPrimary2021 = _OnPrimary2021();
const DynamicColor _primaryContainer2021 = _PrimaryContainer2021();
const DynamicColor _onPrimaryContainer2021 = _OnPrimaryContainer2021();
const DynamicColor _primaryFixed2021 = _PrimaryFixed2021();
const DynamicColor _primaryFixedDim2021 = _PrimaryFixedDim2021();
const DynamicColor _onPrimaryFixed2021 = _OnPrimaryFixed2021();
const DynamicColor _onPrimaryFixedVariant2021 = _OnPrimaryFixedVariant2021();
const DynamicColor _inversePrimary2021 = _InversePrimary2021();
const DynamicColor _secondary2021 = _Secondary2021();
const DynamicColor _onSecondary2021 = _OnSecondary2021();
const DynamicColor _secondaryContainer2021 = _SecondaryContainer2021();
const DynamicColor _onSecondaryContainer2021 = _OnSecondaryContainer2021();
const DynamicColor _secondaryFixed2021 = _SecondaryFixed2021();
const DynamicColor _secondaryFixedDim2021 = _SecondaryFixedDim2021();
const DynamicColor _onSecondaryFixed2021 = _OnSecondaryFixed2021();
const DynamicColor _onSecondaryFixedVariant2021 =
    _OnSecondaryFixedVariant2021();
const DynamicColor _tertiary2021 = _Tertiary2021();
const DynamicColor _onTertiary2021 = _OnTertiary2021();
const DynamicColor _tertiaryContainer2021 = _TertiaryContainer2021();
const DynamicColor _onTertiaryContainer2021 = _OnTertiaryContainer2021();
const DynamicColor _tertiaryFixed2021 = _TertiaryFixed2021();
const DynamicColor _tertiaryFixedDim2021 = _TertiaryFixedDim2021();
const DynamicColor _onTertiaryFixed2021 = _OnTertiaryFixed2021();
const DynamicColor _onTertiaryFixedVariant2021 = _OnTertiaryFixedVariant2021();
const DynamicColor _error2021 = _Error2021();
const DynamicColor _onError2021 = _OnError2021();
const DynamicColor _errorContainer2021 = _ErrorContainer2021();
const DynamicColor _onErrorContainer2021 = _OnErrorContainer2021();
const DynamicColor _controlActivated2021 = _ControlActivated2021();
const DynamicColor _controlNormal2021 = _ControlNormal2021();
const DynamicColor _controlHighlight2021 = _ControlHighlight2021();
const DynamicColor _textPrimaryInverse2021 = _TextPrimaryInverse2021();
const DynamicColor _textSecondaryAndTertiaryInverse2021 =
    _TextSecondaryAndTertiaryInverse2021();
const DynamicColor _textPrimaryInverseDisableOnly2021 =
    _TextPrimaryInverseDisableOnly2021();
const DynamicColor _textSecondaryAndTertiaryInverseDisabled2021 =
    _TextSecondaryAndTertiaryInverseDisabled2021();
const DynamicColor _textHintInverse2021 = _TextHintInverse2021();

mixin _DynamicColors2021 {
  DynamicColor get _primaryPaletteKeyColor => _primaryPaletteKeyColor2021;

  DynamicColor get _secondaryPaletteKeyColor => _secondaryPaletteKeyColor2021;

  DynamicColor get _tertiaryPaletteKeyColor => _tertiaryPaletteKeyColor2021;

  DynamicColor get _neutralPaletteKeyColor => _neutralPaletteKeyColor2021;

  DynamicColor get _neutralVariantPaletteKeyColor =>
      _neutralVariantPaletteKeyColor2021;

  DynamicColor get _errorPaletteKeyColor => _errorPaletteKeyColor2021;

  DynamicColor get _background => _background2021;

  DynamicColor get _onBackground => _onBackground2021;

  DynamicColor get _surface => _surface2021;

  DynamicColor get _surfaceDim => _surfaceDim2021;

  DynamicColor get _surfaceBright => _surfaceBright2021;

  DynamicColor get _surfaceContainerLowest => _surfaceContainerLowest2021;

  DynamicColor get _surfaceContainerLow => _surfaceContainerLow2021;

  DynamicColor get _surfaceContainer => _surfaceContainer2021;

  DynamicColor get _surfaceContainerHigh => _surfaceContainerHigh2021;

  DynamicColor get _surfaceContainerHighest => _surfaceContainerHighest2021;

  DynamicColor get _onSurface => _onSurface2021;

  DynamicColor get _surfaceVariant => _surfaceVariant2021;

  DynamicColor get _onSurfaceVariant => _onSurfaceVariant2021;

  DynamicColor get _outline => _outline2021;

  DynamicColor get _outlineVariant => _outlineVariant2021;

  DynamicColor get _inverseSurface => _inverseSurface2021;

  DynamicColor get _inverseOnSurface => _inverseOnSurface2021;

  DynamicColor get _shadow => _shadow2021;

  DynamicColor get _scrim => _scrim2021;

  DynamicColor get _surfaceTint => _surfaceTint2021;

  DynamicColor get _primary => _primary2021;

  DynamicColor? get _primaryDim => null;

  DynamicColor get _onPrimary => _onPrimary2021;

  DynamicColor get _primaryContainer => _primaryContainer2021;

  DynamicColor get _onPrimaryContainer => _onPrimaryContainer2021;

  DynamicColor get _primaryFixed => _primaryFixed2021;

  DynamicColor get _primaryFixedDim => _primaryFixedDim2021;

  DynamicColor get _onPrimaryFixed => _onPrimaryFixed2021;

  DynamicColor get _onPrimaryFixedVariant => _onPrimaryFixedVariant2021;

  DynamicColor get _inversePrimary => _inversePrimary2021;

  DynamicColor get _secondary => _secondary2021;

  DynamicColor? get _secondaryDim => null;

  DynamicColor get _onSecondary => _onSecondary2021;

  DynamicColor get _secondaryContainer => _secondaryContainer2021;

  DynamicColor get _onSecondaryContainer => _onSecondaryContainer2021;

  DynamicColor get _secondaryFixed => _secondaryFixed2021;

  DynamicColor get _secondaryFixedDim => _secondaryFixedDim2021;

  DynamicColor get _onSecondaryFixed => _onSecondaryFixed2021;

  DynamicColor get _onSecondaryFixedVariant => _onSecondaryFixedVariant2021;

  DynamicColor get _tertiary => _tertiary2021;

  DynamicColor? get _tertiaryDim => null;

  DynamicColor get _onTertiary => _onTertiary2021;

  DynamicColor get _tertiaryContainer => _tertiaryContainer2021;

  DynamicColor get _onTertiaryContainer => _onTertiaryContainer2021;

  DynamicColor get _tertiaryFixed => _tertiaryFixed2021;

  DynamicColor get _tertiaryFixedDim => _tertiaryFixedDim2021;

  DynamicColor get _onTertiaryFixed => _onTertiaryFixed2021;

  DynamicColor get _onTertiaryFixedVariant => _onTertiaryFixedVariant2021;

  DynamicColor get _error => _error2021;

  DynamicColor? get _errorDim => null;

  DynamicColor get _onError => _onError2021;

  DynamicColor get _errorContainer => _errorContainer2021;

  DynamicColor get _onErrorContainer => _onErrorContainer2021;

  DynamicColor get _controlActivated => _controlActivated2021;

  DynamicColor get _controlNormal => _controlNormal2021;

  DynamicColor get _controlHighlight => _controlHighlight2021;

  DynamicColor get _textPrimaryInverse => _textPrimaryInverse2021;

  DynamicColor get _textSecondaryAndTertiaryInverse =>
      _textSecondaryAndTertiaryInverse2021;

  DynamicColor get _textPrimaryInverseDisableOnly =>
      _textPrimaryInverseDisableOnly2021;

  DynamicColor get _textSecondaryAndTertiaryInverseDisabled =>
      _textSecondaryAndTertiaryInverseDisabled2021;

  DynamicColor get _textHintInverse => _textHintInverse2021;

  DynamicColor _highestSurface(DynamicScheme scheme) =>
      scheme.isDark ? _surfaceBright : _surfaceDim;
}

/// [ColorSpec] implementation for the 2021 spec.
class const ColorSpec2021() with _DynamicColors2021 implements ColorSpec {
  @override
  DynamicColor get primaryPaletteKeyColor => _primaryPaletteKeyColor;

  @override
  DynamicColor get secondaryPaletteKeyColor => _secondaryPaletteKeyColor;

  @override
  DynamicColor get tertiaryPaletteKeyColor => _tertiaryPaletteKeyColor;

  @override
  DynamicColor get neutralPaletteKeyColor => _neutralPaletteKeyColor;

  @override
  DynamicColor get neutralVariantPaletteKeyColor =>
      _neutralVariantPaletteKeyColor;

  @override
  DynamicColor get errorPaletteKeyColor => _errorPaletteKeyColor;

  @override
  DynamicColor get background => _background;

  @override
  DynamicColor get onBackground => _onBackground;

  @override
  DynamicColor get surface => _surface;

  @override
  DynamicColor get surfaceDim => _surfaceDim;

  @override
  DynamicColor get surfaceBright => _surfaceBright;

  @override
  DynamicColor get surfaceContainerLowest => _surfaceContainerLowest;

  @override
  DynamicColor get surfaceContainerLow => _surfaceContainerLow;

  @override
  DynamicColor get surfaceContainer => _surfaceContainer;

  @override
  DynamicColor get surfaceContainerHigh => _surfaceContainerHigh;

  @override
  DynamicColor get surfaceContainerHighest => _surfaceContainerHighest;

  @override
  DynamicColor get onSurface => _onSurface;

  @override
  DynamicColor get surfaceVariant => _surfaceVariant;

  @override
  DynamicColor get onSurfaceVariant => _onSurfaceVariant;

  @override
  DynamicColor get inverseSurface => _inverseSurface;

  @override
  DynamicColor get inverseOnSurface => _inverseOnSurface;

  @override
  DynamicColor get outline => _outline;

  @override
  DynamicColor get outlineVariant => _outlineVariant;

  @override
  DynamicColor get shadow => _shadow;

  @override
  DynamicColor get scrim => _scrim;

  @override
  DynamicColor get surfaceTint => _surfaceTint;

  @override
  DynamicColor get primary => _primary;

  @override
  DynamicColor? get primaryDim => _primaryDim;

  @override
  DynamicColor get onPrimary => _onPrimary;

  @override
  DynamicColor get primaryContainer => _primaryContainer;

  @override
  DynamicColor get onPrimaryContainer => _onPrimaryContainer;

  @override
  DynamicColor get inversePrimary => _inversePrimary;

  @override
  DynamicColor get secondary => _secondary;

  @override
  DynamicColor? get secondaryDim => _secondaryDim;

  @override
  DynamicColor get onSecondary => _onSecondary;

  @override
  DynamicColor get secondaryContainer => _secondaryContainer;

  @override
  DynamicColor get onSecondaryContainer => _onSecondaryContainer;

  @override
  DynamicColor get tertiary => _tertiary;

  @override
  DynamicColor? get tertiaryDim => _tertiaryDim;

  @override
  DynamicColor get onTertiary => _onTertiary;

  @override
  DynamicColor get tertiaryContainer => _tertiaryContainer;

  @override
  DynamicColor get onTertiaryContainer => _onTertiaryContainer;

  @override
  DynamicColor get error => _error;

  @override
  DynamicColor? get errorDim => _errorDim;

  @override
  DynamicColor get onError => _onError;

  @override
  DynamicColor get errorContainer => _errorContainer;

  @override
  DynamicColor get onErrorContainer => _onErrorContainer;

  @override
  DynamicColor get primaryFixed => _primaryFixed;

  @override
  DynamicColor get primaryFixedDim => _primaryFixedDim;

  @override
  DynamicColor get onPrimaryFixed => _onPrimaryFixed;

  @override
  DynamicColor get onPrimaryFixedVariant => _onPrimaryFixedVariant;

  @override
  DynamicColor get secondaryFixed => _secondaryFixed;

  @override
  DynamicColor get secondaryFixedDim => _secondaryFixedDim;

  @override
  DynamicColor get onSecondaryFixed => _onSecondaryFixed;

  @override
  DynamicColor get onSecondaryFixedVariant => _onSecondaryFixedVariant;

  @override
  DynamicColor get tertiaryFixed => _tertiaryFixed;

  @override
  DynamicColor get tertiaryFixedDim => _tertiaryFixedDim;

  @override
  DynamicColor get onTertiaryFixed => _onTertiaryFixed;

  @override
  DynamicColor get onTertiaryFixedVariant => _onTertiaryFixedVariant;

  @override
  DynamicColor get controlActivated => _controlActivated;

  @override
  DynamicColor get controlNormal => _controlNormal;

  @override
  DynamicColor get controlHighlight => _controlHighlight;

  @override
  DynamicColor get textPrimaryInverse => _textPrimaryInverse;

  @override
  DynamicColor get textSecondaryAndTertiaryInverse =>
      _textSecondaryAndTertiaryInverse;

  @override
  DynamicColor get textPrimaryInverseDisableOnly =>
      _textPrimaryInverseDisableOnly;

  @override
  DynamicColor get textSecondaryAndTertiaryInverseDisabled =>
      _textSecondaryAndTertiaryInverseDisabled;

  @override
  DynamicColor get textHintInverse => _textHintInverse;

  @override
  DynamicColor highestSurface(DynamicScheme scheme) => _highestSurface(scheme);

  @override
  Hct getHct(DynamicScheme scheme, DynamicColor color) {
    final tone = getTone(scheme, color);
    return color.palette(scheme).getHct(tone);
  }

  @override
  double getTone(DynamicScheme scheme, DynamicColor color) {
    final decreasingContrast = scheme.contrastLevel < 0;
    final toneDeltaPair = color.toneDeltaPair(scheme);

    final bg = color.background(scheme);

    // Case 1: dual foreground, pair of colors with delta constraint.
    if (toneDeltaPair != null) {
      final roleA = toneDeltaPair.roleA;
      final roleB = toneDeltaPair.roleB;
      final delta = toneDeltaPair.delta;
      final polarity = toneDeltaPair.polarity;
      final stayTogether = toneDeltaPair.stayTogether;

      final aIsNearer =
          toneDeltaPair.constraint == .nearer ||
          (polarity == .lighter && !scheme.isDark) ||
          (polarity == .darker && !scheme.isDark);
      final nearer = aIsNearer ? roleA : roleB;
      final farther = aIsNearer ? roleB : roleA;
      final amNearer = color.name == nearer.name;
      final expansionDir = scheme.isDark ? 1 : -1;
      var nTone = nearer.tone(scheme);
      var fTone = farther.tone(scheme);

      // 1st round: solve to min, each
      {
        final nContrastCurve = nearer.contrastCurve(scheme);
        final fContrastCurve = farther.contrastCurve(scheme);
        if (bg != null && nContrastCurve != null && fContrastCurve != null) {
          final nContrast = nContrastCurve.get(scheme.contrastLevel);
          final fContrast = fContrastCurve.get(scheme.contrastLevel);
          final bgTone = bg.getTone(scheme);

          // If a color is good enough, it is not adjusted.
          // Initial and adjusted tones for `nearer`
          if (Contrast.ratioOfTones(bgTone, nTone) < nContrast) {
            nTone = DynamicColor.foregroundTone(bgTone, nContrast);
          }
          // Initial and adjusted tones for `farther`
          if (Contrast.ratioOfTones(bgTone, fTone) < fContrast) {
            fTone = DynamicColor.foregroundTone(bgTone, fContrast);
          }

          if (decreasingContrast) {
            // If decreasing contrast, adjust color to the "bare minimum"
            // that satisfies contrast.
            nTone = DynamicColor.foregroundTone(bgTone, nContrast);
            fTone = DynamicColor.foregroundTone(bgTone, fContrast);
          }
        }
      }

      // If constraint is not satisfied, try another round.
      if ((fTone - nTone) * expansionDir < delta) {
        // 2nd round: expand farther to match delta.
        fTone = MathUtils.clamp(nTone + delta * expansionDir, 0.0, 100.0);
        // If constraint is not satisfied, try another round.
        if ((fTone - nTone) * expansionDir < delta) {
          // 3rd round: contract nearer to match delta.
          nTone = MathUtils.clamp(fTone - delta * expansionDir, 0.0, 100.0);
        }
      }

      // Avoids the 50-59 awkward zone.
      if (50.0 <= nTone && nTone < 60.0) {
        // If `nearer` is in the awkward zone, move it away, together with
        // `farther`.
        if (expansionDir > 0.0) {
          nTone = 60.0;
          fTone = math.max(fTone, nTone + delta * expansionDir);
        } else {
          nTone = 49.0;
          fTone = math.min(fTone, nTone + delta * expansionDir);
        }
      } else if (50.0 <= fTone && fTone < 60.0) {
        if (stayTogether) {
          // Fixes both, to avoid two colors on opposite sides of the "awkward
          // zone".
          if (expansionDir > 0) {
            nTone = 60.0;
            fTone = math.max(fTone, nTone + delta * expansionDir);
          } else {
            nTone = 49.0;
            fTone = math.min(fTone, nTone + delta * expansionDir);
          }
        } else {
          // Not required to stay together; fixes just one.
          if (expansionDir > 0) {
            fTone = 60.0;
          } else {
            fTone = 49.0;
          }
        }
      }

      // Returns `nTone` if this color is `nearer`, otherwise `fTone`.
      return amNearer ? nTone : fTone;
    } else {
      // Case 2: No contrast pair; just solve for itself.
      var answer = color.tone(scheme);

      final contrastCurve = color.contrastCurve(scheme);

      if (bg == null || contrastCurve == null) {
        return answer; // No adjustment for colors with no background.
      }

      final bgTone = bg.getTone(scheme);
      final desiredRatio = contrastCurve.get(scheme.contrastLevel);

      if (Contrast.ratioOfTones(bgTone, answer) >= desiredRatio) {
        // Don't "improve" what's good enough.
      } else {
        // Rough improvement.
        answer = DynamicColor.foregroundTone(bgTone, desiredRatio);
      }

      if (decreasingContrast) {
        answer = DynamicColor.foregroundTone(bgTone, desiredRatio);
      }

      if (color.isBackground && 50.0 <= answer && answer < 60.0) {
        // Must adjust
        if (Contrast.ratioOfTones(49.0, bgTone) >= desiredRatio) {
          answer = 49.0;
        } else {
          answer = 60.0;
        }
      }

      final secondBackground = color.secondBackground(scheme);
      if (secondBackground == null) return answer;

      // Case 3: Adjust for dual backgrounds.
      final bgTone1 = bg.getTone(scheme);
      final bgTone2 = secondBackground.getTone(scheme);

      final upper = math.max(bgTone1, bgTone2);
      final lower = math.min(bgTone1, bgTone2);

      if (Contrast.ratioOfTones(upper, answer) >= desiredRatio &&
          Contrast.ratioOfTones(lower, answer) >= desiredRatio) {
        return answer;
      }

      // The darkest light tone that satisfies the desired ratio,
      // or -1 if such ratio cannot be reached.
      final lightOption = Contrast.lighter(upper, desiredRatio);

      // The lightest dark tone that satisfies the desired ratio,
      // or -1 if such ratio cannot be reached.
      final darkOption = Contrast.darker(lower, desiredRatio);

      // Tones suitable for the foreground.
      final availables = <double>[?lightOption, ?darkOption];
      final prefersLight =
          DynamicColor.tonePrefersLightForeground(bgTone1) ||
          DynamicColor.tonePrefersLightForeground(bgTone2);
      if (prefersLight) {
        return lightOption ?? 100.0;
      }
      return availables.length == 1 ? availables[0] : (darkOption ?? 0.0);
    }
  }

  @override
  TonalPalette getPrimaryPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) => switch (variant) {
    .content || .fidelity => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma,
    ),
    .fruitSalad => .fromHueAndChroma(
      MathUtils.sanitizeDegrees(sourceColor.asHct.hue - 50.0),
      48.0,
    ),
    .monochrome => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .neutral => .fromHueAndChroma(sourceColor.asHct.hue, 12.0),
    .rainbow => .fromHueAndChroma(sourceColor.asHct.hue, 48.0),
    .tonalSpot => .fromHueAndChroma(sourceColor.asHct.hue, 36.0),
    .expressive => .fromHueAndChroma(
      MathUtils.sanitizeDegrees(sourceColor.asHct.hue + 240.0),
      40.0,
    ),
    .vibrant => .fromHueAndChroma(sourceColor.asHct.hue, 200.0),
    _ => throw ArgumentError.value(
      variant,
      "variant",
      "Variant is not supported in current spec.",
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
    .content || .fidelity => .fromHueAndChroma(
      sourceColor.asHct.hue,
      math.max(sourceColor.asHct.chroma - 32.0, sourceColor.asHct.chroma * 0.5),
    ),
    .fruitSalad => .fromHueAndChroma(
      MathUtils.sanitizeDegrees(sourceColor.asHct.hue - 50.0),
      36.0,
    ),
    .monochrome => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .neutral => .fromHueAndChroma(sourceColor.asHct.hue, 8.0),
    .rainbow => .fromHueAndChroma(sourceColor.asHct.hue, 16.0),
    .tonalSpot => .fromHueAndChroma(sourceColor.asHct.hue, 16.0),
    .expressive => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        [0.0, 21.0, 51.0, 121.0, 151.0, 191.0, 271.0, 321.0, 360.0],
        [45.0, 95.0, 45.0, 20.0, 45.0, 90.0, 45.0, 45.0, 45.0],
      ),
      24.0,
    ),
    .vibrant => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 41.0, 61.0, 101.0, 131.0, 181.0, 251.0, 301.0, 360.0],
        const [18.0, 15.0, 10.0, 12.0, 15.0, 18.0, 15.0, 12.0, 12.0],
      ),
      24.0,
    ),
    _ => throw ArgumentError.value(
      variant,
      "variant",
      "Variant is not supported in current spec.",
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
    .content => .fromHct(
      DislikeAnalyzer.fixIfDisliked(
        TemperatureCache(sourceColor.asHct).getAnalogousColors(3, 6)[2],
      ),
    ),
    .fidelity => .fromHct(
      DislikeAnalyzer.fixIfDisliked(
        TemperatureCache(sourceColor.asHct).complement,
      ),
    ),
    .fruitSalad => .fromHueAndChroma(sourceColor.asHct.hue, 36.0),
    .monochrome => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .neutral => .fromHueAndChroma(sourceColor.asHct.hue, 16.0),
    .rainbow || .tonalSpot => .fromHueAndChroma(
      MathUtils.sanitizeDegrees(sourceColor.asHct.hue + 60.0),
      24.0,
    ),
    .expressive => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        [0.0, 21.0, 51.0, 121.0, 151.0, 191.0, 271.0, 321.0, 360.0],
        [120.0, 120.0, 20.0, 45.0, 20.0, 15.0, 20.0, 120.0, 120.0],
      ),
      32.0,
    ),
    .vibrant => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        [0.0, 41.0, 61.0, 101.0, 131.0, 181.0, 251.0, 301.0, 360.0],
        [35.0, 30.0, 20.0, 25.0, 30.0, 35.0, 30.0, 25.0, 25.0],
      ),
      32.0,
    ),
    _ => throw ArgumentError.value(
      variant,
      "variant",
      "Variant is not supported in current spec.",
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
    .content || .fidelity => .fromHueAndChroma(
      sourceColor.asHct.hue,
      sourceColor.asHct.chroma / 8.0,
    ),
    .fruitSalad => .fromHueAndChroma(sourceColor.asHct.hue, 10.0),
    .monochrome => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .neutral => .fromHueAndChroma(sourceColor.asHct.hue, 2.0),
    .rainbow => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .tonalSpot => .fromHueAndChroma(sourceColor.asHct.hue, 6.0),
    .expressive => .fromHueAndChroma(
      MathUtils.sanitizeDegrees(sourceColor.asHct.hue + 15.0),
      8.0,
    ),
    .vibrant => .fromHueAndChroma(sourceColor.asHct.hue, 10.0),
    _ => throw ArgumentError.value(
      variant,
      "variant",
      "Variant is not supported in current spec.",
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
    .content || .fidelity => .fromHueAndChroma(
      sourceColor.asHct.hue,
      (sourceColor.asHct.chroma / 8.0) + 4.0,
    ),
    .fruitSalad => .fromHueAndChroma(sourceColor.asHct.hue, 16.0),
    .monochrome => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .neutral => .fromHueAndChroma(sourceColor.asHct.hue, 2.0),
    .rainbow => .fromHueAndChroma(sourceColor.asHct.hue, 0.0),
    .tonalSpot => .fromHueAndChroma(sourceColor.asHct.hue, 8.0),
    .expressive => .fromHueAndChroma(
      MathUtils.sanitizeDegrees(sourceColor.asHct.hue + 15.0),
      12.0,
    ),
    .vibrant => .fromHueAndChroma(sourceColor.asHct.hue, 12.0),
    _ => throw ArgumentError.value(
      variant,
      "variant",
      "Variant is not supported in current spec.",
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
  ) => .fromHueAndChroma(25.0, 84.0);
}
