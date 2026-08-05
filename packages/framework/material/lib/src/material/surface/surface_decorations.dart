import 'package:material/src/material/flutter.dart';

class SurfaceElevationShadow extends SurfaceDecoration {
  const SurfaceElevationShadow(
    this.elevation, {
    this.color,
    this.transparentOccluder = false,
  }) : assert(elevation >= 0.0);

  final double elevation;
  final Color? color;
  final bool transparentOccluder;

  @override
  SurfaceElevationShadowPaint resolve(BuildContext context) => .new(
    elevation: elevation,
    color: color ?? ColorScheme.of(context).shadow,
    transparentOccluder: transparentOccluder,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty("elevation", elevation))
      ..add(ColorProperty("color", color, defaultValue: null))
      ..add(
        FlagProperty(
          "transparentOccluder",
          value: transparentOccluder,
          defaultValue: false,
        ),
      );
  }
}

class SurfaceElevationShadowPaint extends LazySurfaceDecorationPaint
    implements SurfaceElevationShadow {
  const SurfaceElevationShadowPaint({
    required this.elevation,
    required this.color,
    this.transparentOccluder = false,
  }) : assert(elevation >= 0.0);

  @override
  final double elevation;

  @override
  final Color color;

  @override
  final bool transparentOccluder;

  @override
  SurfaceElevationShadowPaint resolve(BuildContext context) => this;

  @override
  SurfaceDecorationPainter createPainter(VoidCallback onChanged) =>
      _SurfaceElevationShadowPainter(this, onChanged);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty("elevation", elevation))
      ..add(ColorProperty("color", color))
      ..add(
        FlagProperty(
          "transparentOccluder",
          value: transparentOccluder,
          defaultValue: false,
        ),
      );
  }
}

class _SurfaceElevationShadowPainter extends SurfaceDecorationPainter {
  _SurfaceElevationShadowPainter(this._decoration, super.onChanged);

  final SurfaceElevationShadowPaint _decoration;

  Rect? _lastRect;
  OutlinedBorder? _lastShape;
  TextDirection? _lastTextDirection;
  late Path _shadowPath;

  void _precache(
    Rect rect,
    OutlinedBorder shape,
    TextDirection? textDirection,
  ) {
    if (rect == _lastRect &&
        shape == _lastShape &&
        textDirection == _lastTextDirection) {
      return;
    }

    _shadowPath = shape.getOuterPath(rect, textDirection: textDirection);

    _lastRect = rect;
    _lastShape = shape;
    _lastTextDirection = textDirection;
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration,
  ) {
    final elevation = _decoration.elevation;
    final color = _decoration.color;
    if (elevation > 0.0 && color.a > 0.0) {
      _precache(rect, shape, configuration.textDirection);

      var paintShadow = true;
      assert(() {
        if (debugDisableShadows) {
          canvas.drawPath(
            _shadowPath,
            Paint()
              ..style = .stroke
              ..color = color
              ..strokeWidth = 2.0 * elevation,
          );
          paintShadow = false;
        }
        return true;
      }());

      if (paintShadow) {
        final transparentOccluder = _decoration.transparentOccluder;
        canvas.drawShadow(_shadowPath, color, elevation, transparentOccluder);
      }
    }
  }
}

class SurfaceColorFill extends LazySurfaceDecorationPaint {
  const SurfaceColorFill(this.color, {this.blendMode = .srcOver});

  final Color color;

  final BlendMode blendMode;

  @override
  SurfaceDecorationPainter createPainter(VoidCallback onChanged) =>
      _SurfaceColorFillPainter(this, onChanged);

