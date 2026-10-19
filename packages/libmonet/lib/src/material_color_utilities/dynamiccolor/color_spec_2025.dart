part of 'color_spec.dart';

double _findBestToneForChroma(
  double hue,
  double chroma,
  double tone,
  bool byDecreasingTone,
) {
  var answer = tone;
  var bestCandidate = Hct.from(hue, chroma, answer);
  while (bestCandidate.chroma < chroma) {
    if (tone < 0.0 || tone > 100.0) break;
    tone += byDecreasingTone ? -1.0 : 1.0;
    final newCandidate = Hct.from(hue, chroma, tone);
    if (bestCandidate.chroma < newCandidate.chroma) {
      bestCandidate = newCandidate;
      answer = tone;
    }
  }
  return answer;
}

double _tMinC(
  TonalPalette palette, [
  double lowerBound = 0.0,
  double upperBound = 100.0,
]) => MathUtils.clamp(
  _findBestToneForChroma(palette.hue, palette.chroma, 0.0, false),
  lowerBound,
  upperBound,
);

double _tMaxC(
  TonalPalette palette, [
  double lowerBound = 0.0,
  double upperBound = 100.0,
  double chromaMultiplier = 1.0,
]) => MathUtils.clamp(
  _findBestToneForChroma(
    palette.hue,
    palette.chroma * chromaMultiplier,
    100.0,
    true,
  ),
  lowerBound,
  upperBound,
);

@pragma("wasm:prefer-inline")
@pragma("vm:prefer-inline")
@pragma("dart2js:prefer-inline")
ContrastCurve _getContrastCurve(double defaultContrast) =>
    switch (defaultContrast) {
      1.5 => const ContrastCurve(1.5, 1.5, 3.0, 5.5),
      3.0 => const ContrastCurve(3.0, 3.0, 4.5, 7.0),
      4.5 => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
      6.0 => const ContrastCurve(6.0, 6.0, 7.0, 11.0),
      7.0 => const ContrastCurve(7.0, 7.0, 11.0, 21.0),
      9.0 => const ContrastCurve(9.0, 9.0, 11.0, 21.0),
      11.0 => const ContrastCurve(11.0, 11.0, 21.0, 21.0),
      21.0 => const ContrastCurve(21.0, 21.0, 21.0, 21.0),
      final value => ContrastCurve(value, value, 7.0, 21.0),
    };

