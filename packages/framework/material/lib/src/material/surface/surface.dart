import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:material/src/material/flutter.dart';

const _paintsEquality = ListEquality<SurfaceDecorationPaint>();

enum SurfaceMode { material, ink }

class Surface extends StatelessWidget {
  const Surface({
    super.key,
    required this.mode,
    this.position = .background,
    this.clipBehavior = .none,
    this.shape,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.child,
  });

  const Surface.material({
    super.key,
    this.position = .background,
    this.clipBehavior = .none,
    this.shape,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.child,
  }) : mode = .material;

  const Surface.ink({
    super.key,
    this.position = .background,
    this.clipBehavior = .none,
    this.shape,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.child,
  }) : mode = .ink;

  final SurfaceMode mode;

  final DecorationPosition position;

  final Clip clipBehavior;

  final OutlinedBorder? shape;

  final List<SurfaceDecoration> backgroundDecorations;

  final List<SurfaceDecoration> foregroundDecorations;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    var shape = this.shape;
    if (shape == null) {
      final shapeTheme = ShapeTheme.of(context);
      shape = shapeTheme.applyCorner(corner: shapeTheme.cornerNone);
    }
    return RawSurface(
      mode: mode,
      position: position,
      clipBehavior: clipBehavior,
      shape: shape,
      backgroundDecorations: backgroundDecorations,
      foregroundDecorations: foregroundDecorations,
      child: child,
    );
  }
}

class RawSurface extends StatefulWidget {
  const RawSurface({
    super.key,
    required this.mode,
    required this.position,
    required this.clipBehavior,
    required this.shape,
    required this.backgroundDecorations,
    required this.foregroundDecorations,
    this.child,
  });

  final SurfaceMode mode;

  final DecorationPosition position;

  final Clip clipBehavior;

  final OutlinedBorder shape;

  final List<SurfaceDecoration> backgroundDecorations;

  final List<SurfaceDecoration> foregroundDecorations;

  final Widget? child;

  @override
  State<RawSurface> createState() => _RawSurfaceState();
}

class _RawSurfaceState extends State<RawSurface> {
  @override
  Widget build(BuildContext context) {
    final clipBehavior = widget.clipBehavior;
    final shape = widget.shape;
    final backgroundDecorations = widget.backgroundDecorations
        .map((decoration) => decoration.resolve(context))
        .toList(growable: false);
    final foregroundDecorations = widget.foregroundDecorations
        .map((decoration) => decoration.resolve(context))
        .toList(growable: false);
    final isVisible = Visibility.of(context);
    final configuration = createLocalImageConfiguration(context);

    var result = switch (widget.position) {
      .background => _SurfaceInk(
        position: widget.position,
        clipBehavior: switch (widget.mode) {
          .material => .none,
          .ink => clipBehavior,
        },
        shape: shape,
        backgroundDecorations: backgroundDecorations,
        foregroundDecorations: foregroundDecorations,
        isVisible: isVisible,
        configuration: configuration,
        child: widget.child ?? const SizedBox.shrink(),
      ),
      .foreground => _SurfacePaint(
        clipBehavior: switch (widget.mode) {
          .material => .none,
          .ink => clipBehavior,
        },
        shape: shape,
        backgroundDecorations: backgroundDecorations,
        foregroundDecorations: foregroundDecorations,
        child: widget.child,
      ),
    };

    switch (widget.mode) {
      case .material:
        result = RawSurfaceMaterial(
          clipBehavior: clipBehavior,
          shape: shape,
          child: result,
        );
      case .ink:
    }

    return result;
  }
}

class _SurfaceInk extends StatefulWidget {
  const _SurfaceInk({
    super.key,
    required this.position,
    required this.clipBehavior,
    required this.shape,
    required this.backgroundDecorations,
    required this.foregroundDecorations,
    required this.isVisible,
    required this.configuration,
    required this.child,
  });

