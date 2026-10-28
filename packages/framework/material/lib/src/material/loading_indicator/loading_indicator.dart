import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material/src/material/flutter.dart';

const _kContainerWidth = 48.0;

const _kContainerHeight = 48.0;

const _kIndicatorSize = 38.0;

final _kActiveIndicatorScale =
    _kIndicatorSize / math.min(_kContainerWidth, _kContainerHeight);

const _kFullRotation = 2.0 * math.pi;

const _kQuarterRotation = _kFullRotation / 4.0;

/// How long the indeterminate indicator takes to morph from one shape to the
/// next.
const _kMorphInterval = Duration(milliseconds: 650);

/// How long the indeterminate indicator takes to complete one full turn of
/// its constant rotation, on top of the rotation that comes with each morph.
const _kGlobalRotationDuration = Duration(milliseconds: 4666);

/// The spring that drives each indeterminate morph.
///
/// Its overshoot carries the morph slightly past its end shape, which gives
/// the indicator its bounce.
///
/// Unlike Compose, which stops the spring early and snaps it back to the end
/// shape, the spring runs for the whole [_kMorphInterval], so that the
/// overshoot settles smoothly.
final _kMorphSpring = SpringSimulation(
  .withDampingRatio(mass: 1.0, stiffness: 200.0, ratio: 0.6),
  0.0,
  1.0,
  0.0,
  snapToEnd: true,
);

final class const _LoadingIndicatorStates({
  @override required final LoadingIndicatorBehavior behavior,
  @override required final LoadingIndicatorContainment containment,
}) with Diagnosticable implements LoadingIndicatorStates {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<LoadingIndicatorBehavior>("behavior", behavior))
      ..add(
        EnumProperty<LoadingIndicatorContainment>("containment", containment),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorStates &&
          behavior == other.behavior &&
          containment == other.containment;

  @override
  int get hashCode => Object.hash(behavior, containment);
}

// TODO: finish and implement the new loading indicator API

class LoadingIndicatorController;

class const LoadingIndicator({
  super.key,

  required final double? progress,

  required final LoadingIndicatorContainment containment,

  /// {@macro material_ui.progress_indicator.ProgressIndicator.semanticsLabel}
  final String? semanticsLabel,

  /// {@macro material_ui.progress_indicator.ProgressIndicator.semanticsValue}
  final String? semanticsValue,
}) extends StatefulWidget {
  const new uncontained({
    Key? key,
    required double? progress,
    String? semanticsLabel,
    String? semanticsValue,
  }) : this(
         key: key,
         progress: progress,
         containment: .uncontained,
         semanticsLabel: semanticsLabel,
         semanticsValue: semanticsValue,
       );

  const new contained({
    Key? key,
    required double? progress,
    String? semanticsLabel,
    String? semanticsValue,
  }) : this(
         key: key,
         progress: progress,
         containment: .contained,
         semanticsLabel: semanticsLabel,
         semanticsValue: semanticsValue,
       );

  LoadingIndicatorBehavior get _behavior =>
      progress != null ? .determinate : .indeterminate;

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    final progress = widget.progress;
    final contained = switch (widget.containment) {
      .uncontained => false,
      .contained => true,
    };
    return progress != null
        ? DeterminateLoadingIndicator(
            progress: progress,
            contained: contained,
            semanticsLabel: widget.semanticsLabel,
            semanticsValue: widget.semanticsValue,
          )
        : IndeterminateLoadingIndicator(
            contained: contained,
            semanticsLabel: widget.semanticsLabel,
            semanticsValue: widget.semanticsValue,
          );
  }
}

class const LoadingIndicatorPaint({
  super.key,
  required final LoadingIndicatorController controller,
}) extends StatefulWidget {
  @override
  State<LoadingIndicatorPaint> createState() => _LoadingIndicatorPaintState();
}

class _LoadingIndicatorPaintState extends State<LoadingIndicatorPaint> {
  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}

