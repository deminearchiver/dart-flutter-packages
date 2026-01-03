import 'package:test/test.dart';
import 'package:libmonet/material_color_utilities.dart';

import 'test_utils.dart';

void main() {
  group("contrast", () {
    test("ratioOfTones_outOfBoundsInput", () {
      expect(
        21.0,
        closeToWithPrecision(Contrast.ratioOfTones(-10.0, 110.0), 0.001),
      );
    });

    test("lighter_impossibleRatioErrors", () {
      expect(null, closeToWithPrecision(Contrast.lighter(90.0, 10.0), 0.001));
    });

    test("lighter_outOfBoundsInputAboveErrors", () {
      expect(null, closeToWithPrecision(Contrast.lighter(110.0, 2.0), 0.001));
    });

    test("lighter_outOfBoundsInputBelowErrors", () {
      expect(null, closeToWithPrecision(Contrast.lighter(-10.0, 2.0), 0.001));
    });

    test("lighterUnsafe_returnsMaxTone", () {
      expect(
        100,
        closeToWithPrecision(Contrast.lighterUnsafe(100.0, 2.0), 0.001),
      );
    });

    test("darker_impossibleRatioErrors", () {
      expect(null, closeToWithPrecision(Contrast.darker(10.0, 20.0), 0.001));
    });

    test("darker_outOfBoundsInputAboveErrors", () {
      expect(null, closeToWithPrecision(Contrast.darker(110.0, 2.0), 0.001));
    });

    test("darker_outOfBoundsInputBelowErrors", () {
      expect(null, closeToWithPrecision(Contrast.darker(-10.0, 2.0), 0.001));
    });

    test("darkerUnsafe_returnsMinTone", () {
      expect(0.0, closeToWithPrecision(Contrast.darkerUnsafe(0.0, 2.0), 0.001));
    });
  });
}
