import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_3p/material_shapes.dart';
import 'package:material_ui/material_ui.dart';

import 'stateful_custom_painter.dart';

const _kContainerWidth = 48.0;
const _kContainerHeight = 48.0;
const _kIndicatorSize = 38.0;
final _kActiveIndicatorScale =
    _kIndicatorSize / math.min(_kContainerWidth, _kContainerHeight);

const _kGlobalRotationDurationMs = 4666;
const _kMorphIntervalMs = 650;
const _kFullRotation = 2.0 * math.pi;
const _kQuarterRotation = _kFullRotation / 4.0;

class const DeterminateLoadingIndicator({
  super.key,
  final bool contained = false,
  required final double progress,
  final List<RoundedPolygon>? indicatorPolygons,
  final OutlinedBorder? containerShape,
  final Color? containerColor,
  final BorderSide? containerOutline,
  final Color? activeIndicatorColor,
  final BorderSide? activeIndicatorOutline,
}) extends StatefulWidget {
  this
    : assert(
        indicatorPolygons == null || indicatorPolygons.length >= 2,
        "indicatorPolygons should have, at least, two RoundedPolygons",
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
      circularSequence: false,
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
        circularSequence: false,
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
      circularSequence: false,
    );
    _morphSequence = morphSequence;
    _morphScaleFactor = morphScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    final isContained = widget.contained;

    final resolvedContainerShape =
        widget.containerShape ?? const CircleBorder();

    final resolvedContainerColor =
        widget.containerColor ??
        (isContained ? colorScheme.primaryContainer : Colors.transparent);

    final resolvedContainerOutline = widget.containerOutline ?? .none;

    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor ??
        (isContained ? colorScheme.onPrimaryContainer : colorScheme.primary);

    final resolvedActiveIndicatorOutline =
        widget.activeIndicatorOutline ?? .none;

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

    return RepaintBoundary(
      child: Semantics(
        label: "$progressFraction",
        value: "$progressFraction",
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: _kContainerWidth,
            minHeight: _kContainerHeight,
          ),
          child: Material(
            animationDuration: .zero,
            clipBehavior: .antiAlias,
            shape: resolvedContainerShape.copyWith(
              side: resolvedContainerOutline,
            ),
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
      ),
    );
  }
}

class _DeterminateLoadingIndicatorPainter({
  required final Color color,
  required final BorderSide outline,
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
        strokeAlign: outline.strokeAlign,
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
  final OutlinedBorder? containerShape,
  final Color? containerColor,
  final BorderSide? containerOutline,
  final Color? activeIndicatorColor,
  final BorderSide? activeIndicatorOutline,
  final String? semanticsLabel,
}) extends StatefulWidget {
  this
    : assert(
        indicatorPolygons == null || indicatorPolygons.length >= 2,
        "indicatorPolygons should have, at least, two RoundedPolygons",
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

  late _IndeterminateLoadingIndicatorAnimationController _controller;
  late _IndeterminateLoadingIndicatorPainter _painter;

  @override
  void initState() {
    super.initState();
    final (
      :morphSequence,
      :morphScaleFactor,
    ) = LoadingIndicatorDefaults._buildMorphSequenceAndScaleFactor(
      polygons: _indicatorPolygons,
      circularSequence: true,
    );
    _controller = .new(vsync: this, morphSequenceLength: morphSequence.length);
    _painter = .new(
      color: Colors.transparent,
      outline: .none,
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
        circularSequence: true,
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
      circularSequence: true,
    );
    _painter
      ..morphSequence = morphSequence
      ..morphScaleFactor = morphScaleFactor;
    _controller.morphSequenceLength = morphSequence.length;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    final isContained = widget.contained;

    final resolvedContainerShape =
        widget.containerShape ?? const CircleBorder();

    final resolvedContainerColor =
        widget.containerColor ??
        (isContained ? colorScheme.primaryContainer : Colors.transparent);

    final resolvedContainerOutline = widget.containerOutline ?? .none;

    final resolvedActiveIndicatorColor =
        widget.activeIndicatorColor ??
        (isContained ? colorScheme.onPrimaryContainer : colorScheme.primary);

    final resolvedActiveIndicatorOutline =
        widget.activeIndicatorOutline ?? .none;

    _painter
      ..color = resolvedActiveIndicatorColor
      ..outline = resolvedActiveIndicatorOutline;

    return RepaintBoundary(
      child: Semantics(
        label: widget.semanticsLabel,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: _kContainerWidth,
            minHeight: _kContainerHeight,
          ),
          child: Material(
            animationDuration: .zero,
            clipBehavior: .antiAlias,
            shape: resolvedContainerShape.copyWith(
              side: resolvedContainerOutline,
            ),
            color: resolvedContainerColor,
            child: CustomPaint(painter: _painter, willChange: true),
          ),
        ),
      ),
    );
  }
}

