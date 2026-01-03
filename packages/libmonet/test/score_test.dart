import 'package:libmonet/material_color_utilities.dart';
import 'package:test/test.dart';

void main() {
  group("scoring", () {
    test("prioritizes chroma", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff000000] = 1;
      colorsToPopulation[0xffffffff] = 1;
      colorsToPopulation[0xff0000ff] = 1;

      final ranked = Score.score(colorsToPopulation, 4);

      expect(ranked.length, 1);
      expect(ranked[0], 0xff0000ff);
    });

    test("prioritizes chroma when proportions equal", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xffff0000] = 1;
      colorsToPopulation[0xff00ff00] = 1;
      colorsToPopulation[0xff0000ff] = 1;

      final ranked = Score.score(colorsToPopulation, 4);

      expect(ranked.length, 3);
      expect(ranked[0], 0xffff0000);
      expect(ranked[1], 0xff00ff00);
      expect(ranked[2], 0xff0000ff);
    });

    test("generates gBlue when no colors available", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff000000] = 1;

      final ranked = Score.score(colorsToPopulation, 4);

      expect(ranked.length, 1);
      expect(ranked[0], 0xff4285f4);
    });

    test("dedupes nearby hues", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff008772] = 1; // H 180 C 42 T 0
      colorsToPopulation[0xff318477] = 1; // H 184 C 35 T 0

      final ranked = Score.score(colorsToPopulation, 4);

      expect(ranked.length, 1);
      expect(ranked[0], 0xff008772);
    });

    test("maximizes hue distance", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff008772] = 1; // H 180 C 42 T 0
      colorsToPopulation[0xff008587] = 1; // H 198 C 50 T 0
      colorsToPopulation[0xff007ebc] = 1; // H 245 C 50 T 0

      final ranked = Score.score(colorsToPopulation, 2);

      expect(ranked.length, 2);
      expect(ranked[0], 0xff007ebc);
      expect(ranked[1], 0xff008772);
    });

    test("passes generated scenario one", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff7ea16d] = 67;
      colorsToPopulation[0xffd8ccae] = 67;
      colorsToPopulation[0xff835c0d] = 49;

      final ranked = Score.score(colorsToPopulation, 3, 0xff8d3819, false);

      expect(ranked.length, 3);
      expect(ranked[0], 0xff7ea16d);
      expect(ranked[1], 0xffd8ccae);
      expect(ranked[2], 0xff835c0d);
    });

    test("passes generated scenario two", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xffd33881] = 14;
      colorsToPopulation[0xff3205cc] = 77;
      colorsToPopulation[0xff0b48cf] = 36;
      colorsToPopulation[0xffa08f5d] = 81;

      final ranked = Score.score(colorsToPopulation, 4, 0xff7d772b, true);

      expect(ranked.length, 3);
      expect(ranked[0], 0xff3205cc);
      expect(ranked[1], 0xffa08f5d);
      expect(ranked[2], 0xffd33881);
    });

    test("passes generated scenario three", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xffbe94a6] = 23;
      colorsToPopulation[0xffc33fd7] = 42;
      colorsToPopulation[0xff899f36] = 90;
      colorsToPopulation[0xff94c574] = 82;

      final ranked = Score.score(colorsToPopulation, 3, 0xffaa79a4, true);

      expect(ranked.length, 3);
      expect(ranked[0], 0xff94c574);
      expect(ranked[1], 0xffc33fd7);
      expect(ranked[2], 0xffbe94a6);
    });

    test("passes generated scenario four", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xffdf241c] = 85;
      colorsToPopulation[0xff685859] = 44;
      colorsToPopulation[0xffd06d5f] = 34;
      colorsToPopulation[0xff561c54] = 27;
      colorsToPopulation[0xff713090] = 88;

      final ranked = Score.score(colorsToPopulation, 5, 0xff58c19c, false);

      expect(ranked.length, 2);
      expect(ranked[0], 0xffdf241c);
      expect(ranked[1], 0xff561c54);
    });

    test("passes generated scenario five", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xffbe66f8] = 41;
      colorsToPopulation[0xff4bbda9] = 88;
      colorsToPopulation[0xff80f6f9] = 44;
      colorsToPopulation[0xffab8017] = 43;
      colorsToPopulation[0xffe89307] = 65;

      final ranked = Score.score(colorsToPopulation, 3, 0xff916691, false);

      expect(ranked.length, 3);
      expect(ranked[0], 0xffab8017);
      expect(ranked[1], 0xff4bbda9);
      expect(ranked[2], 0xffbe66f8);
    });

    test("passes generated scenario six", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff18ea8f] = 93;
      colorsToPopulation[0xff327593] = 18;
      colorsToPopulation[0xff066a18] = 53;
      colorsToPopulation[0xfffa8a23] = 74;
      colorsToPopulation[0xff04ca1f] = 62;

      final ranked = Score.score(colorsToPopulation, 2, 0xff4c377a, false);

      expect(ranked.length, 2);
      expect(ranked[0], 0xff18ea8f);
      expect(ranked[1], 0xfffa8a23);
    });

    test("passes generated scenario seven", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff2e05ed] = 23;
      colorsToPopulation[0xff153e55] = 90;
      colorsToPopulation[0xff9ab220] = 23;
      colorsToPopulation[0xff153379] = 66;
      colorsToPopulation[0xff68bcc3] = 81;

      final ranked = Score.score(colorsToPopulation, 2, 0xfff588dc, true);

      expect(ranked.length, 2);
      expect(ranked[0], 0xff2e05ed);
      expect(ranked[1], 0xff9ab220);
    });

    test("passes generated scenario eight", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff816ec5] = 24;
      colorsToPopulation[0xff6dcb94] = 19;
      colorsToPopulation[0xff3cae91] = 98;
      colorsToPopulation[0xff5b542f] = 25;

      final ranked = Score.score(colorsToPopulation, 1, 0xff84b0fd, false);

      expect(ranked.length, 1);
      expect(ranked[0], 0xff3cae91);
    });

    test("passes generated scenario nine", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff206f86] = 52;
      colorsToPopulation[0xff4a620d] = 96;
      colorsToPopulation[0xfff51401] = 85;
      colorsToPopulation[0xff2b8ebf] = 3;
      colorsToPopulation[0xff277766] = 59;

      final ranked = Score.score(colorsToPopulation, 3, 0xff02b415, true);

      expect(ranked.length, 3);
      expect(ranked[0], 0xfff51401);
      expect(ranked[1], 0xff4a620d);
      expect(ranked[2], 0xff2b8ebf);
    });

    test("passes generated scenario ten", () {
      final colorsToPopulation = <int, int>{};
      colorsToPopulation[0xff8b1d99] = 54;
      colorsToPopulation[0xff27effe] = 43;
      colorsToPopulation[0xff6f558d] = 2;
      colorsToPopulation[0xff77fdf2] = 78;

      final ranked = Score.score(colorsToPopulation, 4, 0xff5e7a10, true);

      expect(ranked.length, 3);
      expect(ranked[0], 0xff27effe);
      expect(ranked[1], 0xff8b1d99);
      expect(ranked[2], 0xff6f558d);
    });
  });
}
