import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

@Freezed(fromJson: false, toJson: false)
sealed class SubsetAxisConstraint with _$SubsetAxisConstraint {
  const SubsetAxisConstraint._();

  const factory SubsetAxisConstraint.fixed(String tag, {required double at}) =
      SubsetAxisFixed;

  const factory SubsetAxisConstraint.range(
    String tag, {
    required double from,
    required double to,
    required double defaultValue,
  }) = SubsetAxisRange;

  // factory SubsetAxisConstraint.fromJson(Map<String, Object?> json) =>
  //     _$SubsetAxisConstraintFromJson(json);
}

@Freezed(fromJson: false, toJson: false)
abstract class SubsetOutput with _$SubsetOutput {
  const factory SubsetOutput({
    required Uri asset,
    @Default([]) List<SubsetAxisConstraint> axisConstraints,
  }) = _SubsetOutput;

  // factory SubsetOutput.fromJson(Map<String, Object?> json) =>
  //     _$SubsetOutputFromJson(json);
}

@Freezed(fromJson: false, toJson: false)
abstract class SubsetResult<T extends Object?> with _$SubsetResult<T> {
  const factory SubsetResult({
    required T outputId,
    required SubsetOutput output,
    String? fontFamily,
    @Default([]) List<IconGlyph> iconGlyphs,
  }) = _SubsetResult<T>;

  // factory SubsetResult.fromJson(Map<String, Object?> json) =>
  //     _$SubsetResultFromJson(json);
}

@Freezed(fromJson: false, toJson: false)
abstract class IconGlyph with _$IconGlyph {
  const factory IconGlyph({required int codePoint, String? name}) = _IconGlyph;

  // factory IconGlyph.fromJson(Map<String, Object?> json) =>
  //     _$IconGlyphFromJson(json);
}
