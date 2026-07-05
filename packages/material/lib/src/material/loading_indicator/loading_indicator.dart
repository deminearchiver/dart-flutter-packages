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
  // Rotate by 36 degrees to align vertices with softBurst.
  MaterialShapes.circle.transformedWithMatrix2(.rotation(math.pi / 10.0)),
  MaterialShapes.softBurst,
];

typedef LoadingIndicatorForEachPolygon =
    RoundedPolygon Function(RoundedPolygon polygon);

class DeterminateLoadingIndicator extends StatefulWidget {
  const DeterminateLoadingIndicator({
    super.key,
    required this.contained,
    required this.progress,
    this.indicatorPolygons,
    this.containerColor,
    this.indicatorColor,
    this.indicatorOutline = const .from(),
    this.forEachPolygon = defaultForEachPolygon,
  }) : assert(progress >= 0.0 && progress <= 1.0),
       assert(
         indicatorPolygons == null || indicatorPolygons.length >= 2,
         "indicatorPolygons should have, at least, two RoundedPolygons",
       );

  final bool contained;

  final double progress;

  final List<RoundedPolygon>? indicatorPolygons;

  final Color? containerColor;

  final Color? indicatorColor;

  final Outline indicatorOutline;

  final LoadingIndicatorForEachPolygon forEachPolygon;

  List<RoundedPolygon> get _indicatorPolygons =>
      indicatorPolygons ?? _determinateIndicatorPolygons;

  @override
  State<DeterminateLoadingIndicator> createState() =>
      _DeterminateLoadingIndicatorState();

  static RoundedPolygon defaultForEachPolygon(RoundedPolygon polygon) =>
      polygon.normalized();
}

