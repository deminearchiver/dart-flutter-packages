import 'package:test/test.dart';
import 'package:libmonet/material_color_utilities.dart';

import 'test_utils.dart';

const red = 0xffff0000;
const green = 0xff00ff00;
const blue = 0xff0000ff;
const white = 0xffffffff;
const black = 0xff000000;

void main() {
  group("CAM to ARGB", () {
    test("red", () {
      final cam = Cam16.fromInt(red);
      expect(cam.hue, closeToWithPrecision(27.408, 3));
      expect(cam.chroma, closeToWithPrecision(113.358, 3));
      expect(cam.j, closeToWithPrecision(46.445, 3));
      expect(cam.m, closeToWithPrecision(89.494, 3));
      expect(cam.s, closeToWithPrecision(91.890, 3));
      expect(cam.q, closeToWithPrecision(105.989, 3));
    });

    test("green", () {
      final cam = Cam16.fromInt(green);
      expect(cam.hue, closeToWithPrecision(142.140, 3));
      expect(cam.chroma, closeToWithPrecision(108.410, 3));
      expect(cam.j, closeToWithPrecision(79.332, 3));
      expect(cam.m, closeToWithPrecision(85.588, 3));
      expect(cam.s, closeToWithPrecision(78.605, 3));
      expect(cam.q, closeToWithPrecision(138.520, 3));
    });

    test("blue", () {
      final cam = Cam16.fromInt(blue);
      expect(cam.hue, closeToWithPrecision(282.788, 3));
      expect(cam.chroma, closeToWithPrecision(87.231, 3));
      expect(cam.j, closeToWithPrecision(25.466, 3));
      expect(cam.m, closeToWithPrecision(68.867, 3));
      expect(cam.s, closeToWithPrecision(93.675, 3));
      expect(cam.q, closeToWithPrecision(78.481, 3));
    });

    test("white", () {
      final cam = Cam16.fromInt(white);
      expect(cam.hue, closeToWithPrecision(209.492, 3));
      expect(cam.chroma, closeToWithPrecision(2.869, 3));
      expect(cam.j, closeToWithPrecision(100.0, 3));
      expect(cam.m, closeToWithPrecision(2.265, 3));
      expect(cam.s, closeToWithPrecision(12.068, 3));
      expect(cam.q, closeToWithPrecision(155.521, 3));
    });

    test("black", () {
      final cam = Cam16.fromInt(black);
      expect(cam.hue, closeToWithPrecision(0.0, 3));
      expect(cam.chroma, closeToWithPrecision(0.0, 3));
      expect(cam.j, closeToWithPrecision(0.0, 3));
      expect(cam.m, closeToWithPrecision(0.0, 3));
      expect(cam.s, closeToWithPrecision(0.0, 3));
      expect(cam.q, closeToWithPrecision(0.0, 3));
    });
  });

  group("CAM to ARGB to CAM", () {
    test("red", () {
      final cam = Cam16.fromInt(red);
      final argb = cam.toInt();
      expect(argb, red);
    });

    test("green", () {
      final cam = Cam16.fromInt(green);
      final argb = cam.toInt();
      expect(argb, green);
    });

    test("blue", () {
      final cam = Cam16.fromInt(blue);
      final argb = cam.toInt();
      expect(argb, blue);
    });
  });

  group("ARGB to HCT", () {
    test("green", () {
      final hct = Hct.fromInt(green);
      expect(hct.hue, closeToWithPrecision(142.139, 2));
      expect(hct.chroma, closeToWithPrecision(108.410, 2));
      expect(hct.tone, closeToWithPrecision(87.737, 2));
    });

    test("blue", () {
      final hct = Hct.fromInt(blue);
      expect(hct.hue, closeToWithPrecision(282.788, 2));
      expect(hct.chroma, closeToWithPrecision(87.230, 2));
      expect(hct.tone, closeToWithPrecision(32.302, 2));
    });

    test("blue tone 90", () {
      final hct = Hct.from(282.788, 87.230, 90.0);
      expect(hct.hue, closeToWithPrecision(282.239, 2));
      expect(hct.chroma, closeToWithPrecision(19.144, 2));
      expect(hct.tone, closeToWithPrecision(90.035, 2));
    });
  });

  group("viewing conditions", () {
    test("default", () {
      final vc = ViewingConditions.standard;
      expect(vc.n, closeToWithPrecision(0.184, 3));
      expect(vc.aw, closeToWithPrecision(29.981, 3));
      expect(vc.nbb, closeToWithPrecision(1.017, 3));
      expect(vc.ncb, closeToWithPrecision(1.017, 3));
      expect(vc.c, closeToWithPrecision(0.69, 3));
      expect(vc.nc, closeToWithPrecision(1.0, 3));
      expect(vc.rgbD[0], closeToWithPrecision(1.021, 3));
      expect(vc.rgbD[1], closeToWithPrecision(0.986, 3));
      expect(vc.rgbD[2], closeToWithPrecision(0.934, 3));
      expect(vc.fl, closeToWithPrecision(0.388, 3));
      expect(vc.flRoot, closeToWithPrecision(0.789, 3));
      expect(vc.z, closeToWithPrecision(1.909, 3));
    });
  });

  group("CamSolver", () {
    test("returns a sufficiently close color", () {
      for (var hue = 15.0; hue < 360.0; hue += 30.0) {
        for (var chroma = 0.0; chroma <= 100.0; chroma += 10.0) {
          for (var tone = 20.0; tone <= 80.0; tone += 10.0) {
            final hctColor = Hct.from(hue, chroma, tone);

            if (chroma > 0.0) {
              expect((hctColor.hue - hue).abs(), lessThanOrEqualTo(4.0));
            }

            expect(hctColor.chroma, greaterThanOrEqualTo(0.0));
            expect(hctColor.chroma, lessThanOrEqualTo(chroma + 2.5));

            if (hctColor.chroma < chroma - 2.5) {
              expect(colorIsOnBoundary(hctColor.toInt()), isTrue);
            }

            expect((hctColor.tone - tone).abs(), lessThanOrEqualTo(0.5));
          }
        }
      }
    });
  });
}

bool colorIsOnBoundary(int argb) =>
    ColorUtils.redFromArgb(argb) == 0 ||
    ColorUtils.redFromArgb(argb) == 255 ||
    ColorUtils.greenFromArgb(argb) == 0 ||
    ColorUtils.greenFromArgb(argb) == 255 ||
    ColorUtils.blueFromArgb(argb) == 0 ||
    ColorUtils.blueFromArgb(argb) == 255;
