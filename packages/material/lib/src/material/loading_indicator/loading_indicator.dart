import 'dart:async';
import 'dart:math' as math;

import 'package:material/material_shapes.dart';
import 'package:material/src/material/flutter.dart';

const _kContainerWidth = 48.0;
const _kContainerHeight = 48.0;
const _kIndicatorSize = 38.0;
final _kActiveIndicatorScale =
    _kIndicatorSize / math.min(_kContainerWidth, _kContainerHeight);

const _kFullRotationAngle = math.pi * 2.0;
const _kSingleRotationAngle = math.pi * 3.0 / 4.0;
const _kLinearRotationAngle = math.pi / 4.0;
const _kMorphRotationAngle = _kSingleRotationAngle - _kLinearRotationAngle;

// The following constants are used in the Compose implementation:
// const _kGlobalRotationDurationMs = 4666;
// const _kMorphIntervalMs = 650;
// const _kFullRotation = 2.0 * math.pi;
// const _kQuarterRotation = _kFullRotation / 4.0;

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

typedef ForEachPolygon = RoundedPolygon Function(RoundedPolygon polygon);

class DeterminateLoadingIndicator extends StatefulWidget {
  const DeterminateLoadingIndicator({
    super.key,
    required this.contained,
    required this.progress,
    this.indicatorPolygons,
    this.containerColor,
    this.indicatorColor,
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

  final ForEachPolygon forEachPolygon;

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

  void _updateMorphScaleFactor(List<RoundedPolygon> indicatorPolygons) {
    _morphScaleFactor =
        LoadingIndicatorUtils.calculateScaleFactor(widget._indicatorPolygons) *
        _kActiveIndicatorScale;
  }

  @override
  void initState() {
    super.initState();
    _morphSequence = LoadingIndicatorUtils.updateMorphSequence(
      polygons: widget._indicatorPolygons,
      circularSequence: false,
      forEachPolygon: widget.forEachPolygon,
    );
    _updateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  void didUpdateWidget(covariant DeterminateLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget._indicatorPolygons, oldWidget._indicatorPolygons) ||
        widget.forEachPolygon != oldWidget.forEachPolygon) {
      _morphSequence = LoadingIndicatorUtils.updateMorphSequence(
        morphSequence: _morphSequence,
        polygons: widget._indicatorPolygons,
        circularSequence: false,
        forEachPolygon: widget.forEachPolygon,
      );
      _updateMorphScaleFactor(widget._indicatorPolygons);
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    _morphSequence = LoadingIndicatorUtils.updateMorphSequence(
      morphSequence: _morphSequence,
      polygons: widget._indicatorPolygons,
      circularSequence: false,
      forEachPolygon: widget.forEachPolygon,
    );
    _updateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);

    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final indicatorColor =
        widget.indicatorColor ??
        (widget.contained
            ? loadingIndicatorTheme.containedIndicatorColor
            : loadingIndicatorTheme.indicatorColor);

    final containerColor =
        widget.containerColor ?? loadingIndicatorTheme.containedContainerColor;

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
          child: Material.raw(
            clipBehavior: widget.contained ? .antiAlias : .none,
            shape: widget.contained
                ? CornersBorder.rounded(
                    corners: Corners.all(shapeTheme.corner.full),
                  )
                : const RoundedRectangleBorder(),
            color: widget.contained ? containerColor : Colors.transparent,
            elevation: widget.contained ? elevationTheme.level0 : 0.0,
            shadowColor: widget.contained
                ? colorTheme.shadow
                : Colors.transparent,
            child: CustomPaint(
              isComplex: true,
              willChange: false,
              painter: _DeterminateLoadingIndicatorPainter(
                currentMorph: currentMorph,
                morphScaleFactor: _morphScaleFactor,
                adjustedProgressValue: adjustedProgressValue,
                rotation: rotation,
                indicatorColor: indicatorColor,
                matrix: _matrix,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeterminateLoadingIndicatorPainter extends CustomPainter {
  _DeterminateLoadingIndicatorPainter({
    required this.currentMorph,
    required this.morphScaleFactor,
    required this.adjustedProgressValue,
    required this.rotation,
    required this.indicatorColor,
    this.matrix,
  });

  final Morph currentMorph;
  final double morphScaleFactor;
  final double adjustedProgressValue;
  final double rotation;
  final Color indicatorColor;
  final Matrix4? matrix;

  @override
  void paint(Canvas canvas, Size size) {
    LoadingIndicatorUtils.paintPathWithTransform(
      canvas: canvas,
      size: size,
      path: currentMorph.toPath(
        progress: adjustedProgressValue,
        startAngle: 0.0,
      ),
      scale: morphScaleFactor,
      rotation: rotation,
      matrix: matrix,
      paint: Paint()..color = indicatorColor,
    );
  }

  @override
  bool shouldRepaint(_DeterminateLoadingIndicatorPainter oldDelegate) =>
      currentMorph != oldDelegate.currentMorph ||
      morphScaleFactor != oldDelegate.morphScaleFactor ||
      adjustedProgressValue != oldDelegate.adjustedProgressValue ||
      rotation != oldDelegate.rotation ||
      indicatorColor != oldDelegate.indicatorColor ||
      matrix != oldDelegate.matrix;
}

class IndeterminateLoadingIndicator extends StatefulWidget {
  const IndeterminateLoadingIndicator({
    super.key,
    required this.contained,
    this.indicatorPolygons,
    this.indicatorColor,
    this.containerColor,
    this.semanticsLabel,
    this.forEachPolygon = LoadingIndicatorUtils.defaultForEachPolygon,
  }) : assert(
         indicatorPolygons == null || indicatorPolygons.length >= 2,
         "indicatorPolygons should have, at least, two RoundedPolygons",
       );

  final bool contained;

  final List<RoundedPolygon>? indicatorPolygons;

  final Color? indicatorColor;

  final Color? containerColor;

  final String? semanticsLabel;

  final ForEachPolygon forEachPolygon;

  List<RoundedPolygon> get _indicatorPolygons =>
      indicatorPolygons ?? _indeterminateIndicatorPolygons;

  @override
  State<IndeterminateLoadingIndicator> createState() =>
      _IndeterminateLoadingIndicatorState();
}

class _IndeterminateLoadingIndicatorState
    extends State<IndeterminateLoadingIndicator>
    with SingleTickerProviderStateMixin {
  final _matrix = Matrix4.zero();

  final _globalAngle = ValueNotifier<double>(0.0);
  final _morphIndex = ValueNotifier<int>(0);

  late List<Morph> _morphSequence;
  late double _morphScaleFactor;

  late AnimationController _controller;

  late Animation<double> _rotation;

  late Animation<double> _scale;

  late Animation<double> _morphProgress;

  void _updateMorphScaleFactor(List<RoundedPolygon> indicatorPolygons) {
    _morphScaleFactor =
        LoadingIndicatorUtils.calculateScaleFactor(widget._indicatorPolygons) *
        _kActiveIndicatorScale;
  }

  void _statusListener(AnimationStatus status) {
    if (status != .completed) return;
    _globalAngle.value =
        (_globalAngle.value + _kSingleRotationAngle) % _kFullRotationAngle;
    _morphIndex.value = (_morphIndex.value + 1) % _morphSequence.length;
    unawaited(_controller.forward(from: 0.0));
  }

  @override
  void initState() {
    super.initState();

    _morphSequence = LoadingIndicatorUtils.updateMorphSequence(
      polygons: widget._indicatorPolygons,
      circularSequence: true,
      forEachPolygon: widget.forEachPolygon,
    );
    _updateMorphScaleFactor(widget._indicatorPolygons);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..addStatusListener(_statusListener);
    unawaited(_controller.forward());

    _rotation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _scale =
        TweenSequence<double>([
              TweenSequenceItem(
                tween: Tween<double>(begin: 1.0, end: 1.125),
                weight: 200.0 / 350.0,
              ),
              TweenSequenceItem(
                tween: Tween<double>(begin: 1.125, end: 1.0),
                weight: 150.0 / 350.0,
              ),
            ])
            .chain(
              CurveTween(curve: const Interval(300.0 / 650.0, 650.0 / 650.0)),
            )
            .animate(_controller);

    _morphProgress = Tween<double>(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(
            curve: const Interval(
              300.0 / 650.0,
              550.0 / 650.0,
              curve: Curves.easeOut,
            ),
          ),
        )
        .animate(_controller);
  }

  @override
  void didUpdateWidget(IndeterminateLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.indicatorPolygons, oldWidget.indicatorPolygons) ||
        widget.forEachPolygon != oldWidget.forEachPolygon) {
      _morphIndex.value = 0;
      _morphSequence = LoadingIndicatorUtils.updateMorphSequence(
        morphSequence: _morphSequence,
        polygons: widget._indicatorPolygons,
        circularSequence: true,
        forEachPolygon: widget.forEachPolygon,
      );
      _updateMorphScaleFactor(widget._indicatorPolygons);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _globalAngle.dispose();
    _morphIndex.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    _morphIndex.value = 0;
    _morphSequence = LoadingIndicatorUtils.updateMorphSequence(
      morphSequence: _morphSequence,
      polygons: widget._indicatorPolygons,
      circularSequence: true,
      forEachPolygon: widget.forEachPolygon,
    );
    _updateMorphScaleFactor(widget._indicatorPolygons);
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);

    final loadingIndicatorTheme = LoadingIndicatorTheme.of(context);

    final indicatorColor =
        widget.indicatorColor ??
        (widget.contained
            ? loadingIndicatorTheme.containedIndicatorColor
            : loadingIndicatorTheme.indicatorColor);

    final containerColor =
        widget.containerColor ?? loadingIndicatorTheme.containedContainerColor;

    return RepaintBoundary(
      child: Semantics(
        label: widget.semanticsLabel,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: _kContainerWidth,
            minHeight: _kContainerHeight,
          ),
          child: Material.raw(
            clipBehavior: widget.contained ? .antiAlias : .none,
            shape: widget.contained
                ? CornersBorder.rounded(
                    corners: Corners.all(shapeTheme.corner.full),
                  )
                : const RoundedRectangleBorder(),
            color: widget.contained ? containerColor : Colors.transparent,
            elevation: widget.contained ? elevationTheme.level0 : 0.0,
            shadowColor: widget.contained
                ? colorTheme.shadow
                : Colors.transparent,
            child: CustomPaint(
              willChange: true,
              painter: _IndeterminateLoadingIndicatorPainter(
                repaint: _controller,
                indicatorColor: indicatorColor,
                morphScaleFactor: _morphScaleFactor,
                morphs: _morphSequence,
                morphIndex: _morphIndex,
                globalAngle: _globalAngle,
                rotation: _rotation,
                scale: _scale,
                morphProgress: _morphProgress,
                matrix: _matrix,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IndeterminateLoadingIndicatorPainter extends CustomPainter {
  _IndeterminateLoadingIndicatorPainter({
    required super.repaint,
    required this.indicatorColor,
    required this.morphScaleFactor,
    required this.morphs,
    required this.morphIndex,
    required this.globalAngle,
    required this.rotation,
    required this.scale,
    required this.morphProgress,
    this.matrix,
  });

  final Color indicatorColor;

  final double morphScaleFactor;

  final List<Morph> morphs;

  final ValueListenable<int> morphIndex;

  final ValueListenable<double> globalAngle;

  final ValueListenable<double> rotation;

  final ValueListenable<double> scale;

  final ValueListenable<double> morphProgress;

  final Matrix4? matrix;

  @override
  void paint(Canvas canvas, Size size) {
    LoadingIndicatorUtils.paintPathWithTransform(
      canvas: canvas,
      size: size,
      path: morphs[morphIndex.value].toPath(progress: morphProgress.value),
      scale: morphScaleFactor * scale.value,
      rotation:
          globalAngle.value +
          _kLinearRotationAngle * rotation.value +
          _kMorphRotationAngle * morphProgress.value,
      matrix: matrix,
      paint: Paint()..color = indicatorColor,
    );
  }

  @override
  bool shouldRepaint(_IndeterminateLoadingIndicatorPainter oldDelegate) =>
      indicatorColor != oldDelegate.indicatorColor ||
      morphScaleFactor != oldDelegate.morphScaleFactor ||
      !listEquals(morphs, oldDelegate.morphs) ||
      morphIndex != oldDelegate.morphIndex ||
      globalAngle != oldDelegate.globalAngle ||
      rotation != oldDelegate.rotation ||
      scale != oldDelegate.scale ||
      morphProgress != oldDelegate.morphProgress ||
      matrix != oldDelegate.matrix;
}

abstract final class LoadingIndicatorUtils {
  static RoundedPolygon defaultForEachPolygon(RoundedPolygon polygon) =>
      polygon.normalized();

  static Iterable<Morph> generateMorphSequence({
    required List<RoundedPolygon> polygons,
    required bool circularSequence,
    ForEachPolygon forEachPolygon = defaultForEachPolygon,
  }) sync* {
    for (var i = 0; i < polygons.length; i++) {
      if (i + 1 < polygons.length) {
        yield Morph(
          forEachPolygon(polygons[i]),
          forEachPolygon(polygons[i + 1]),
        );
      } else if (circularSequence) {
        // Create a morph from the last shape to the first shape.
        yield Morph(forEachPolygon(polygons[i]), forEachPolygon(polygons[0]));
      }
    }
  }

  static List<Morph> updateMorphSequence({
    List<Morph>? morphSequence,
    required List<RoundedPolygon> polygons,
    required bool circularSequence,
    ForEachPolygon forEachPolygon = defaultForEachPolygon,
  }) {
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
