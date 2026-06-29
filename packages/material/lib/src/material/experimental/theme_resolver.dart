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

typedef PartialDataMergeCallback<PartialType extends Object?> =
    ConcreteDataMergeCallback<PartialType, PartialType>;

typedef ConcreteDataMergeCallback<
  PartialType extends Object?,
  ConcreteType extends PartialType
> = ConcreteType Function(PartialType? other);

typedef PartialDataCombineCallback<PartialType extends Object?> =
    ConcreteDataCombineCallback<PartialType, PartialType>;

typedef ConcreteDataCombineCallback<
  PartialType extends Object?,
  ConcreteType extends PartialType
> = ConcreteType Function(ConcreteType fallback, PartialType? overrides);

extension type const _InheritedSnapshot._(
  ({InheritedElement element, InheritedWidget widget}) _
) implements Object {
  _InheritedSnapshot.fromElementAndWidget({
    required InheritedElement element,
    required InheritedWidget widget,
  }) : assert(identical(widget, element.widget)),
       _ = (element: element, widget: widget);

  _InheritedSnapshot.fromElement(InheritedElement element)
    : assert(element.widget is InheritedWidget),
      _ = (element: element, widget: element.widget as InheritedWidget);

  InheritedElement get element => _.element;

  InheritedWidget get widget => _.widget;

  bool get isValid {
    if (!element.mounted) return false;
    final cachedWidget = widget;
    final currentWidget = element.widget;
    if (identical(currentWidget, cachedWidget)) return true;
    if (currentWidget is InheritedThemeResolverWidget &&
        cachedWidget is InheritedThemeResolverWidget) {
      return currentWidget.resolver == cachedWidget.resolver;
    }
    return currentWidget == widget;
  }
}

extension type const _DependencyCacheEntry<T extends Object?>._(
  ({T data, List<_InheritedSnapshot> dependencies}) _
) implements Object {
  const _DependencyCacheEntry({
    required T data,
    required List<_InheritedSnapshot> dependencies,
  }) : _ = (data: data, dependencies: dependencies);

  T get data => _.data;

  List<_InheritedSnapshot> get dependencies => _.dependencies;

  bool get isValid {
    for (final snapshot in dependencies) {
      if (!snapshot.isValid) return false;
    }
    return true;
  }
}

typedef _MatcherVerifyCallback = bool Function(BuildContext context);

typedef _MatcherRegisterCallback = void Function(BuildContext context);

extension type const _Matcher._(
  ({_MatcherVerifyCallback verify, _MatcherRegisterCallback register}) _
) {
  const _Matcher({
    required _MatcherVerifyCallback verify,
    required _MatcherRegisterCallback register,
  }) : _ = (verify: verify, register: register);

  bool verify(BuildContext context) => _.verify(context);

  void register(BuildContext context) => _.register(context);
}

extension type const _ResolutionCache<T extends Object?>._(
  ({T data, List<_InheritedSnapshot> dependencies, List<_Matcher> matchers}) _
) implements Object {
  const _ResolutionCache({
    required T data,
    required List<_InheritedSnapshot> dependencies,
    required List<_Matcher> matchers,
  }) : _ = (data: data, dependencies: dependencies, matchers: matchers);

  T get data => _.data;

  List<_InheritedSnapshot> get dependencies => _.dependencies;

  List<_Matcher> get matchers => _.matchers;

  bool verifyAll(BuildContext context) {
    for (final matcher in matchers) {
      if (!matcher.verify(context)) return false;
    }
    return true;
  }

  void registerAll(BuildContext context) {
    for (final matcher in matchers) {
      matcher.register(context);
    }
  }
}

extension type const _MergeCache<T extends Object?>._(
  ({T fallback, T overrides, T merged}) _
) implements Object {
  const _MergeCache({
    required T fallback,
    required T overrides,
    required T merged,
  }) : _ = (fallback: fallback, overrides: overrides, merged: merged);

  T get fallback => _.fallback;
  T get overrides => _.overrides;
  T get merged => _.merged;
}

