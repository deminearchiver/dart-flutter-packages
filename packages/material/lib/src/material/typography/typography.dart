import 'package:collection/collection.dart';
import 'package:fic/fic.dart';
import 'package:material/src/material/flutter.dart';

part 'text_geometry.dart';
part 'typeface_theme.dart';
part 'typescale_theme.dart';

ImmutableList<String> _mergeFontsInternal(
  ImmutableList<String> fallback,
  ImmutableList<String> other,
) => fallback != other
    ? (other + fallback)
          .removeWhere((element) => element.isEmpty)
          .removeDuplicates()
    : fallback;

ImmutableList<String>? _mergeFontsOrNull(
  ImmutableList<String>? fallback,
  ImmutableList<String>? other,
) {
  if (identical(fallback, other)) return fallback;
  if (fallback == null || fallback.isEmpty) return other;
  if (other == null || other.isEmpty) return fallback;
  return _mergeFontsInternal(fallback, other);
}

ImmutableList<String> _mergeFonts(
  ImmutableList<String> fallback,
  ImmutableList<String>? other,
) {
  if (identical(fallback, other)) return fallback;
  if (other == null || other.isEmpty) return fallback;
  return _mergeFontsInternal(fallback, other);
}