  final DecorationPosition position;
  final Clip clipBehavior;
  final OutlinedBorder shape;
  final List<SurfaceDecorationPaint> backgroundDecorations;
  final List<SurfaceDecorationPaint> foregroundDecorations;
  final bool isVisible;
  final ImageConfiguration configuration;
  final Widget child;

  @override
  State<_SurfaceInk> createState() => _SurfaceInkState();
}

class _SurfaceInkState extends State<_SurfaceInk> {
  final _referenceBoxKey = GlobalKey();

  _SurfaceInkFeature? _inkFeature;

  void _onRemoved() {
    _inkFeature = null;
  }

  @override
  void deactivate() {
    _inkFeature?.dispose();
    assert(_inkFeature == null);
    super.deactivate();
  }

  Widget _build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    if (_inkFeature case final inkFeature?) {
      inkFeature
        ..shape = widget.shape
        ..backgroundDecorations = widget.backgroundDecorations
        ..isVisible = widget.isVisible
        ..configuration = widget.configuration;
    } else {
      _inkFeature = .new(
        shape: widget.shape,
        backgroundDecorations: widget.backgroundDecorations,
        isVisible: widget.isVisible,
        configuration: widget.configuration,
        controller: RawSurfaceMaterial.of(context),
        referenceBox:
            _referenceBoxKey.currentContext!.findRenderObject()! as RenderBox,
        onRemoved: _onRemoved,
      );
    }
    return widget.child;
  }

  @override
  Widget build(BuildContext context) => _SurfacePaint(
    key: _referenceBoxKey,
    clipBehavior: widget.clipBehavior,
    shape: widget.shape,
    backgroundDecorations: const [],
    foregroundDecorations: widget.foregroundDecorations,
    child: widget.backgroundDecorations.isNotEmpty
        ? Builder(builder: _build)
        : widget.child,
  );
}

class _SurfaceInkFeature extends InkFeature {
  _SurfaceInkFeature({
    required this._shape,
    required this._backgroundDecorations,
    required this._isVisible,
    required this._configuration,
    required super.controller,
    required super.referenceBox,
    required super.onRemoved,
  }) {
    controller.addInkFeature(this);
  }

  OutlinedBorder _shape;
  OutlinedBorder get shape => _shape;
  set shape(OutlinedBorder value) {
    if (_shape == value) return;
    _shape = value;
    controller.markNeedsPaint();
  }

  List<SurfaceDecorationPaint> _backgroundDecorations;
  List<SurfaceDecorationPaint> get backgroundDecorations =>
      _backgroundDecorations;
  set backgroundDecorations(List<SurfaceDecorationPaint> value) {
    if (_paintsEquality.equals(_backgroundDecorations, value)) return;
    final oldBackgroundDecorations = _backgroundDecorations;
    _backgroundDecorations = value;
    if (_backgroundPaintersCache case final oldBackgroundPainters?) {
      SurfaceDecorationHelper.updatePainters(
        oldBackgroundPainters,
        oldDecorations: oldBackgroundDecorations,
        newDecorations: _backgroundDecorations,
        createPainter: _createPainter,
      );
    }
    controller.markNeedsPaint();
  }

  bool _isVisible;
  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    if (_isVisible == value) return;
    _isVisible = value;
    controller.markNeedsPaint();
  }

  ImageConfiguration _configuration;
  ImageConfiguration get configuration => _configuration;
  set configuration(ImageConfiguration value) {
    if (_configuration == value) return;
    _configuration = value;
    controller.markNeedsPaint();
  }

  List<SurfaceDecorationPainterBase>? _backgroundPaintersCache;
  List<SurfaceDecorationPainterBase> get _backgroundPainters =>
      _backgroundPaintersCache ??= backgroundDecorations
          .map(_createPainter)
          .toList();

  SurfaceDecorationPainterBase _createPainter(SurfaceDecorationPaint paint) =>
      switch (paint) {
        EagerSurfaceDecorationPaint() => paint,
        LazySurfaceDecorationPaint() => paint.createPainter(_onChanged),
      };

  void _onChanged() {
    controller.markNeedsPaint();
  }

  void _paint(Canvas canvas, Rect rect, ImageConfiguration configuration) {
    for (final painter in _backgroundPainters) {
      painter.paint(canvas, rect, shape, configuration);
    }
  }

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    if (!isVisible || backgroundDecorations.isEmpty) return;

    final size = referenceBox.size;
    final sizedConfiguration = configuration.copyWith(size: size);

    if (MatrixUtils.getAsTranslation(transform) case final originOffset?) {
      _paint(canvas, originOffset & size, sizedConfiguration);
    } else {
      canvas
        ..save()
        ..transform(transform.storage);
      _paint(canvas, Offset.zero & size, sizedConfiguration);
      canvas.restore();
    }
  }

  @override
  void dispose() {
    _backgroundPaintersCache?.forEach(SurfaceDecorationHelper.dispose);
    super.dispose();
  }
}

