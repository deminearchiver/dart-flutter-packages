import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

part 'text_geometry.dart';
part 'typeface_theme.dart';
part 'typescale_theme.dart';

List<String> _mergeFontsInternal(List<String> fallback, List<String> other) {
  // final fallbackSize = fallback.length;
  // final otherSize = other.length;
  // final maxSize = fallbackSize + otherSize;
  // final seen = HashSet<String>();
  // final result = List<String>.filled(maxSize, "");
  // var resultSize = 0;
  // for (var i = 0; i < otherSize; i++) {
  //   final value = other[i];
  //   if (seen.add(value)) result[resultSize++] = value;
  // }
  // for (var i = 0; i < fallbackSize; i++) {
  //   final value = fallback[i];
  //   if (seen.add(value)) result[resultSize++] = value;
  // }
  // return resultSize == maxSize ? result : result.sublist(0, resultSize);
  final result = <String>{};
  for (final value in other) {
    if (value.isNotEmpty) result.add(value);
  }
  for (final value in fallback) {
    if (value.isNotEmpty) result.add(value);
  }
  return result.toList(growable: false);
}

List<String>? _mergeFontsOrNull(List<String>? fallback, List<String>? other) {
  if (identical(fallback, other)) return fallback;
  if (fallback == null || fallback.isEmpty) return other;
  if (other == null || other.isEmpty) return fallback;
  if (const ListEquality<String>().equals(fallback, other)) return fallback;
  return _mergeFontsInternal(fallback, other);
}

List<String> _mergeFonts(List<String> fallback, List<String>? other) {
  if (identical(fallback, other)) return fallback;
  if (other == null || other.isEmpty) return fallback;
  if (const ListEquality<String>().equals(fallback, other)) return fallback;
  return _mergeFontsInternal(fallback, other);
}
