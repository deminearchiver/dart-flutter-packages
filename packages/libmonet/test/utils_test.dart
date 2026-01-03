import 'package:test/test.dart';
import 'package:libmonet/material_color_utilities.dart';

import 'test_utils.dart';

void main() {
  group("argbFromRgb", () {
    test('returns correct value for black', () {
      expect(ColorUtils.argbFromRgb(255, 255, 255), 0xffffffff);
      expect(ColorUtils.argbFromRgb(255, 255, 255), 4294967295);
    });

    test('returns correct value for white', () {
      expect(ColorUtils.argbFromRgb(0, 0, 0), 0xff000000);
      expect(ColorUtils.argbFromRgb(0, 0, 0), 4278190080);
    });

    test('returns correct value for random color', () {
      expect(ColorUtils.argbFromRgb(50, 150, 250), 0xff3296fa);
      expect(ColorUtils.argbFromRgb(50, 150, 250), 4281505530);
    });
  });

  group("yFromLstar", () {
    test("satisfies given values", () {
      expect(ColorUtils.yFromLstar(0.0), closeToWithPrecision(0.0, 5));
      expect(ColorUtils.yFromLstar(0.1), closeToWithPrecision(0.0110705, 5));
      expect(ColorUtils.yFromLstar(0.2), closeToWithPrecision(0.0221411, 5));
      expect(ColorUtils.yFromLstar(0.3), closeToWithPrecision(0.0332116, 5));
      expect(ColorUtils.yFromLstar(0.4), closeToWithPrecision(0.0442822, 5));
      expect(ColorUtils.yFromLstar(0.5), closeToWithPrecision(0.0553528, 5));
      expect(ColorUtils.yFromLstar(1.0), closeToWithPrecision(0.1107056, 5));
      expect(ColorUtils.yFromLstar(2.0), closeToWithPrecision(0.2214112, 5));
      expect(ColorUtils.yFromLstar(3.0), closeToWithPrecision(0.3321169, 5));
      expect(ColorUtils.yFromLstar(4.0), closeToWithPrecision(0.4428225, 5));
      expect(ColorUtils.yFromLstar(5.0), closeToWithPrecision(0.5535282, 5));
      expect(ColorUtils.yFromLstar(8.0), closeToWithPrecision(0.8856451, 5));
      expect(ColorUtils.yFromLstar(10.0), closeToWithPrecision(1.1260199, 5));
      expect(ColorUtils.yFromLstar(15.0), closeToWithPrecision(1.9085832, 5));
      expect(ColorUtils.yFromLstar(20.0), closeToWithPrecision(2.9890524, 5));
      expect(ColorUtils.yFromLstar(25.0), closeToWithPrecision(4.4154767, 5));
      expect(ColorUtils.yFromLstar(30.0), closeToWithPrecision(6.2359055, 5));
      expect(ColorUtils.yFromLstar(40.0), closeToWithPrecision(11.2509737, 5));
      expect(ColorUtils.yFromLstar(50.0), closeToWithPrecision(18.4186518, 5));
      expect(ColorUtils.yFromLstar(60.0), closeToWithPrecision(28.1233342, 5));
      expect(ColorUtils.yFromLstar(70.0), closeToWithPrecision(40.7494157, 5));
      expect(ColorUtils.yFromLstar(80.0), closeToWithPrecision(56.6812907, 5));
      expect(ColorUtils.yFromLstar(90.0), closeToWithPrecision(76.3033539, 5));
      expect(ColorUtils.yFromLstar(95.0), closeToWithPrecision(87.6183294, 5));
      expect(ColorUtils.yFromLstar(99.0), closeToWithPrecision(97.4360239, 5));
      expect(ColorUtils.yFromLstar(100.0), closeToWithPrecision(100.0, 5));
    });

    test("is inverse of lstarFromY", () {
      for (var y = 0.0; y <= 100.0; y += 0.1) {
        final lstar = ColorUtils.lstarFromY(y);
        final reconstructedY = ColorUtils.yFromLstar(lstar);
        expect(reconstructedY, closeToWithPrecision(y, 8));
      }
    });
  });

  group("lstarFromY", () {
    test("satisfies given values", () {
      expect(ColorUtils.lstarFromY(0.0), closeToWithPrecision(0.0, 5));
      expect(ColorUtils.lstarFromY(0.1), closeToWithPrecision(0.9032962, 5));
      expect(ColorUtils.lstarFromY(0.2), closeToWithPrecision(1.8065925, 5));
      expect(ColorUtils.lstarFromY(0.3), closeToWithPrecision(2.7098888, 5));
      expect(ColorUtils.lstarFromY(0.4), closeToWithPrecision(3.6131851, 5));
      expect(ColorUtils.lstarFromY(0.5), closeToWithPrecision(4.5164814, 5));
      expect(ColorUtils.lstarFromY(0.8856451), closeToWithPrecision(8.0, 5));
      expect(ColorUtils.lstarFromY(1.0), closeToWithPrecision(8.9914424, 5));
      expect(ColorUtils.lstarFromY(2.0), closeToWithPrecision(15.4872443, 5));
      expect(ColorUtils.lstarFromY(3.0), closeToWithPrecision(20.0438970, 5));
      expect(ColorUtils.lstarFromY(4.0), closeToWithPrecision(23.6714419, 5));
      expect(ColorUtils.lstarFromY(5.0), closeToWithPrecision(26.7347653, 5));
      expect(ColorUtils.lstarFromY(10.0), closeToWithPrecision(37.8424304, 5));
      expect(ColorUtils.lstarFromY(15.0), closeToWithPrecision(45.6341970, 5));
      expect(ColorUtils.lstarFromY(20.0), closeToWithPrecision(51.8372115, 5));
      expect(ColorUtils.lstarFromY(25.0), closeToWithPrecision(57.0754208, 5));
      expect(ColorUtils.lstarFromY(30.0), closeToWithPrecision(61.6542222, 5));
      expect(ColorUtils.lstarFromY(40.0), closeToWithPrecision(69.4695307, 5));
      expect(ColorUtils.lstarFromY(50.0), closeToWithPrecision(76.0692610, 5));
      expect(ColorUtils.lstarFromY(60.0), closeToWithPrecision(81.8381891, 5));
      expect(ColorUtils.lstarFromY(70.0), closeToWithPrecision(86.9968642, 5));
      expect(ColorUtils.lstarFromY(80.0), closeToWithPrecision(91.6848609, 5));
      expect(ColorUtils.lstarFromY(90.0), closeToWithPrecision(95.9967686, 5));
      expect(ColorUtils.lstarFromY(95.0), closeToWithPrecision(98.0335184, 5));
      expect(ColorUtils.lstarFromY(99.0), closeToWithPrecision(99.6120372, 5));
      expect(ColorUtils.lstarFromY(100.0), closeToWithPrecision(100.0, 5));
    });

    test("is inverse of yFromLstar", () {
      for (var lstar = 0.0; lstar <= 100.0; lstar += 0.1) {
        final y = ColorUtils.yFromLstar(lstar);
        final reconstructedLstar = ColorUtils.lstarFromY(y);
        expect(reconstructedLstar, closeToWithPrecision(lstar, 8));
      }
    });
  });
}