  @override
  SurfaceDecorationPaint? lerpFrom(SurfaceDecoration? a, double t) {
    if (a is SurfaceColorFill) {
      return SurfaceColorFill(
        Color.lerp(a.color, color, t)!,
        blendMode: t < 0.5 ? a.blendMode : blendMode,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  SurfaceDecorationPaint? lerpTo(SurfaceDecoration? b, double t) {
    if (b is SurfaceColorFill) {
      return SurfaceColorFill(
        Color.lerp(color, b.color, t)!,
        blendMode: t < 0.5 ? blendMode : b.blendMode,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("color", color))
      ..add(
        EnumProperty<BlendMode>(
          "blendMode",
          blendMode,
          defaultValue: BlendMode.srcOver,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SurfaceColorFill &&
          color == other.color &&
          blendMode == other.blendMode;

  @override
  int get hashCode => Object.hash(color, blendMode);
}

class _SurfaceColorFillPainter extends SurfaceDecorationPainter {
  _SurfaceColorFillPainter(this._fill, super.onChanged);

  final SurfaceColorFill _fill;

  Rect? _lastRect;
  OutlinedBorder? _lastShape;
  TextDirection? _lastTextDirection;
  Path? _interiorPath;
  Paint? _interiorPaint;

  void _precache(
    Rect rect,
    OutlinedBorder shape,
    TextDirection? textDirection,
  ) {
    if (rect == _lastRect &&
        shape == _lastShape &&
        textDirection == _lastTextDirection) {
      return;
    }

    _interiorPaint ??= Paint()
      ..style = .fill
      ..color = _fill.color
      ..blendMode = _fill.blendMode;

    _interiorPath = shape.preferPaintInterior
        ? null
        : shape.getOuterPath(rect, textDirection: textDirection);

    _lastRect = rect;
    _lastShape = shape;
    _lastTextDirection = textDirection;
  }

  void _paintInterior(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    TextDirection? textDirection,
  ) {
    if (_interiorPaint case final interiorPaint?) {
      if (shape.preferPaintInterior) {
        shape.paintInterior(
          canvas,
          rect,
          interiorPaint,
          textDirection: textDirection,
        );
      } else {
        assert(_interiorPath != null);
        canvas.drawPath(_interiorPath!, interiorPaint);
      }
    }
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration, {
    double? elevation,
  }) {
    final textDirection = configuration.textDirection;
    _precache(rect, shape, textDirection);
    _paintInterior(canvas, rect, shape, textDirection);
  }
}

class SurfaceGradientFill extends LazySurfaceDecorationPaint {
  const SurfaceGradientFill(this.gradient, {this.blendMode = .srcOver});

  final Gradient gradient;

  final BlendMode blendMode;

  @override
  SurfaceDecorationPainter createPainter(VoidCallback onChanged) =>
      _SurfaceGradientFillPainter(this, onChanged);

  @override
  SurfaceDecorationPaint? lerpFrom(SurfaceDecoration? a, double t) {
    if (a is SurfaceGradientFill) {
      return SurfaceGradientFill(
        Gradient.lerp(a.gradient, gradient, t)!,
        blendMode: t < 0.5 ? a.blendMode : blendMode,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  SurfaceDecorationPaint? lerpTo(SurfaceDecoration? b, double t) {
    if (b is SurfaceGradientFill) {
      return SurfaceGradientFill(
        Gradient.lerp(gradient, b.gradient, t)!,
        blendMode: t < 0.5 ? blendMode : b.blendMode,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Gradient>("gradient", gradient))
      ..add(
        EnumProperty<BlendMode>(
          "blendMode",
          blendMode,
          defaultValue: BlendMode.srcOver,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SurfaceGradientFill &&
          gradient == other.gradient &&
          blendMode == other.blendMode;

  @override
  int get hashCode => Object.hash(gradient, blendMode);
}

class _SurfaceGradientFillPainter extends SurfaceDecorationPainter {
  _SurfaceGradientFillPainter(this._fill, super.onChanged);

  final SurfaceGradientFill _fill;

  Rect? _lastRect;
  OutlinedBorder? _lastShape;
  TextDirection? _lastTextDirection;
  Path? _interiorPath;
  Paint? _interiorPaint;

  void _precache(
    Rect rect,
    OutlinedBorder shape,
    TextDirection? textDirection,
  ) {
    if (rect == _lastRect &&
        shape == _lastShape &&
        textDirection == _lastTextDirection) {
      return;
    }

    final interiorPaint = _interiorPaint ??= Paint()
      ..style = .fill
      ..blendMode = _fill.blendMode;

    // ignore: cascade_invocations
    interiorPaint.shader = _fill.gradient.createShader(
      rect,
      textDirection: textDirection,
    );

    _interiorPath = shape.preferPaintInterior
        ? null
        : shape.getOuterPath(rect, textDirection: textDirection);

    _lastRect = rect;
    _lastShape = shape;
    _lastTextDirection = textDirection;
  }

  void _paintInterior(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    TextDirection? textDirection,
  ) {
    if (_interiorPaint case final interiorPaint?) {
      if (shape.preferPaintInterior) {
        shape.paintInterior(
          canvas,
          rect,
          interiorPaint,
          textDirection: textDirection,
        );
      } else {
        assert(_interiorPath != null);
        canvas.drawPath(_interiorPath!, interiorPaint);
      }
    }
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration, {
    double? elevation,
  }) {
    final textDirection = configuration.textDirection;
    _precache(rect, shape, textDirection);
    _paintInterior(canvas, rect, shape, textDirection);
  }
}

class SurfaceImageFill extends LazySurfaceDecorationPaint {
  const SurfaceImageFill(this.image, {this.blendMode = .srcOver});

  final DecorationImage image;

  final BlendMode blendMode;

  @override
  SurfaceDecorationPainter createPainter(VoidCallback onChanged) =>
      _SurfaceImageFillPainter(this, onChanged);

  @override
  SurfaceDecorationPaint? lerpFrom(SurfaceDecoration? a, double t) {
    if (a is SurfaceImageFill) {
      return SurfaceImageFill(
        DecorationImage.lerp(a.image, image, t)!,
        blendMode: t < 0.5 ? a.blendMode : blendMode,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  SurfaceDecorationPaint? lerpTo(SurfaceDecoration? b, double t) {
    if (b is SurfaceImageFill) {
      return SurfaceImageFill(
        DecorationImage.lerp(image, b.image, t)!,
        blendMode: t < 0.5 ? blendMode : b.blendMode,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<DecorationImage>("image", image))
      ..add(
        EnumProperty<BlendMode>(
          "blendMode",
          blendMode,
          defaultValue: BlendMode.srcOver,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SurfaceImageFill &&
          image == other.image &&
          blendMode == other.blendMode;

  @override
  int get hashCode => Object.hash(image, blendMode);
}

class _SurfaceImageFillPainter extends SurfaceDecorationPainter {
  _SurfaceImageFillPainter(this._fill, super.onChanged);

  final SurfaceImageFill _fill;

  Rect? _lastRect;
  OutlinedBorder? _lastShape;
  TextDirection? _lastTextDirection;
  Path? _clipPath;

  DecorationImagePainter? _imagePainterCache;
  DecorationImagePainter? get _imagePainter =>
      _imagePainterCache ??= _fill.image.createPainter(onChanged);

  void _precache(
    Rect rect,
    OutlinedBorder shape,
    TextDirection? textDirection,
  ) {
    if (rect == _lastRect &&
        shape == _lastShape &&
        textDirection == _lastTextDirection) {
      return;
    }

    _clipPath = shape.getOuterPath(rect, textDirection: textDirection);

    _lastRect = rect;
    _lastShape = shape;
    _lastTextDirection = textDirection;
  }

  void _paintImage(Canvas canvas, ImageConfiguration configuration) {
    _imagePainter?.paint(
      canvas,
      _lastRect!,
      _clipPath,
      configuration,
      blendMode: _fill.blendMode,
    );
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration, {
    double? elevation,
  }) {
    final textDirection = configuration.textDirection;
    _precache(rect, shape, textDirection);
    _paintImage(canvas, configuration);
  }

  @override
  void dispose() {
    _imagePainterCache?.dispose();
    super.dispose();
  }
}

class SurfaceBorderSide extends LazySurfaceDecorationPaint {
  const SurfaceBorderSide(this.side);

  final BorderSide side;

  @override
  SurfaceDecorationPainter createPainter(VoidCallback onChanged) =>
      _SurfaceBorderSidePainter(this, onChanged);

  @override
  SurfaceDecorationPaint? lerpFrom(SurfaceDecoration? a, double t) {
    if (a is SurfaceBorderSide) {
      return SurfaceBorderSide(BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  @override
  SurfaceDecorationPaint? lerpTo(SurfaceDecoration? b, double t) {
    if (b is SurfaceBorderSide) {
      return SurfaceBorderSide(BorderSide.lerp(side, b.side, t));
    }
    return super.lerpTo(b, t);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BorderSide>("side", side));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SurfaceBorderSide &&
          side == other.side;

  @override
  int get hashCode => side.hashCode;
}

class _SurfaceBorderSidePainter extends SurfaceDecorationPainter {
  _SurfaceBorderSidePainter(this._decoration, super.onChanged);

  final SurfaceBorderSide _decoration;

  OutlinedBorder? _lastShape;
  late ShapeBorder _outlinedShape;

  @override
  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration,
  ) {
    if (shape != _lastShape) {
      _outlinedShape = shape.copyWith(side: _decoration.side);
      _lastShape = shape;
    }
    _outlinedShape.paint(
      canvas,
      rect,
      textDirection: configuration.textDirection,
    );
  }
}

class SurfaceOutline extends LazySurfaceDecorationPaint {
  const SurfaceOutline(this.outline);

  final Outline outline;

  @override
  SurfaceDecorationPainter createPainter(VoidCallback onChanged) =>
      _SurfaceOutlinePainter(this, onChanged);

  @override
  SurfaceDecorationPaint? lerpFrom(SurfaceDecoration? a, double t) {
    if (a is SurfaceOutline) {
      return SurfaceOutline(Outline.lerp(a.outline, outline, t));
    }
    return super.lerpFrom(a, t);
  }

  @override
  SurfaceDecorationPaint? lerpTo(SurfaceDecoration? b, double t) {
    if (b is SurfaceOutline) {
      return SurfaceOutline(Outline.lerp(outline, b.outline, t));
    }
    return super.lerpTo(b, t);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Outline>("outline", outline));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is SurfaceOutline &&
          outline == other.outline;

  @override
  int get hashCode => outline.hashCode;
}

class _SurfaceOutlinePainter extends SurfaceDecorationPainter {
  _SurfaceOutlinePainter(this._decoration, super.onChanged);

  final SurfaceOutline _decoration;

  OutlinedBorder? _lastShape;
  late ShapeBorder _outlinedShape;

  @override
  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration,
  ) {
    if (shape != _lastShape) {
      _outlinedShape = _decoration.outline.apply(shape);
      _lastShape = shape;
    }
    _outlinedShape.paint(
      canvas,
      rect,
      textDirection: configuration.textDirection,
    );
  }
}