class const DeterminateLoadingIndicator({
  super.key,

  final bool contained = false,

  required final double progress,

  final List<RoundedPolygon>? indicatorPolygons,

  final LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,

  final LoadingIndicatorStateProperty<Color?>? containerColor,

  final LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,

  final LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,

  final LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,

  /// {@macro material_ui.progress_indicator.ProgressIndicator.semanticsLabel}
  final String? semanticsLabel,

  /// {@macro material_ui.progress_indicator.ProgressIndicator.semanticsValue}
  final String? semanticsValue,
}) extends StatefulWidget {
  this
    : assert(
        indicatorPolygons == null || indicatorPolygons.length >= 2,
        "A DeterminateLoadingIndicator needs at least two polygons "
        "to morph between, but ${indicatorPolygons.length} were provided.",
      );

  @override
  State<DeterminateLoadingIndicator> createState() =>
      _DeterminateLoadingIndicatorState();
}

class _DeterminateLoadingIndicatorState
    extends State<DeterminateLoadingIndicator> {
  List<RoundedPolygon> get _indicatorPolygons =>
      widget.indicatorPolygons ??
      LoadingIndicatorDefaults.determinateIndicatorPolygons;

  final _matrix = Matrix4.zero();

  late List<Morph> _morphSequence;
  late double _morphScaleFactor;

  @override
  void initState() {
    super.initState();
    final (
      :morphSequence,
      :morphScaleFactor,
    ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
      polygons: _indicatorPolygons,
      loops: false,
    );
    _morphSequence = morphSequence;
    _morphScaleFactor = morphScaleFactor;
  }

  @override
  void didUpdateWidget(covariant DeterminateLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.indicatorPolygons, oldWidget.indicatorPolygons)) {
      final (
        :morphSequence,
        :morphScaleFactor,
      ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
        polygons: _indicatorPolygons,
        loops: false,
      );
      _morphSequence = morphSequence;
      _morphScaleFactor = morphScaleFactor;
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    final (
      :morphSequence,
      :morphScaleFactor,
    ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
      polygons: _indicatorPolygons,
      loops: false,
    );
    _morphSequence = morphSequence;
    _morphScaleFactor = morphScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final states = _LoadingIndicatorStates(
      behavior: .determinate,
      containment: widget.contained ? .contained : .uncontained,
    );

    final resolvedContainerShape =
        widget.containerShape?.resolve(states) ??
        loadingIndicatorTheme.containerShape.resolve(states);

    final resolvedContainerColor =
        widget.containerColor?.resolve(states) ??
        loadingIndicatorTheme.containerColor.resolve(states);

    final resolvedContainerOutline = loadingIndicatorTheme.containerOutline
        .resolve(states)
        .maybeMerge(widget.containerOutline?.resolve(states));

    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor?.resolve(states) ??
        loadingIndicatorTheme.activeIndicatorColor.resolve(states);

    final resolvedActiveIndicatorOutline = loadingIndicatorTheme
        .activeIndicatorOutline
        .resolve(states)
        .maybeMerge(widget.activeIndicatorOutline?.resolve(states));

    final progressFraction = widget.progress;
    final clampedProgressFraction = clampDouble(progressFraction, 0.0, 1.0);

    // Adjust the active morph index according to the progress.
    final activeMorphIndex = math.min(
      (_morphSequence.length * clampedProgressFraction).toInt(),
      _morphSequence.length - 1,
    );

    // Prepare the progress value that will be used for the active Morph.
    final adjustedProgressValue =
        clampedProgressFraction == 1.0 &&
            activeMorphIndex == _morphSequence.length - 1
        // Prevents a zero when the progress is one and we are at the last
        // shape morph.
        ? 1.0
        : (clampedProgressFraction * _morphSequence.length) % 1.0;

    final currentMorph = _morphSequence[activeMorphIndex];

    // Rotate counterclockwise.
    final rotation = -progressFraction * math.pi;

    return Semantics(
      label: widget.semanticsLabel,
      role: .progressBar,
      minValue: "0",
      maxValue: "100",
      value: "${(clampedProgressFraction * 100).round()}",
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: _kContainerWidth,
          minHeight: _kContainerHeight,
        ),
        child: Surface(
          clipBehavior: .antiAlias,
          shape: resolvedContainerOutline.apply(resolvedContainerShape),
          color: resolvedContainerColor,
          child: CustomPaint(
            painter: _DeterminateLoadingIndicatorPainter(
              color: resolvedActiveIndicatorColor,
              outline: resolvedActiveIndicatorOutline,
              currentMorph: currentMorph,
              morphScaleFactor: _morphScaleFactor,
              adjustedProgressValue: adjustedProgressValue,
              rotation: rotation,
              matrix: _matrix,
            ),
            isComplex: true,
            willChange: false,
          ),
        ),
      ),
    );
  }
}