class _IndeterminateLoadingIndicatorAnimationController({
  required TickerProvider vsync,
  required var int _morphSequenceLength,
  final String? debugLabel,
}) extends ChangeNotifier {
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

  SpringSimulation? _simulation;

  SpringSimulation _createSimulation() {
    final spring = SpringDescription.withDampingRatio(
      mass: 1.0,
      stiffness: 200.0,
      ratio: 0.6,
    );
    // Ignoring tolerance from Compose fixes the snapping issue.
    // const tolerance = Tolerance(distance: 0.1, velocity: .infinity);
    return .new(spring, 0.0, 1.0, 0.0, snapToEnd: true);
  }

  void _tick(Duration elapsed) {
    const kGlobalRotationDurationUs =
        _kGlobalRotationDurationMs * Duration.microsecondsPerMillisecond;
    _globalRotation =
        (elapsed.inMicroseconds % kGlobalRotationDurationUs) /
        kGlobalRotationDurationUs;

    while (elapsed >= _nextSpringStart) {
      if (_simulation != null) _snap();
      _currentSpringStart = _nextSpringStart;
      _nextSpringStart += const .new(milliseconds: _kMorphIntervalMs);
      _simulation = _createSimulation();
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
  required var BorderSide _outline,
  required var List<Morph> _morphSequence,
  required var double _morphScaleFactor,
  required var _IndeterminateLoadingIndicatorAnimationController _controller,
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

  BorderSide get outline => _outline;
  set outline(BorderSide value) {
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

  _IndeterminateLoadingIndicatorAnimationController get controller =>
      _controller;
  set controller(_IndeterminateLoadingIndicatorAnimationController value) {
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
        strokeAlign: outline.strokeAlign,
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

  static List<Morph> _createMorphSequence({
    required List<RoundedPolygon> polygons,
    required int polygonsLength,
    required bool circularSequence,
    required int morphSequenceLength,
  }) => .unmodifiableOf(
    // Using fully qualified call avoids Iterable.generate dot shorthand.
    List<Morph>.generate(
      morphSequenceLength,
      (index) => Morph(polygons[index], polygons[(index + 1) % polygonsLength]),
      growable: false,
    ),
  );

  static _MorphSequenceCacheValue _buildMorphSequenceAndScaleFactor({
    required List<RoundedPolygon> polygons,
    required bool circularSequence,
    bool approximate = true,
  }) {
    final polygonsLength = polygons.length;
    final morphSequenceLength = circularSequence
        ? polygonsLength
        : polygonsLength - 1;
    if (morphSequenceLength <= 0) {
      return (morphSequence: const [], morphScaleFactor: 1.0);
    }

    polygons = .unmodifiableOf(polygons);
    return _morphSequenceCache.putIfAbsent(
      .new(
        polygons: polygons,
        circularSequence: circularSequence,
        approximate: approximate,
      ),
      () => (
        morphSequence: _createMorphSequence(
          polygons: polygons,
          polygonsLength: polygonsLength,
          circularSequence: circularSequence,
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
    required bool circularSequence,
  }) {
    final polygonsLength = polygons.length;
    final morphSequenceLength = circularSequence
        ? polygonsLength
        : polygonsLength - 1;
    return morphSequenceLength > 0
        ? _createMorphSequence(
            polygons: polygons,
            polygonsLength: polygonsLength,
            circularSequence: circularSequence,
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
  required final bool circularSequence,
  required final bool approximate,
}) {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MorphSequenceCacheKey &&
          listEquals(polygons, other.polygons) &&
          circularSequence == other.circularSequence &&
          approximate == other.approximate;

  @override
  late final int hashCode = Object.hash(
    Object.hashAll(polygons),
    circularSequence,
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
