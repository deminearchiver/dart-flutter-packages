import 'package:libmonet/material_color_utilities.dart';
import 'package:test/test.dart';

void main() {
  group("TonalPalette", () {
    test("ofBlue", () {
      final blue = TonalPalette.fromInt(0xff0000ff);
      expect(blue.tone(100), 0xffffffff);
      expect(blue.tone(95), 0xfff1efff);
      expect(blue.tone(90), 0xffe0e0ff);
      expect(blue.tone(80), 0xffbec2ff);
      expect(blue.tone(70), 0xff9da3ff);
      expect(blue.tone(60), 0xff7c84ff);
      expect(blue.tone(50), 0xff5a64ff);
      expect(blue.tone(40), 0xff343dff);
      expect(blue.tone(30), 0xff0000ef);
      expect(blue.tone(20), 0xff0001ac);
      expect(blue.tone(10), 0xff00006e);
      expect(blue.tone(0), 0xff000000);
    });
  });

  // group("CorePalette", () {
  //   test("ofBlue", () {
  //     final core = CorePalette.of(0xff0000ff);

  //     expect(core.a1.tone(100), 0xffffffff);
  //     expect(core.a1.tone(95), 0xfff1efff);
  //     expect(core.a1.tone(90), 0xffe0e0ff);
  //     expect(core.a1.tone(80), 0xffbec2ff);
  //     expect(core.a1.tone(70), 0xff9da3ff);
  //     expect(core.a1.tone(60), 0xff7c84ff);
  //     expect(core.a1.tone(50), 0xff5a64ff);
  //     expect(core.a1.tone(40), 0xff343dff);
  //     expect(core.a1.tone(30), 0xff0000ef);
  //     expect(core.a1.tone(20), 0xff0001ac);
  //     expect(core.a1.tone(10), 0xff00006e);
  //     expect(core.a1.tone(0), 0xff000000);

  //     expect(core.a2.tone(100), 0xffffffff);
  //     expect(core.a2.tone(95), 0xfff1efff);
  //     expect(core.a2.tone(90), 0xffe1e0f9);
  //     expect(core.a2.tone(80), 0xffc5c4dd);
  //     expect(core.a2.tone(70), 0xffa9a9c1);
  //     expect(core.a2.tone(60), 0xff8f8fa6);
  //     expect(core.a2.tone(50), 0xff75758b);
  //     expect(core.a2.tone(40), 0xff5c5d72);
  //     expect(core.a2.tone(30), 0xff444559);
  //     expect(core.a2.tone(20), 0xff2e2f42);
  //     expect(core.a2.tone(10), 0xff191a2c);
  //     expect(core.a2.tone(0), 0xff000000);
  //   });

  //   test("contentOfBlue", () {
  //     final core = CorePalette.contentOf(0xff0000ff);

  //     expect(core.a1.tone(100), 0xffffffff);
  //     expect(core.a1.tone(95), 0xfff1efff);
  //     expect(core.a1.tone(90), 0xffe0e0ff);
  //     expect(core.a1.tone(80), 0xffbec2ff);
  //     expect(core.a1.tone(70), 0xff9da3ff);
  //     expect(core.a1.tone(60), 0xff7c84ff);
  //     expect(core.a1.tone(50), 0xff5a64ff);
  //     expect(core.a1.tone(40), 0xff343dff);
  //     expect(core.a1.tone(30), 0xff0000ef);
  //     expect(core.a1.tone(20), 0xff0001ac);
  //     expect(core.a1.tone(10), 0xff00006e);
  //     expect(core.a1.tone(0), 0xff000000);

  //     expect(core.a2.tone(100), 0xffffffff);
  //     expect(core.a2.tone(95), 0xfff1efff);
  //     expect(core.a2.tone(90), 0xffe0e0ff);
  //     expect(core.a2.tone(80), 0xffc1c3f4);
  //     expect(core.a2.tone(70), 0xffa5a7d7);
  //     expect(core.a2.tone(60), 0xff8b8dbb);
  //     expect(core.a2.tone(50), 0xff7173a0);
  //     expect(core.a2.tone(40), 0xff585b86);
  //     expect(core.a2.tone(30), 0xff40436d);
  //     expect(core.a2.tone(20), 0xff2a2d55);
  //     expect(core.a2.tone(10), 0xff14173f);
  //     expect(core.a2.tone(0), 0xff000000);
  //   });
  // });

  group("KeyColor", () {
    test("Key color with exact chroma", () {
      // Requested chroma is exactly achievable at a certain tone.
      final palette = TonalPalette.fromHueAndChroma(50.0, 60.0);
      final result = palette.keyColor;

      final hueDifference = (result.hue - 50.0).abs();
      expect(hueDifference, lessThan(10.0));
      final chromaDifference = (result.chroma - 60.0).abs();
      expect(chromaDifference, lessThan(0.5));
      // Tone might vary, but should be within the range from 0 to 100.
      expect(result.tone, greaterThan(0));
      expect(result.tone, lessThan(100));
    });

    test("key color with unusually high chroma", () {
      // Requested chroma is above what is achievable. For Hue 149, chroma peak
      // is 89.6 at Tone 87.9. The result key color"s chroma should be close to
      // the chroma peak.
      final palette = TonalPalette.fromHueAndChroma(149.0, 200.0);
      final result = palette.keyColor;

      final hueDifference = (result.hue - 149.0).abs();
      expect(hueDifference, lessThan(10.0));
      expect(result.chroma, greaterThan(89.0));
      // Tone might vary, but should be within the range from 0 to 100.
      expect(result.tone, greaterThan(0));
      expect(result.tone, lessThan(100));
    });

    test("key color with unusually low chroma", () {
      // By definition, the key color should be the first tone, starting from
      // Tone 50, matching the given hue and chroma. When requesting a very low
      // chroma, the result should be close to Tone 50, since most tones can
      // produce a low chroma.
      final palette = TonalPalette.fromHueAndChroma(50.0, 3.0);
      final result = palette.keyColor;

      final hueDifference = (result.hue - 50.0).abs();
      expect(hueDifference, lessThan(10.0));
      final chromaDifference = (result.chroma - 3.0).abs();
      expect(chromaDifference, lessThan(0.5));
      final toneDifference = (result.tone - 50.0).abs();
      expect(toneDifference, lessThan(0.5));
    });
  });
}