final class _ResolutionContext implements BuildContext {
  _ResolutionContext(this._context) : _element = _asElement(_context);

  final BuildContext _context;
  final Element? _element;
  final _dependencies = <_InheritedSnapshot>[];
  final _matchers = <_Matcher>[];

  @override
  Widget get widget => _context.widget;

  @override
  BuildOwner? get owner => _context.owner;

  @override
  bool get mounted => _context.mounted;

  @override
  bool get debugDoingBuild => _context.debugDoingBuild;

  @override
  RenderObject? findRenderObject() => _context.findRenderObject();

  @override
  Size? get size => _context.size;

  @override
  InheritedWidget dependOnInheritedElement(
    InheritedElement ancestor, {
    Object? aspect,
  }) {
    // Original result should be preserved.
    final widget = _context.dependOnInheritedElement(ancestor, aspect: aspect);
    assert(identical(ancestor.widget, widget));

    // Update dependencies.
    _dependencies.add(.fromElementAndWidget(element: ancestor, widget: widget));

    // Add matcher.
    _matchers.add(
      .new(
        verify: (context) {
          if (!ancestor.mounted) return false;
          final currentWidget = ancestor.widget;
          final cachedWidget = widget;
          if (identical(currentWidget, cachedWidget)) return true;
          if (currentWidget is InheritedThemeResolverWidget &&
              cachedWidget is InheritedThemeResolverWidget) {
            return currentWidget.resolver == cachedWidget.resolver;
          }
          return currentWidget == widget;
        },
        register: (context) =>
            context.dependOnInheritedElement(ancestor, aspect: aspect),
      ),
    );

    // Return original result.
    return widget;
  }

  @override
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>({
    Object? aspect,
  }) {
    // Original result should be preserved.
    final widget = _context.dependOnInheritedWidgetOfExactType<T>(
      aspect: aspect,
    );
    final ancestor = _context.getElementForInheritedWidgetOfExactType<T>();
    assert(identical(ancestor?.widget, widget));

    if (ancestor != null) {
      assert(widget != null);

      // Update dependencies.
      _dependencies.add(
        .fromElementAndWidget(element: ancestor, widget: widget!),
      );

      // Add matcher.
      _matchers.add(
        .new(
          verify: (context) {
            final element = context
                .getElementForInheritedWidgetOfExactType<T>();
            if (element != ancestor) return false;
            final currentWidget = element!.widget;
            final cachedWidget = widget;
            if (identical(currentWidget, cachedWidget)) return true;
            if (currentWidget is InheritedThemeResolverWidget &&
                cachedWidget is InheritedThemeResolverWidget) {
              return currentWidget.resolver == cachedWidget.resolver;
            }
            return currentWidget == widget;
          },
          register: (context) =>
              context.dependOnInheritedElement(ancestor, aspect: aspect),
        ),
      );
    }

    // Return original result.
    return widget;
  }

  @override
  T? getInheritedWidgetOfExactType<T extends InheritedWidget>() =>
      _context.getInheritedWidgetOfExactType<T>();

  @override
  InheritedElement?
  getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() =>
      _context.getElementForInheritedWidgetOfExactType<T>();

  @override
  T? findAncestorWidgetOfExactType<T extends Widget>() =>
      _context.findAncestorWidgetOfExactType<T>();

  @override
  T? findAncestorStateOfType<T extends State>() =>
      _context.findAncestorStateOfType<T>();

  @override
  T? findRootAncestorStateOfType<T extends State>() =>
      _context.findRootAncestorStateOfType<T>();

  @override
  T? findAncestorRenderObjectOfType<T extends RenderObject>() =>
      _context.findAncestorRenderObjectOfType<T>();

  @override
  void visitAncestorElements(ConditionalElementVisitor visitor) =>
      _context.visitAncestorElements(visitor);

