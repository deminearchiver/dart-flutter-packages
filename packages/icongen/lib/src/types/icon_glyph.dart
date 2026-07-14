import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_glyph.freezed.dart';
part 'icon_glyph.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class IconGlyph with _$IconGlyph {
  const factory IconGlyph({required int codePoint, String? name}) = _IconGlyph;

  factory IconGlyph.fromJson(Map<String, Object?> json) =>
      _$IconGlyphFromJson(json);
}
