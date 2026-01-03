// ignore_for_file: invalid_annotation_target

import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libmonet/material_color_utilities.dart';
import 'package:test/test.dart';

part 'snapshot_test.g.dart';
part 'snapshot_test.freezed.dart';

sealed class Color {
  const factory Color.argb(int argb) = _ColorArgb;
  const factory Color.rgba(int r, int g, int b, [int a]) = _ColorRgba;
  const factory Color.hex(String hex) = _ColorHex;
  const factory Color.hct(Hct hct) = _ColorHct;

  int get argb;
  String get hex;
  Hct get hct;

  static (double, bool)? _parsePercentOrFloat(String source) {
    if (source.endsWith("%")) {
      source = source.substring(0, source.length - 1);
      final t = double.tryParse(source);
      if (t != null) {
        return (t / 100.0, true);
      }
    } else {
      final t = double.tryParse(source);
      if (t != null) {
        return (t, false);
      }
    }
    return null;
  }

  static (double, bool)? _parsePercentOr255(String source) {
    if (source.endsWith("%")) {
      source = source.substring(0, source.length - 1);
      final t = double.tryParse(source);
      if (t != null) {
        return (t / 100.0, true);
      }
    } else {
      final t = double.tryParse(source);
      if (t != null) {
        return (t / 255.0, false);
      }
    }
    return null;
  }

  static int? _parseSingleDigit(String digit) {
    final result = int.tryParse(digit, radix: 16);
    if (result == null) return null;
    return (result << 4) | result;
  }

  static Color? _parseHex(String source) {
    final n = source.length;

    if (n == 3 || n == 4) {
      final r = _parseSingleDigit(source[0]);
      final g = _parseSingleDigit(source[1]);
      final b = _parseSingleDigit(source[2]);
      if (r == null || g == null || b == null) return null;
      final a = source.length == 4 ? _parseSingleDigit(source[3]) : null;
      return Color.rgba(r, g, b, a ?? 255);
    } else if (n == 6 || n == 8) {
      final r = int.tryParse(source.substring(0, 2), radix: 16);
      final g = int.tryParse(source.substring(2, 4), radix: 16);
      final b = int.tryParse(source.substring(4, 6), radix: 16);
      if (r == null || g == null || b == null) return null;
      final a = source.length == 8
          ? int.tryParse(source.substring(6, 8), radix: 16)
          : null;
      return Color.rgba(r, g, b, a ?? 255);
    }
    return null;
  }

  static Color? tryParse(String source) {
    // source = source.trim().replaceAll(r"\s", "");
    source = source.trim().toLowerCase();

    if (source == "transparent") {
      return const Color.argb(0x00000000);
    }

    // Hex format
    if (source.startsWith("#")) {
      final hex = source.substring(1);
      return _parseHex(hex);
    }

    // TODO: add rgb / rgba formats here
    final i = source.indexOf("(");
    if (i != -1 && source.endsWith(")")) {
      final fname = source.substring(0, i).trimRight();
      source = source
          .substring(i + 1)
          .replaceAll(",", " ")
          .replaceAll("/", " ");
      final params = source.split(RegExp(r"\s+"));
      final pLen = params.length;

      switch (fname) {
        case "rgb" || "rgba":
          if (pLen != 3 && pLen != 4) {
            return null;
          }
          final r = _parsePercentOr255(params[0]);
          final g = _parsePercentOr255(params[1]);
          final b = _parsePercentOr255(params[2]);
          final a = pLen == 4 ? _parsePercentOrFloat(params[3]) : (1.0, true);
          if ((r, g, b, a) case (
            (final r, final rFormat)?,
            (final g, final gFormat)?,
            (final b, final bFormat)?,
            (final a, _)?,
          )) {
            if (rFormat == gFormat && gFormat == bFormat) {
              // return Color.rgba(r, g, b);
            }
          }
          break;
        default:
          return null;
      }
    }

    // Hex format without prefix "#"
    return _parseHex(source);
  }

  static Color parse(String source) {
    final value = tryParse(source);
    assert(value != null);
    return value!;
  }
}

class _ColorArgb implements Color {
  const _ColorArgb(this.argb);

  @override
  final int argb;

  @override
  String get hex => StringUtils.hexFromArgb(argb, leadingHashSign: false);

  @override
  Hct get hct => Hct.fromInt(argb);

  @override
  String toString() => "Color.argb(0x${argb.toRadixString(16)})";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorArgb &&
          argb == other.argb;

  @override
  int get hashCode => Object.hash(runtimeType, argb);
}

