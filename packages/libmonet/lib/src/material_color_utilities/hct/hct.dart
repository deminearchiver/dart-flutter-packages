import '../utils/color_utils.dart';

import 'cam16.dart';
import 'hct_solver.dart';
import 'viewing_conditions.dart';

/// HCT, hue, chroma, and tone. A color system that provides a perceptually
/// accurate color measurement system that can also accurately render
/// what colors will appear as in different lighting environments.
final class Hct {
  const Hct._({
    required int argb,
    required this.hue,
    required this.chroma,
    required this.tone,
  }) : _argb = argb;

  Hct._fromCam({required int argb, required Cam16 cam})
    : this._(
        argb: argb,
        hue: cam.hue,
        chroma: cam.chroma,
        tone: ColorUtils.lstarFromArgb(argb),
      );

  /// Create an HCT color from a color.
  Hct.fromInt(int argb) : this._fromCam(argb: argb, cam: .fromInt(argb));

  /// Create an HCT color from hue, chroma, and tone.
  Hct.from(double hue, double chroma, double tone)
    : this.fromInt(HctSolver.solveToInt(hue, chroma, tone));

  final int _argb;

  final double hue;

  final double chroma;

  final double tone;

  int toInt() => _argb;

  Hct copyWith({double? hue, double? chroma, double? tone}) =>
      .from(hue ?? this.hue, chroma ?? this.chroma, tone ?? this.tone);

  Hct inViewingConditions(ViewingConditions viewingConditions) {
    // 1. Use CAM16 to find XYZ coordinates of color in specified VC.
    final cam16 = Cam16.fromInt(toInt());
    final viewedInVc = cam16.xyzInViewingConditions(viewingConditions);

    // 2. Create CAM16 of those XYZ coordinates in default VC.
    final recastInVc = Cam16.fromXyzInViewingConditions(
      viewedInVc[0],
      viewedInVc[1],
      viewedInVc[2],
      .srgb,
    );

    // 3. Create HCT from:
    // - CAM16 using default VC with XYZ coordinates in specified VC.
    // - L* converted from Y in XYZ coordinates in specified VC.
    return .from(
      recastInVc.hue,
      recastInVc.chroma,
      ColorUtils.lstarFromY(viewedInVc[1]),
    );
  }

  @override
  String toString() =>
      "HCT(${hue.round()}, ${chroma.round()}, ${tone.round()})";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Hct &&
          _argb == other._argb &&
          hue == other.hue &&
          chroma == other.chroma &&
          tone == other.tone;

  @override
  int get hashCode => Object.hash(_argb, hue, chroma, tone);

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static bool isBlue(double hue) => hue >= 250.0 && hue < 270.0;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static bool isYellow(double hue) => hue >= 105.0 && hue < 125.0;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  static bool isCyan(double hue) => hue >= 170.0 && hue < 207.0;
}
