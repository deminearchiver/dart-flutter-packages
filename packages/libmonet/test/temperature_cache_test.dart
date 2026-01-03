import 'package:test/test.dart';
import 'package:libmonet/material_color_utilities.dart';

import 'test_utils.dart';

extension on TemperatureCache {
  double get _inputRelativeTemperature => getRelativeTemperature(input);
}

void main() {
  group("TemperatureCache", () {
    test("computes raw temperatures correctly", () {
      final blueTemp = TemperatureCache.rawTemperature(Hct.fromInt(0xff0000ff));
      expect(blueTemp, closeToWithPrecision(-1.393, 3));

      final redTemp = TemperatureCache.rawTemperature(Hct.fromInt(0xffff0000));
      expect(redTemp, closeToWithPrecision(2.351, 3));

      final greenTemp = TemperatureCache.rawTemperature(
        Hct.fromInt(0xff00ff00),
      );
      expect(greenTemp, closeToWithPrecision(-0.267, 3));

      final whiteTemp = TemperatureCache.rawTemperature(
        Hct.fromInt(0xffffffff),
      );
      expect(whiteTemp, closeToWithPrecision(-0.5, 3));

      final blackTemp = TemperatureCache.rawTemperature(
        Hct.fromInt(0xff000000),
      );
      expect(blackTemp, closeToWithPrecision(-0.5, 3));
    });

    test("relative temperature", () {
      final blueTemp = TemperatureCache(
        Hct.fromInt(0xff0000ff),
      )._inputRelativeTemperature;
      expect(blueTemp, closeToWithPrecision(0.0, 3));

      final redTemp = TemperatureCache(
        Hct.fromInt(0xffff0000),
      )._inputRelativeTemperature;
      expect(redTemp, closeToWithPrecision(1.0, 3));

      final greenTemp = TemperatureCache(
        Hct.fromInt(0xff00ff00),
      )._inputRelativeTemperature;
      expect(greenTemp, closeToWithPrecision(0.467, 3));

      final whiteTemp = TemperatureCache(
        Hct.fromInt(0xffffffff),
      )._inputRelativeTemperature;
      expect(whiteTemp, closeToWithPrecision(0.5, 3));

      final blackTemp = TemperatureCache(
        Hct.fromInt(0xff000000),
      )._inputRelativeTemperature;
      expect(blackTemp, closeToWithPrecision(0.5, 3));
    });

    test("complement", () {
      final blueComplement = TemperatureCache(
        Hct.fromInt(0xff0000ff),
      ).getComplement().toInt();
      expect(blueComplement, 0xff9d0002);

      final redComplement = TemperatureCache(
        Hct.fromInt(0xffff0000),
      ).getComplement().toInt();
      expect(redComplement, 0xff007bfc);

      final greenComplement = TemperatureCache(
        Hct.fromInt(0xff00ff00),
      ).getComplement().toInt();
      expect(greenComplement, 0xffffd2c9);

      final whiteComplement = TemperatureCache(
        Hct.fromInt(0xffffffff),
      ).getComplement().toInt();
      expect(whiteComplement, 0xffffffff);

      final blackComplement = TemperatureCache(
        Hct.fromInt(0xff000000),
      ).getComplement().toInt();
      expect(blackComplement, 0xff000000);
    });

    test("analogous", () {
      final blueAnalogous = TemperatureCache(
        Hct.fromInt(0xff0000ff),
      ).getAnalogousColors().map((e) => e.toInt()).toList();
      expect(blueAnalogous[0], 0xff00590c);
      expect(blueAnalogous[1], 0xff00564e);
      expect(blueAnalogous[2], 0xff0000ff);
      expect(blueAnalogous[3], 0xff6700cc);
      expect(blueAnalogous[4], 0xff81009f);

      final redAnalogous = TemperatureCache(
        Hct.fromInt(0xffff0000),
      ).getAnalogousColors().map((e) => e.toInt()).toList();
      expect(redAnalogous[0], 0xfff60082);
      expect(redAnalogous[1], 0xfffc004c);
      expect(redAnalogous[2], 0xffff0000);
      expect(redAnalogous[3], 0xffd95500);
      expect(redAnalogous[4], 0xffaf7200);

      final greenAnalogous = TemperatureCache(
        Hct.fromInt(0xff00ff00),
      ).getAnalogousColors().map((e) => e.toInt()).toList();
      expect(greenAnalogous[0], 0xffcee900);
      expect(greenAnalogous[1], 0xff92f500);
      expect(greenAnalogous[2], 0xff00ff00);
      expect(greenAnalogous[3], 0xff00fd6f);
      expect(greenAnalogous[4], 0xff00fab3);

      final blackAnalogous = TemperatureCache(
        Hct.fromInt(0xff000000),
      ).getAnalogousColors().map((e) => e.toInt()).toList();
      expect(blackAnalogous[0], 0xff000000);
      expect(blackAnalogous[1], 0xff000000);
      expect(blackAnalogous[2], 0xff000000);
      expect(blackAnalogous[3], 0xff000000);
      expect(blackAnalogous[4], 0xff000000);

      final whiteAnalogous = TemperatureCache(
        Hct.fromInt(0xffffffff),
      ).getAnalogousColors().map((e) => e.toInt()).toList();
      expect(whiteAnalogous[0], 0xffffffff);
      expect(whiteAnalogous[1], 0xffffffff);
      expect(whiteAnalogous[2], 0xffffffff);
      expect(whiteAnalogous[3], 0xffffffff);
      expect(whiteAnalogous[4], 0xffffffff);
    });
  });
}