class _ColorRgba implements Color {
  const _ColorRgba(this.red, this.green, this.blue, [this.alpha = 255]);

  final int red;
  final int green;
  final int blue;
  final int alpha;

  @override
  int get argb =>
      (alpha << 24) | ((red & 255) << 16) | ((green & 255) << 8) | (blue & 255);

  @override
  String get hex => StringUtils.hexFromArgb(argb, leadingHashSign: false);

  @override
  Hct get hct => Hct.fromInt(argb);

  @override
  String toString() => "Color.rgba($red, $green, $blue, $alpha)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorRgba &&
          red == other.red &&
          green == other.green &&
          blue == other.blue &&
          alpha == other.alpha;

  @override
  int get hashCode => Object.hash(runtimeType, red, green, blue, alpha);
}

class _ColorHex implements Color {
  const _ColorHex(this.hex);

  @override
  int get argb {
    final argb = StringUtils.argbFromHex(hex);
    assert(argb != null);
    return argb!;
  }

  @override
  final String hex;

  @override
  Hct get hct => Hct.fromInt(argb);

  @override
  String toString() => "Color.hex(#$hex)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorHex &&
          hex == other.hex;

  @override
  int get hashCode => Object.hash(runtimeType, hex);
}

class _ColorHct implements Color {
  const _ColorHct(this.hct);

  @override
  int get argb => hct.toInt();

  @override
  String get hex => StringUtils.hexFromArgb(argb, leadingHashSign: false);

  @override
  final Hct hct;

  @override
  String toString() =>
      "Color.hct(${hct.hue.round()}, ${hct.chroma.round()}, ${hct.tone.round()})";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorHct &&
          hct == other.hct;

  @override
  int get hashCode => Object.hash(runtimeType, hct);
}

@freezed
abstract class SnapshotScheme with _$SnapshotScheme {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SnapshotScheme({
    required SnapshotSchemeProperties properties,
    @ColorConverter() @Default({}) Map<String, Color> materialDynamicColors,
    @ColorConverter() @Default({}) Map<String, Color> androidOnlyDynamicColors,
  }) = _SnapshotScheme;

  factory SnapshotScheme.fromJson(Map<String, Object?> json) =>
      _$SnapshotSchemeFromJson(json);
}

@freezed
abstract class SnapshotSchemeProperties with _$SnapshotSchemeProperties {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SnapshotSchemeProperties({
    String? fallbackConstructorName,
    @ColorConverter() required Color sourceColor,
    required bool isDark,
    required double contrastLevel,
    @VariantConverter() required Variant variant,
    @SpecVersionConverter() required SpecVersion specVersion,
    @PlatformConverter() required Platform platform,
  }) = _SnapshotSchemeProperties;

  factory SnapshotSchemeProperties.fromJson(Map<String, Object?> json) =>
      _$SnapshotSchemePropertiesFromJson(json);
}

class VariantConverter extends JsonConverter<Variant, String> {
  const VariantConverter({this.defaultValue});

  final Variant? defaultValue;

  @override
  Variant fromJson(String json) => switch (json.toLowerCase()) {
    "monochrome" => .monochrome,
    "neutral" => .neutral,
    "tonal_spot" => .tonalSpot,
    "vibrant" => .vibrant,
    "expressive" => .expressive,
    "fidelity" => .fidelity,
    "content" => .content,
    "rainbow" => .rainbow,
    "fruit_salad" => .fruitSalad,
    _ when defaultValue != null => defaultValue!,
    _ => throw ArgumentError.value(json),
  };

  @override
  String toJson(Variant object) => switch (object) {
    .monochrome => "monochrome",
    .neutral => "neutral",
    .tonalSpot => "tonal_spot",
    .vibrant => "vibrant",
    .expressive => "expressive",
    .fidelity => "fidelity",
    .content => "content",
    .rainbow => "rainbow",
    .fruitSalad => "fruit_salad",
  };
}

class SpecVersionConverter extends JsonConverter<SpecVersion, String> {
  const SpecVersionConverter({this.defaultValue});

  final SpecVersion? defaultValue;

  @override
  SpecVersion fromJson(String json) => switch (json.toLowerCase()) {
    "spec_2021" => .spec2021,
    "spec_2025" => .spec2025,
    _ when defaultValue != null => defaultValue!,
    _ => throw ArgumentError.value(json),
  };

  @override
  String toJson(SpecVersion object) => switch (object) {
    .spec2021 => "spec_2021",
    .spec2025 => "spec_2025",
  };
}