class _SurfacePaint extends SingleChildRenderObjectWidget {
  const _SurfacePaint({
    super.key,
    required this.clipBehavior,
    required this.shape,
    required this.backgroundDecorations,
    required this.foregroundDecorations,
    super.child,
  });

  final Clip clipBehavior;
  final OutlinedBorder shape;
  final List<SurfaceDecorationPaint> backgroundDecorations;
  final List<SurfaceDecorationPaint> foregroundDecorations;

  @override
  _RenderSurfacePaint createRenderObject(BuildContext context) => .new(
    clipBehavior: clipBehavior,
    shape: shape,
    backgroundDecorations: backgroundDecorations,
    foregroundDecorations: foregroundDecorations,
    configuration: createLocalImageConfiguration(context),
  );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSurfacePaint renderObject,
  ) {
    renderObject
      ..clipBehavior = clipBehavior
      ..shape = shape
      ..backgroundDecorations = backgroundDecorations
      ..foregroundDecorations = foregroundDecorations
      ..configuration = createLocalImageConfiguration(context);
  }
}

class _RenderSurfacePaint extends RenderProxyBox {
  _RenderSurfacePaint({
    required this._clipBehavior,
    required this._shape,
    required this._backgroundDecorations,
    required this._foregroundDecorations,
    required this._configuration,
    RenderBox? child,
  }) : super(child);

  Clip _clipBehavior;
  Clip get clipBehavior => _clipBehavior;
  set clipBehavior(Clip value) {
    if (_clipBehavior == value) return;
    _clipBehavior = value;
    markNeedsPaint();
  }

  OutlinedBorder _shape;
  OutlinedBorder get shape => _shape;
  set shape(OutlinedBorder value) {
    if (_shape == value) return;
    _shape = value;
    _markNeedsClip();
  }

  List<SurfaceDecorationPaint> _backgroundDecorations;
  List<SurfaceDecorationPaint> get backgroundDecorations =>
      _backgroundDecorations;
  set backgroundDecorations(List<SurfaceDecorationPaint> value) {
    if (_paintsEquality.equals(_backgroundDecorations, value)) return;
    final oldBackgroundDecorations = _backgroundDecorations;
    _backgroundDecorations = value;
    if (_backgroundPaintersCache case final oldBackgroundPainters?) {
      SurfaceDecorationHelper.updatePainters(
        oldBackgroundPainters,
        oldDecorations: oldBackgroundDecorations,
        newDecorations: _backgroundDecorations,
        createPainter: _createPainter,
      );
    }
    markNeedsPaint();
  }

  List<SurfaceDecorationPaint> _foregroundDecorations;
  List<SurfaceDecorationPaint> get foregroundDecorations =>
      _foregroundDecorations;
  set foregroundDecorations(List<SurfaceDecorationPaint> value) {
    if (_paintsEquality.equals(_foregroundDecorations, value)) return;
    final oldForegroundDecorations = _foregroundDecorations;
    _foregroundDecorations = value;
    if (_foregroundPaintersCache case final oldForegroundPainters?) {
      SurfaceDecorationHelper.updatePainters(
        oldForegroundPainters,
        oldDecorations: oldForegroundDecorations,
        newDecorations: _foregroundDecorations,
        createPainter: _createPainter,
      );
    }
    markNeedsPaint();
  }