class _DeterminateLoadingIndicatorPainter({
  required final Color color,
  required final Outline outline,
  required final Morph currentMorph,
  required final double morphScaleFactor,
  required final double adjustedProgressValue,
  required final double rotation,
  final Matrix4? matrix,
}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = LoadingIndicatorDefaults.transformPath(
      size: size,
      path: currentMorph.toPath(adjustedProgressValue, startAngle: 0.0),
      scale: morphScaleFactor,
      rotation: rotation,
      matrix: matrix,
    );

    if (color.a > 0.0) {
      final paint = Paint()
        ..style = .fill
        ..color = color;
      canvas.drawPath(path, paint);
    }

    if (outline.width > 0.0 && outline.color.a > 0.0) {
      DynamicPathBorder.paintPathStroke(
        canvas,
        path,
        outline.color,
        strokeWidth: outline.width,
        strokeAlign: outline.alignment,
        strokeCap: .round,
        strokeJoin: .round,
      );
    }
  }

  @override
  bool shouldRepaint(_DeterminateLoadingIndicatorPainter oldDelegate) =>
      color != oldDelegate.color ||
      outline != oldDelegate.outline ||
      currentMorph != oldDelegate.currentMorph ||
      morphScaleFactor != oldDelegate.morphScaleFactor ||
      adjustedProgressValue != oldDelegate.adjustedProgressValue ||
      rotation != oldDelegate.rotation ||
      matrix != oldDelegate.matrix;
}

class const IndeterminateLoadingIndicator({
  super.key,

  final bool contained = false,

  final List<RoundedPolygon>? indicatorPolygons,

  final LoadingIndicatorStateProperty<OutlinedBorder?>? containerShape,

  final LoadingIndicatorStateProperty<Color?>? containerColor,

  final LoadingIndicatorStateProperty<OutlinePartial?>? containerOutline,

  final LoadingIndicatorStateProperty<Color?>? activeIndicatorColor,

  final LoadingIndicatorStateProperty<OutlinePartial?>? activeIndicatorOutline,

  /// {@macro material_ui.progress_indicator.ProgressIndicator.semanticsLabel}
  final String? semanticsLabel,

  /// {@macro material_ui.progress_indicator.ProgressIndicator.semanticsValue}
  final String? semanticsValue,
}) extends StatefulWidget {
  this
    : assert(
        indicatorPolygons == null || indicatorPolygons.length >= 2,
        "An IndeterminateLoadingIndicator needs at least two polygons "
        "to morph between, but ${indicatorPolygons.length} were provided.",
      );

  @override
  State<IndeterminateLoadingIndicator> createState() =>
      _IndeterminateLoadingIndicatorState();
}

