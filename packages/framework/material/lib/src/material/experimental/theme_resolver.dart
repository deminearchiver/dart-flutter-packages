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

/// A snapshot capturing an [InheritedElement] at the moment a dependency on it
/// was registered. It includes the element itself, its [InheritedWidget], and
/// the aspect, if any, which was supplied when registering the dependency.
extension type const _InheritedSnapshot._(
  ({InheritedElement element, InheritedWidget widget, Object? aspect}) _
) implements Object {
  _InheritedSnapshot.fromElementAndWidget({
    required InheritedElement element,
    required InheritedWidget widget,
    Object? aspect,
  }) : assert(identical(widget, element.widget)),
       _ = (element: element, widget: widget, aspect: aspect);

  _InheritedSnapshot.fromElement(InheritedElement element, {Object? aspect})
    : assert(element.widget is InheritedWidget),
      _ = (
        element: element,
        widget: element.widget as InheritedWidget,
        aspect: aspect,
      );

  bool get isValid {
    if (!_.element.mounted) return false;
    final currentWidget = _.element.widget;
    final cachedWidget = _.widget;
    if (identical(currentWidget, cachedWidget)) return true;
    if (currentWidget is InheritedThemeResolverWidget &&
        cachedWidget is InheritedThemeResolverWidget) {
      return currentWidget.resolver == cachedWidget.resolver;
    }
    return currentWidget == cachedWidget;
  }

  void register(BuildContext context) {
    context.dependOnInheritedElement(_.element, aspect: _.aspect);
  }
}

/// Stores the fully resolved, merged theme data and the complete tree of
/// dependencies required to validate it.
class _DependencyTree {
  const _DependencyTree(this._local, {this._ancestor});

  final List<_InheritedSnapshot> _local;

  final _DependencyTree? _ancestor;

  bool get isValid {
    for (final snapshot in _local) {
      if (!snapshot.isValid) return false;
    }
    return _ancestor?.isValid ?? true;
  }

  void registerAll(BuildContext context) {
    for (final snapshot in _local) {
      snapshot.register(context);
    }
    _ancestor?.registerAll(context);
  }
}

extension type const _DependencyCacheEntry<PartialType extends Object?>._(
  ({PartialType data, _DependencyTree dependencies}) _
) implements Object {
  const _DependencyCacheEntry(
    PartialType data, {
    required _DependencyTree dependencies,
  }) : _ = (data: data, dependencies: dependencies);

  PartialType get data => _.data;

  _DependencyTree get dependencies => _.dependencies;
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

extension type const _ResolutionCache<PartialType extends Object?>._(
  ({
    PartialType data,
    List<_InheritedSnapshot> dependencies,
    List<_Matcher> matchers,
  })
  _
) implements Object {
  const _ResolutionCache({
    required PartialType data,
    required List<_InheritedSnapshot> dependencies,
    required List<_Matcher> matchers,
  }) : _ = (data: data, dependencies: dependencies, matchers: matchers);

  PartialType get data => _.data;

  List<_InheritedSnapshot> get dependencies => _.dependencies;

  bool verifyAll(BuildContext context) {
    for (final matcher in _.matchers) {
      if (!matcher.verify(context)) return false;
    }
    return true;
  }

  void registerAll(BuildContext context) {
    for (final matcher in _.matchers) {
      matcher.register(context);
    }
  }
}

/// Data structure for fine-grained cache control. Stores three partial objects:
/// base [fallback], applied [overrides], and the [merged] result.
extension type const _MergeCache<PartialType extends Object?>._(
  ({PartialType fallback, PartialType overrides, PartialType merged}) _
) implements Object {
  const _MergeCache({
    required PartialType fallback,
    required PartialType overrides,
    required PartialType merged,
  }) : _ = (fallback: fallback, overrides: overrides, merged: merged);

  PartialType get fallback => _.fallback;

  PartialType get overrides => _.overrides;

  PartialType get merged => _.merged;
}

/// A proxy [BuildContext] that intercepts dependency registrations during
/// [ThemeResolver.resolve] invocations to build the dependency graph.
final class _ResolutionContext implements BuildContext {
  _ResolutionContext(this._context) : _element = _asElement(_context);

  final BuildContext _context;

  // TODO: implement resolution context recognition or remove this field
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
    _dependencies.add(
      .fromElementAndWidget(element: ancestor, widget: widget, aspect: aspect),
    );

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
          return currentWidget == cachedWidget;
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
        .fromElementAndWidget(
          element: ancestor,
          widget: widget!,
          aspect: aspect,
        ),
      );

      // Add matcher.
      _matchers.add(
        .new(
          verify: (context) {
            if (!ancestor.mounted) return false;
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
            return currentWidget == cachedWidget;
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

extension type const _ResolveResult<PartialType extends Object?>._(
  ({PartialType data, _DependencyTree dependencies}) _
) implements Object {
  const _ResolveResult(
    PartialType data, {
    required _DependencyTree dependencies,
  }) : _ = (data: data, dependencies: dependencies);

  PartialType get data => _.data;

  _DependencyTree get dependencies => _.dependencies;
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

  bool isConcrete(PartialType data) => false;

  bool equals(PartialType a, PartialType b) => a == b;

  @override
  ElementType createElement();

  @override
  bool updateShouldNotify(WidgetType oldWidget) =>
      resolver != oldWidget.resolver;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ThemeResolver<PartialType>>("resolver", resolver),
    );
  }

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
      return ancestor._resolveOverridesIn(context).data;
    }
    return null;
  }
}

