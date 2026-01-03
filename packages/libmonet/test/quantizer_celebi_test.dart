import 'package:libmonet/material_color_utilities.dart';
import 'package:test/test.dart';

const red = 0xffff0000;
const green = 0xff00ff00;
const blue = 0xff0000ff;
void main() {
  group("QuantizerCelebi", () {
    test("1R", () {
      final answer = const QuantizerCelebi().quantize([red], 128);
      expect(answer.colorToCount.length, 1);
      expect(answer.colorToCount[red], 1);
    });

    test("1G", () {
      final answer = const QuantizerCelebi().quantize([green], 128);
      expect(answer.colorToCount.length, 1);
      expect(answer.colorToCount[green], 1);
    });

    test("1B", () {
      final answer = const QuantizerCelebi().quantize([blue], 128);
      expect(answer.colorToCount.length, 1);
      expect(answer.colorToCount[blue], 1);
    });

    test("5B", () {
      final answer = const QuantizerCelebi().quantize([
        blue,
        blue,
        blue,
        blue,
        blue,
      ], 128);
      expect(answer.colorToCount.length, 1);
      expect(answer.colorToCount[blue], 5);
    });

    test("2R 3G", () {
      final answer = const QuantizerCelebi().quantize([
        red,
        red,
        green,
        green,
        green,
      ], 128);
      expect(answer.colorToCount.length, 2);
      expect(answer.colorToCount[red], 2);
      expect(answer.colorToCount[green], 3);
    });

    test("1R 1G 1B", () {
      final answer = const QuantizerCelebi().quantize([red, green, blue], 128);
      expect(answer.colorToCount.length, 3);
      expect(answer.colorToCount[red], 1);
      expect(answer.colorToCount[green], 1);
      expect(answer.colorToCount[blue], 1);
    });
  });
}