final class const _PrimaryPaletteKeyColor2025()
    extends _PrimaryPaletteKeyColor2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryPaletteKeyColor2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryPaletteKeyColor2025()
    extends _SecondaryPaletteKeyColor2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _SecondaryPaletteKeyColor2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryPaletteKeyColor2025()
    extends _TertiaryPaletteKeyColor2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryPaletteKeyColor2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _NeutralPaletteKeyColor2025()
    extends _NeutralPaletteKeyColor2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _NeutralPaletteKeyColor2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _NeutralVariantPaletteKeyColor2025()
    extends _NeutralVariantPaletteKeyColor2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _NeutralVariantPaletteKeyColor2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorPaletteKeyColor2025()
    extends _ErrorPaletteKeyColor2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorPaletteKeyColor2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Background2025() extends _Surface2025 {
  @override
  String get name => "background";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Background2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnBackground2025() extends _OnSurface2025 {
  @override
  String get name => "on_background";

  @override
  double tone(DynamicScheme scheme) =>
      scheme.platform == .watch ? 100.0 : _onSurface.getTone(scheme);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnBackground2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Surface2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.isDark) {
        return 4.0;
      } else {
        if (Hct.isYellow(scheme.neutralPalette.hue)) {
          return 99.0;
        } else if (scheme.variant == .vibrant) {
          return 97.0;
        } else {
          return 98.0;
        }
      }
    } else {
      return 0.0;
    }
  }

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Surface2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.isDark) {
      return 4.0;
    } else {
      if (Hct.isYellow(scheme.neutralPalette.hue)) {
        return 90.0;
      } else if (scheme.variant == .vibrant) {
        return 85.0;
      } else {
        return 87.0;
      }
    }
  }

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (!scheme.isDark) {
      if (scheme.variant == .neutral) {
        return 2.5;
      } else if (scheme.variant == .tonalSpot) {
        return 1.7;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue) ? 2.7 : 1.75;
      } else if (scheme.variant == .vibrant) {
        return 1.36;
      }
    }
    return 1.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceBright2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_bright";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.isDark) {
      return 18.0;
    } else {
      if (Hct.isYellow(scheme.neutralPalette.hue)) {
        return 99.0;
      } else if (scheme.variant == .vibrant) {
        return 97.0;
      } else {
        return 98.0;
      }
    }
  }

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.isDark) {
      if (scheme.variant == .neutral) {
        return 2.5;
      } else if (scheme.variant == .tonalSpot) {
        return 1.7;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue) ? 2.7 : 1.75;
      } else if (scheme.variant == .vibrant) {
        return 1.36;
      }
    }
    return 1.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceBright2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerLowest2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_container_lowest";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 0.0 : 100.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerLowest2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerLow2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_container_low";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.isDark) {
        return 6.0;
      } else {
        if (Hct.isYellow(scheme.neutralPalette.hue)) {
          return 98.0;
        } else if (scheme.variant == .vibrant) {
          return 95.0;
        } else {
          return 96.0;
        }
      }
    } else {
      return 15.0;
    }
  }

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 1.3;
      } else if (scheme.variant == .tonalSpot) {
        return 1.25;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue) ? 1.3 : 1.15;
      } else if (scheme.variant == .vibrant) {
        return 1.08;
      }
    }
    return 1.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerLow2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.isDark) {
        return 9.0;
      } else {
        if (Hct.isYellow(scheme.neutralPalette.hue)) {
          return 96.0;
        } else if (scheme.variant == .vibrant) {
          return 92.0;
        } else {
          return 94.0;
        }
      }
    } else {
      return 20.0;
    }
  }

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 1.6;
      } else if (scheme.variant == .tonalSpot) {
        return 1.4;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue) ? 1.6 : 1.3;
      } else if (scheme.variant == .vibrant) {
        return 1.15;
      }
    }
    return 1.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerHigh2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_container_high";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.isDark) {
        return 12.0;
      } else {
        if (Hct.isYellow(scheme.neutralPalette.hue)) {
          return 94.0;
        } else if (scheme.variant == .vibrant) {
          return 90.0;
        } else {
          return 92.0;
        }
      }
    } else {
      return 25.0;
    }
  }

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 1.9;
      } else if (scheme.variant == .tonalSpot) {
        return 1.5;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue) ? 1.95 : 1.45;
      } else if (scheme.variant == .vibrant) {
        return 1.22;
      }
    }
    return 1.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerHigh2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceContainerHighest2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "surface_container_highest";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.isDark) {
      return 15.0;
    } else {
      if (Hct.isYellow(scheme.neutralPalette.hue)) {
        return 92.0;
      } else if (scheme.variant == .vibrant) {
        return 88.0;
      } else {
        return 90.0;
      }
    }
  }

  @override
  bool get isBackground => true;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.variant == .neutral) {
      return 2.2;
    } else if (scheme.variant == .tonalSpot) {
      return 1.7;
    } else if (scheme.variant == .expressive) {
      return Hct.isYellow(scheme.neutralPalette.hue) ? 2.3 : 1.6;
    } else if (scheme.variant == .vibrant) {
      return 1.29;
    }
    return 1.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceContainerHighest2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSurface2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .vibrant) {
      return _tMaxC(scheme.neutralPalette, 0, 100, 1.1);
    } else {
      return background(scheme)?.getTone(scheme) ?? 50.0;
    }
  }

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 2.2;
      } else if (scheme.variant == .tonalSpot) {
        return 1.7;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue)
            ? (scheme.isDark ? 3.0 : 2.3)
            : 1.6;
      }
    }
    return 1.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.isDark && scheme.platform == .phone
      ? _getContrastCurve(11.0)
      : _getContrastCurve(9.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSurface2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceVariant2025() extends _SurfaceContainerHighest2025 {
  @override
  String get name => "surface_variant";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceVariant2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSurfaceVariant2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_surface_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 2.2;
      } else if (scheme.variant == .tonalSpot) {
        return 1.7;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue)
            ? (scheme.isDark ? 3.0 : 2.3)
            : 1.6;
      }
    }
    return 1.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? scheme.isDark
            ? _getContrastCurve(6.0)
            : _getContrastCurve(4.5)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSurfaceVariant2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InverseSurface2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "inverse_surface";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double tone(DynamicScheme scheme) => scheme.isDark ? 98.0 : 4.0;

  @override
  bool get isBackground => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InverseSurface2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InverseOnSurface2025()
    extends DynamicColor
    with _DynamicColors2025 {
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
      runtimeType == other.runtimeType && other is _InverseOnSurface2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Shadow2025() extends _Shadow2021 with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Shadow2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Scrim2025() extends _Scrim2021 with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Scrim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Outline2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "outline";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 2.2;
      } else if (scheme.variant == .tonalSpot) {
        return 1.7;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue)
            ? (scheme.isDark ? 3.0 : 2.3)
            : 1.6;
      }
    }
    return 1.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(3.0)
      : _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _Outline2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OutlineVariant2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "outline_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.neutralPalette;

  @override
  double chromaMultiplier(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      if (scheme.variant == .neutral) {
        return 2.2;
      } else if (scheme.variant == .tonalSpot) {
        return 1.7;
      } else if (scheme.variant == .expressive) {
        return Hct.isYellow(scheme.neutralPalette.hue)
            ? (scheme.isDark ? 3.0 : 2.3)
            : 1.6;
      }
    }
    return 1.0;
  }

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(1.5)
      : _getContrastCurve(3.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OutlineVariant2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SurfaceTint2025() extends _Primary2025 {
  @override
  String get name => "surface_tint";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SurfaceTint2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Primary2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .neutral) {
      if (scheme.platform == .phone) {
        return scheme.isDark ? 80.0 : 40.0;
      } else {
        return 90.0;
      }
    } else if (scheme.variant == .tonalSpot) {
      if (scheme.platform == .phone) {
        if (scheme.isDark) {
          return 80.0;
        } else {
          return _tMaxC(scheme.primaryPalette);
        }
      } else {
        return _tMaxC(scheme.primaryPalette, 0, 90);
      }
    } else if (scheme.variant == .expressive) {
      if (scheme.platform == .phone) {
        return _tMaxC(
          scheme.primaryPalette,
          0,
          scheme.isDark
              ? (Hct.isCyan(scheme.primaryPalette.hue) ? 88 : 98)
              : (Hct.isYellow(scheme.primaryPalette.hue) ? 25 : 98),
        );
      } else {
        // WATCH
        return _tMaxC(scheme.primaryPalette);
      }
    } else {
      // VIBRANT
      if (scheme.platform == .phone) {
        return _tMaxC(
          scheme.primaryPalette,
          0,
          Hct.isCyan(scheme.primaryPalette.hue) ? 88 : 98,
        );
      } else {
        // WATCH
        return _tMaxC(scheme.primaryPalette);
      }
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(4.5)
      : _getContrastCurve(7.0);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? .new(
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
      runtimeType == other.runtimeType && other is _Primary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "primary_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .neutral) {
      return 85.0;
    } else if (scheme.variant == .tonalSpot) {
      return _tMaxC(scheme.primaryPalette, 0, 90);
    } else {
      return _tMaxC(scheme.primaryPalette);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _surfaceContainerHigh;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _primaryDim,
    roleB: _primary,
    delta: 5.0,
    polarity: .darker,
    constraint: .farther,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimary2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      scheme.platform == .phone ? _primary : _primaryDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "primary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .watch) {
      return 30.0;
    } else if (scheme.variant == .neutral) {
      return scheme.isDark ? 30.0 : 90.0;
    } else if (scheme.variant == .tonalSpot) {
      return scheme.isDark
          ? _tMinC(scheme.primaryPalette, 35, 93)
          : _tMaxC(scheme.primaryPalette, 0, 90);
    } else if (scheme.variant == .expressive) {
      return scheme.isDark
          ? _tMinC(scheme.primaryPalette, 30, 93)
          : _tMaxC(
              scheme.primaryPalette,
              78,
              Hct.isCyan(scheme.primaryPalette.hue) ? 88 : 90,
            );
    } else {
      // VIBRANT
      return scheme.isDark
          ? _tMinC(scheme.primaryPalette, 66, 93)
          : _tMaxC(
              scheme.primaryPalette,
              66,
              Hct.isCyan(scheme.primaryPalette.hue) ? 88 : 93,
            );
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .watch
      ? .new(
          roleA: _primaryContainer,
          roleB: _primaryDim,
          delta: 10.0,
          polarity: .darker,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_primary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _InversePrimary2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "inverse_primary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => _tMaxC(scheme.primaryPalette);

  @override
  DynamicColor? background(DynamicScheme scheme) => _inverseSurface;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _InversePrimary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Secondary2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "secondary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .watch) {
      return scheme.variant == .neutral
          ? 90.0
          : _tMaxC(scheme.secondaryPalette, 0, 90);
    } else if (scheme.variant == .neutral) {
      return scheme.isDark
          ? _tMinC(scheme.secondaryPalette, 0, 98)
          : _tMaxC(scheme.secondaryPalette);
    } else if (scheme.variant == .vibrant) {
      return _tMaxC(scheme.secondaryPalette, 0, scheme.isDark ? 90 : 98);
    } else {
      // EXPRESSIVE and TONAL_SPOT
      return scheme.isDark ? 80.0 : _tMaxC(scheme.secondaryPalette);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(4.5)
      : _getContrastCurve(7.0);

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
      runtimeType == other.runtimeType && other is _Secondary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "secondary_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .neutral) {
      return 85.0;
    } else {
      return _tMaxC(scheme.secondaryPalette, 0, 90);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _surfaceContainerHigh;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _secondaryDim,
    roleB: _secondary,
    delta: 5.0,
    polarity: .darker,
    constraint: .farther,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondary2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_secondary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      scheme.platform == .phone ? _secondary : _secondaryDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "secondary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .watch) {
      return 30.0;
    } else if (scheme.variant == .vibrant) {
      return scheme.isDark
          ? _tMinC(scheme.secondaryPalette, 30, 40)
          : _tMaxC(scheme.secondaryPalette, 84, 90);
    } else if (scheme.variant == .expressive) {
      return scheme.isDark ? 15.0 : _tMaxC(scheme.secondaryPalette, 90, 95);
    } else {
      return scheme.isDark ? 25.0 : 90.0;
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .watch
      ? .new(
          roleA: _secondaryContainer,
          roleB: _secondaryDim,
          delta: 10.0,
          polarity: .darker,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_secondary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Tertiary2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "tertiary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .watch) {
      return scheme.variant == .tonalSpot
          ? _tMaxC(scheme.tertiaryPalette, 0, 90)
          : _tMaxC(scheme.tertiaryPalette);
    } else if (scheme.variant == .expressive || scheme.variant == .vibrant) {
      return _tMaxC(
        scheme.tertiaryPalette,
        /* lowerBound= */ 0,
        /* upperBound= */ Hct.isCyan(scheme.tertiaryPalette.hue)
            ? 88
            : (scheme.isDark ? 98 : 100),
      );
    } else {
      // NEUTRAL and TONAL_SPOT
      return scheme.isDark
          ? _tMaxC(scheme.tertiaryPalette, 0, 98)
          : _tMaxC(scheme.tertiaryPalette);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(4.5)
      : _getContrastCurve(7.0);

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
      runtimeType == other.runtimeType && other is _Tertiary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "tertiary_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.variant == .tonalSpot) {
      return _tMaxC(scheme.tertiaryPalette, 0, 90);
    } else {
      return _tMaxC(scheme.tertiaryPalette);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _surfaceContainerHigh;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _tertiaryDim,
    roleB: _tertiary,
    delta: 5.0,
    polarity: .darker,
    constraint: .farther,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiary2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_tertiary";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      scheme.platform == .phone ? _tertiary : _tertiaryDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiary2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "tertiary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .watch) {
      return scheme.variant == .tonalSpot
          ? _tMaxC(scheme.tertiaryPalette, 0, 90)
          : _tMaxC(scheme.tertiaryPalette);
    } else {
      if (scheme.variant == .neutral) {
        return scheme.isDark
            ? _tMaxC(scheme.tertiaryPalette, 0, 93)
            : _tMaxC(scheme.tertiaryPalette, 0, 96);
      } else if (scheme.variant == .tonalSpot) {
        return _tMaxC(scheme.tertiaryPalette, 0, scheme.isDark ? 93 : 100);
      } else if (scheme.variant == .expressive) {
        return _tMaxC(
          scheme.tertiaryPalette,
          /* lowerBound= */ 75,
          /* upperBound= */ Hct.isCyan(scheme.tertiaryPalette.hue)
              ? 88
              : (scheme.isDark ? 93 : 100),
        );
      } else {
        // VIBRANT
        return scheme.isDark
            ? _tMaxC(scheme.tertiaryPalette, 0, 93)
            : _tMaxC(scheme.tertiaryPalette, 72, 100);
      }
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .watch
      ? .new(
          roleA: _tertiaryContainer,
          roleB: _tertiaryDim,
          delta: 10.0,
          polarity: .darker,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_tertiary_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _Error2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "error";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark
          ? _tMinC(scheme.errorPalette, 0, 98)
          : _tMaxC(scheme.errorPalette);
    } else {
      return _tMinC(scheme.errorPalette);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return _surfaceContainerHigh;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(4.5)
      : _getContrastCurve(7.0);

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
      runtimeType == other.runtimeType && other is _Error2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorDim2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "error_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) => _tMinC(scheme.errorPalette);

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) => _surfaceContainerHigh;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) => .new(
    roleA: _errorDim,
    roleB: _error,
    delta: 5.0,
    polarity: .darker,
    constraint: .farther,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnError2025() extends DynamicColor with _DynamicColors2025 {
  @override
  String get name => "on_error";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) =>
      scheme.platform == .phone ? _error : _errorDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(6.0)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnError2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ErrorContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "error_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  double tone(DynamicScheme scheme) {
    if (scheme.platform == .watch) {
      return 30.0;
    } else {
      return scheme.isDark
          ? _tMinC(scheme.errorPalette, 30, 93)
          : _tMaxC(scheme.errorPalette, 0, 90);
    }
  }

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  ToneDeltaPair? toneDeltaPair(DynamicScheme scheme) =>
      scheme.platform == .watch
      ? .new(
          roleA: _errorContainer,
          roleB: _errorDim,
          delta: 10.0,
          polarity: .darker,
          constraint: .farther,
        )
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ErrorContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnErrorContainer2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_error_container";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.errorPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _errorContainer;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone
      ? _getContrastCurve(4.5)
      : _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnErrorContainer2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryFixed2025()
    extends DynamicColor
    with _DynamicColors2025 {
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
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _PrimaryFixed2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _PrimaryFixedDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "primary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  double tone(DynamicScheme scheme) => _primaryFixed.getTone(scheme);

  @override
  bool get isBackground => true;

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
      runtimeType == other.runtimeType && other is _PrimaryFixedDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryFixed2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_primary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryFixedDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryFixed2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnPrimaryFixedVariant2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_primary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.primaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _primaryFixedDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnPrimaryFixedVariant2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryFixed2025()
    extends DynamicColor
    with _DynamicColors2025 {
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
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _SecondaryFixed2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _SecondaryFixedDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "secondary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  double tone(DynamicScheme scheme) => _secondaryFixed.getTone(scheme);

  @override
  bool get isBackground => true;

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
      runtimeType == other.runtimeType && other is _SecondaryFixedDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryFixed2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_secondary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryFixedDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryFixed2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnSecondaryFixedVariant2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_secondary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.secondaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _secondaryFixedDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnSecondaryFixedVariant2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryFixed2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "tertiary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) => _tertiaryContainer.getTone(
    scheme.copyWith(isDark: false, contrastLevel: 0.0),
  );

  @override
  bool get isBackground => true;

  @override
  DynamicColor? background(DynamicScheme scheme) {
    if (scheme.platform == .phone) {
      return scheme.isDark ? _surfaceBright : _surfaceDim;
    } else {
      return null;
    }
  }

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) =>
      scheme.platform == .phone && scheme.contrastLevel > 0.0
      ? _getContrastCurve(1.5)
      : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TertiaryFixed2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TertiaryFixedDim2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "tertiary_fixed_dim";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  double tone(DynamicScheme scheme) => _tertiaryFixed.getTone(scheme);

  @override
  bool get isBackground => true;

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
      runtimeType == other.runtimeType && other is _TertiaryFixedDim2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryFixed2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_tertiary_fixed";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryFixedDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(7.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryFixed2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _OnTertiaryFixedVariant2025()
    extends DynamicColor
    with _DynamicColors2025 {
  @override
  String get name => "on_tertiary_fixed_variant";

  @override
  TonalPalette palette(DynamicScheme scheme) => scheme.tertiaryPalette;

  @override
  DynamicColor? background(DynamicScheme scheme) => _tertiaryFixedDim;

  @override
  ContrastCurve? contrastCurve(DynamicScheme scheme) => _getContrastCurve(4.5);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _OnTertiaryFixedVariant2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlActivated2025() extends _PrimaryContainer2025 {
  @override
  String get name => "control_activated";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlActivated2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlNormal2025() extends _OnSurfaceVariant2025 {
  @override
  String get name => "control_normal";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlNormal2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _ControlHighlight2025()
    extends _ControlHighlight2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _ControlHighlight2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextPrimaryInverse2025() extends _InverseOnSurface2025 {
  @override
  String get name => "text_primary_inverse";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TextPrimaryInverse2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextSecondaryAndTertiaryInverse2025()
    extends _TextSecondaryAndTertiaryInverse2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextSecondaryAndTertiaryInverse2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextPrimaryInverseDisableOnly2025()
    extends _TextPrimaryInverseDisableOnly2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextPrimaryInverseDisableOnly2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextSecondaryAndTertiaryInverseDisabled2025()
    extends _TextSecondaryAndTertiaryInverseDisabled2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _TextSecondaryAndTertiaryInverseDisabled2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class const _TextHintInverse2025()
    extends _TextHintInverse2021
    with _DynamicColors2025 {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType && other is _TextHintInverse2025;

  @override
  int get hashCode => runtimeType.hashCode;
}

const DynamicColor _primaryPaletteKeyColor2025 = .extended(
  _primaryPaletteKeyColor2021,
  .spec2025,
  _PrimaryPaletteKeyColor2025(),
);

const DynamicColor _secondaryPaletteKeyColor2025 = .extended(
  _secondaryPaletteKeyColor2021,
  .spec2025,
  _SecondaryPaletteKeyColor2025(),
);

const DynamicColor _tertiaryPaletteKeyColor2025 = .extended(
  _tertiaryPaletteKeyColor2021,
  .spec2025,
  _TertiaryPaletteKeyColor2025(),
);

const DynamicColor _neutralPaletteKeyColor2025 = .extended(
  _neutralPaletteKeyColor2021,
  .spec2025,
  _NeutralPaletteKeyColor2025(),
);

const DynamicColor _neutralVariantPaletteKeyColor2025 = .extended(
  _neutralVariantPaletteKeyColor2021,
  .spec2025,
  _NeutralVariantPaletteKeyColor2025(),
);

const DynamicColor _errorPaletteKeyColor2025 = .extended(
  _errorPaletteKeyColor2021,
  .spec2025,
  _ErrorPaletteKeyColor2025(),
);

const DynamicColor _background2025 = .extended(
  _background2021,
  .spec2025,
  _Background2025(),
);

const DynamicColor _onBackground2025 = .extended(
  _onBackground2021,
  .spec2025,
  _OnBackground2025(),
);

const DynamicColor _surface2025 = .extended(
  _surface2021,
  .spec2025,
  _Surface2025(),
);

const DynamicColor _surfaceDim2025 = .extended(
  _surfaceDim2021,
  .spec2025,
  _SurfaceDim2025(),
);

const DynamicColor _surfaceBright2025 = .extended(
  _surfaceBright2021,
  .spec2025,
  _SurfaceBright2025(),
);

const DynamicColor _surfaceContainerLowest2025 = .extended(
  _surfaceContainerLowest2021,
  .spec2025,
  _SurfaceContainerLowest2025(),
);

const DynamicColor _surfaceContainerLow2025 = .extended(
  _surfaceContainerLow2021,
  .spec2025,
  _SurfaceContainerLow2025(),
);

const DynamicColor _surfaceContainer2025 = .extended(
  _surfaceContainer2021,
  .spec2025,
  _SurfaceContainer2025(),
);

const DynamicColor _surfaceContainerHigh2025 = .extended(
  _surfaceContainerHigh2021,
  .spec2025,
  _SurfaceContainerHigh2025(),
);

const DynamicColor _surfaceContainerHighest2025 = .extended(
  _surfaceContainerHighest2021,
  .spec2025,
  _SurfaceContainerHighest2025(),
);

const DynamicColor _onSurface2025 = .extended(
  _onSurface2021,
  .spec2025,
  _OnSurface2025(),
);

const DynamicColor _surfaceVariant2025 = .extended(
  _surfaceVariant2021,
  .spec2025,
  _SurfaceVariant2025(),
);

const DynamicColor _onSurfaceVariant2025 = .extended(
  _onSurfaceVariant2021,
  .spec2025,
  _OnSurfaceVariant2025(),
);

const DynamicColor _outline2025 = .extended(
  _outline2021,
  .spec2025,
  _Outline2025(),
);

const DynamicColor _outlineVariant2025 = .extended(
  _outlineVariant2021,
  .spec2025,
  _OutlineVariant2025(),
);

const DynamicColor _inverseSurface2025 = .extended(
  _inverseSurface2021,
  .spec2025,
  _InverseSurface2025(),
);

const DynamicColor _inverseOnSurface2025 = .extended(
  _inverseOnSurface2021,
  .spec2025,
  _InverseOnSurface2025(),
);

const DynamicColor _shadow2025 = .extended(
  _shadow2021,
  .spec2025,
  _Shadow2025(),
);

const DynamicColor _scrim2025 = .extended(_scrim2021, .spec2025, _Scrim2025());

const DynamicColor _surfaceTint2025 = .extended(
  _surfaceTint2021,
  .spec2025,
  _SurfaceTint2025(),
);

const DynamicColor _primary2025 = .extended(
  _primary2021,
  .spec2025,
  _Primary2025(),
);

const DynamicColor _primaryDim2025 = _PrimaryDim2025();

const DynamicColor _onPrimary2025 = .extended(
  _onPrimary2021,
  .spec2025,
  _OnPrimary2025(),
);

const DynamicColor _primaryContainer2025 = .extended(
  _primaryContainer2021,
  .spec2025,
  _PrimaryContainer2025(),
);

const DynamicColor _onPrimaryContainer2025 = .extended(
  _onPrimaryContainer2021,
  .spec2025,
  _OnPrimaryContainer2025(),
);

const DynamicColor _primaryFixed2025 = .extended(
  _primaryFixed2021,
  .spec2025,
  _PrimaryFixed2025(),
);

const DynamicColor _primaryFixedDim2025 = .extended(
  _primaryFixedDim2021,
  .spec2025,
  _PrimaryFixedDim2025(),
);

const DynamicColor _onPrimaryFixed2025 = .extended(
  _onPrimaryFixed2021,
  .spec2025,
  _OnPrimaryFixed2025(),
);

const DynamicColor _onPrimaryFixedVariant2025 = .extended(
  _onPrimaryFixedVariant2021,
  .spec2025,
  _OnPrimaryFixedVariant2025(),
);

const DynamicColor _inversePrimary2025 = .extended(
  _inversePrimary2021,
  .spec2025,
  _InversePrimary2025(),
);

const DynamicColor _secondary2025 = .extended(
  _secondary2021,
  .spec2025,
  _Secondary2025(),
);

const DynamicColor _secondaryDim2025 = _SecondaryDim2025();

const DynamicColor _onSecondary2025 = .extended(
  _onSecondary2021,
  .spec2025,
  _OnSecondary2025(),
);

const DynamicColor _secondaryContainer2025 = .extended(
  _secondaryContainer2021,
  .spec2025,
  _SecondaryContainer2025(),
);

const DynamicColor _onSecondaryContainer2025 = .extended(
  _onSecondaryContainer2021,
  .spec2025,
  _OnSecondaryContainer2025(),
);

const DynamicColor _secondaryFixed2025 = .extended(
  _secondaryFixed2021,
  .spec2025,
  _SecondaryFixed2025(),
);

const DynamicColor _secondaryFixedDim2025 = .extended(
  _secondaryFixedDim2021,
  .spec2025,
  _SecondaryFixedDim2025(),
);

const DynamicColor _onSecondaryFixed2025 = .extended(
  _onSecondaryFixed2021,
  .spec2025,
  _OnSecondaryFixed2025(),
);

const DynamicColor _onSecondaryFixedVariant2025 = .extended(
  _onSecondaryFixedVariant2021,
  .spec2025,
  _OnSecondaryFixedVariant2025(),
);

const DynamicColor _tertiary2025 = .extended(
  _tertiary2021,
  .spec2025,
  _Tertiary2025(),
);

const DynamicColor _tertiaryDim2025 = _TertiaryDim2025();

const DynamicColor _onTertiary2025 = .extended(
  _onTertiary2021,
  .spec2025,
  _OnTertiary2025(),
);

const DynamicColor _tertiaryContainer2025 = .extended(
  _tertiaryContainer2021,
  .spec2025,
  _TertiaryContainer2025(),
);

const DynamicColor _onTertiaryContainer2025 = .extended(
  _onTertiaryContainer2021,
  .spec2025,
  _OnTertiaryContainer2025(),
);

const DynamicColor _tertiaryFixed2025 = .extended(
  _tertiaryFixed2021,
  .spec2025,
  _TertiaryFixed2025(),
);

const DynamicColor _tertiaryFixedDim2025 = .extended(
  _tertiaryFixedDim2021,
  .spec2025,
  _TertiaryFixedDim2025(),
);

const DynamicColor _onTertiaryFixed2025 = .extended(
  _onTertiaryFixed2021,
  .spec2025,
  _OnTertiaryFixed2025(),
);

const DynamicColor _onTertiaryFixedVariant2025 = .extended(
  _onTertiaryFixedVariant2021,
  .spec2025,
  _OnTertiaryFixedVariant2025(),
);

const DynamicColor _error2025 = .extended(_error2021, .spec2025, _Error2025());

const DynamicColor _errorDim2025 = _ErrorDim2025();

const DynamicColor _onError2025 = .extended(
  _onError2021,
  .spec2025,
  _OnError2025(),
);

const DynamicColor _errorContainer2025 = .extended(
  _errorContainer2021,
  .spec2025,
  _ErrorContainer2025(),
);

const DynamicColor _onErrorContainer2025 = .extended(
  _onErrorContainer2021,
  .spec2025,
  _OnErrorContainer2025(),
);

const DynamicColor _controlActivated2025 = .extended(
  _controlActivated2021,
  .spec2025,
  _ControlActivated2025(),
);

const DynamicColor _controlNormal2025 = .extended(
  _controlNormal2021,
  .spec2025,
  _ControlNormal2025(),
);

const DynamicColor _controlHighlight2025 = .extended(
  _controlHighlight2021,
  .spec2025,
  _ControlHighlight2025(),
);

const DynamicColor _textPrimaryInverse2025 = .extended(
  _textPrimaryInverse2021,
  .spec2025,
  _TextPrimaryInverse2025(),
);

const DynamicColor _textSecondaryAndTertiaryInverse2025 = .extended(
  _textSecondaryAndTertiaryInverse2021,
  .spec2025,
  _TextSecondaryAndTertiaryInverse2025(),
);

const DynamicColor _textPrimaryInverseDisableOnly2025 = .extended(
  _textPrimaryInverseDisableOnly2021,
  .spec2025,
  _TextPrimaryInverseDisableOnly2025(),
);

const DynamicColor _textSecondaryAndTertiaryInverseDisabled2025 = .extended(
  _textSecondaryAndTertiaryInverseDisabled2021,
  .spec2025,
  _TextSecondaryAndTertiaryInverseDisabled2025(),
);

const DynamicColor _textHintInverse2025 = .extended(
  _textHintInverse2021,
  .spec2025,
  _TextHintInverse2025(),
);

mixin _DynamicColors2025 implements _DynamicColors2021 {
  @override
  DynamicColor get _primaryPaletteKeyColor => _primaryPaletteKeyColor2025;

  @override
  DynamicColor get _secondaryPaletteKeyColor => _secondaryPaletteKeyColor2025;

  @override
  DynamicColor get _tertiaryPaletteKeyColor => _tertiaryPaletteKeyColor2025;

  @override
  DynamicColor get _neutralPaletteKeyColor => _neutralPaletteKeyColor2025;

  @override
  DynamicColor get _neutralVariantPaletteKeyColor =>
      _neutralVariantPaletteKeyColor2025;

  @override
  DynamicColor get _errorPaletteKeyColor => _errorPaletteKeyColor2025;

  @override
  DynamicColor get _background => _background2025;

  @override
  DynamicColor get _onBackground => _onBackground2025;

  @override
  DynamicColor get _surface => _surface2025;

  @override
  DynamicColor get _surfaceDim => _surfaceDim2025;

  @override
  DynamicColor get _surfaceBright => _surfaceBright2025;

  @override
  DynamicColor get _surfaceContainerLowest => _surfaceContainerLowest2025;

  @override
  DynamicColor get _surfaceContainerLow => _surfaceContainerLow2025;

  @override
  DynamicColor get _surfaceContainer => _surfaceContainer2025;

  @override
  DynamicColor get _surfaceContainerHigh => _surfaceContainerHigh2025;

  @override
  DynamicColor get _surfaceContainerHighest => _surfaceContainerHighest2025;

  @override
  DynamicColor get _onSurface => _onSurface2025;

  @override
  DynamicColor get _surfaceVariant => _surfaceVariant2025;

  @override
  DynamicColor get _onSurfaceVariant => _onSurfaceVariant2025;

  @override
  DynamicColor get _outline => _outline2025;

  @override
  DynamicColor get _outlineVariant => _outlineVariant2025;

  @override
  DynamicColor get _inverseSurface => _inverseSurface2025;

  @override
  DynamicColor get _inverseOnSurface => _inverseOnSurface2025;

  @override
  DynamicColor get _shadow => _shadow2025;

  @override
  DynamicColor get _scrim => _scrim2025;

  @override
  DynamicColor get _surfaceTint => _surfaceTint2025;

  @override
  DynamicColor get _primary => _primary2025;

  @override
  DynamicColor get _primaryDim => _primaryDim2025;

  @override
  DynamicColor get _onPrimary => _onPrimary2025;

  @override
  DynamicColor get _primaryContainer => _primaryContainer2025;

  @override
  DynamicColor get _onPrimaryContainer => _onPrimaryContainer2025;

  @override
  DynamicColor get _primaryFixed => _primaryFixed2025;

  @override
  DynamicColor get _primaryFixedDim => _primaryFixedDim2025;

  @override
  DynamicColor get _onPrimaryFixed => _onPrimaryFixed2025;

  @override
  DynamicColor get _onPrimaryFixedVariant => _onPrimaryFixedVariant2025;

  @override
  DynamicColor get _inversePrimary => _inversePrimary2025;

  @override
  DynamicColor get _secondary => _secondary2025;

  @override
  DynamicColor get _secondaryDim => _secondaryDim2025;

  @override
  DynamicColor get _onSecondary => _onSecondary2025;

  @override
  DynamicColor get _secondaryContainer => _secondaryContainer2025;

  @override
  DynamicColor get _onSecondaryContainer => _onSecondaryContainer2025;

  @override
  DynamicColor get _secondaryFixed => _secondaryFixed2025;

  @override
  DynamicColor get _secondaryFixedDim => _secondaryFixedDim2025;

  @override
  DynamicColor get _onSecondaryFixed => _onSecondaryFixed2025;

  @override
  DynamicColor get _onSecondaryFixedVariant => _onSecondaryFixedVariant2025;

  @override
  DynamicColor get _tertiary => _tertiary2025;

  @override
  DynamicColor get _tertiaryDim => _tertiaryDim2025;

  @override
  DynamicColor get _onTertiary => _onTertiary2025;

  @override
  DynamicColor get _tertiaryContainer => _tertiaryContainer2025;

  @override
  DynamicColor get _onTertiaryContainer => _onTertiaryContainer2025;

  @override
  DynamicColor get _tertiaryFixed => _tertiaryFixed2025;

  @override
  DynamicColor get _tertiaryFixedDim => _tertiaryFixedDim2025;

  @override
  DynamicColor get _onTertiaryFixed => _onTertiaryFixed2025;

  @override
  DynamicColor get _onTertiaryFixedVariant => _onTertiaryFixedVariant2025;

  @override
  DynamicColor get _error => _error2025;

  @override
  DynamicColor get _errorDim => _errorDim2025;

  @override
  DynamicColor get _onError => _onError2025;

  @override
  DynamicColor get _errorContainer => _errorContainer2025;

  @override
  DynamicColor get _onErrorContainer => _onErrorContainer2025;

  @override
  DynamicColor get _controlActivated => _controlActivated2025;

  @override
  DynamicColor get _controlNormal => _controlNormal2025;

  @override
  DynamicColor get _controlHighlight => _controlHighlight2025;

  @override
  DynamicColor get _textPrimaryInverse => _textPrimaryInverse2025;

  @override
  DynamicColor get _textSecondaryAndTertiaryInverse =>
      _textSecondaryAndTertiaryInverse2025;

  @override
  DynamicColor get _textPrimaryInverseDisableOnly =>
      _textPrimaryInverseDisableOnly2025;

  @override
  DynamicColor get _textSecondaryAndTertiaryInverseDisabled =>
      _textSecondaryAndTertiaryInverseDisabled2025;

  @override
  DynamicColor get _textHintInverse => _textHintInverse2025;

  @override
  DynamicColor _highestSurface(DynamicScheme scheme) =>
      scheme.isDark ? _surfaceBright : _surfaceDim;
}

/// [ColorSpec] implementation for the 2025 spec.
class const ColorSpec2025() extends ColorSpec2021 with _DynamicColors2025 {
  @override
  DynamicColor get primaryDim => _primaryDim;

  @override
  DynamicColor get secondaryDim => _secondaryDim;

  @override
  DynamicColor get tertiaryDim => _tertiaryDim;

  @override
  DynamicColor get errorDim => _errorDim;

  @override
  Hct getHct(DynamicScheme scheme, DynamicColor color) {
    // This is crucial for aesthetics: we aren't simply the taking the standard
    // color and changing its tone for contrast. Rather, we find the tone for
    // contrast, then use the specified chroma from the palette to construct
    // a new color.
    //
    // For example, this enables colors with standard tone of T90, which has
    // limited chroma, to "recover" intended chroma as contrast increases.
    final palette = color.palette(scheme);
    final tone = getTone(scheme, color);
    final chromaMultiplier = color.chromaMultiplier(scheme);
    if (chromaMultiplier == 1.0) {
      return palette.getHct(tone);
    }

    final chroma = palette.chroma * chromaMultiplier;
    if (tone == 99.0 && Hct.isYellow(palette.hue)) {
      return TonalPalette.fromHueAndChroma(palette.hue, chroma).getHct(tone);
    }
    return .from(palette.hue, chroma, tone);
  }

  @override
  double getTone(DynamicScheme scheme, DynamicColor color) {
    final toneDeltaPair = color.toneDeltaPair(scheme);
    final background = color.background(scheme);

    // Case 0: tone delta pair.
    if (toneDeltaPair != null) {
      final roleA = toneDeltaPair.roleA;
      final roleB = toneDeltaPair.roleB;
      final polarity = toneDeltaPair.polarity;
      final constraint = toneDeltaPair.constraint;
      final absoluteDelta =
          polarity == .darker ||
              (polarity == .relativeLighter && scheme.isDark) ||
              (polarity == .relativeDarker && !scheme.isDark)
          ? -toneDeltaPair.delta
          : toneDeltaPair.delta;

      final amRoleA = color.name == roleA.name;
      final selfRole = amRoleA ? roleA : roleB;
      final referenceRole = amRoleA ? roleB : roleA;
      var selfTone = selfRole.tone(scheme);
      final referenceTone = referenceRole.getTone(scheme);
      final relativeDelta = absoluteDelta * (amRoleA ? 1.0 : -1.0);

      switch (constraint) {
        case .exact:
          selfTone = MathUtils.clamp(referenceTone + relativeDelta, 0.0, 100.0);
        case .nearer:
          if (relativeDelta > 0.0) {
            selfTone = MathUtils.clamp(
              MathUtils.clamp(
                selfTone,
                referenceTone,
                referenceTone + relativeDelta,
              ),
              0.0,
              100.0,
            );
          } else {
            selfTone = MathUtils.clamp(
              MathUtils.clamp(
                selfTone,
                referenceTone + relativeDelta,
                referenceTone,
              ),
              0.0,
              100.0,
            );
          }
        case .farther:
          if (relativeDelta > 0.0) {
            selfTone = MathUtils.clamp(
              selfTone,
              referenceTone + relativeDelta,
              100.0,
            );
          } else {
            selfTone = MathUtils.clamp(
              selfTone,
              0.0,
              referenceTone + relativeDelta,
            );
          }
      }

      final contrastCurve = color.contrastCurve(scheme);
      if (background != null && contrastCurve != null) {
        final bgTone = background.getTone(scheme);
        final selfContrast = contrastCurve.get(scheme.contrastLevel);
        selfTone =
            Contrast.ratioOfTones(bgTone, selfTone) >= selfContrast &&
                scheme.contrastLevel >= 0.0
            ? selfTone
            : DynamicColor.foregroundTone(bgTone, selfContrast);
      }

      // This can avoid the awkward tones for background colors including the access fixed colors.
      // Accent fixed dim colors should not be adjusted.
      if (color.isBackground && !color.name.endsWith("_fixed_dim")) {
        if (selfTone >= 57) {
          selfTone = MathUtils.clamp(selfTone, 65.0, 100.0);
        } else {
          selfTone = MathUtils.clamp(selfTone, 0.0, 49.0);
        }
      }

      return selfTone;
    } else {
      // Case 1: No tone delta pair; just solve for itself.
      var answer = color.tone(scheme);

      final contrastCurve = color.contrastCurve(scheme);
      if (background == null || contrastCurve == null) {
        return answer; // No adjustment for colors with no background.
      }

      final bgTone = background.getTone(scheme);
      final desiredRatio = contrastCurve.get(scheme.contrastLevel);

      // Recalculate the tone from desired contrast ratio if the current
      // contrast ratio is not enough or desired contrast level is decreasing
      // (<0).
      answer =
          Contrast.ratioOfTones(bgTone, answer) >= desiredRatio &&
              scheme.contrastLevel >= 0.0
          ? answer
          : DynamicColor.foregroundTone(bgTone, desiredRatio);

      // This can avoid the awkward tones for background colors including the access fixed colors.
      // Accent fixed dim colors should not be adjusted.
      if (color.isBackground && !color.name.endsWith("_fixed_dim")) {
        if (answer >= 57.0) {
          answer = MathUtils.clamp(answer, 65.0, 100.0);
        } else {
          answer = MathUtils.clamp(answer, 0.0, 49.0);
        }
      }

      final secondBackground = color.secondBackground(scheme);
      if (secondBackground == null) return answer;

      // Case 2: Adjust for dual backgrounds.
      final bgTone1 = background.getTone(scheme);
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
    .neutral => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone
          ? (Hct.isBlue(sourceColor.asHct.hue) ? 12.0 : 8.0)
          : (Hct.isBlue(sourceColor.asHct.hue) ? 16.0 : 12.0),
    ),
    .tonalSpot => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone && isDark ? 26.0 : 32.0,
    ),
    .expressive => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone ? (isDark ? 36.0 : 48.0) : 40.0,
    ),
    .vibrant => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone ? 74.0 : 56.0,
    ),
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
    .neutral => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone
          ? (Hct.isBlue(sourceColor.asHct.hue) ? 6.0 : 4.0)
          : (Hct.isBlue(sourceColor.asHct.hue) ? 10.0 : 6.0),
    ),
    .tonalSpot => .fromHueAndChroma(sourceColor.asHct.hue, 16.0),
    .expressive => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 105.0, 140.0, 204.0, 253.0, 278.0, 300.0, 333.0, 360.0],
        const [-160.0, 155.0, -100.0, 96.0, -96.0, -156.0, -165.0, -160.0],
      ),
      platform == .phone ? (isDark ? 16.0 : 24.0) : 24.0,
    ),
    .vibrant => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 38.0, 105.0, 140.0, 333.0, 360.0],
        const [-14.0, 10.0, -14.0, 10.0, -14.0],
      ),
      platform == .phone ? 56.0 : 36.0,
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
    .neutral => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 38.0, 105.0, 161.0, 204.0, 278.0, 333.0, 360.0],
        const [-32.0, 26.0, 10.0, -39.0, 24.0, -15.0, -32.0],
      ),
      platform == .phone ? 20.0 : 36.0,
    ),
    .tonalSpot => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 20.0, 71.0, 161.0, 333.0, 360.0],
        const [-40.0, 48.0, -32.0, 40.0, -32.0],
      ),
      platform == .phone ? 28.0 : 32.0,
    ),
    .expressive => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 105.0, 140.0, 204.0, 253.0, 278.0, 300.0, 333.0, 360.0],
        const [-165.0, 160.0, -105.0, 101.0, -101.0, -160.0, -170.0, -165.0],
      ),
      48.0,
    ),
    .vibrant => .fromHueAndChroma(
      DynamicScheme.getRotatedHue(
        sourceColor.asHct,
        const [0.0, 38.0, 71.0, 105.0, 140.0, 161.0, 253.0, 333.0, 360.0],
        const [-72.0, 35.0, 24.0, -24.0, 62.0, 50.0, 62.0, -72.0],
      ),
      56.0,
    ),
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
    .neutral => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone ? 1.4 : 6.0,
    ),
    .tonalSpot => .fromHueAndChroma(
      sourceColor.asHct.hue,
      platform == .phone ? 5.0 : 10.0,
    ),
    .expressive => .fromHueAndChroma(
      _getExpressiveNeutralHue(sourceColor.asHct),
      _getExpressiveNeutralChroma(sourceColor.asHct, isDark, platform),
    ),
    .vibrant => .fromHueAndChroma(
      _getVibrantNeutralHue(sourceColor.asHct),
      _getVibrantNeutralChroma(sourceColor.asHct, platform),
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
  ) {
    switch (variant) {
      case .neutral:
        return .fromHueAndChroma(
          sourceColor.asHct.hue,
          (platform == .phone ? 1.4 : 6.0) * 2.2,
        );
      case .tonalSpot:
        return .fromHueAndChroma(
          sourceColor.asHct.hue,
          (platform == .phone ? 5.0 : 10.0) * 1.7,
        );
      case .expressive:
        final expressiveNeutralHue = _getExpressiveNeutralHue(
          sourceColor.asHct,
        );
        final expressiveNeutralChroma = _getExpressiveNeutralChroma(
          sourceColor.asHct,
          isDark,
          platform,
        );
        return .fromHueAndChroma(
          expressiveNeutralHue,
          expressiveNeutralChroma *
              (expressiveNeutralHue >= 105.0 && expressiveNeutralHue < 125.0
                  ? 1.6
                  : 2.3),
        );
      case .vibrant:
        final vibrantNeutralHue = _getVibrantNeutralHue(sourceColor.asHct);
        final vibrantNeutralChroma = _getVibrantNeutralChroma(
          sourceColor.asHct,
          platform,
        );
        return .fromHueAndChroma(
          vibrantNeutralHue,
          vibrantNeutralChroma * 1.29,
        );
      default:
        return super.getNeutralVariantPalette(
          sourceColor,
          variant,
          isDark,
          contrastLevel,
          platform,
          specVersion,
        );
    }
  }

  @override
  TonalPalette getErrorPalette(
    TonalPaletteSourceColor sourceColor,
    Variant variant,
    bool isDark,
    double contrastLevel,
    Platform platform,
    SpecVersion specVersion,
  ) {
    final errorHue = DynamicScheme.getPiecewiseValue(
      sourceColor.asHct,
      const [0.0, 3.0, 13.0, 23.0, 33.0, 43.0, 153.0, 273.0, 360.0],
      const [12.0, 22.0, 32.0, 12.0, 22.0, 32.0, 22.0, 12.0],
    );
    return switch (variant) {
      .neutral => .fromHueAndChroma(errorHue, platform == .phone ? 50.0 : 40.0),
      .tonalSpot => .fromHueAndChroma(
        errorHue,
        platform == .phone ? 60.0 : 48.0,
      ),
      .expressive => .fromHueAndChroma(
        errorHue,
        platform == .phone ? 64.0 : 48.0,
      ),
      .vibrant => .fromHueAndChroma(errorHue, platform == .phone ? 80.0 : 60.0),
      _ => super.getErrorPalette(
        sourceColor,
        variant,
        isDark,
        contrastLevel,
        platform,
        specVersion,
      ),
    };
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double _getExpressiveNeutralHue(Hct sourceColorHct) =>
      DynamicScheme.getRotatedHue(
        sourceColorHct,
        const [0.0, 71.0, 124.0, 253.0, 278.0, 300.0, 360.0],
        const [10.0, 0.0, 10.0, 0.0, 10.0, 0.0],
      );

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double _getExpressiveNeutralChroma(
    Hct sourceColorHct,
    bool isDark,
    Platform platform,
  ) => platform == .phone
      ? isDark
            ? Hct.isYellow(_getExpressiveNeutralHue(sourceColorHct))
                  ? 6.0
                  : 14.0
            : 18.0
      : 12.0;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double _getVibrantNeutralHue(Hct sourceColorHct) =>
      DynamicScheme.getRotatedHue(
        sourceColorHct,
        const [0.0, 38.0, 105.0, 140.0, 333.0, 360.0],
        const [-14.0, 10.0, -14.0, 10.0, -14.0],
      );

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static double _getVibrantNeutralChroma(
    Hct sourceColorHct,
    Platform platform,
  ) => platform == .phone
      ? 28.0
      : Hct.isBlue(_getVibrantNeutralHue(sourceColorHct))
      ? 28.0
      : 20.0;
}
