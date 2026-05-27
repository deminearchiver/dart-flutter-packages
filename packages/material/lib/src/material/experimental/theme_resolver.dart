import 'package:material/src/material/flutter.dart';

typedef ThemeResolverCallback<T extends Object?> =
    T Function(BuildContext context);

typedef ThemeResolverCombineCallback<T extends Object?> = T Function(T a, T b);

abstract class ThemeResolver<T extends Object?> {
  const ThemeResolver();

  const factory ThemeResolver.callback(ThemeResolverCallback<T> callback) =
      _CallbackThemeResolver;

  const factory ThemeResolver.value(T value) = _ValueThemeResolver;

  T resolve(BuildContext context);

  static CombiningThemeResolver<T> combine<T extends Object>(
    ThemeResolver<T> a,
    ThemeResolver<T> b,
    ThemeResolverCombineCallback<T> combine,
  ) => _ThemeResolverCombine(a, b, combine);
}

final class _CallbackThemeResolver<T extends Object?> extends ThemeResolver<T> {
  const _CallbackThemeResolver(this._callback);

  final ThemeResolverCallback<T> _callback;

  @override
  T resolve(BuildContext context) => _callback(context);

  @override
  String toString() => "ThemeResolver<$T>.callback($_callback)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CallbackThemeResolver<T> && _callback == other._callback;

  @override
  int get hashCode => _callback.hashCode;
}

final class _ValueThemeResolver<T extends Object?> extends ThemeResolver<T> {
  const _ValueThemeResolver(this._value);

  final T _value;

  @override
  T resolve(BuildContext context) => _value;

  @override
  String toString() => "ThemeResolver<$T>.value($_value)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ValueThemeResolver<T> && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

abstract class CombiningThemeResolver<T extends Object?>
    extends ThemeResolver<T> {
  const CombiningThemeResolver(this.a, this.b);

  final ThemeResolver<T> a;
  final ThemeResolver<T> b;

  @protected
  T combine(T a, T b);

  @override
  T resolve(BuildContext context) =>
      combine(a.resolve(context), b.resolve(context));
}

final class _ThemeResolverCombine<T extends Object>
    extends CombiningThemeResolver<T> {
  const _ThemeResolverCombine(
    super.a,
    super.b,
    ThemeResolverCombineCallback<T> combine,
  ) : _combine = combine;

  final ThemeResolverCombineCallback<T> _combine;

  @override
  T combine(T a, T b) => _combine(a, b);

  @override
  String toString() => "ThemeResolver.combine<$T>($a, $b, $_combine)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ThemeResolverCombine<T> &&
          a == other.a &&
          b == other.b &&
          _combine == other._combine;

  @override
  int get hashCode => Object.hash(a, b, _combine);
}

// mixin ThemeDataPartialCopyMixin<PartialType extends Object?> {
//   PartialType copy();
// }

// mixin ThemeDataConcreteCopyMixin<
//   PartialType extends Object?,
//   ConcreteType extends PartialType
// >
//     implements ThemeDataPartialCopyMixin<PartialType> {
//   @override
//   ConcreteType copy();
// }

// mixin ThemeDataPartialCopyWithMixin<PartialType extends Object?> {
//   PartialType copyWith();

//   PartialType maybeCopyWith();
// }

// mixin ThemeDataConcreteCopyWithMixin<
//   PartialType extends Object?,
//   ConcreteType extends PartialType
// >
//     implements ThemeDataPartialCopyWithMixin<PartialType> {
//   @override
//   ConcreteType copyWith();

//   @override
//   ConcreteType maybeCopyWith();
// }

// mixin ThemeDataPartialMergeWithMixin<PartialType extends Object?> {
//   PartialType mergeWith();

//   PartialType maybeMergeWith();
// }

// mixin ThemeDataConcreteMergeWithMixin<
//   PartialType extends Object?,
//   ConcreteType extends PartialType
// >
//     implements ThemeDataPartialMergeWithMixin<PartialType> {
//   @override
//   ConcreteType mergeWith();

//   @override
//   ConcreteType maybeMergeWith();
// }

// mixin ThemeDataPartialMergeMixin<PartialType extends Object?> {
//   PartialType merge(PartialType? other);

//   PartialType maybeMerge(PartialType? other);
// }

// mixin ThemeDataConcreteMergeMixin<
//   PartialType extends Object?,
//   ConcreteType extends PartialType
// >
//     implements ThemeDataPartialMergeMixin<PartialType> {
//   @override
//   ConcreteType merge(PartialType? other);

//   @override
//   ConcreteType maybeMerge(PartialType? other);
// }

// mixin ThemeDataChecksMixin<ConcreteType extends Object?> {
//   bool get isEmpty;

//   bool get isNotEmpty;

//   bool get isConcrete;

//   ConcreteType get asConcrete;
// }