  ImageConfiguration _configuration;
  ImageConfiguration get configuration => _configuration;
  set configuration(ImageConfiguration value) {
    if (_configuration == value) return;
    final oldTextDirection = _configuration.textDirection;
    _configuration = value;
    final newTextDirection = _configuration.textDirection;
    if (oldTextDirection != newTextDirection) {
      _markNeedsClip();
    } else {
      markNeedsPaint();
    }
  }

  Path? _clipPathCache;
  Path get _clipPath => _clipPathCache ??= shape.getOuterPath(
    Offset.zero & size,
    textDirection: configuration.textDirection,
  );

  List<SurfaceDecorationPainterBase>? _backgroundPaintersCache;
  List<SurfaceDecorationPainterBase> get _backgroundPainters =>
      _backgroundPaintersCache ??= backgroundDecorations
          .map(_createPainter)
          .toList();

  List<SurfaceDecorationPainterBase>? _foregroundPaintersCache;
  List<SurfaceDecorationPainterBase> get _foregroundPainters =>
      _foregroundPaintersCache ??= foregroundDecorations
          .map(_createPainter)
          .toList();

  SurfaceDecorationPainterBase _createPainter(SurfaceDecorationPaint paint) =>
      switch (paint) {
        EagerSurfaceDecorationPaint() => paint,
        LazySurfaceDecorationPaint() => paint.createPainter(markNeedsPaint),
      };