class _IndeterminateLoadingIndicatorState
    extends State<IndeterminateLoadingIndicator>
    with TickerProviderStateMixin {
  List<RoundedPolygon> get _indicatorPolygons =>
      widget.indicatorPolygons ??
      LoadingIndicatorDefaults.indeterminateIndicatorPolygons;

  late _IndeterminateLoadingIndicatorController _controller;
  late _IndeterminateLoadingIndicatorPainter _painter;

  @override
  void initState() {
    super.initState();
    final (
      :morphSequence,
      :morphScaleFactor,
    ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
      polygons: _indicatorPolygons,
      loops: true,
    );
    _controller = .new(vsync: this, morphSequenceLength: morphSequence.length);
    _painter = .new(
      color: Colors.transparent,
      outline: const .from(),
      morphSequence: morphSequence,
      morphScaleFactor: morphScaleFactor,
      controller: _controller,
    );
    unawaited(_controller.start());
  }

  @override
  void didUpdateWidget(IndeterminateLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.indicatorPolygons, oldWidget.indicatorPolygons)) {
      final (
        :morphSequence,
        :morphScaleFactor,
      ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
        polygons: _indicatorPolygons,
        loops: true,
      );
      _painter
        ..morphSequence = morphSequence
        ..morphScaleFactor = morphScaleFactor;
      _controller.morphSequenceLength = morphSequence.length;
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    final (
      :morphSequence,
      :morphScaleFactor,
    ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
      polygons: _indicatorPolygons,
      loops: true,
    );
    _painter
      ..morphSequence = morphSequence
      ..morphScaleFactor = morphScaleFactor;
    _controller.morphSequenceLength = morphSequence.length;
  }

  @override
  Widget build(BuildContext context) {
    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final states = _LoadingIndicatorStates(
      behavior: .indeterminate,
      containment: widget.contained ? .contained : .uncontained,
    );

    final resolvedContainerShape =
        widget.containerShape?.resolve(states) ??
        loadingIndicatorTheme.containerShape.resolve(states);

    final resolvedContainerColor =
        widget.containerColor?.resolve(states) ??
        loadingIndicatorTheme.containerColor.resolve(states);

    final resolvedContainerOutline = loadingIndicatorTheme.containerOutline
        .resolve(states)
        .maybeMerge(widget.containerOutline?.resolve(states));

    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor?.resolve(states) ??
        loadingIndicatorTheme.activeIndicatorColor.resolve(states);

    final resolvedActiveIndicatorOutline = loadingIndicatorTheme
        .activeIndicatorOutline
        .resolve(states)
        .maybeMerge(widget.activeIndicatorOutline?.resolve(states));

    _painter
      ..color = resolvedActiveIndicatorColor
      ..outline = resolvedActiveIndicatorOutline;

    return Semantics(
      label: widget.semanticsLabel,
      role: .loadingSpinner,
      value: widget.semanticsValue,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: _kContainerWidth,
          minHeight: _kContainerHeight,
        ),
        child: Surface(
          clipBehavior: .antiAlias,
          shape: resolvedContainerOutline.apply(resolvedContainerShape),
          color: resolvedContainerColor,
          child: CustomPaint(painter: _painter, willChange: true),
        ),
      ),
    );
  }
}

