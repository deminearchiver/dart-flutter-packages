import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

// TODO: move to measurement when complete

// TODO: probably should add Set<Breakpoint> to MeasurementThemeData(/Partial)

Set<Breakpoint> _createBreakpointSet(
  List<double> widthBreakpoints,
  List<double> heightBreakpoints,
) => UnmodifiableSetView({
  for (var i = 0; i < widthBreakpoints.length; i++)
    for (var j = 0; j < heightBreakpoints.length; j++)
      .fromDimensions(widthBreakpoints[i], heightBreakpoints[j]),
});

// TODO: consider making non-final (don't forget to compare runtimeType)

// TODO: consider adopting Corner API design = remove props and make abstract

final class Breakpoint {
  const Breakpoint({this.minWidth = 0.0, this.minHeight = 0.0});

  const Breakpoint.fromDimensions(this.minWidth, this.minHeight)
    : assert(minWidth >= 0.0, "Minimum width must be non-negative."),
      assert(minHeight >= 0.0, "Minimum height must be non-negative.");

  Breakpoint.fromSize(Size size) : this.fromDimensions(size.width, size.height);

  /// Lower bound for the width of the breakpoint.
  final double minWidth;

  /// Lower bound for the height of the breakpoint.
  final double minHeight;

  bool isAtLeastWidth(double widthBreakpoint) => minWidth >= widthBreakpoint;

  bool isAtLeastHeight(double heightBreakpoint) =>
      minHeight >= heightBreakpoint;

  bool isAtLeastDimensions(double widthBreakpoint, double heightBreakpoint) =>
      isAtLeastWidth(widthBreakpoint) && isAtLeastHeight(heightBreakpoint);

  bool isAtLeastSize(Size sizeBreakpoint) =>
      isAtLeastDimensions(sizeBreakpoint.width, sizeBreakpoint.height);

  @override
  String toString() =>
      "Breakpoint("
      "minWidth: ${minWidth.toStringAsFixed(1)}, "
      "minHeight: ${minHeight.toStringAsFixed(1)}"
      ")";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Breakpoint &&
          minWidth == other.minWidth &&
          minHeight == other.minHeight;

  @override
  int get hashCode => Object.hash(minWidth, minHeight);

  static const widthMediumLowerBound = 600.0;

  static const widthExpandedLowerBound = 840.0;

  static const widthLargeLowerBound = 1200.0;

  static const widthExtraLargeLowerBound = 1600.0;

  static const heightMediumLowerBound = 480.0;

  static const heightExpandedLowerBound = 900.0;

  static const _defaultWidthBreakpoints = <double>[
    0.0,
    widthMediumLowerBound,
    widthExpandedLowerBound,
    widthLargeLowerBound,
    widthExtraLargeLowerBound,
  ];

  static const _defaultHeightBreakpoints = <double>[
    0.0,
    heightMediumLowerBound,
    heightExpandedLowerBound,
  ];

  static final defaultBreakpoints = _createBreakpointSet(
    _defaultWidthBreakpoints,
    _defaultHeightBreakpoints,
  );
}

abstract class BreakpointSelector {
  const BreakpointSelector();

  const factory BreakpointSelector.preferWidth() =
      _BreakpointSelectorPreferWidth;

  const factory BreakpointSelector.preferHeight() =
      _BreakpointSelectorPreferHeight;

  Breakpoint fromDimensions(
    Iterable<Breakpoint> breakpoints,
    double width,
    double height,
  );

  Breakpoint fromSize(Iterable<Breakpoint> breakpoints, Size size) =>
      fromDimensions(breakpoints, size.width, size.height);

  Breakpoint? maybeOf(Iterable<Breakpoint> breakpoints, BuildContext context) {
    final size = MediaQuery.maybeSizeOf(context);
    return size != null ? fromSize(breakpoints, size) : null;
  }

  Breakpoint of(Iterable<Breakpoint> breakpoints, BuildContext context) =>
      fromSize(breakpoints, MediaQuery.sizeOf(context));
}

final class _BreakpointSelectorPreferWidth extends BreakpointSelector {
  const _BreakpointSelectorPreferWidth();

  @override
  Breakpoint fromDimensions(
    Iterable<Breakpoint> breakpoints,
    double width,
    double height,
  ) {
    var maxWidth = 0.0;
    for (final bucket in breakpoints) {
      if (bucket.minWidth <= width && bucket.minWidth > maxWidth) {
        maxWidth = bucket.minWidth;
      }
    }
    var match = const Breakpoint();
    for (final bucket in breakpoints) {
      if (bucket.minWidth == maxWidth &&
          bucket.minHeight <= height &&
          bucket.minHeight >= match.minHeight) {
        match = bucket;
      }
    }
    return match;
  }

  @override
  String toString() => "BreakpointSelector.preferWidth()";
}

final class _BreakpointSelectorPreferHeight extends BreakpointSelector {
  const _BreakpointSelectorPreferHeight();

  @override
  Breakpoint fromDimensions(
    Iterable<Breakpoint> breakpoints,
    double width,
    double height,
  ) {
    var maxHeight = 0.0;
    for (final bucket in breakpoints) {
      if (bucket.minHeight <= height && bucket.minHeight > maxHeight) {
        maxHeight = bucket.minHeight;
      }
    }
    var match = const Breakpoint();
    for (final bucket in breakpoints) {
      if (bucket.minHeight == maxHeight &&
          bucket.minWidth <= width &&
          bucket.minWidth >= bucket.minWidth) {
        match = bucket;
      }
    }
    return match;
  }

  @override
  String toString() => "BreakpointSelector.preferHeight()";
}

final class BreakpointResolver {
  const BreakpointResolver(this.selector, this.breakpoints);

  const BreakpointResolver.preferWidth(this.breakpoints)
    : selector = const .preferWidth();

  const BreakpointResolver.preferHeight(this.breakpoints)
    : selector = const .preferHeight();

  final BreakpointSelector selector;
  final Iterable<Breakpoint> breakpoints;

  Breakpoint fromDimensions(double width, double height) =>
      selector.fromDimensions(breakpoints, width, height);

  Breakpoint fromSize(Size size) => selector.fromSize(breakpoints, size);

  Breakpoint? maybeOf(BuildContext context) =>
      selector.maybeOf(breakpoints, context);

  Breakpoint of(BuildContext context) => selector.of(breakpoints, context);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreakpointResolver &&
          selector == other.selector &&
          const IterableEquality<Breakpoint>().equals(
            breakpoints,
            other.breakpoints,
          );

  @override
  int get hashCode => Object.hash(
    selector,
    const IterableEquality<Breakpoint>().hash(breakpoints),
  );
}