  void _markNeedsClip() {
    _clipPathCache = null;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  void detach() {
    _clipPathCache = null;
    _backgroundPaintersCache?.forEach(SurfaceDecorationHelper.dispose);
    _backgroundPaintersCache = null;
    _foregroundPaintersCache?.forEach(SurfaceDecorationHelper.dispose);
    _foregroundPaintersCache = null;
    super.detach();
    markNeedsPaint();
  }

  @override
  void dispose() {
    _backgroundPaintersCache?.forEach(SurfaceDecorationHelper.dispose);
    _foregroundPaintersCache?.forEach(SurfaceDecorationHelper.dispose);
    super.dispose();
  }

  @override
  void performLayout() {
    final oldSize = hasSize ? size : null;
    super.performLayout();
    if (oldSize != size) {
      _clipPathCache = null;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final rect = offset & size;

    if (backgroundDecorations.any(SurfaceDecorationHelper.isComplex) ||
        foregroundDecorations.any(SurfaceDecorationHelper.isComplex)) {
      context.setIsComplexHint();
    }

    for (final painter in _backgroundPainters) {
      painter.paint(context.canvas, rect, shape, configuration);
    }

    if (child case final child?) {
      if (clipBehavior != .none) {
        layer = context.pushClipPath(
          needsCompositing,
          offset,
          Offset.zero & size,
          _clipPath,
          (context, offset) {
            context.paintChild(child, offset);
          },
          clipBehavior: clipBehavior,
          oldLayer: layer as ClipPathLayer?,
        );
        assert(() {
          layer?.debugCreator = debugCreator;
          return true;
        }());
      } else {
        context.paintChild(child, offset);
        layer = null;
      }
    } else {
      layer = null;
    }

    for (final painter in _foregroundPainters) {
      painter.paint(context.canvas, rect, shape, configuration);
    }
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (clipBehavior != .none && !_clipPath.contains(position)) {
      return false;
    }
    return super.hitTest(result, position: position);
  }

  @override
  Rect? describeApproximatePaintClip(covariant RenderObject child) =>
      switch (clipBehavior) {
        .none => null,
        .hardEdge ||
        .antiAlias ||
        .antiAliasWithSaveLayer => Offset.zero & size,
      };
}

abstract final class SurfaceDecorationHelper {
  static bool isComplex(SurfaceDecorationPaint paint) => paint.isComplex;

  static bool dispose(SurfaceDecorationPainterBase painter) {
    switch (painter) {
      case EagerSurfaceDecorationPaint():
        return false;
      case SurfaceDecorationPainter():
        painter.dispose();
        return true;
    }
  }

  static void updatePainters(
    List<SurfaceDecorationPainterBase> painters, {
    required List<SurfaceDecorationPaint> oldDecorations,
    required List<SurfaceDecorationPaint> newDecorations,
    required SurfaceDecorationPainterBase Function(SurfaceDecorationPaint)
    createPainter,
  }) {
    assert(painters.length == oldDecorations.length);
    assert(!identical(newDecorations, oldDecorations));

    final newSize = newDecorations.length;
    if (newSize == 0) {
      painters
        ..forEach(dispose)
        ..clear();
      return;
    }

    final oldSize = painters.length;
    if (oldSize == 0) {
      for (final paint in newDecorations) {
        painters.add(createPainter(paint));
      }
      return;
    }

    var start = 0;
    while (start < oldSize &&
        start < newSize &&
        oldDecorations[start] == newDecorations[start]) {
      start++;
    }

    if (start == oldSize) {
      for (var i = start; i < newSize; i++) {
        painters.add(createPainter(newDecorations[i]));
      }
      return;
    }

    if (start == newSize) {
      for (var i = start; i < oldSize; i++) {
        dispose(painters[i]);
      }
      painters.length = newSize;
      return;
    }

    var oldEnd = oldSize - 1;
    var newEnd = newSize - 1;
    while (oldEnd >= start &&
        newEnd >= start &&
        oldDecorations[oldEnd] == newDecorations[newEnd]) {
      oldEnd--;
      newEnd--;
    }

    final oldMiddleSize = oldEnd - start + 1;
    final newMiddleSize = newEnd - start + 1;

    final middlePainters = <SurfaceDecorationPainterBase>[];

    // TODO: try different values here, maybe bring down to 6?
    const linearSearchThreshold = 8;

    if (oldMiddleSize <= linearSearchThreshold &&
        newMiddleSize <= linearSearchThreshold) {
      final used = List<bool>.filled(oldMiddleSize, false);

      for (var newIndex = start; newIndex <= newEnd; newIndex++) {
        final paint = newDecorations[newIndex];
        SurfaceDecorationPainterBase? painter;

        for (var i = 0; i < oldMiddleSize; i++) {
          if (used[i]) continue;

          final oldIndex = start + i;
          if (oldDecorations[oldIndex] == paint) {
            used[i] = true;
            painter = painters[oldIndex];
            break;
          }
        }

        middlePainters.add(painter ?? createPainter(paint));
      }

      for (var i = 0; i < oldMiddleSize; i++) {
        if (!used[i]) {
          dispose(painters[start + i]);
        }
      }
    } else {
      final oldDecorationToPainters =
          HashMap<
            SurfaceDecorationPaint,
            ListQueue<SurfaceDecorationPainterBase>
          >();

      for (var i = start; i <= oldEnd; i++) {
        oldDecorationToPainters.update(
          oldDecorations[i],
          (queue) => queue..addLast(painters[i]),
          ifAbsent: () => ListQueue()..add(painters[i]),
        );
      }

      for (var i = start; i <= newEnd; i++) {
        final paint = newDecorations[i];
        final queue = oldDecorationToPainters[paint];

        if (queue == null || queue.isEmpty) {
          middlePainters.add(createPainter(paint));
          continue;
        }

        middlePainters.add(queue.removeFirst());

        if (queue.isEmpty) {
          oldDecorationToPainters.remove(paint);
        }
      }

      for (final queue in oldDecorationToPainters.values) {
        queue.forEach(dispose);
      }
    }

    final suffix = painters.sublist(oldEnd + 1);

    painters
      ..length = start
      ..addAll(middlePainters)
      ..addAll(suffix);

    assert(painters.length == newSize);
  }
}