  @override
  void visitChildElements(ElementVisitor visitor) =>
      _context.visitChildElements(visitor);

  @override
  void dispatchNotification(Notification notification) =>
      _context.dispatchNotification(notification);

  @override
  DiagnosticsNode describeElement(
    String name, {
    DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty,
  }) => _context.describeElement(name, style: style);

  @override
  DiagnosticsNode describeWidget(
    String name, {
    DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty,
  }) => _context.describeWidget(name, style: style);

  @override
  List<DiagnosticsNode> describeMissingAncestor({
    required Type expectedAncestorType,
  }) => _context.describeMissingAncestor(
    expectedAncestorType: expectedAncestorType,
  );

  @override
  DiagnosticsNode describeOwnershipChain(String name) =>
      _context.describeOwnershipChain(name);

  static Element? _asElement(BuildContext context) => switch (context) {
    _ResolutionContext(_element: final element) => element,
    final Element element => element,
    _ => null,
  };
}

abstract class InheritedThemeResolverWidget<
  PartialType extends Object?,
  WidgetType extends InheritedThemeResolverWidget<
    PartialType,
    WidgetType,
    ElementType
  >,
  ElementType extends InheritedThemeResolverElement<
    PartialType,
    WidgetType,
    ElementType
  >
>
    extends InheritedWidget {
  const InheritedThemeResolverWidget({
    super.key,
    required this.resolver,
    required super.child,
  });

  final ThemeResolver<PartialType> resolver;

  PartialType merge(PartialType fallback, PartialType? overrides);

  @override
  ElementType createElement();

  @override
  bool updateShouldNotify(WidgetType oldWidget) =>
      resolver != oldWidget.resolver;

  static ThemeResolver<PartialType>? maybeResolverOf<
    PartialType extends Object?,
    WidgetType extends InheritedThemeResolverWidget<
      PartialType,
      WidgetType,
      ElementType
    >,
    ElementType extends InheritedThemeResolverElement<
      PartialType,
      WidgetType,
      ElementType
    >
  >(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<WidgetType>()?.resolver;

  static PartialType? maybeOverridesOf<
    PartialType extends Object?,
    WidgetType extends InheritedThemeResolverWidget<
      PartialType,
      WidgetType,
      ElementType
    >,
    ElementType extends InheritedThemeResolverElement<
      PartialType,
      WidgetType,
      ElementType
    >
  >(BuildContext context) {
    final ancestor = context
        .getElementForInheritedWidgetOfExactType<WidgetType>();
    if (ancestor is ElementType) {
      context.dependOnInheritedElement(ancestor);
      return ancestor._resolveOverrides(context);
    }
    return null;
  }
}

// TODO: is it possible to skip merge when data is concrete?

abstract class InheritedThemeResolverElement<
  PartialType extends Object?,
  WidgetType extends InheritedThemeResolverWidget<
    PartialType,
    WidgetType,
    ElementType
  >,
  ElementType extends InheritedThemeResolverElement<
    PartialType,
    WidgetType,
    ElementType
  >
>
    extends InheritedElement {
  InheritedThemeResolverElement(WidgetType super.widget);

  WidgetType get _widget => super.widget as WidgetType;

  var _dependencyCache = Expando<_DependencyCacheEntry<PartialType>>();
  _ResolutionCache<PartialType>? _resolutionCache;
  _MergeCache<PartialType>? _mergeCache;

  ElementType? _findAncestorElementOfSameType() {
    ElementType? ancestor;
    visitAncestorElements((element) {
      if (element is ElementType) {
        ancestor = element;
        return false;
      }
      return true;
    });
    return ancestor;
  }

  PartialType _resolveOverrides(BuildContext context) {
    final element = _ResolutionContext._asElement(context);

    if (element != null) {
      if (_dependencyCache[element] case final dependencyCached?
          when dependencyCached.isValid) {
        // print("dependency cache hit");
        for (final snapshot in dependencyCached.dependencies) {
          context.dependOnInheritedElement(snapshot.element);
        }
        return dependencyCached.data;
      }
    }

    final PartialType resolved;
    final List<_InheritedSnapshot> dependencies;

    if (_resolutionCache case final resolutionCached?
        when resolutionCached.verifyAll(context)) {
      // print("resolution cache hit");
      resolved = resolutionCached.data;
      dependencies = resolutionCached.dependencies;
      resolutionCached.registerAll(context);
    } else {
      final resolutionContext = _ResolutionContext(context);
      resolved = _widget.resolver.resolve(resolutionContext);
      dependencies = resolutionContext._dependencies;
      _resolutionCache = _ResolutionCache(
        data: resolved,
        dependencies: dependencies,
        matchers: resolutionContext._matchers,
      );
    }

    final ancestor = _findAncestorElementOfSameType()?._resolveOverrides(
      context,
    );
    if (ancestor == null) {
      // print("no ancestor");
      return resolved;
    }

    final PartialType merged;
    if (_mergeCache case final mergeCached?
        // TODO: allow customizing this equality
        when mergeCached.fallback == ancestor &&
            mergeCached.overrides == resolved) {
      // print("merge cache hit");
      merged = mergeCached.merged;
    } else {
      // print(
      //   "merge cache miss ${_mergeCache?.fallback} ${ancestor} ${_mergeCache?.overrides} ${resolved}",
      // );
      merged = _widget.merge(ancestor, resolved);
      _mergeCache = _MergeCache(
        fallback: ancestor,
        overrides: resolved,
        merged: merged,
      );
    }

    if (element != null) {
      _dependencyCache[element] = .new(
        data: merged,
        dependencies: dependencies,
      );
    }

    return merged;
  }

  @override
  void updated(covariant WidgetType oldWidget) {
    if (_widget.updateShouldNotify(oldWidget)) {
      _dependencyCache = Expando();
      _resolutionCache = null;
      _mergeCache = null;
      notifyClients(oldWidget);
    }
  }

  @override
  void didChangeDependencies() {
    _dependencyCache = Expando();
    _resolutionCache = null;
    _mergeCache = null;
    super.didChangeDependencies();
    notifyClients(_widget);
  }
}

// abstract class ResolvableTheme<T extends Object?> extends StatelessWidget
//     implements ProxyWidget {
//   const ResolvableTheme({super.key, required this.child});

//   ThemeResolver<T> get resolver;

//   /// The widget below this widget in the tree.
//   ///
//   /// {@macro flutter.widgets.ProxyWidget.child}
//   @override
//   final Widget child;

//   @override
//   Widget build(BuildContext context);
// }

// abstract class ResolvableThemeWithResolver<T extends Object?>
//     extends ResolvableTheme<T> {
//   const ResolvableThemeWithResolver({
//     super.key,
//     required this.resolver,
//     required super.child,
//   });

//   @override
//   final ThemeResolver<T> resolver;

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<ThemeResolver<T>>("resolver", resolver));
//   }
// }

// abstract class ResolvableThemeWithCallback<T extends Object?>
//     extends ResolvableTheme<T> {
//   const ResolvableThemeWithCallback({
//     super.key,
//     required this.callback,
//     required super.child,
//   });

//   final ThemeResolverCallback<T> callback;

//   @override
//   ThemeResolver<T> get resolver => .callback(callback);

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(
//       DiagnosticsProperty<ThemeResolverCallback<T>>("callback", callback),
//     );
//   }
// }

// abstract class ResolvableThemeWithData<T extends Object?>
//     extends ResolvableTheme<T> {
//   const ResolvableThemeWithData({
//     super.key,
//     required this.data,
//     required super.child,
//   });

//   final T data;

//   @override
//   ThemeResolver<T> get resolver => .value(data);

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<T>("data", data));
//   }
// }
