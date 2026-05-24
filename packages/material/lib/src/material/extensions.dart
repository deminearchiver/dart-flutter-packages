import 'package:material/src/material/flutter.dart';
import 'package:meta/meta.dart';

extension AnimatableExtensions<T> on Animatable<T> {
  Animatable<T> get reversed => _ReversedAnimatable(this);

  Animatable<T> mapPoint(AnimatableMapPointCallback callback) =>
      _MapPointAnimatable(this, callback);

  Animatable<U> mapValue<U>(AnimatableMapValueCallback<T, U> callback) =>
      _MapValueAnimatable(this, callback);

  Animatable<T> clampPoint(double min, double max) =>
      mapPoint((t) => clampDouble(t, min, max));

  Animatable<T> mapPointToInterval(
    double begin,
    double end, [
    Curve curve = Curves.linear,
  ]) {
    assert(begin >= 0.0);
    assert(begin <= 1.0);
    assert(end >= 0.0);
    assert(end <= 1.0);
    assert(end >= begin);
    return mapPoint((t) {
      t = clampDouble((t - begin) / (end - begin), 0.0, 1.0);
      return t == 0.0 || t == 1.0 ? t : curve.transform(t);
    });
  }
}

extension NullableAnimatableExtensions<T> on Animatable<T?> {
  Animatable<T> get nonNull => _NonNullAnimatable(this);
}

class _ReversedAnimatable<T> extends Animatable<T> {
  const _ReversedAnimatable(this._parent);

  final Animatable<T> _parent;

  @override
  T transform(double t) => _parent.transform(1.0 - t);

  @override
  String toString() => "$_parent.reversed";
}

typedef AnimatableMapValueCallback<From, To> = To Function(From value);
typedef AnimatableMapPointCallback = double Function(double t);

class _MapPointAnimatable<T> extends Animatable<T> {
  const _MapPointAnimatable(this._parent, this._callback);

  final Animatable<T> _parent;
  final AnimatableMapPointCallback _callback;

  @override
  T transform(double t) => _parent.transform(_callback(t));
}

class _MapValueAnimatable<From, To> extends Animatable<To> {
  const _MapValueAnimatable(this._parent, this._callback);

  final Animatable<From> _parent;
  final AnimatableMapValueCallback<From, To> _callback;

  @override
  To transform(double t) => _callback(_parent.transform(t));

  @override
  String toString() {
    return "$_parent";
  }
}

class _NonNullAnimatable<T> extends Animatable<T> {
  const _NonNullAnimatable(this._parent);

  final Animatable<T?> _parent;

  @override
  T transform(double t) {
    final value = _parent.transform(t);
    assert(value != null);
    return value!;
  }
}

extension AnimationExtensions<T> on Animation<T> {
  Animation<U> mapValue<U>(AnimatableMapValueCallback<T, U> callback) =>
      _AnimationMapValue(this, callback);

  Animation<T> mapStatus(AnimationMapStatusCallback callback) =>
      _AnimationMapStatus(this, callback);
}

extension NullableAnimationExtensions<T extends Object> on Animation<T?> {
  Animation<T> get nonNull => mapValue((value) {
    assert(value != null);
    return value!;
  });

  Animation<T> nonNullOr(T defaultValue) =>
      mapValue((value) => value ?? defaultValue);

  Animation<T> nonNullOrElse(ValueGetter<T> defaultValueGetter) =>
      mapValue((value) => value ?? defaultValueGetter());
}

class _AnimationMapValue<T, U> extends Animation<U>
    with
        AnimationLazyListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  _AnimationMapValue(this._parent, this._callback);

  final Animation<T> _parent;
  final AnimatableMapValueCallback<T, U> _callback;

  @override
  void didStartListening() {
    _parent
      ..addListener(notifyListeners)
      ..addStatusListener(notifyStatusListeners);
  }

  @override
  void didStopListening() {
    _parent
      ..removeStatusListener(notifyStatusListeners)
      ..removeListener(notifyListeners);
  }

  @override
  AnimationStatus get status => _parent.status;

  @override
  U get value => _callback(_parent.value);
}

typedef AnimationMapStatusCallback =
    AnimationStatus Function(AnimationStatus status);

