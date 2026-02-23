// ignore_for_file: recursive_getters

import 'dart:math' as math;

import '../contrast/contrast.dart';
import '../hct/hct.dart';
import '../palettes/tonal_palette.dart';
import '../utils/math_utils.dart';
import 'color_spec.dart';
import 'color_spec_2021.dart';
import 'contrast_curve.dart';
import 'dynamic_color.dart';
import 'dynamic_scheme.dart';
import 'tone_delta_pair.dart';
import 'variant.dart';

/// [ColorSpec] implementation for the 2025 spec.
class ColorSpec2025 extends ColorSpec2021 {
  const ColorSpec2025();

  @override
  DynamicColor get background {
    final color2025 = surface.copyWith(name: "background");
    return super.background.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onBackground {
    final color2025 = onSurface.copyWith(
      name: "on_background",
      tone: (scheme) =>
          scheme.platform == .watch ? 100.0 : onSurface.getTone(scheme),
    );
    return super.onBackground.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surface {
    final color2025 = DynamicColor(
      name: "surface",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
    );
    return super.surface.extendSpecVersion(SpecVersion.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceDim {
    final color2025 = DynamicColor(
      name: "surface_dim",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      chromaMultiplier: (scheme) {
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
      },
    );
    return super.surfaceDim.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceBright {
    final color2025 = DynamicColor(
      name: "surface_bright",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      chromaMultiplier: (scheme) {
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
      },
    );
    return super.surfaceBright.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceContainerLowest {
    final color2025 = DynamicColor(
      name: "surface_container_lowest",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.isDark ? 0.0 : 100.0,
      isBackground: true,
    );
    return super.surfaceContainerLowest.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceContainerLow {
    final color2025 = DynamicColor(
      name: "surface_container_low",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      chromaMultiplier: (scheme) {
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
      },
    );
    return super.surfaceContainerLow.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceContainer {
    final color2025 = DynamicColor(
      name: "surface_container",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      chromaMultiplier: (scheme) {
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
      },
    );
    return super.surfaceContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceContainerHigh {
    final color2025 = DynamicColor(
      name: "surface_container_high",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      chromaMultiplier: (scheme) {
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
      },
    );
    return super.surfaceContainerHigh.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceContainerHighest {
    final color2025 = DynamicColor(
      name: "surface_container_highest",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      chromaMultiplier: (scheme) {
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
      },
    );
    return super.surfaceContainerHighest.extendSpecVersion(
      .spec2025,
      color2025,
    );
  }

  @override
  DynamicColor get onSurface {
    final color2025 = DynamicColor(
      name: "on_surface",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) {
        if (scheme.variant == .vibrant) {
          return _tMaxC(scheme.neutralPalette, 0, 100, 1.1);
        } else {
          return DynamicColor.getInitialToneFromBackground((scheme) {
            if (scheme.platform == .phone) {
              return scheme.isDark ? surfaceBright : surfaceDim;
            } else {
              return surfaceContainerHigh;
            }
          })(scheme);
        }
      },
      chromaMultiplier: (scheme) {
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
      },
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.isDark && scheme.platform == .phone
          ? _getContrastCurve(11)
          : _getContrastCurve(9),
    );
    return super.onSurface.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceVariant {
    final color2025 = surfaceContainerHighest.copyWith(name: "surface_variant");
    return super.surfaceVariant.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onSurfaceVariant {
    final color2025 = DynamicColor(
      name: "on_surface_variant",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) {
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
      },
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? scheme.isDark
                ? _getContrastCurve(6.0)
                : _getContrastCurve(4.5)
          : _getContrastCurve(7.0),
    );
    return super.onSurfaceVariant.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get inverseSurface {
    final color2025 = DynamicColor(
      name: "inverse_surface",
      palette: (scheme) => scheme.neutralPalette,
      tone: (scheme) => scheme.isDark ? 98.0 : 4.0,
      isBackground: true,
    );
    return super.inverseSurface.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get inverseOnSurface {
    final color2025 = DynamicColor(
      name: "inverse_on_surface",
      palette: (scheme) => scheme.neutralPalette,
      background: (scheme) => inverseSurface,
      contrastCurve: (scheme) => _getContrastCurve(7),
    );
    return super.inverseOnSurface.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get outline {
    final color2025 = DynamicColor(
      name: "outline",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) {
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
      },
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(3)
          : _getContrastCurve(4.5),
    );
    return super.outline.extendSpecVersion(SpecVersion.spec2025, color2025);
  }

  @override
  DynamicColor get outlineVariant {
    final color2025 = DynamicColor(
      name: "outline_variant",
      palette: (scheme) => scheme.neutralPalette,
      chromaMultiplier: (scheme) {
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
      },
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(1.5)
          : _getContrastCurve(3),
    );
    return super.outlineVariant.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get surfaceTint {
    final color2025 = primary.copyWith(name: "surface_tint");
    return super.surfaceTint.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get primary {
    final color2025 = DynamicColor(
      name: "primary",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) {
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
              Hct.isYellow(scheme.primaryPalette.hue)
                  ? 25
                  : Hct.isCyan(scheme.primaryPalette.hue)
                  ? 88
                  : 98,
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
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(4.5)
          : _getContrastCurve(7),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: primaryContainer,
              roleB: primary,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.primary.extendSpecVersion(SpecVersion.spec2025, color2025);
  }

  @override
  DynamicColor get primaryDim {
    return DynamicColor(
      name: "primary_dim",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) {
        if (scheme.variant == .neutral) {
          return 85.0;
        } else if (scheme.variant == .tonalSpot) {
          return _tMaxC(scheme.primaryPalette, 0, 90);
        } else {
          return _tMaxC(scheme.primaryPalette);
        }
      },
      isBackground: true,
      background: (_) => surfaceContainerHigh,
      contrastCurve: (_) => _getContrastCurve(4.5),
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: primaryDim,
        roleB: primary,
        delta: 5.0,
        polarity: .darker,
        constraint: .farther,
      ),
    );
  }

  @override
  DynamicColor get onPrimary {
    final color2025 = DynamicColor(
      name: "on_primary",
      palette: (scheme) => scheme.primaryPalette,
      background: (scheme) => scheme.platform == .phone ? primary : primaryDim,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onPrimary.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get primaryContainer {
    final color2025 = DynamicColor(
      name: "primary_container",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) {
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
              ? _tMaxC(scheme.primaryPalette, 30, 93)
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
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      toneDeltaPair: (scheme) => scheme.platform == .watch
          ? ToneDeltaPair(
              roleA: primaryContainer,
              roleB: primaryDim,
              delta: 10.0,
              polarity: .darker,
              constraint: .farther,
            )
          : null,
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.primaryContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onPrimaryContainer {
    final color2025 = DynamicColor(
      name: "on_primary_container",
      palette: (scheme) => scheme.primaryPalette,
      background: (_) => primaryContainer,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onPrimaryContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get inversePrimary {
    final color2025 = DynamicColor(
      name: "inverse_primary",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) => _tMaxC(scheme.primaryPalette),
      background: (_) => inverseSurface,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.inversePrimary.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get secondary {
    final color2025 = DynamicColor(
      name: "secondary",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(4.5)
          : _getContrastCurve(7),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: secondaryContainer,
              roleB: secondary,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.secondary.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get secondaryDim {
    return DynamicColor(
      name: "secondary_dim",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) {
        if (scheme.variant == .neutral) {
          return 85.0;
        } else {
          return _tMaxC(scheme.secondaryPalette, 0, 90);
        }
      },
      isBackground: true,
      background: (_) => surfaceContainerHigh,
      contrastCurve: (_) => _getContrastCurve(4.5),
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: secondaryDim,
        roleB: secondary,
        delta: 5.0,
        polarity: .darker,
        constraint: .farther,
      ),
    );
  }

  @override
  DynamicColor get onSecondary {
    final color2025 = DynamicColor(
      name: "on_secondary",
      palette: (scheme) => scheme.secondaryPalette,
      background: (scheme) =>
          scheme.platform == .phone ? secondary : secondaryDim,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onSecondary.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get secondaryContainer {
    final color2025 = DynamicColor(
      name: "secondary_container",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      toneDeltaPair: (scheme) => scheme.platform == .watch
          ? ToneDeltaPair(
              roleA: secondaryContainer,
              roleB: secondaryDim,
              delta: 10.0,
              polarity: .darker,
              constraint: .farther,
            )
          : null,
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0.0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.secondaryContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onSecondaryContainer {
    final color2025 = DynamicColor(
      name: "on_secondary_container",
      palette: (scheme) => scheme.secondaryPalette,
      background: (_) => secondaryContainer,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onSecondaryContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get tertiary {
    final color2025 = DynamicColor(
      name: "tertiary",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) {
        if (scheme.platform == .watch) {
          return scheme.variant == .tonalSpot
              ? _tMaxC(scheme.tertiaryPalette, 0, 90)
              : _tMaxC(scheme.tertiaryPalette);
        } else if (scheme.variant == .expressive ||
            scheme.variant == .vibrant) {
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
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(4.5)
          : _getContrastCurve(7),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: tertiaryContainer,
              roleB: tertiary,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.tertiary.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get tertiaryDim {
    return DynamicColor(
      name: "tertiary_dim",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) {
        if (scheme.variant == .tonalSpot) {
          return _tMaxC(scheme.tertiaryPalette, 0, 90);
        } else {
          return _tMaxC(scheme.tertiaryPalette);
        }
      },
      isBackground: true,
      background: (_) => surfaceContainerHigh,
      contrastCurve: (_) => _getContrastCurve(4.5),
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: tertiaryDim,
        roleB: tertiary,
        delta: 5.0,
        polarity: .darker,
        constraint: .farther,
      ),
    );
  }

  @override
  DynamicColor get onTertiary {
    final color2025 = DynamicColor(
      name: "on_tertiary",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (scheme) =>
          scheme.platform == .phone ? tertiary : tertiaryDim,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onTertiary.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get tertiaryContainer {
    final color2025 = DynamicColor(
      name: "tertiary_container",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) {
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
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      toneDeltaPair: (scheme) => scheme.platform == .watch
          ? ToneDeltaPair(
              roleA: tertiaryContainer,
              roleB: tertiaryDim,
              delta: 10.0,
              polarity: .darker,
              constraint: .farther,
            )
          : null,
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.tertiaryContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onTertiaryContainer {
    final color2025 = DynamicColor(
      name: "on_tertiary_container",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (_) => tertiaryContainer,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onTertiaryContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get error {
    final color2025 = DynamicColor(
      name: "error",
      palette: (scheme) => scheme.errorPalette,
      tone: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark
              ? _tMinC(scheme.errorPalette, 0, 98)
              : _tMaxC(scheme.errorPalette);
        } else {
          return _tMinC(scheme.errorPalette);
        }
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return surfaceContainerHigh;
        }
      },
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(4.5)
          : _getContrastCurve(7),
      toneDeltaPair: (scheme) => scheme.platform == .phone
          ? ToneDeltaPair(
              roleA: errorContainer,
              roleB: error,
              delta: 5.0,
              polarity: .relativeLighter,
              constraint: .farther,
            )
          : null,
    );
    return super.error.extendSpecVersion(SpecVersion.spec2025, color2025);
  }

  @override
  DynamicColor get errorDim {
    return DynamicColor(
      name: "error_dim",
      palette: (scheme) => scheme.errorPalette,
      tone: (scheme) => _tMinC(scheme.errorPalette),
      isBackground: true,
      background: (_) => surfaceContainerHigh,
      contrastCurve: (_) => _getContrastCurve(4.5),
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: errorDim,
        roleB: error,
        delta: 5.0,
        polarity: .darker,
        constraint: .farther,
      ),
    );
  }

  @override
  DynamicColor get onError {
    final color2025 = DynamicColor(
      name: "on_error",
      palette: (scheme) => scheme.errorPalette,
      background: (scheme) => scheme.platform == .phone ? error : errorDim,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(6)
          : _getContrastCurve(7),
    );
    return super.onError.extendSpecVersion(SpecVersion.spec2025, color2025);
  }

  @override
  DynamicColor get errorContainer {
    final color2025 = DynamicColor(
      name: "error_container",
      palette: (scheme) => scheme.errorPalette,
      tone: (scheme) {
        if (scheme.platform == .watch) {
          return 30.0;
        } else {
          return scheme.isDark
              ? _tMinC(scheme.errorPalette, 30, 93)
              : _tMaxC(scheme.errorPalette, 0, 90);
        }
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      toneDeltaPair: (scheme) => scheme.platform == .watch
          ? ToneDeltaPair(
              roleA: errorContainer,
              roleB: errorDim,
              delta: 10.0,
              polarity: .darker,
              constraint: .farther,
            )
          : null,
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.errorContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onErrorContainer {
    final color2025 = DynamicColor(
      name: "on_error_container",
      palette: (scheme) => scheme.errorPalette,
      background: (_) => errorContainer,
      contrastCurve: (scheme) => scheme.platform == .phone
          ? _getContrastCurve(4.5)
          : _getContrastCurve(7.0),
    );
    return super.onErrorContainer.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get primaryFixed {
    final color2025 = DynamicColor(
      name: "primary_fixed",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) {
        return primaryContainer.getTone(
          scheme.copyWith(isDark: false, contrastLevel: 0.0),
        );
      },
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0.0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.primaryFixed.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get primaryFixedDim {
    final color2025 = DynamicColor(
      name: "primary_fixed_dim",
      palette: (scheme) => scheme.primaryPalette,
      tone: (scheme) => primaryFixed.getTone(scheme),
      isBackground: true,
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: primaryFixedDim,
        roleB: primaryFixed,
        delta: 5.0,
        polarity: .darker,
        constraint: .exact,
      ),
    );
    return super.primaryFixedDim.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onPrimaryFixed {
    final color2025 = DynamicColor(
      name: "on_primary_fixed",
      palette: (scheme) => scheme.primaryPalette,
      background: (_) => primaryFixedDim,
      contrastCurve: (_) => _getContrastCurve(7),
    );
    return super.onPrimaryFixed.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onPrimaryFixedVariant {
    final color2025 = DynamicColor(
      name: "on_primary_fixed_variant",
      palette: (scheme) => scheme.primaryPalette,
      background: (_) => primaryFixedDim,
      contrastCurve: (_) => _getContrastCurve(4.5),
    );
    return super.onPrimaryFixedVariant.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get secondaryFixed {
    final color2025 = DynamicColor(
      name: "secondary_fixed",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) => secondaryContainer.getTone(
        scheme.copyWith(isDark: false, contrastLevel: 0.0),
      ),
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0.0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.secondaryFixed.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get secondaryFixedDim {
    final color2025 = DynamicColor(
      name: "secondary_fixed_dim",
      palette: (scheme) => scheme.secondaryPalette,
      tone: (scheme) => secondaryFixed.getTone(scheme),
      isBackground: true,
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: secondaryFixedDim,
        roleB: secondaryFixed,
        delta: 5.0,
        polarity: .darker,
        constraint: .exact,
      ),
    );
    return super.secondaryFixedDim.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onSecondaryFixed {
    final color2025 = DynamicColor(
      name: "on_secondary_fixed",
      palette: (scheme) => scheme.secondaryPalette,
      background: (_) => secondaryFixedDim,
      contrastCurve: (_) => _getContrastCurve(7),
    );
    return super.onSecondaryFixed.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onSecondaryFixedVariant {
    final color2025 = DynamicColor(
      name: "on_secondary_fixed_variant",
      palette: (scheme) => scheme.secondaryPalette,
      background: (_) => secondaryFixedDim,
      contrastCurve: (_) => _getContrastCurve(4.5),
    );
    return super.onSecondaryFixedVariant.extendSpecVersion(
      .spec2025,
      color2025,
    );
  }

  @override
  DynamicColor get tertiaryFixed {
    final color2025 = DynamicColor(
      name: "tertiary_fixed",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) => tertiaryContainer.getTone(
        scheme.copyWith(isDark: false, contrastLevel: 0.0),
      ),
      isBackground: true,
      background: (scheme) {
        if (scheme.platform == .phone) {
          return scheme.isDark ? surfaceBright : surfaceDim;
        } else {
          return null;
        }
      },
      contrastCurve: (scheme) =>
          scheme.platform == .phone && scheme.contrastLevel > 0.0
          ? _getContrastCurve(1.5)
          : null,
    );
    return super.tertiaryFixed.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get tertiaryFixedDim {
    final color2025 = DynamicColor(
      name: "tertiary_fixed_dim",
      palette: (scheme) => scheme.tertiaryPalette,
      tone: (scheme) => tertiaryFixed.getTone(scheme),
      isBackground: true,
      toneDeltaPair: (_) => ToneDeltaPair(
        roleA: tertiaryFixedDim,
        roleB: tertiaryFixed,
        delta: 5.0,
        polarity: .darker,
        constraint: .exact,
      ),
    );
    return super.tertiaryFixedDim.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onTertiaryFixed {
    final color2025 = DynamicColor(
      name: "on_tertiary_fixed",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (_) => tertiaryFixedDim,
      contrastCurve: (_) => _getContrastCurve(7.0),
    );
    return super.onTertiaryFixed.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get onTertiaryFixedVariant {
    final color2025 = DynamicColor(
      name: "on_tertiary_fixed_variant",
      palette: (scheme) => scheme.tertiaryPalette,
      background: (_) => tertiaryFixedDim,
      contrastCurve: (_) => _getContrastCurve(4.5),
    );
    return super.onTertiaryFixedVariant.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get controlActivated {
    // Remapped to primaryContainer for 2025 spec.
    final color2025 = primaryContainer.copyWith(name: "control_activated");
    return super.controlActivated.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get controlNormal {
    // Remapped to onSurfaceVariant for 2025 spec.
    final color2025 = onSurfaceVariant.copyWith(name: "control_normal");
    return super.controlNormal.extendSpecVersion(.spec2025, color2025);
  }

  @override
  DynamicColor get textPrimaryInverse {
    // Remapped to inverseOnSurface for 2025 spec.
    final color2025 = inverseOnSurface.copyWith(name: "text_primary_inverse");
    return super.textPrimaryInverse.extendSpecVersion(.spec2025, color2025);
  }

  @override
  Hct getHct(DynamicScheme scheme, DynamicColor color) {
    // This is crucial for aesthetics: we aren't simply the taking the standard color
    // and changing its tone for contrast. Rather, we find the tone for contrast, then
    // use the specified chroma from the palette to construct a new color.
    //
    // For example, this enables colors with standard tone of T90, which has limited chroma, to
    // "recover" intended chroma as contrast increases.
    final palette = color.palette(scheme);
    final tone = getTone(scheme, color);
    final hue = palette.hue;
    final chromaMultiplier = color.chromaMultiplier?.call(scheme) ?? 1.0;
    final chroma = palette.chroma * chromaMultiplier;

    return Hct.from(hue, chroma, tone);
  }

  @override
  double getTone(DynamicScheme scheme, DynamicColor color) {
    final toneDeltaPair = color.toneDeltaPair?.call(scheme);

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
          selfTone = MathUtils.clampDouble(
            0.0,
            100.0,
            referenceTone + relativeDelta,
          );
        case .nearer:
          if (relativeDelta > 0.0) {
            selfTone = MathUtils.clampDouble(
              0.0,
              100.0,
              MathUtils.clampDouble(
                referenceTone,
                referenceTone + relativeDelta,
                selfTone,
              ),
            );
          } else {
            selfTone = MathUtils.clampDouble(
              0.0,
              100.0,
              MathUtils.clampDouble(
                referenceTone + relativeDelta,
                referenceTone,
                selfTone,
              ),
            );
          }
        case .farther:
          if (relativeDelta > 0.0) {
            selfTone = MathUtils.clampDouble(
              referenceTone + relativeDelta,
              100.0,
              selfTone,
            );
          } else {
            selfTone = MathUtils.clampDouble(
              0.0,
              referenceTone + relativeDelta,
              selfTone,
            );
          }
      }

      if (color.background != null && color.contrastCurve != null) {
        final background = color.background!(scheme);
        final contrastCurve = color.contrastCurve!(scheme);
        if (background != null && contrastCurve != null) {
          final bgTone = background.getTone(scheme);
          final selfContrast = contrastCurve.get(scheme.contrastLevel);
          selfTone =
              Contrast.ratioOfTones(bgTone, selfTone) >= selfContrast &&
                  scheme.contrastLevel >= 0.0
              ? selfTone
              : DynamicColor.foregroundTone(bgTone, selfContrast);
        }
      }

      // This can avoid the awkward tones for background colors including the access fixed colors.
      // Accent fixed dim colors should not be adjusted.
      if (color.isBackground && !color.name.endsWith("_fixed_dim")) {
        if (selfTone >= 57) {
          selfTone = MathUtils.clampDouble(65.0, 100.0, selfTone);
        } else {
          selfTone = MathUtils.clampDouble(0.0, 49.0, selfTone);
        }
      }

      return selfTone;
    } else {
      // Case 1: No tone delta pair; just solve for itself.
      var answer = color.tone(scheme);

      if (color.background?.call(scheme) == null ||
          color.contrastCurve?.call(scheme) == null) {
        return answer; // No adjustment for colors with no background.
      }

      final bgTone = color.background!(scheme)!.getTone(scheme);
      final desiredRatio = color.contrastCurve!(scheme)!.get(
        scheme.contrastLevel,
      );

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
          answer = MathUtils.clampDouble(65.0, 100.0, answer);
        } else {
          answer = MathUtils.clampDouble(0.0, 49.0, answer);
        }
      }

      if (color.secondBackground?.call(scheme) == null) {
        return answer;
      }

      // Case 2: Adjust for dual backgrounds.
      final bgTone1 = color.background!(scheme)!.getTone(scheme);
      final bgTone2 = color.secondBackground!(scheme)!.getTone(scheme);
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

  static double _tMaxC(
    TonalPalette palette, [
    double lowerBound = 0.0,
    double upperBound = 100.0,
    double chromaMultiplier = 1.0,
  ]) => MathUtils.clampDouble(
    lowerBound,
    upperBound,
    _findBestToneForChroma(
      palette.hue,
      palette.chroma * chromaMultiplier,
      100.0,
      true,
    ),
  );

  static double _tMinC(
    TonalPalette palette, [
    double lowerBound = 0.0,
    double upperBound = 100.0,
  ]) => MathUtils.clampDouble(
    lowerBound,
    upperBound,
    _findBestToneForChroma(palette.hue, palette.chroma, 0.0, false),
  );

  static double _findBestToneForChroma(
    double hue,
    double chroma,
    double tone,
    bool byDecreasingTone,
  ) {
    var answer = tone;
    var bestCandidate = Hct.from(hue, chroma, answer);
    while (bestCandidate.chroma < chroma) {
      if (tone < 0.0 || tone > 100.0) {
        break;
      }
      tone += byDecreasingTone ? -1.0 : 1.0;
      final newCandidate = Hct.from(hue, chroma, tone);
      if (bestCandidate.chroma < newCandidate.chroma) {
        bestCandidate = newCandidate;
        answer = tone;
      }
    }
    return answer;
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static ContrastCurve _getContrastCurve(double defaultContrast) =>
      switch (defaultContrast) {
        1.5 => const ContrastCurve(1.5, 1.5, 3.0, 5.5),
        3.0 => const ContrastCurve(3.0, 3.0, 4.5, 7.0),
        4.5 => const ContrastCurve(4.5, 4.5, 7.0, 11.0),
        6.0 => const ContrastCurve(6.0, 6.0, 7.0, 11.0),
        7.0 => const ContrastCurve(7.0, 7.0, 11.0, 21.0),
        9.0 => const ContrastCurve(9.0, 9.0, 11.0, 21.0),
        11.0 => const ContrastCurve(11.0, 11.0, 21.0, 21.0),
        21.0 => const ContrastCurve(21.0, 21.0, 21.0, 21.0),
        _ => ContrastCurve(defaultContrast, defaultContrast, 7.0, 21.0),
      };
}