class _IndeterminateLoadingIndicatorController({
  required TickerProvider vsync,
  required var int _morphSequenceLength,
  final String? debugLabel,
}) with AnimationEagerListenerMixin, AnimationLocalListenersMixin {
  this {
    _ticker = vsync.createTicker(_tick);
  }

  Ticker? _ticker;

  void resync(TickerProvider vsync) {
    _ticker = vsync.createTicker(_tick)..absorbTicker(_ticker!);
  }

  int get morphSequenceLength => _morphSequenceLength;

  set morphSequenceLength(int value) {
    if (_morphSequenceLength == value) return;
    _morphSequenceLength = value;
    _morphIndex = 0;
    _morphRotationTargetAngle = _kQuarterRotation;
    notifyListeners();
  }

  int _morphIndex = 0;

  int get morphIndex => _morphIndex;

  double _morphRotationTargetAngle = _kQuarterRotation;

  double get morphRotationTargetAngle => _morphRotationTargetAngle;

  double _morphProgress = 0.0;

  double get morphProgress => _morphProgress;

  double _globalRotation = 0.0;

  double get globalRotation => _globalRotation;

  Duration _currentSpringStart = .zero;

  Duration _nextSpringStart = .zero;

  // TODO: refactor the simulation to either allow customizing it, or remove the field entirely

  SpringSimulation? _simulation;

  void _tick(Duration elapsed) {
    final kGlobalRotationDurationUs = _kGlobalRotationDuration.inMicroseconds;
    _globalRotation =
        (elapsed.inMicroseconds % kGlobalRotationDurationUs) /
        kGlobalRotationDurationUs;

    while (elapsed >= _nextSpringStart) {
      if (_simulation != null) _snap();
      _currentSpringStart = _nextSpringStart;
      _nextSpringStart += _kMorphInterval;
      _simulation = _kMorphSpring;
    }

    if (_simulation case final simulation?) {
      final timeInSeconds =
          (elapsed - _currentSpringStart).inMicroseconds /
          Duration.microsecondsPerSecond;
      _morphProgress = simulation.x(timeInSeconds);
      if (simulation.isDone(timeInSeconds)) _snap();
    }

    notifyListeners();
  }

  void _snap() {
    _morphIndex = (morphIndex + 1) % morphSequenceLength;
    _morphRotationTargetAngle =
        (morphRotationTargetAngle + _kQuarterRotation) % _kFullRotation;
    _morphProgress = 0.0;
    _simulation = null;
  }

  TickerFuture start() {
    _morphIndex = 0;
    _morphRotationTargetAngle = _kQuarterRotation;
    _morphProgress = 0.0;
    _globalRotation = 0.0;
    _currentSpringStart = .zero;
    _nextSpringStart = .zero;
    _simulation = null;
    return _ticker!.start();
  }

  // TODO: decide if this should pause or cancel the animation
  void stop({bool canceled = true}) {
    _currentSpringStart = .zero;
    _nextSpringStart = .zero;
    _simulation = null;

    _ticker!.stop(canceled: canceled);
  }

  @mustCallSuper
  @override
  void dispose() {
    _simulation = null;
    _ticker!.dispose();
    _ticker = null;
    super.dispose();
  }
}

class _IndeterminateLoadingIndicatorPainter({
  required var Color _color,
  required var Outline _outline,
  required var List<Morph> _morphSequence,
  required var double _morphScaleFactor,
  required var _IndeterminateLoadingIndicatorController _controller,
}) extends StatefulCustomPainter<_IndeterminateLoadingIndicatorPainter> {
  this {
    _controller.addListener(notifyListeners);
  }

  Color get color => _color;
  set color(Color value) {
    if (_color == value) return;
    _color = value;
    notifyListeners();
  }

  Outline get outline => _outline;
  set outline(Outline value) {
    if (_outline == value) return;
    _outline = value;
    notifyListeners();
  }

  List<Morph> get morphSequence => _morphSequence;
  set morphSequence(List<Morph> value) {
    if (_morphSequence == value) return;
    _morphSequence = value;
    notifyListeners();
  }

  double get morphScaleFactor => _morphScaleFactor;
  set morphScaleFactor(double value) {
    if (_morphScaleFactor == value) return;
    _morphScaleFactor = value;
    notifyListeners();
  }

  _IndeterminateLoadingIndicatorController get controller => _controller;
  set controller(_IndeterminateLoadingIndicatorController value) {
    if (_controller == value) return;
    _controller.removeListener(notifyListeners);
    _controller = value;
    _controller.addListener(notifyListeners);
    notifyListeners();
  }

  final _matrix = Matrix4.zero();

  @override
  void paint(Canvas canvas, Size size) {
    final morphIndex = controller.morphIndex;
    final morphRotationTargetAngle = controller.morphRotationTargetAngle;
    final morphProgress = controller.morphProgress;
    final globalRotation = controller.globalRotation * _kFullRotation;
    final path = LoadingIndicatorDefaults.transformPath(
      size: size,
      path: morphSequence[morphIndex].toPath(morphProgress),
      scale: morphScaleFactor,
      rotation:
          morphProgress * _kQuarterRotation +
          morphRotationTargetAngle +
          globalRotation,
      matrix: _matrix,
    );

    if (color.a > 0.0) {
      final paint = Paint()
        ..style = .fill
        ..color = color;
      canvas.drawPath(path, paint);
    }

    if (outline.width > 0.0 && outline.color.a > 0.0) {
      DynamicPathBorder.paintPathStroke(
        canvas,
        path,
        outline.color,
        strokeWidth: outline.width,
        strokeAlign: outline.alignment,
        strokeCap: .round,
        strokeJoin: .round,
      );
    }
  }
}

