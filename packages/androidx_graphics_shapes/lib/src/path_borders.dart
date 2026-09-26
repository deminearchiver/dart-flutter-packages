import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:androidx_graphics_shapes/androidx_graphics_shapes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart';

abstract class const DynamicPathBorder({
  super.side,

  /// See [Paint.strokeCap].
  final StrokeCap strokeCap = .butt,

  /// See [Paint.strokeJoin].
  final StrokeJoin strokeJoin = .miter,

  /// See [Paint.strokeMiterLimit].
  final double strokeMiterLimit = 4.0,
}) extends OutlinedBorder {
  @override
  DynamicPathBorder copyWith({
    BorderSide? side,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    double? strokeMiterLimit,
  });

  @override
  DynamicPathBorder scale(double t);

  @protected
  Path getPath(Rect rect, {TextDirection? textDirection});

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      getPath(rect, textDirection: textDirection);

  @override
  bool get preferPaintInterior => true;

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    final path = getPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == .none || side.width == 0.0 || side.color.a <= 0.0) return;
    final path = getPath(rect, textDirection: textDirection);
    paintPathStroke(
      canvas,
      path,
      side.color,
      strokeWidth: side.width,
      strokeAlign: side.strokeAlign,
      strokeCap: strokeCap,
      strokeJoin: strokeJoin,
      strokeMiterLimit: strokeMiterLimit,
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write(objectRuntimeType(this, "DynamicPathBorder"))
      ..write("($side");
    if (strokeCap != .butt) {
      buffer.write(", strokeCap: $strokeCap");
    }
    if (strokeJoin != .miter) {
      buffer.write(", strokeJoin: $strokeJoin");
    } else if (strokeMiterLimit != 4.0) {
      buffer.write(", strokeMiterLimit: $strokeMiterLimit");
    }
    buffer.write(")");
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is DynamicPathBorder &&
          side == other.side &&
          strokeCap == other.strokeCap &&
          strokeJoin == other.strokeJoin &&
          strokeMiterLimit == other.strokeMiterLimit;

  @override
  int get hashCode =>
      Object.hash(runtimeType, side, strokeCap, strokeJoin, strokeMiterLimit);

  static void paintPathStroke(
    Canvas canvas,
    Path path,
    Color color, {
    required double strokeWidth,
    double strokeAlign = 0.0,
    StrokeCap strokeCap = .butt,
    StrokeJoin strokeJoin = .miter,
    double strokeMiterLimit = 4.0,
  }) {
    // Early return if the stroke would be invisible.
    if (strokeWidth == 0.0 || color.a <= 0.0) return;

    // Explicitly set miter limit to 0 if not using miter.
    if (strokeJoin != .miter) strokeMiterLimit = 0.0;

    final paint = Paint()
      ..style = .stroke
      ..color = color
      ..strokeCap = strokeCap
      ..strokeJoin = strokeJoin
      ..strokeMiterLimit = strokeMiterLimit;

    // The most optimal path is when the stroke is center-aligned.
    // BorderSide.strokeAlignCenter is explicitly not used here.
    if (strokeAlign == 0.0) {
      paint.strokeWidth = strokeWidth;
      canvas.drawPath(path, paint);
      return;
    }

    // Inlined from [BorderSide].
    final strokeInset = strokeWidth * (1.0 - (1.0 + strokeAlign) / 2.0);
    final strokeOutset = strokeWidth * (1.0 + strokeAlign) / 2.0;

    final minOffset = math.min(strokeInset, strokeOutset);
    final maxOffset = math.max(strokeInset, strokeOutset);

    // Compute the minimum safe bounds for the layer and clip path.
    final maxMiterLength = math.max(maxOffset, maxOffset * strokeMiterLimit);
    final bounds = path.getBounds().inflate(maxMiterLength);

    // Save layer is needed for compound strokes with a translucent color.
    final needsSaveLayer =
        color.a < 1.0 && strokeInset > 0.0 && strokeOutset > 0.0;

    // Apply opacity to everything.
    if (needsSaveLayer) {
      canvas.saveLayer(
        bounds,
        Paint()..color = color.withValues(red: 0.0, green: 0.0, blue: 0.0),
      );
      paint.color = color.withValues(alpha: 1.0);
    }

    // Paint the lesser offset.
    if (minOffset > 0.0) {
      paint.strokeWidth = 2.0 * minOffset;
      canvas.drawPath(path, paint);
    }

    // Paint the greater offset.
    paint.strokeWidth = 2.0 * maxOffset;
    if (strokeInset > strokeOutset) {
      // Clip the inside of the path.
      canvas
        ..save()
        ..clipPath(path)
        ..drawPath(path, paint)
        ..restore();
    } else {
      // Clip the outside of the path.
      canvas
        ..save()
        ..clipPath(.combine(.difference, Path()..addRect(bounds), path))
        ..drawPath(path, paint)
        ..restore();
    }

    // Don't forget to restore the canvas if needed.
    if (needsSaveLayer) {
      canvas.restore();
    }
  }
}

