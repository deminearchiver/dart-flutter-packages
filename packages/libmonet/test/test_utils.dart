import 'dart:math' as math;

import 'package:test/test.dart';

// ignore: depend_on_referenced_packages
import 'package:matcher/src/feature_matcher.dart';

Matcher closeToWithPrecision(num? value, [num precision = 2]) =>
    _IsCloseToWithPrecision(value, precision);

class _IsCloseToWithPrecision extends FeatureMatcher<num?> {
  const _IsCloseToWithPrecision(this._expected, this._precision);

  final num? _expected;
  final num _precision;

  @override
  bool typedMatches(num? item, Map<Object?, Object?> matchState) {
    final expected = _expected;

    if (expected == null || item == null) {
      return expected == item;
    }

    if (expected.isInfinite) {
      return expected == item;
    }

    final pow = math.pow(10, _precision + 1);
    final delta = (expected - item).abs();
    final maxDelta = math.pow(10, -_precision) / 2;
    return (delta * pow).round() <= maxDelta * pow;
  }

  @override
  Description describe(Description description) => description
      .add("a numeric value within ")
      .addDescriptionOf(_precision)
      .add(" of ")
      .addDescriptionOf(_expected);

  @override
  Description describeTypedMismatch(
    num? item,
    Description mismatchDescription,
    Map<Object?, Object?> matchState,
    bool verbose,
  ) {
    final expected = _expected;
    if (expected == null || item == null) {
      return mismatchDescription;
    }
    var diff = item - expected;
    if (diff < 0) diff = -diff;
    return mismatchDescription.add(" differs by ").addDescriptionOf(diff);
  }
}
