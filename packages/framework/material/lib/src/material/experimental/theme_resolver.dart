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

typedef _VerifyCallback = bool Function(BuildContext context);

/// A snapshot capturing an [InheritedElement] at the moment a dependency on it
/// was registered. It includes the element itself, its [InheritedWidget], and
/// the aspect, if any, which was supplied when registering the dependency.
final class _InheritedSnapshot {
  _InheritedSnapshot.fromElementAndWidget({
    required this.element,
    required this.widget,
    this.aspect,
    required this._verify,
  });

  _InheritedSnapshot.fromElement(
    this.element, {
    this.aspect,
    required this._verify,
  }) : assert(element.widget is InheritedWidget),
       widget = element.widget as InheritedWidget;

  final InheritedElement element;
  final InheritedWidget widget;
  final Object? aspect;
  final _VerifyCallback _verify;

  bool verify(BuildContext context) {
    if (!element.mounted) return false;

    if (!_verify(context)) return false;

    final currentWidget = element.widget;
    final cachedWidget = widget;
    if (identical(currentWidget, cachedWidget)) return true;
    if (currentWidget is InheritedThemeResolverWidget &&
        cachedWidget is InheritedThemeResolverWidget) {
      return currentWidget.resolver == cachedWidget.resolver;
    }
    return currentWidget == cachedWidget;
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  void register(BuildContext context) {
    context.dependOnInheritedElement(element, aspect: aspect);
  }
}

/// Stores the fully resolved, merged theme data and the complete tree of
/// dependencies required to validate it.
final class _DependencyTree {
  _DependencyTree(this.local, {this.ancestorSnapshot, this.ancestorTree});

  final List<_InheritedSnapshot> local;
  final _InheritedSnapshot? ancestorSnapshot;
  final _DependencyTree? ancestorTree;

  bool verifyAll(BuildContext context) {
    for (final snapshot in local) {
      if (!snapshot.verify(context)) return false;
    }
    if (ancestorSnapshot case final ancestorSnapshot?
        when !ancestorSnapshot.verify(context)) {
      return false;
    }
    return ancestorTree?.verifyAll(context) ?? true;
  }

  void registerAll(BuildContext context) {
    for (final snapshot in local) {
      snapshot.register(context);
    }
    ancestorSnapshot?.register(context);
    ancestorTree?.registerAll(context);
  }
}

final class _DependencyCacheEntry<PartialType extends Object?> {
  _DependencyCacheEntry(this.data, {required this.dependencies});

  final PartialType data;
  final _DependencyTree dependencies;
}

final class _ResolutionCache<PartialType extends Object?> {
  _ResolutionCache({required this.data, required this.dependencies});

  final PartialType data;
  final List<_InheritedSnapshot> dependencies;

  bool verifyAll(BuildContext context) {
    for (final snapshot in dependencies) {
      if (!snapshot.verify(context)) return false;
    }
    return true;
  }

  void registerAll(BuildContext context) {
    for (final snapshot in dependencies) {
      snapshot.register(context);
    }
  }
}

/// Data structure for fine-grained cache control. Stores three partial objects:
/// base [fallback], applied [overrides], and the [merged] result.
final class _MergeCache<PartialType extends Object?> {
  _MergeCache({
    required this.fallback,
    required this.overrides,
    required this.merged,
  });

  final PartialType fallback;
  final PartialType overrides;
  final PartialType merged;
}

/// A proxy [BuildContext] that intercepts dependency registrations during
/// [ThemeResolver.resolve] invocations to build the dependency graph.
final class _ResolutionContext implements BuildContext {
  _ResolutionContext(this._context) : _element = _asElement(_context);

  final BuildContext _context;

  final Element? _element;

  final _dependencies = <_InheritedSnapshot>[];

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
    final widget = _context.dependOnInheritedElement(ancestor, aspect: aspect);
    assert(identical(ancestor.widget, widget));
    _dependencies.add(
      .fromElementAndWidget(
        element: ancestor,
        widget: widget,
        aspect: aspect,
        verify: (context) {
          if (!ancestor.mounted) return false;
          if (context is InheritedThemeResolverElement) {
            if (context._inheritedElements[widget.runtimeType]
                case final cachedAncestor?) {
              return cachedAncestor == ancestor;
            }
          }
          InheritedElement? element;
          context.visitAncestorElements((other) {
            if (other == ancestor) {
              element = other as InheritedElement;
              return false;
            }
            return true;
          });
          return element == ancestor;
        },
      ),
    );
    return widget;
  }

  @override
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>({
    Object? aspect,
  }) {
    final widget = _context.dependOnInheritedWidgetOfExactType<T>(
      aspect: aspect,
    );
    final ancestor = _context.getElementForInheritedWidgetOfExactType<T>();
    assert(identical(ancestor?.widget, widget));
    if (ancestor != null) {
      assert(widget != null);
      _dependencies.add(
        _InheritedSnapshot.fromElementAndWidget(
          element: ancestor,
          widget: widget!,
          aspect: aspect,
          verify: (context) {
            final element = context
                .getElementForInheritedWidgetOfExactType<T>();
            return element == ancestor;
          },
        ),
      );
    }
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

  static Element? _asElement(BuildContext context) {
    if (context is Element) return context;
    if (context is _ResolutionContext) return context._element;
    return null;
  }
}

final class _ResolveResult<PartialType extends Object?> {
  _ResolveResult(this.data, {required this.dependencies});

