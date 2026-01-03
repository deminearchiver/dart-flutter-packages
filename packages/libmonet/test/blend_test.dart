import 'package:test/test.dart';
import 'package:libmonet/material_color_utilities.dart';

const int red = 0xffff0000;
const int blue = 0xff0000ff;
const int green = 0xff00ff00;
const int yellow = 0xffffff00;

void main() {
  group("harmonize", () {
    test("redToBlue", () {
      final answer = Blend.harmonize(red, blue);
      expect(answer, 0xffFB0057);
    });

    test("redToGreen", () {
      final answer = Blend.harmonize(red, green);
      expect(answer, 0xffD85600);
    });

    test("redToYellow", () {
      final answer = Blend.harmonize(red, yellow);
      expect(answer, 0xffD85600);
    });

    test("blueToGreen", () {
      final answer = Blend.harmonize(blue, green);
      expect(answer, 0xff0047A3);
    });

    test("blueToRed", () {
      final answer = Blend.harmonize(blue, red);
      expect(answer, 0xff5700DC);
    });

    test("blueToYellow", () {
      final answer = Blend.harmonize(blue, yellow);
      expect(answer, 0xff0047A3);
    });

    test("greenToBlue", () {
      final answer = Blend.harmonize(green, blue);
      expect(answer, 0xff00FC94);
    });

    test("greenToRed", () {
      final answer = Blend.harmonize(green, red);
      expect(answer, 0xffB1F000);
    });

    test("greenToYellow", () {
      final answer = Blend.harmonize(green, yellow);
      expect(answer, 0xffB1F000);
    });

    test("yellowToBlue", () {
      final answer = Blend.harmonize(yellow, blue);
      expect(answer, 0xffEBFFBA);
    });

    test("yellowToGreen", () {
      final answer = Blend.harmonize(yellow, green);
      expect(answer, 0xffEBFFBA);
    });

    test("yellowToRed", () {
      final answer = Blend.harmonize(yellow, red);
      expect(answer, 0xffFFF6E3);
    });
  });
}
