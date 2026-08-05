// TODO: class SurfacePaintingContext

import 'package:material/src/material/flutter.dart';

abstract class SurfacePaintingContext {
  const SurfacePaintingContext();

  Canvas get canvas;
}

@immutable
abstract class SurfaceDecoration with Diagnosticable {
  const SurfaceDecoration();

  const factory SurfaceDecoration.elevationShadow(
    double elevation, {
    Color? color,
    bool transparentOccluder,
  }) = SurfaceElevationShadow;

  const factory SurfaceDecoration.fillColor(
    Color color, {
    BlendMode blendMode,
  }) = SurfaceColorFill;

  const factory SurfaceDecoration.fillGradient(
    Gradient gradient, {
    BlendMode blendMode,
  }) = SurfaceGradientFill;

  const factory SurfaceDecoration.fillImage(
    DecorationImage image, {
    BlendMode blendMode,
  }) = SurfaceImageFill;

  const factory SurfaceDecoration.borderSide(BorderSide side) =
      SurfaceBorderSide;

  const factory SurfaceDecoration.outline(Outline outline) = SurfaceOutline;

  SurfaceDecorationPaint resolve(BuildContext context);

  @protected
  SurfaceDecoration? lerpFrom(SurfaceDecoration? a, double t) => null;

  @protected
  SurfaceDecoration? lerpTo(SurfaceDecoration? b, double t) => null;

  @override
  String toStringShort() => objectRuntimeType(this, "SurfaceDecoration");

  static SurfaceDecoration? lerp(
    SurfaceDecoration? a,
    SurfaceDecoration? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    if (a == null) return b!.lerpFrom(null, t) ?? b;
    if (b == null) return a.lerpTo(null, t) ?? a;
    if (t == 0.0) return a;
    if (t == 1.0) return b;
    return b.lerpFrom(a, t) ??
        a.lerpTo(b, t) ??
        (t < 0.5
            ? a.lerpTo(null, t * 2.0) ?? a
            : b.lerpFrom(null, (t - 0.5) * 2.0) ?? b);
  }
}

@immutable
sealed class SurfaceDecorationPaint
    with Diagnosticable
    implements SurfaceDecoration {
  const SurfaceDecorationPaint();

  bool get isComplex => false;

  @override
  SurfaceDecorationPaint resolve(BuildContext context) => this;

  @protected
  @override
  SurfaceDecorationPaint? lerpFrom(SurfaceDecoration? a, double t) => null;

  @protected
  @override
  SurfaceDecorationPaint? lerpTo(SurfaceDecoration? b, double t) => null;

  @override
  String toStringShort() => objectRuntimeType(this, "SurfaceDecorationPaint");
}

abstract class LazySurfaceDecorationPaint extends SurfaceDecorationPaint {
  const LazySurfaceDecorationPaint();

  @factory
  SurfaceDecorationPainter createPainter(VoidCallback onChanged);
}

sealed class SurfaceDecorationPainterBase {
  const SurfaceDecorationPainterBase();

  void paint(
    Canvas canvas,
    Rect rect,
    OutlinedBorder shape,
    ImageConfiguration configuration,
  );
}

abstract class EagerSurfaceDecorationPaint extends SurfaceDecorationPaint
    implements SurfaceDecorationPainterBase {
  const EagerSurfaceDecorationPaint();
}

abstract class SurfaceDecorationPainter
    implements SurfaceDecorationPainterBase {
  const SurfaceDecorationPainter(this.onChanged);

  final VoidCallback onChanged;

  @mustCallSuper
  void dispose() {}

  @override
  String toString() => describeIdentity(this);
}