abstract class const StaticPathBorder({
  super.side,
  super.strokeCap,
  super.strokeJoin,
  super.strokeMiterLimit,

  /// How much of the aspect ratio of the attached widget to take on.
  ///
  /// If [squash] is non-zero, the border will match the aspect ratio of the
  /// bounding box of the widget that it is attached to, which can give a
  /// squashed appearance.
  ///
  /// The [squash] parameter lets you control how much of that aspect ratio this
  /// border takes on.
  ///
  /// A value of zero means that the border will be drawn with a square aspect
  /// ratio at the size of the shortest side of the bounding rectangle, ignoring
  /// the aspect ratio of the widget, and a value of one means it will be drawn
  /// with the aspect ratio of the widget. The value of [squash] has no effect
  /// if the widget is square to begin with.
  ///
  /// Defaults to zero, and must be between zero and one, inclusive.
  final double squash = 0.0,
}) extends DynamicPathBorder {
  /// The static path of this border.
  ///
  /// The path must be normalized to fit exactly into a single unit square,
  /// starting at (0, 0) with a bottom-right coordinate of (1, 1) respectively.
  ///
  /// If [squash] is non-zero, the path will be scaled to match the aspect ratio
  /// of the bounding box of the widget that this border is attached to, which
  /// can give a squashed appearance.
  @protected
  Path get path;

  @override
  StaticPathBorder copyWith({
    BorderSide? side,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    double? strokeMiterLimit,
    double? squash,
  });

  @override
  StaticPathBorder scale(double t);

  @override
  Path getPath(Rect rect, {TextDirection? textDirection}) {
    final Rect(:left, :top, :width, :height, :isEmpty) = rect;

    if (isEmpty || width <= 0.0 || height <= 0.0) return Path();

    var scaleX = width;
    var scaleY = height;
    if (width <= height) {
      scaleY = squash * height + (1.0 - squash) * width;
    } else {
      scaleX = squash * width + (1.0 - squash) * height;
    }

    final matrix = Matrix4.identity()
      ..translateByDouble(
        left + (width - scaleX) / 2.0,
        top + (height - scaleY) / 2.0,
        0.0,
        1.0,
      )
      ..scaleByDouble(scaleX, scaleY, 1.0, 1.0);
    return path.transform(matrix.storage);
  }

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write(objectRuntimeType(this, "StaticPathBorder"))
      ..write("($side");
    if (strokeCap != .butt) {
      buffer.write(", strokeCap: $strokeCap");
    }
    if (strokeJoin != .miter) {
      buffer.write(", strokeJoin: $strokeJoin");
    } else if (strokeMiterLimit != 4.0) {
      buffer.write(", strokeMiterLimit: $strokeMiterLimit");
    }
    if (squash != 0.0) {
      buffer.write(", squash: $squash");
    }
    buffer.write(")");
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is StaticPathBorder &&
          side == other.side &&
          strokeCap == other.strokeCap &&
          strokeJoin == other.strokeJoin &&
          strokeMiterLimit == other.strokeMiterLimit &&
          squash == other.squash;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    side,
    strokeCap,
    strokeJoin,
    strokeMiterLimit,
    squash,
  );
}