class _AnimationMapStatus<T> extends Animation<T>
    with
        AnimationLazyListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  _AnimationMapStatus(this._parent, this._callback);

  final Animation<T> _parent;
  final AnimationMapStatusCallback _callback;

  @override
  void didStartListening() {
    _parent
      ..addListener(notifyListeners)
      ..addStatusListener(notifyStatusListeners);
  }

  @override
  void didStopListening() {
    _parent
      ..removeStatusListener(notifyStatusListeners)
      ..removeListener(notifyListeners);
  }

  @override
  AnimationStatus get status => _callback(_parent.status);

  @override
  T get value => _parent.value;
}

// class _NonNullAnimatable<T> extends Animatable<T> {
//   const _NonNullAnimatable(this._parent);

//   final Animatable<T?> _parent;

//   @override
//   T transform(double t) {
//     final value = _parent.transform(t);
//     assert(value != null);
//     return value!;
//   }
// }

class _NonNullAnimation<T extends Object> extends Animation<T>
    with
        AnimationLazyListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  _NonNullAnimation(this._parent);

  final Animation<T?> _parent;

  @override
  void didStartListening() {
    _parent
      ..addListener(notifyListeners)
      ..addStatusListener(notifyStatusListeners);
  }

  @override
  void didStopListening() {
    _parent
      ..removeStatusListener(notifyStatusListeners)
      ..removeListener(notifyListeners);
  }

  @override
  AnimationStatus get status => _parent.status;

  @override
  T get value {
    final value = _parent.value;
    assert(value != null);
    return value!;
  }
}

extension IntervalCurveExtension on Interval {
  Interval copyWith({double? begin, double? end, Curve? curve}) =>
      begin != null || end != null || curve != null
      ? Interval(
          begin ?? this.begin,
          end ?? this.end,
          curve: curve ?? this.curve,
        )
      : this;
}

extension PaintingContextWithCanvasTransformExtension on PaintingContext {
  void withCanvasTransform(void Function(PaintingContext context) paint) {
    late int debugPreviousCanvasSaveCount;
    canvas.save();
    assert(() {
      debugPreviousCanvasSaveCount = canvas.getSaveCount();
      return true;
    }());

    paint(this);

    assert(() {
      // This isn't perfect. For example, we can't catch the case of
      // someone first restoring, then setting a transform or whatnot,
      // then saving.
      // If this becomes a real problem, we could add logic to the
      // Canvas class to lock the canvas at a particular save count
      // such that restore() fails if it would take the lock count
      // below that number.
      final int debugNewCanvasSaveCount = canvas.getSaveCount();
      if (debugNewCanvasSaveCount > debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.save() or canvas.saveLayer() at least "
            "${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount} more "
            "time${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.restore().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will probably result in a broken display.",
          ),
          ErrorHint(
            "You must pair each call to save()/saveLayer() with a later matching call to restore().",
          ),
        ]);
      }
      if (debugNewCanvasSaveCount < debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.restore() "
            "${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount} more "
            "time${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.save() or canvas.saveLayer().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will result in a broken display.",
          ),
          ErrorHint(
            "You should only call restore() if you first called save() or saveLayer().",
          ),
        ]);
      }
      return debugNewCanvasSaveCount == debugPreviousCanvasSaveCount;
    }());

    canvas.restore();
  }
}

extension CanvasWithTransformExtension on Canvas {
  void withTransform(void Function(Canvas canvas) paint) {
    late int debugPreviousCanvasSaveCount;
    save();
    assert(() {
      debugPreviousCanvasSaveCount = getSaveCount();
      return true;
    }());

    paint(this);

    assert(() {
      // This isn't perfect. For example, we can't catch the case of
      // someone first restoring, then setting a transform or whatnot,
      // then saving.
      // If this becomes a real problem, we could add logic to the
      // Canvas class to lock the canvas at a particular save count
      // such that restore() fails if it would take the lock count
      // below that number.
      final int debugNewCanvasSaveCount = getSaveCount();
      if (debugNewCanvasSaveCount > debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.save() or canvas.saveLayer() at least "
            "${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount} more "
            "time${debugNewCanvasSaveCount - debugPreviousCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.restore().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will probably result in a broken display.",
          ),
          ErrorHint(
            "You must pair each call to save()/saveLayer() with a later matching call to restore().",
          ),
        ]);
      }
      if (debugNewCanvasSaveCount < debugPreviousCanvasSaveCount) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "The caller invoked canvas.restore() "
            "${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount} more "
            "time${debugPreviousCanvasSaveCount - debugNewCanvasSaveCount == 1 ? "" : "s"} "
            "than it called canvas.save() or canvas.saveLayer().",
          ),
          ErrorDescription(
            "This leaves the canvas in an inconsistent state and will result in a broken display.",
          ),
          ErrorHint(
            "You should only call restore() if you first called save() or saveLayer().",
          ),
        ]);
      }
      return debugNewCanvasSaveCount == debugPreviousCanvasSaveCount;
    }());

    restore();
  }
}

