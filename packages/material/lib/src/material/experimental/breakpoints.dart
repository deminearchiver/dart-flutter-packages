// TODO: move to measurement when complete

// TODO: probably should add Set<Breakpoint> to MeasurementThemeData(/Partial)

import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

extension BreakpointSetExtension on Set<Breakpoint> {
  /// Creates a new [Set] that contains the original [Breakpoint] values
  /// in addition to new elements where the width is from the original set and
  /// the height is from [heightBreakpoints]. Note this method does not fill
  /// in any gaps in the original set.
  ///
  /// Returns a new [Set] that contains each pair possible taking the height
  /// breakpoint from [heightBreakpoints] and the width breakpoint from this.
  Set<Breakpoint> addHeightBreakpoints(Set<double> heightBreakpoints) {
    final widthBreakpoints = map((breakpoint) => breakpoint.minWidth).toSet();
    return UnmodifiableSetView(
      union(
        Breakpoint.createGridBreakpointSet(widthBreakpoints, heightBreakpoints),
      ),
    );
  }
}

// TODO: consider making non-final (don't forget to compare runtimeType)

// TODO: consider adopting Corner API design = remove props and make abstract

final class Breakpoint {
  const Breakpoint({this.minWidth = 0.0, this.minHeight = 0.0})
    : assert(minWidth >= 0.0, "Minimum width must be non-negative."),
      assert(minHeight >= 0.0, "Minimum height must be non-negative.");

  const Breakpoint.fromDimensions(double minWidth, double minHeight)
    : this(minWidth: minWidth, minHeight: minHeight);

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

  static final Set<double> _defaultWidthBreakpoints = UnmodifiableSetView({
    0.0,
    widthMediumLowerBound,
    widthExpandedLowerBound,
    widthLargeLowerBound,
    widthExtraLargeLowerBound,
  });

  static final Set<double> _defaultHeightBreakpoints = UnmodifiableSetView({
    0.0,
    heightMediumLowerBound,
    heightExpandedLowerBound,
  });

  static final defaultBreakpoints = createGridBreakpointSet(
    _defaultWidthBreakpoints,
    _defaultHeightBreakpoints,
  );

  /// Creates a new set of breakpoints by taking the cross product of
  /// [widthBreakpoints] and [heightBreakpoints].
  ///
  /// Returns a [Set] containing the breakpoints using a grid style.
  static Set<Breakpoint> createGridBreakpointSet(
    Set<double> widthBreakpoints,
    Set<double> heightBreakpoints,
  ) => UnmodifiableSetView({
    for (final widthBreakpoint in widthBreakpoints)
      for (final heightBreakpoint in heightBreakpoints)
        .fromDimensions(widthBreakpoint, heightBreakpoint),
  });
}

abstract class BreakpointSelector {
  const BreakpointSelector();

  Breakpoint fromDimensions(
    Set<Breakpoint> breakpoints,
    double width,
    double height,
  );

  Breakpoint fromSize(Set<Breakpoint> breakpoints, Size size) =>
      fromDimensions(breakpoints, size.width, size.height);

  Breakpoint? fromContextOrNull(
    Set<Breakpoint> breakpoints,
    BuildContext context,
  ) {
    final size = MediaQuery.maybeSizeOf(context);
    return size != null ? fromSize(breakpoints, size) : null;
  }

  Breakpoint fromContext(Set<Breakpoint> breakpoints, BuildContext context) =>
      fromSize(breakpoints, MediaQuery.sizeOf(context));

  static const BreakpointSelector preferWidth =
      _BreakpointSelectorPreferWidth();

  static const BreakpointSelector preferHeight =
      _BreakpointSelectorPreferHeight();
}

final class _BreakpointSelectorPreferWidth extends BreakpointSelector {
  const _BreakpointSelectorPreferWidth();

  @override
  Breakpoint fromDimensions(
    Set<Breakpoint> breakpoints,
    double width,
    double height,
  ) {
    var maxWidth = 0.0;
    var match = const Breakpoint();
    for (final bucket in breakpoints) {
      if (bucket.minWidth <= width) {
        if (bucket.minWidth > maxWidth) {
          maxWidth = bucket.minWidth;
          match = const .new();
        }
        if (bucket.minWidth == maxWidth &&
            bucket.minHeight <= height &&
            bucket.minHeight >= match.minHeight) {
          match = bucket;
        }
      }
    }
    return match;
  }

  @override
  String toString() => "BreakpointSelector.preferWidth";
}

final class _BreakpointSelectorPreferHeight extends BreakpointSelector {
  const _BreakpointSelectorPreferHeight();

  @override
  Breakpoint fromDimensions(
    Set<Breakpoint> breakpoints,
    double width,
    double height,
  ) {
    var maxHeight = 0.0;
    var match = const Breakpoint();
    for (final bucket in breakpoints) {
      if (bucket.minHeight <= height) {
        if (bucket.minHeight > maxHeight) {
          maxHeight = bucket.minHeight;
          match = const .new();
        }
        if (bucket.minHeight == maxHeight &&
            bucket.minWidth <= width &&
            bucket.minWidth >= match.minWidth) {
          match = bucket;
        }
      }
    }
    return match;
  }

  @override
  String toString() => "BreakpointSelector.preferHeight";
}

final class BreakpointResolver {
  const BreakpointResolver(this.selector, this.breakpoints);

  const BreakpointResolver.preferWidth(this.breakpoints)
    : selector = .preferWidth;

  const BreakpointResolver.preferHeight(this.breakpoints)
    : selector = .preferHeight;

  final BreakpointSelector selector;
  final Set<Breakpoint> breakpoints;

  Breakpoint fromDimensions(double width, double height) =>
      selector.fromDimensions(breakpoints, width, height);

  Breakpoint fromSize(Size size) => selector.fromSize(breakpoints, size);

  Breakpoint? fromContextOrNull(BuildContext context) =>
      selector.fromContextOrNull(breakpoints, context);

  Breakpoint fromContext(BuildContext context) =>
      selector.fromContext(breakpoints, context);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreakpointResolver &&
          selector == other.selector &&
          const SetEquality<Breakpoint>().equals(
            breakpoints,
            other.breakpoints,
          );

  @override
  int get hashCode =>
      Object.hash(selector, const SetEquality<Breakpoint>().hash(breakpoints));
}