class _DeterminateLoadingIndicatorState
    extends State<DeterminateLoadingIndicator> {
  double get _progressValue => widget.progress;

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
      forEachPolygon: widget.forEachPolygon,
    );
    _morphScaleFactor = _calculateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  void didUpdateWidget(covariant DeterminateLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget._indicatorPolygons, oldWidget._indicatorPolygons) ||
        widget.forEachPolygon != oldWidget.forEachPolygon) {
      _morphSequence = LoadingIndicatorHelper.updateMorphSequence(
        morphSequence: _morphSequence,
        polygons: widget._indicatorPolygons,
        circularSequence: false,
        forEachPolygon: widget.forEachPolygon,
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
      forEachPolygon: widget.forEachPolygon,
    );
    _morphScaleFactor = _calculateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  Widget build(BuildContext context) {
    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final containerColor =
        widget.containerColor ?? loadingIndicatorTheme.containedContainerColor;

    final indicatorColor =
        widget.indicatorColor ??
        (widget.contained
            ? loadingIndicatorTheme.containedIndicatorColor
            : loadingIndicatorTheme.indicatorColor);

    final indicatorOutline = widget.indicatorOutline;

    // Adjust the active morph index according to the progress.
    final activeMorphIndex = math.min(
      (_morphSequence.length * _progressValue).toInt(),
      _morphSequence.length - 1,
    );

    // Prepare the progress value that will be used for the active Morph.
    final adjustedProgressValue =
        _progressValue == 1.0 && activeMorphIndex == _morphSequence.length - 1
        // Prevents a zero when the progress is one and we are at the last
        // shape morph.
        ? 1.0
        : (_progressValue * _morphSequence.length) % 1.0;

    final currentMorph = _morphSequence[activeMorphIndex];

    // Rotate counterclockwise.
    final rotation = -_progressValue * math.pi;

    return RepaintBoundary(
      child: Semantics(
        label: "$_progressValue",
        value: "$_progressValue",
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: _kContainerWidth,
            minHeight: _kContainerHeight,
          ),
          child: Surface(
            clipBehavior: widget.contained ? .antiAlias : .none,
            shape: widget.contained
                ? const CircleBorder()
                : const RoundedRectangleBorder(),
            color: widget.contained ? containerColor : null,
            elevation: widget.contained ? null : 0.0,
            shadowColor: widget.contained ? null : Colors.transparent,
            child: CustomPaint(
              painter: _DeterminateLoadingIndicatorPainter(
                color: indicatorColor,
                outline: indicatorOutline,
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

class _DeterminateLoadingIndicatorPainter extends CustomPainter {
  _DeterminateLoadingIndicatorPainter({
    required this.color,
    required this.outline,
    required this.currentMorph,
    required this.morphScaleFactor,
    required this.adjustedProgressValue,
    required this.rotation,
    this.matrix,
  });

  final Color color;

  final Outline outline;

  final Morph currentMorph;

  final double morphScaleFactor;

  final double adjustedProgressValue;

  final double rotation;

  final Matrix4? matrix;

  @override
  void paint(Canvas canvas, Size size) {
    final path = LoadingIndicatorHelper.transformPath(
      size: size,
      path: currentMorph.toPath(
        progress: adjustedProgressValue,
        startAngle: 0.0,
      ),
      scale: morphScaleFactor,
      rotation: rotation,
      matrix: matrix,
    );

    final paint = Paint()
      ..style = .fill
      ..color = color;
    canvas.drawPath(path, paint);

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

class IndeterminateLoadingIndicator extends StatefulWidget {
  const IndeterminateLoadingIndicator({
    super.key,
    required this.contained,
    this.indicatorPolygons,
    this.containerColor,
    this.indicatorColor,
    this.indicatorOutline = const .from(),
    this.semanticsLabel,
    this.forEachPolygon = LoadingIndicatorHelper.defaultForEachPolygon,
  }) : assert(
         indicatorPolygons == null || indicatorPolygons.length >= 2,
         "indicatorPolygons should have, at least, two RoundedPolygons",
       );

  final bool contained;

  final List<RoundedPolygon>? indicatorPolygons;

  final Color? containerColor;

  final Color? indicatorColor;

  final Outline indicatorOutline;

  final String? semanticsLabel;

  final LoadingIndicatorForEachPolygon forEachPolygon;

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
      forEachPolygon: widget.forEachPolygon,
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
    if (!listEquals(widget.indicatorPolygons, oldWidget.indicatorPolygons) ||
        widget.forEachPolygon != oldWidget.forEachPolygon) {
      _painter
        ..morphSequence = LoadingIndicatorHelper.updateMorphSequence(
          morphSequence: _painter.morphSequence,
          polygons: widget._indicatorPolygons,
          circularSequence: true,
          forEachPolygon: widget.forEachPolygon,
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
        forEachPolygon: widget.forEachPolygon,
      )
      ..morphScaleFactor = _calculateMorphScaleFactor(
        widget._indicatorPolygons,
      );
    _controller.morphSequenceLength = _painter.morphSequence.length;
  }

  @override
  Widget build(BuildContext context) {
    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final containerColor =
        widget.containerColor ?? loadingIndicatorTheme.containedContainerColor;

    _painter.color =
        widget.indicatorColor ??
        (widget.contained
            ? loadingIndicatorTheme.containedIndicatorColor
            : loadingIndicatorTheme.indicatorColor);
    _painter.outline = widget.indicatorOutline;

    return RepaintBoundary(
      child: Semantics(
        label: widget.semanticsLabel,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: _kContainerWidth,
            minHeight: _kContainerHeight,
          ),
          child: Surface(
            clipBehavior: widget.contained ? .antiAlias : .none,
            shape: widget.contained
                ? const CircleBorder()
                : const RoundedRectangleBorder(),
            color: widget.contained ? containerColor : null,
            elevation: widget.contained ? null : 0.0,
            shadowColor: widget.contained ? null : Colors.transparent,
            child: CustomPaint(painter: _painter, willChange: true),
          ),
        ),
      ),
    );
  }
}

class _IndeterminateLoadingIndicatorAnimationController extends ChangeNotifier {
  _IndeterminateLoadingIndicatorAnimationController({
    required TickerProvider vsync,
    required this._morphSequenceLength,
    this.debugLabel,
  }) {
    _ticker = vsync.createTicker(_tick);
  }

  Ticker? _ticker;

  void resync(TickerProvider vsync) {
    _ticker = vsync.createTicker(_tick)..absorbTicker(_ticker!);
  }

  int _morphSequenceLength;

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

  final String? debugLabel;

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

class _IndeterminateLoadingIndicatorPainter
    extends StatefulCustomPainter<_IndeterminateLoadingIndicatorPainter> {
  _IndeterminateLoadingIndicatorPainter({
    required this._color,
    required this._outline,
    required this._morphSequence,
    required this._morphScaleFactor,
    required this._controller,
  }) {
    _controller.addListener(notifyListeners);
  }

  Color _color;

  Color get color => _color;

  set color(Color value) {
    if (_color == value) return;
    _color = value;
    notifyListeners();
  }

  Outline _outline;

  Outline get outline => _outline;

  set outline(Outline value) {
    if (_outline == value) return;
    _outline = value;
    notifyListeners();
  }

  List<Morph> _morphSequence;

  List<Morph> get morphSequence => _morphSequence;

  set morphSequence(List<Morph> value) {
    if (_morphSequence == value) return;
    _morphSequence = value;
    notifyListeners();
  }

  double _morphScaleFactor;

  double get morphScaleFactor => _morphScaleFactor;

  set morphScaleFactor(double value) {
    if (_morphScaleFactor == value) return;
    _morphScaleFactor = value;
    notifyListeners();
  }

  _IndeterminateLoadingIndicatorAnimationController _controller;

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
      path: morphSequence[morphIndex].toPath(progress: morphProgress),
      scale: morphScaleFactor,
      rotation:
          morphProgress * _kQuarterRotation +
          morphRotationTargetAngle +
          globalRotation,
      matrix: _matrix,
    );

    final paint = Paint()
      ..style = .fill
      ..color = color;
    canvas.drawPath(path, paint);

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
  static RoundedPolygon defaultForEachPolygon(RoundedPolygon polygon) =>
      polygon.normalized();

  static Iterable<Morph> generateMorphSequence({
    required List<RoundedPolygon> polygons,
    required bool circularSequence,
    LoadingIndicatorForEachPolygon forEachPolygon = defaultForEachPolygon,
  }) sync* {
    if (polygons.isEmpty) return;
    final first = forEachPolygon(polygons[0]);
    var current = first;
    for (var i = 1; i < polygons.length; i++) {
      final next = forEachPolygon(polygons[i]);
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
    LoadingIndicatorForEachPolygon forEachPolygon = defaultForEachPolygon,
  }) {
    if (polygons.isEmpty) {
      morphSequence?.clear();
      return morphSequence ?? [];
    }
    final iterable = generateMorphSequence(
      polygons: polygons,
      circularSequence: circularSequence,
      forEachPolygon: forEachPolygon,
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

      final bounds = polygon.calculateBounds(approximate: approximate);
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

// TODO: implement controlled loading indicators

class LoadingIndicatorController {
  // TODO: this class manages LoadingIndicator animations
  //  and allows syncing multiple loading indicators together

  // TODO: add vsync here
}

class LoadingIndicatorPaint extends StatefulWidget {
  const LoadingIndicatorPaint({super.key, required this.controller});

  final LoadingIndicatorController controller;

  @override
  State<LoadingIndicatorPaint> createState() => _LoadingIndicatorPaintState();
}

// The widget is theoretically stateless but we still need a state (probably).
class _LoadingIndicatorPaintState extends State<LoadingIndicatorPaint> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