abstract final class LoadingIndicatorDefaults {
  static final indeterminateIndicatorPolygons =
      List<RoundedPolygon>.unmodifiableOf([
        MaterialShapes.softBurst,
        MaterialShapes.cookie9Sided,
        MaterialShapes.pentagon,
        MaterialShapes.pill,
        MaterialShapes.sunny,
        MaterialShapes.cookie4Sided,
        MaterialShapes.oval,
      ]);

  static final determinateIndicatorPolygons =
      List<RoundedPolygon>.unmodifiableOf([
        MaterialShapes.circle
            // Rotate by 36 degrees to align vertices with softBurst.
            .transformed(Matrix4.rotationZ(math.pi / 10.0).asPointTransformer())
            // Normalizing is required to avoid weird feature mapping for morph.
            .normalized(),
        MaterialShapes.softBurst,
      ]);

  static const _morphSequenceCacheSize = 8;

  static final _morphSequenceCache =
      _LruCache<_MorphSequenceCacheKey, _MorphSequenceCacheValue>(
        _morphSequenceCacheSize,
      );

  static List<Morph> _generateMorphSequence({
    required List<RoundedPolygon> polygons,
    required int polygonsLength,
    required bool loops,
    required int morphSequenceLength,
  }) {
    // Sanity checks.
    assert(polygonsLength == polygons.length);
    assert(
      morphSequenceLength == (loops ? polygonsLength : polygonsLength - 1),
    );
    return .unmodifiableOf(
      // Using fully qualified call avoids Iterable.generate dot shorthand.
      List<Morph>.generate(
        morphSequenceLength,
        (index) =>
            Morph(polygons[index], polygons[(index + 1) % polygonsLength]),
        growable: false,
      ),
    );
  }

  static _MorphSequenceCacheValue _buildMorphSequenceAndScaleFactor({
    required List<RoundedPolygon> polygons,
    required bool loops,
    bool approximate = true,
  }) {
    final polygonsLength = polygons.length;
    final morphSequenceLength = loops ? polygonsLength : polygonsLength - 1;
    if (morphSequenceLength <= 0) {
      return (morphSequence: const [], morphScaleFactor: 1.0);
    }

    polygons = .unmodifiableOf(polygons);
    return _morphSequenceCache.putIfAbsent(
      .new(polygons: polygons, loops: loops, approximate: approximate),
      () => (
        morphSequence: _generateMorphSequence(
          polygons: polygons,
          polygonsLength: polygonsLength,
          loops: loops,
          morphSequenceLength: morphSequenceLength,
        ),
        morphScaleFactor: calculateMorphScaleFactor(
          polygons,
          approximate: approximate,
        ),
      ),
    );
  }

  static List<Morph> buildMorphSequence(
    List<RoundedPolygon> polygons, {
    required bool loops,
  }) {
    final polygonsLength = polygons.length;
    final morphSequenceLength = loops ? polygonsLength : polygonsLength - 1;
    return morphSequenceLength > 0
        ? _generateMorphSequence(
            polygons: polygons,
            polygonsLength: polygonsLength,
            loops: loops,
            morphSequenceLength: morphSequenceLength,
          )
        : const [];
  }

