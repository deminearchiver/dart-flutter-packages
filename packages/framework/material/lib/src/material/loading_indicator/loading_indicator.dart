import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:material/material_shapes.dart';
import 'package:material/src/material/flutter.dart';

const _kContainerWidth = 48.0;
const _kContainerHeight = 48.0;
const _kIndicatorSize = 38.0;
final _kActiveIndicatorScale =
    _kIndicatorSize / math.min(_kContainerWidth, _kContainerHeight);

const _kGlobalRotationDurationMs = 4666;
const _kMorphIntervalMs = 650;
const _kFullRotation = 2.0 * math.pi;
const _kQuarterRotation = _kFullRotation / 4.0;

final _indeterminateIndicatorPolygons = <RoundedPolygon>[
  MaterialShapes.softBurst,
  MaterialShapes.cookie9Sided,
  MaterialShapes.pentagon,
  MaterialShapes.pill,
  MaterialShapes.sunny,
  MaterialShapes.cookie4Sided,
  MaterialShapes.oval,
];

final _determinateIndicatorPolygons = <RoundedPolygon>[
  MaterialShapes.circle
      // Rotate by 36 degrees to align vertices with softBurst.
      .transformed(Matrix4.rotationZ(math.pi / 10.0).asPointTransformer())
      // Normalizing is required to avoid weird feature mapping for morph.
      .normalized(),
  MaterialShapes.softBurst,
];

final class const _LoadingIndicatorStates({
  @override required final bool isContained,
}) with Diagnosticable implements LoadingIndicatorStates {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>("isContained", isContained));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _LoadingIndicatorStates && isContained == other.isContained;

  @override
  int get hashCode => isContained.hashCode;
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
}) extends StatefulWidget {
  this
    : assert(
        indicatorPolygons == null || indicatorPolygons.length >= 2,
        "indicatorPolygons should have, at least, two RoundedPolygons",
      );

  List<RoundedPolygon> get _indicatorPolygons =>
      indicatorPolygons ?? _determinateIndicatorPolygons;

  @override
  State<DeterminateLoadingIndicator> createState() =>
      _DeterminateLoadingIndicatorState();
}

class _DeterminateLoadingIndicatorState
    extends State<DeterminateLoadingIndicator> {
  final _matrix = Matrix4.zero();

  late List<Morph> _morphSequence;
  late double _morphScaleFactor;

  double _calculateMorphScaleFactor(List<RoundedPolygon> indicatorPolygons) =>
      LoadingIndicatorHelper.calculateScaleFactor(widget._indicatorPolygons) *
      _kActiveIndicatorScale;

  @override
  void initState() {
    super.initState();
    _morphSequence = LoadingIndicatorHelper.updateMorphSequence(
      polygons: widget._indicatorPolygons,
      circularSequence: false,
    );
    _morphScaleFactor = _calculateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  void didUpdateWidget(covariant DeterminateLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget._indicatorPolygons, oldWidget._indicatorPolygons)) {
      _morphSequence = LoadingIndicatorHelper.updateMorphSequence(
        morphSequence: _morphSequence,
        polygons: widget._indicatorPolygons,
        circularSequence: false,
      );
      _morphScaleFactor = _calculateMorphScaleFactor(widget._indicatorPolygons);
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    _morphSequence = LoadingIndicatorHelper.updateMorphSequence(
      morphSequence: _morphSequence,
      polygons: widget._indicatorPolygons,
      circularSequence: false,
    );
    _morphScaleFactor = _calculateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  Widget build(BuildContext context) {
    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final states = _LoadingIndicatorStates(isContained: widget.contained);

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

    return RepaintBoundary(
      child: Semantics(
        label: "$progressFraction",
        value: "$progressFraction",
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
    final path = LoadingIndicatorHelper.transformPath(
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
  final String? semanticsLabel,
}) extends StatefulWidget {
  this
    : assert(
        indicatorPolygons == null || indicatorPolygons.length >= 2,
        "indicatorPolygons should have, at least, two RoundedPolygons",
      );

  List<RoundedPolygon> get _indicatorPolygons =>
      indicatorPolygons ?? _indeterminateIndicatorPolygons;

  @override
  State<IndeterminateLoadingIndicator> createState() =>
      _IndeterminateLoadingIndicatorState();
}

class _IndeterminateLoadingIndicatorState
    extends State<IndeterminateLoadingIndicator>
    with TickerProviderStateMixin {
  late _IndeterminateLoadingIndicatorAnimationController _controller;
  late _IndeterminateLoadingIndicatorPainter _painter;

  double _calculateMorphScaleFactor(List<RoundedPolygon> indicatorPolygons) =>
      LoadingIndicatorHelper.calculateScaleFactor(widget._indicatorPolygons) *
      _kActiveIndicatorScale;

  @override
  void initState() {
    super.initState();
    final morphSequence = LoadingIndicatorHelper.updateMorphSequence(
      polygons: widget._indicatorPolygons,
      circularSequence: true,
    );
    final morphScaleFactor = _calculateMorphScaleFactor(
      widget._indicatorPolygons,
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
      _painter
        ..morphSequence = LoadingIndicatorHelper.updateMorphSequence(
          morphSequence: _painter.morphSequence,
          polygons: widget._indicatorPolygons,
          circularSequence: true,
        )
        ..morphScaleFactor = _calculateMorphScaleFactor(
          widget._indicatorPolygons,
        );
      _controller.morphSequenceLength = _painter.morphSequence.length;
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
    _painter
      ..morphSequence = LoadingIndicatorHelper.updateMorphSequence(
        morphSequence: _painter.morphSequence,
        polygons: widget._indicatorPolygons,
        circularSequence: true,
      )
      ..morphScaleFactor = _calculateMorphScaleFactor(
        widget._indicatorPolygons,
      );
    _controller.morphSequenceLength = _painter.morphSequence.length;
  }

  @override
  Widget build(BuildContext context) {
    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final states = _LoadingIndicatorStates(isContained: widget.contained);

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

    return RepaintBoundary(
      child: Semantics(
        label: widget.semanticsLabel,
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
    final path = LoadingIndicatorHelper.transformPath(
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

abstract final class LoadingIndicatorHelper {
  static Iterable<Morph> generateMorphSequence({
    required List<RoundedPolygon> polygons,
    required bool circularSequence,
  }) sync* {
    if (polygons.isEmpty) return;
    final first = polygons[0];
    var current = first;
    for (var i = 1; i < polygons.length; i++) {
      final next = polygons[i];
      yield Morph(current, next);
      current = next;
    }
    if (circularSequence) {
      // Create a morph from the last shape to the first shape.
      yield Morph(current, first);
    }
  }

  static List<Morph> updateMorphSequence({
    List<Morph>? morphSequence,
    required List<RoundedPolygon> polygons,
    required bool circularSequence,
  }) {
    if (polygons.isEmpty) {
      morphSequence?.clear();
      return morphSequence ?? [];
    }
    final iterable = generateMorphSequence(
      polygons: polygons,
      circularSequence: circularSequence,
    );
    morphSequence
      ?..clear()
      ..addAll(iterable);
    return morphSequence ?? [...iterable];
  }

  static double calculateScaleFactor(
    List<RoundedPolygon> indicatorPolygons, {
    bool approximate = true,
  }) {
    var scaleFactor = 1.0;
    for (var i = 0; i < indicatorPolygons.length; i++) {
      final polygon = indicatorPolygons[i];

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