  final PartialType data;
  final _DependencyTree dependencies;
}

final class _Scope<
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
  const _Scope({super.key, required this.element, required super.child});

  final ElementType element;

  @override
  bool updateShouldNotify(
    _Scope<PartialType, WidgetType, ElementType> oldWidget,
  ) => element != oldWidget.element;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ElementType>("element", element));
  }
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
  InheritedThemeResolverElement(WidgetType super.widget)
    : assert(
        widget.runtimeType == WidgetType,
        "${widget.runtimeType} must be exactly $WidgetType.",
      ) {
    assert(
      runtimeType == ElementType,
      "$runtimeType must be exactly $ElementType.",
    );
  }

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  WidgetType get _widget {
    final widget = this.widget;
    assert(
      widget.runtimeType == WidgetType,
      "${widget.runtimeType} must be exactly $WidgetType.",
    );
    return widget as WidgetType;
  }

  PersistentHashMap<Type, InheritedElement> _inheritedElements = const .empty();

  void _updateInheritanceMap() {
    InheritedThemeResolverElement? parent;
    visitAncestorElements((ancestor) {
      if (ancestor is InheritedThemeResolverElement) {
        parent = ancestor;
        return false;
      }

      final scopeElement = ancestor
          .getElementForInheritedWidgetOfExactType<
            _Scope<PartialType, WidgetType, ElementType>
          >();
      final scopeWidget = scopeElement?.widget;
      assert(
        scopeWidget == null ||
            scopeWidget.runtimeType ==
                _Scope<PartialType, WidgetType, ElementType>,
      );
      if (scopeWidget != null) {
        scopeWidget as _Scope<PartialType, WidgetType, ElementType>;
        parent = scopeWidget.element;
        return false;
      }

      return true;
    });

    final inheritedElements = parent?._inheritedElements ?? const .empty();
    _inheritedElements = inheritedElements.put(WidgetType, this);
  }

  var _dependencyCache = Expando<_DependencyCacheEntry<PartialType>>();

  _ResolutionCache<PartialType>? _resolutionCache;

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

    final dependencyCached = element != null ? _dependencyCache[element] : null;
    if (dependencyCached != null &&
        dependencyCached.dependencies.verifyAll(context)) {
      dependencyCached.dependencies.registerAll(context);
      return .new(
        dependencyCached.data,
        dependencies: dependencyCached.dependencies,
      );
    }

    final PartialType resolved;
    List<_InheritedSnapshot> localDependencies;

    if (_resolutionCache case final resolutionCached?
        when resolutionCached.verifyAll(context)) {
      resolved = resolutionCached.data;
      localDependencies = resolutionCached.dependencies;
      resolutionCached.registerAll(context);
    } else {
      final resolutionContext = _ResolutionContext(context);
      resolved = _widget.resolver.resolve(resolutionContext);
      localDependencies = resolutionContext._dependencies;
      _resolutionCache = .new(data: resolved, dependencies: localDependencies);
    }

    final PartialType result;
    _InheritedSnapshot? ancestorSnapshot;
    _DependencyTree? ancestorTree;

    if (_widget.isConcrete(resolved)) {
      result = resolved;
    } else {
      final ancestorElement = _findAncestorElementOfSameType();
      if (ancestorElement == null) {
        result = resolved;
      } else {
        context.dependOnInheritedElement(ancestorElement);
        ancestorSnapshot = .fromElement(
          ancestorElement,
          verify: (_) => _findAncestorElementOfSameType() == ancestorElement,
        );

        final PartialType ancestor;
        _ResolveResult(data: ancestor, dependencies: ancestorTree) =
            ancestorElement._resolveOverridesIn(context);

        if (_mergeCache case final mergeCached?
            when _widget.equals(mergeCached.fallback, ancestor) &&
                _widget.equals(mergeCached.overrides, resolved)) {
          result = mergeCached.merged;
        } else {
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
      ancestorSnapshot: ancestorSnapshot,
      ancestorTree: ancestorTree,
    );

    if (element != null) {
      _dependencyCache[element] = .new(result, dependencies: localTree);
    }

    return .new(result, dependencies: localTree);
  }

  void _invalidateCaches() {
    _dependencyCache = .new();
    _resolutionCache = null;
    _mergeCache = null;
  }

  @override
  void activate() {
    super.activate();
    _invalidateCaches();
  }

  @override
  void unmount() {
    _invalidateCaches();
    super.unmount();
  }

  @override
  void updated(covariant WidgetType oldWidget) {
    if (_widget.updateShouldNotify(oldWidget)) {
      _invalidateCaches();
      // Super call chain explicitly inlined here to avoid unnecessary checks.
      notifyClients(oldWidget);
    }
  }

  @override
  void didChangeDependencies() {
    _invalidateCaches();
    super.didChangeDependencies();
    notifyClients(_widget);
  }

  @override
  void removeDependent(Element dependent) {
    _dependencyCache[dependent] = null;
    super.removeDependent(dependent);
  }

  @override
  Widget build() {
    _updateInheritanceMap();
    return _Scope<PartialType, WidgetType, ElementType>(
      element: this as ElementType,
      child: super.build(),
    );
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