extension OverlayChildLayoutInfoTransformsExtension on OverlayChildLayoutInfo {
  double get translationX => childPaintTransform.storage[12];
  double get translationY => childPaintTransform.storage[13];
  double get translationZ => childPaintTransform.storage[14];

  double get scaleX => childPaintTransform[0];
  double get scaleY => childPaintTransform[5];
  double get scaleZ => childPaintTransform[10];
}

extension DefaultTextStyleWrapExtension on DefaultTextStyle {
  Widget wrap(BuildContext context, Widget child) => DefaultTextStyle(
    style: style,
    textAlign: textAlign,
    maxLines: maxLines,
    softWrap: softWrap,
    overflow: overflow,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    child: child,
  );
}

extension type const StrictSet<E extends Object?>._(Set<E> _)
    implements Set<E> {
  factory StrictSet() => ._(.new());

  factory StrictSet.identity() => ._(.identity());

  factory StrictSet.of(Iterable<E> elements) => ._(.of(elements));

  factory StrictSet.unmodifiable(Iterable<E> elements) =>
      ._(.unmodifiable(elements));

  @redeclare
  bool contains(E value) => _.contains(value);

  @redeclare
  bool remove(E value) => _.remove(value);

  @redeclare
  E? lookup(E object) => _.lookup(object);

  @redeclare
  void removeAll(Iterable<E> elements) => _.removeAll(elements);

  @redeclare
  void retainAll(Iterable<E> elements) => _.retainAll(elements);

  @redeclare
  bool containsAll(Iterable<E> other) => _.containsAll(other);

  @redeclare
  StrictSet<E> intersection(Set<E> other) =>
      _.intersection(other) as StrictSet<E>;

  @redeclare
  StrictSet<E> union(Set<E> other) => _.union(other) as StrictSet<E>;

  @redeclare
  StrictSet<E> difference(Set<E> other) => _.difference(other) as StrictSet<E>;

  @redeclare
  StrictSet<R> cast<R extends Object?>() => ._(_.cast<R>());

  @redeclare
  StrictSet<E> toSet() => ._(_.toSet());

  static StrictSet<T> castFrom<S, T>(
    Set<S> source, {
    Set<R> Function<R>()? newSet,
  }) => ._(.castFrom<S, T>(source, newSet: newSet));
}

extension SpringDescriptionExtension on SpringDescription {
  SpringDescription copyWith({
    double? mass,
    double? stiffness,
    double? damping,
  }) => mass != null || stiffness != null || damping != null
      ? .new(
          mass: mass ?? this.mass,
          stiffness: stiffness ?? this.stiffness,
          damping: damping ?? this.damping,
        )
      : this;

  SpringDescription copyWithDampingRatio({
    double? mass,
    double? stiffness,
    double? ratio,
  }) => mass != null || stiffness != null || ratio != null
      ? ratio != null
            ? .withDampingRatio(
                mass: mass ?? this.mass,
                stiffness: stiffness ?? this.stiffness,
                ratio: ratio,
              )
            : .new(
                mass: mass ?? this.mass,
                stiffness: stiffness ?? this.stiffness,
                damping: damping,
              )
      : this;

  SpringDescription copyWithDurationAndBounce({
    Duration? duration,
    double? bounce,
  }) => duration != null || bounce != null
      ? .withDurationAndBounce(
          duration: duration ?? this.duration,
          bounce: bounce ?? this.bounce,
        )
      : this;
}