  static double calculateMorphScaleFactor(
    List<RoundedPolygon> polygons, {
    bool approximate = true,
  }) => calculateMorphScaleFactorRaw(polygons) * _kActiveIndicatorScale;

  static double calculateMorphScaleFactorRaw(
    List<RoundedPolygon> polygons, {
    bool approximate = true,
  }) {
    var scaleFactor = 1.0;
    for (final polygon in polygons) {
      final bounds = approximate
          ? polygon.calculateApproximateBounds()
          : polygon.calculateBounds();
      final maxBounds = polygon.calculateMaxBounds();

      final scaleX = bounds.width / maxBounds.width;
      final scaleY = bounds.height / maxBounds.height;

      // We use max(scaleX, scaleY) to handle cases like a pill-shape that can
      // throw off the entire calculation.
      scaleFactor = math.min(scaleFactor, math.max(scaleX, scaleY));
    }
    return scaleFactor;
  }

  static Path transformPath({
    required Size size,
    required Path path,
    double scale = 1.0,
    double rotation = 0.0,
    Matrix4? matrix,
  }) {
    final canvasCenter = size.center(.zero);
    final pathCenter = path.getBounds().center;
    (matrix ??= .zero())
      ..setIdentity()
      // Translate the path to align its center with the available size center.
      ..translateByDouble(canvasCenter.dx, canvasCenter.dy, 0.0, 1.0)
      // Apply rotation.
      ..rotateZ(rotation)
      // Scale to the desired size.
      ..scaleByDouble(size.width * scale, size.height * scale, 1.0, 1.0)
      // Translate the path to align its center with (0, 0).
      ..translateByDouble(-pathCenter.dx, -pathCenter.dy, 0.0, 1.0);
    return path.transform(matrix.storage);
  }

  static void paintPathWithTransform({
    required Canvas canvas,
    required Size size,
    required Path path,
    double scale = 1.0,
    double rotation = 0.0,
    Matrix4? matrix,
    required Paint paint,
  }) {
    final processedPath = transformPath(
      size: size,
      path: path,
      scale: scale,
      rotation: rotation,
      matrix: matrix,
    );
    canvas.drawPath(processedPath, paint);
  }
}

@immutable
// ignore: prefer_const_constructors_in_immutables
final class _MorphSequenceCacheKey({
  required final List<RoundedPolygon> polygons,
  required final bool loops,
  required final bool approximate,
}) {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MorphSequenceCacheKey &&
          listEquals(polygons, other.polygons) &&
          loops == other.loops &&
          approximate == other.approximate;

  @override
  late final int hashCode = Object.hash(
    Object.hashAll(polygons),
    loops,
    approximate,
  );
}

typedef _MorphSequenceCacheValue = ({
  List<Morph> morphSequence,
  double morphScaleFactor,
});

/// Cache of objects of limited size that evicts the least recently used entry.
///
/// Reading an entry counts as using it, so entries that are asked for on
/// every frame stay cached while ones that are no longer needed drift out.
final class _LruCache<K extends Object?, V extends Object>(
  /// Maximum number of entries to store in the cache.
  ///
  /// Once this many entries have been cached, the entry used least recently
  /// is evicted when adding a new entry.
  final int _maximumSize,
) {
  this : assert(_maximumSize > 0);

  /// In Dart the map literal uses a linked hash-map implementation, whose keys
  /// are stored such that [Map.keys] returns them in the order they were
  /// inserted. Re-inserting an entry on every use keeps that order the order
  /// of last use, with the least recently used entry first.
  final _cache = <K, V>{};

  /// Whether there is a cached value for the given key.
  bool containsKey(K key) => _cache.containsKey(key);

  /// Returns the previously cached value for the given key, if available;
  /// if not, calls the given callback to obtain it first.
  V putIfAbsent(K key, V Function() loader) {
    final result = _cache.remove(key);

    if (result != null) return _cache[key] = result;

    if (_cache.length == _maximumSize) _cache.remove(_cache.keys.first);

    return _cache[key] = loader();
  }
}
