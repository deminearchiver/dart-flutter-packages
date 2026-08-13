import '../utils/color_utils.dart';

import 'cam16.dart';
import 'hct_solver.dart';
import 'viewing_conditions.dart';

/// HCT, hue, chroma, and tone. A color system that provides a perceptually
/// accurate color measurement system that can also accurately render
/// what colors will appear as in different lighting environments.
final class Hct._fromCam({required final int _argb, required Cam16 cam}) {
  /// Create an HCT color from a color.
  new fromInt(int argb) : this._fromCam(argb: argb, cam: .fromInt(argb));

  /// Create an HCT color from hue, chroma, and tone.
  new from(double hue, double chroma, double tone)
    : this.fromInt(HctSolver.solveToInt(hue, chroma, tone));

  final double hue = cam.hue;

  final double chroma = cam.chroma;

  final double tone = ColorUtils.lstarFromArgb(_argb);

  int toInt() => _argb;

  Hct copyWith({double? hue, double? chroma, double? tone}) =>
      hue != null || chroma != null || tone != null
      ? .from(hue ?? this.hue, chroma ?? this.chroma, tone ?? this.tone)
      : this;

  Hct inViewingConditions(ViewingConditions viewingConditions) {
    // 1. Use CAM16 to find XYZ coordinates of color in specified VC.
    final cam16 = Cam16.fromInt(toInt());
    final viewedInVc = cam16.xyzInViewingConditions(viewingConditions);

    // 2. Create CAM16 of those XYZ coordinates in default VC.
    final recastInVc = Cam16.fromXyzInViewingConditions(
      viewedInVc[0],
      viewedInVc[1],
      viewedInVc[2],
      .sRgb,
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