class PlatformConverter extends JsonConverter<Platform, String> {
  const PlatformConverter({this.defaultValue});

  final Platform? defaultValue;

  @override
  Platform fromJson(String json) => switch (json.toLowerCase()) {
    "phone" => .phone,
    "watch" => .watch,
    _ when defaultValue != null => defaultValue!,
    _ => throw ArgumentError.value(json),
  };

  @override
  String toJson(Platform object) => switch (object) {
    .phone => "phone",
    .watch => "watch",
  };
}

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    return Color.parse(json);
  }

  @override
  String toJson(Color object) {
    return "#${object.hex}";
  }
}

class ColorMapConverter
    implements JsonConverter<Map<Object?, Color>, Map<Object?, String>> {
  const ColorMapConverter();

  @override
  Map<Object?, Color> fromJson(Map<Object?, String> json) => Map.fromEntries(
    json.entries
        .map((e) => MapEntry(e.key, Color.tryParse(e.value)))
        .where((element) => element.value != null)
        .cast<MapEntry<Object?, Color>>(),
  );

  @override
  Map<Object?, String> toJson(Map<Object?, Color> object) =>
      object.map((key, value) => MapEntry(key, "#${value.hex}"));
}

void main() {
  // Implementation priority: high
  test(
    "matches java snapshot",
    () => _expectMatchesSnapshot("./test/snapshots/java.json"),
  );

  // TODO: generate kotlin snapshot and enable the following test
  // Implementation priority: medium
  // test(
  //   "matches kotlin snapshot",
  //   () => _expectMatchesSnapshot("./test/snapshots/kotlin.json"),
  // );

  // Implementation priority: low
  // TODO: generate typescript snapshot and enable the following test
  // test(
  //   "matches kotlin snapshot",
  //   () => _expectMatchesSnapshot("./test/snapshots/kotlin.json"),
  // );
}

void _expectMatchesSnapshot(String snapshotFilePath) {
  final dynamicColorsMap = Map<String, DynamicColor>.fromEntries(
    const MaterialDynamicColors().allDynamicColors.map((callback) {
      final dynamicColor = callback();
      return MapEntry(dynamicColor.name, dynamicColor);
    }),
  );

  // Data loading
  final file = File(snapshotFilePath);
  expect(file.existsSync(), isTrue);
  final text = file.readAsStringSync();

  // JSON validation
  final Object? decodedJson = jsonDecode(text);
  final validJson = _tryValidateSnapshots(decodedJson);

  // JSON parsing
  final snapshots = _tryParseSnapshots(validJson);

  for (final snapshot in snapshots) {
    final scheme = DynamicScheme.fromPalettesOrKeyColors(
      isDark: snapshot.properties.isDark,
      sourceColorHct: snapshot.properties.sourceColor.hct,
      contrastLevel: snapshot.properties.contrastLevel,
      variant: snapshot.properties.variant,
      platform: snapshot.properties.platform,
      specVersion: snapshot.properties.specVersion,
    );

    final snapshotColors = {
      ...snapshot.materialDynamicColors,
      ...snapshot.androidOnlyDynamicColors,
    };

    final dynamicColorsMapCopy = Map.of(dynamicColorsMap);
    for (final MapEntry(key: name, value: snapshotColor)
        in snapshotColors.entries) {
      final dynamicColor = dynamicColorsMapCopy.remove(name);
      expect(dynamicColor, isNotNull);
      if (dynamicColor != null) {
        final generatedColor = Color.argb(scheme.getArgb(dynamicColor));
        expect(
          generatedColor.argb,
          snapshotColor.argb,
          reason:
              "snapshot: ${snapshot.properties}\nscheme: $scheme\ncolor: $name",
        );
      }
    }
    expect(dynamicColorsMapCopy, isEmpty);
  }
}

List<Map<String, Object?>> _tryValidateSnapshots(Object? json) {
  if (json is List<Object?>) {
    return json
        .where(
          (e) =>
              e is Map<Object?, Object?> &&
              e.keys.every((key) => key != null && key is String),
        )
        .toList()
        .cast<Map<String, Object?>>();
  }
  if (json is Map<Object?, Object> &&
      json.keys.every((key) => key != null && key is String)) {
    return [json.cast<String, Object?>()];
  }
  return [];
}

List<SnapshotScheme> _tryParseSnapshots(List<Map<String, Object?>> json) {
  return json
      .map((e) {
        try {
          return SnapshotScheme.fromJson(e);
        } on Object {
          return null;
        }
      })
      .nonNulls
      .toList();
}