// ignore: prefer_const_constructors_in_immutables
class RoundedPolygonBorder({
  super.side,
  super.strokeCap,
  super.strokeJoin,
  super.strokeMiterLimit,
  super.squash,
  required final RoundedPolygon polygon,
  final double startAngle = 0.0,
}) extends StaticPathBorder {
  @override
  final Path path = polygon.toPath(startAngle: startAngle);

  @override
  RoundedPolygonBorder copyWith({
    BorderSide? side,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    double? strokeMiterLimit,
    double? squash,
    RoundedPolygon? polygon,
    double? startAngle,
  }) => RoundedPolygonBorder(
    side: side ?? this.side,
    strokeCap: strokeCap ?? this.strokeCap,
    strokeJoin: strokeJoin ?? this.strokeJoin,
    strokeMiterLimit: strokeMiterLimit ?? this.strokeMiterLimit,
    squash: squash ?? this.squash,
    polygon: polygon ?? this.polygon,
    startAngle: startAngle ?? this.startAngle,
  );

  @override
  RoundedPolygonBorder scale(double t) => RoundedPolygonBorder(
    side: side.scale(t),
    strokeCap: strokeCap,
    strokeJoin: strokeJoin,
    strokeMiterLimit: strokeMiterLimit,
    squash: squash,
    polygon: polygon,
    startAngle: startAngle,
  );

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is RoundedPolygonBorder) {
      return MorphBorder(
        side: BorderSide.lerp(a.side, side, t),
        strokeCap: t < 0.5 ? a.strokeCap : strokeCap,
        strokeJoin: t < 0.5 ? a.strokeJoin : strokeJoin,
        strokeMiterLimit: lerpDouble(a.strokeMiterLimit, strokeMiterLimit, t)!,
        squash: lerpDouble(a.squash, squash, t)!,
        morph: _morphBetween(a.polygon, polygon),
        progress: t,
        startAngle: lerpDouble(a.startAngle, startAngle, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is RoundedPolygonBorder) {
      return MorphBorder(
        side: BorderSide.lerp(side, b.side, t),
        strokeCap: t < 0.5 ? strokeCap : b.strokeCap,
        strokeJoin: t < 0.5 ? strokeJoin : b.strokeJoin,
        strokeMiterLimit: lerpDouble(strokeMiterLimit, b.strokeMiterLimit, t)!,
        squash: lerpDouble(squash, b.squash, t)!,
        morph: _morphBetween(polygon, b.polygon),
        progress: t,
        startAngle: lerpDouble(startAngle, b.startAngle, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write(objectRuntimeType(this, "RoundedPolygonBorder"))
      ..write("($side");
    if (strokeCap != .butt) {
      buffer.write(", strokeCap: $strokeCap");
    }
    if (strokeJoin != .miter) {
      buffer.write(", strokeJoin: $strokeJoin");
    } else if (strokeMiterLimit != 4.0) {
      buffer.write(", strokeMiterLimit: $strokeMiterLimit");
    }
    if (squash != 0.0) {
      buffer.write(", squash: $squash");
    }
    buffer.write(", polygon: $polygon");
    if (startAngle != 0.0) {
      buffer.write(", startAngle: $startAngle");
    }
    buffer.write(")");
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is RoundedPolygonBorder &&
          side == other.side &&
          strokeCap == other.strokeCap &&
          strokeJoin == other.strokeJoin &&
          strokeMiterLimit == other.strokeMiterLimit &&
          squash == other.squash &&
          polygon == other.polygon &&
          startAngle == other.startAngle;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    side,
    strokeCap,
    strokeJoin,
    strokeMiterLimit,
    squash,
    polygon,
    startAngle,
  );

  // The number 5 was chosen without any real science behind it. It is small
  // enough that the cached morphs fit comfortably in memory, and large enough
  // for the few pairs of shapes a screen animates between at once.
  static const int _morphCacheSize = 5;

  /// Caches the mapping between pairs of shapes to speed up [lerpFrom] and
  /// [lerpTo].
  static final _morphCache = _FifoCache<_MorphCacheKey, Morph>(_morphCacheSize);

  /// Returns the [Morph] between [start] and [end], reusing a cached one when
  /// possible.
  ///
  /// Creating a [Morph] matches up the curves of both shapes, which is much
  /// more expensive than evaluating it at a progress value. A transition asks
  /// for the same pair of shapes on every frame, so the result is worth
  /// keeping.
  static Morph _morphBetween(RoundedPolygon start, RoundedPolygon end) =>
      _morphCache.putIfAbsent(
        _MorphCacheKey(start, end),
        () => Morph(start, end),
      );
}

// ignore: prefer_const_constructors_in_immutables
class MorphBorder({
  super.side,
  super.strokeCap,
  super.strokeJoin,
  super.strokeMiterLimit,
  super.squash,
  required final Morph morph,
  required final double progress,
  final double startAngle = 0.0,
}) extends StaticPathBorder {
  @override
  final Path path = morph.toPath(progress, startAngle: startAngle);

  @override
  MorphBorder copyWith({
    BorderSide? side,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    double? strokeMiterLimit,
    double? squash,
    Morph? morph,
    double? progress,
    double? startAngle,
  }) => MorphBorder(
    side: side ?? this.side,
    strokeCap: strokeCap ?? this.strokeCap,
    strokeJoin: strokeJoin ?? this.strokeJoin,
    strokeMiterLimit: strokeMiterLimit ?? this.strokeMiterLimit,
    squash: squash ?? this.squash,
    morph: morph ?? this.morph,
    progress: progress ?? this.progress,
    startAngle: startAngle ?? this.startAngle,
  );

  @override
  MorphBorder scale(double t) => MorphBorder(
    side: side.scale(t),
    strokeCap: strokeCap,
    strokeJoin: strokeJoin,
    strokeMiterLimit: strokeMiterLimit,
    squash: squash,
    morph: morph,
    progress: progress,
    startAngle: startAngle,
  );

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MorphBorder) {
      return MorphBorder(
        side: BorderSide.lerp(a.side, side, t),
        strokeCap: t < 0.5 ? a.strokeCap : strokeCap,
        strokeJoin: t < 0.5 ? a.strokeJoin : strokeJoin,
        strokeMiterLimit: lerpDouble(a.strokeMiterLimit, strokeMiterLimit, t)!,
        squash: lerpDouble(a.squash, squash, t)!,
        morph: t < 0.5 ? a.morph : morph,
        progress: lerpDouble(a.progress, progress, t)!,
        startAngle: lerpDouble(a.startAngle, startAngle, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is MorphBorder) {
      return MorphBorder(
        side: BorderSide.lerp(side, b.side, t),
        strokeCap: t < 0.5 ? strokeCap : b.strokeCap,
        strokeJoin: t < 0.5 ? strokeJoin : b.strokeJoin,
        strokeMiterLimit: lerpDouble(strokeMiterLimit, b.strokeMiterLimit, t)!,
        squash: lerpDouble(squash, b.squash, t)!,
        morph: t < 0.5 ? morph : b.morph,
        progress: lerpDouble(progress, b.progress, t)!,
        startAngle: lerpDouble(startAngle, b.startAngle, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write(objectRuntimeType(this, "MorphBorder"))
      ..write("($side");
    if (strokeCap != .butt) {
      buffer.write(", strokeCap: $strokeCap");
    }
    if (strokeJoin != .miter) {
      buffer.write(", strokeJoin: $strokeJoin");
    } else if (strokeMiterLimit != 4.0) {
      buffer.write(", strokeMiterLimit: $strokeMiterLimit");
    }
    if (squash != 0.0) {
      buffer.write(", squash: $squash");
    }
    buffer
      ..write(", morph: $morph")
      ..write(", progress: $progress");
    if (startAngle != 0.0) {
      buffer.write(", startAngle: $startAngle");
    }
    buffer.write(")");
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is MorphBorder &&
          side == other.side &&
          strokeCap == other.strokeCap &&
          strokeJoin == other.strokeJoin &&
          strokeMiterLimit == other.strokeMiterLimit &&
          squash == other.squash &&
          morph == other.morph &&
          progress == other.progress &&
          startAngle == other.startAngle;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    side,
    strokeCap,
    strokeJoin,
    strokeMiterLimit,
    squash,
    morph,
    progress,
    startAngle,
  );
}

/// The pair of shapes a cached [Morph] was built from.
///
/// Keys compare by value. This is cheap because [RoundedPolygon.hashCode] is
/// computed once and cached, and its `==` short-circuits on identical instances.
@immutable
class const _MorphCacheKey(
  final RoundedPolygon start,
  final RoundedPolygon end,
) {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MorphCacheKey && other.start == start && other.end == end;

  @override
  int get hashCode => Object.hash(start, end);
}

/// Cache of objects of limited size that uses the first in first out eviction
/// strategy (a.k.a least recently inserted).
///
/// The key that was inserted before all other keys is evicted first, i.e. the
/// one inserted least recently.
class _FifoCache<K extends Object, V extends Object?>(
  /// Maximum number of entries to store in the cache.
  ///
  /// Once this many entries have been cached, the entry inserted least recently
  /// is evicted when adding a new entry.
  final int _maximumSize,
) {
  this : assert(_maximumSize > 0);

  /// In Dart the map literal uses a linked hash-map implementation, whose keys
  /// are stored such that [Map.keys] returns them in the order they were
  /// inserted.
  final _cache = <K, V>{};

  /// Returns the previously cached value for the given key, if available;
  /// if not, calls the given callback to obtain it first.
  V putIfAbsent(K key, V Function() loader) {
    final result = _cache[key];
    if (result != null) return result;

    if (_cache.length == _maximumSize) {
      _cache.remove(_cache.keys.first);
    }
    return _cache[key] = loader();
  }
}