base class InheritedThemeResolverElement<
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

  // Dependency cache is only valid if no changes have occured since last
  // rebuild.
  var _dependencyCache = Expando<_DependencyCacheEntry<PartialType>>();

  // Resolution cache stores the result of the last resolver invocation.
  _ResolutionCache<PartialType>? _resolutionCache;

  // Merge cache is only used if the element has an ancestor of the same type.
  _MergeCache<PartialType>? _mergeCache;

  ElementType? _findAncestorElementOfSameType() {
    InheritedElement? ancestor;
    visitAncestorElements((parent) {
      ancestor = parent.getElementForInheritedWidgetOfExactType<WidgetType>();
      return false;
    });
    assert(ancestor == null || ancestor.runtimeType == ElementType);
    return ancestor as ElementType?;
  }

  _ResolveResult<PartialType> _resolveOverridesIn(BuildContext context) {
    final element = _ResolutionContext._asElement(context);

    // Dependency cache is the best possible case.
    final dependencyCached = element != null ? _dependencyCache[element] : null;
    if (dependencyCached != null && dependencyCached.dependencies.isValid) {
      // print("dependency cache hit");

      dependencyCached.dependencies.registerAll(context);

      // Safe to return: cache invalidates when changing dependencies.
      return .new(
        dependencyCached.data,
        dependencies: dependencyCached.dependencies,
      );
    }

    // print("dependency cache miss");

    final PartialType resolved;
    List<_InheritedSnapshot> localDependencies;

    if (_resolutionCache case final resolutionCached?
        when resolutionCached.verifyAll(context)) {
      // print("resolution cache hit");

      resolved = resolutionCached.data;
      localDependencies = resolutionCached.dependencies;
      resolutionCached.registerAll(context);
    } else {
      // print("resolution cache miss");

      final resolutionContext = _ResolutionContext(context);
      resolved = _widget.resolver.resolve(resolutionContext);
      localDependencies = resolutionContext._dependencies;
      _resolutionCache = _ResolutionCache(
        data: resolved,
        dependencies: localDependencies,
        matchers: resolutionContext._matchers,
      );
    }

    final PartialType result;
    _DependencyTree? ancestorTree;

    if (_widget.isConcrete(resolved)) {
      result = resolved;
    } else {
      final ancestorElement = _findAncestorElementOfSameType();
      if (ancestorElement == null) {
        result = resolved;
      } else {
        context.dependOnInheritedElement(ancestorElement);
        localDependencies = [
          ...localDependencies,
          .fromElement(ancestorElement),
        ];

        final PartialType ancestor;
        _ResolveResult(data: ancestor, dependencies: ancestorTree) =
            ancestorElement._resolveOverridesIn(context);

        if (_mergeCache case final mergeCached?
            when _widget.equals(mergeCached.fallback, ancestor) &&
                _widget.equals(mergeCached.overrides, resolved)) {
          // print("merge cache hit");

          result = mergeCached.merged;
        } else {
          // print("merge cache miss");

          result = _widget.merge(ancestor, resolved);
          _mergeCache = .new(
            fallback: ancestor,
            overrides: resolved,
            merged: result,
          );
        }
      }
    }

    final localTree = _DependencyTree(
      localDependencies,
      ancestor: ancestorTree,
    );

    if (element != null) {
      _dependencyCache[element] = .new(result, dependencies: localTree);
    }

    return .new(result, dependencies: localTree);
  }

  @override
  void updated(covariant WidgetType oldWidget) {
    if (_widget.updateShouldNotify(oldWidget)) {
      _dependencyCache = Expando();
      _resolutionCache = null;
      _mergeCache = null;
      // Super call chain explicitly inlined here to avoid unnecessary checks.
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

  @override
  void removeDependent(Element dependent) {
    _dependencyCache[dependent] = null;
    super.removeDependent(dependent);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<_ResolutionCache<PartialType>>(
          "resolution cache",
          _resolutionCache,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<_MergeCache<PartialType>>(
          "merge cache",
          _mergeCache,
          defaultValue: null,
        ),
      );
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
