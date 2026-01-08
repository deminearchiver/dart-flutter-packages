import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:csscolorparser/csscolorparser.dart';
import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:named_colors/src/flat_buffers_schema.g.dart' as fb;

import 'utils.dart';

void main(List<String> arguments) async {
  final packageRoot = Directory.current.uri;

  final colorsFile = File.fromUri(
    packageRoot.resolve("src/color.names.rgbonly.txt"),
  );

  final data = _parseNamedColors(colorsFile.openRead());
  final map = await _toMap(data);
  final buffer = _toBinary(map.values);

  final outFile = File.fromUri(
    packageRoot.resolve("assets/named_colors_cache.fb"),
  )..writeAsBytesSync(buffer);
  // await outFile.writeAsBytes(buffer);
}

final splitWhitespaceRegExp = RegExp(r"\s+");

final rgbOnlyRegExpString = r"^(\d{1,3})\s+(\d{1,3})\s+(\d{1,3})\s+(.+)$";
final rgbOnlyRegExp = RegExp(rgbOnlyRegExpString);

typedef _Record1 = ({int argb, String name});
typedef _Record2 = ({int argb, Color color, List<String> names});

_Record1? _tryParseNamedColorRgbOnly(String line) {
  line = line.trim();
  if (line.isEmpty || line.startsWith("#")) {
    return null;
  }
  final match = rgbOnlyRegExp.firstMatch(line);
  if (match == null) return null;
  final red = match.group(1);
  final green = match.group(2);
  final blue = match.group(3);
  final name = match.group(4);
  if (red == null || green == null || blue == null || name == null) {
    return null;
  }
  final r = int.tryParse(red);
  final g = int.tryParse(green);
  final b = int.tryParse(blue);
  if (r == null || g == null || b == null) {
    return null;
  }
  final argb = argbFromComponents(255, r, g, b);
  return (argb: argb, name: name);
}

Future<Map<int, _Record2>> _toMap(Stream<_Record1> data) async {
  final result = <int, _Record2>{};
  await for (final (:argb, :name) in data) {
    result.update(
      argb,
      (value) =>
          (argb: value.argb, color: value.color, names: [...value.names, name]),
      ifAbsent: () => (argb: argb, color: colorFromArgb(argb), names: [name]),
    );
  }
  return result;
}

Stream<_Record1> _parseNamedColors(Stream<List<int>> buffer) => buffer
    .transform(const Utf8Decoder())
    .transform(const LineSplitter())
    .map(_tryParseNamedColorRgbOnly)
    .where((namedColor) => namedColor != null)
    .cast();

Uint8List _toBinary(Iterable<_Record2> data) {
  final builder = fb.Builder();
  final cache = fb.NamedColorsCacheObjectBuilder(
    entries: [
      for (final value in data)
        fb.NamedColorsCacheEntryObjectBuilder(
          argb: value.argb,
          oklab: switch (value.color.toOklaba()) {
            (final l, final a, final b, _) => fb.OklabObjectBuilder(
              l: l,
              a: a,
              b: b,
            ),
          },
          identities: [
            for (final name in value.names)
              fb.NamedColorIdentityObjectBuilder(name: name),
          ],
        ),
    ],
  );
  final cacheOffset = cache.finish(builder);
  builder.finish(cacheOffset);
  return builder.buffer;
}
