// MIT License
// Copyright (c) 2019 Remi Rousselet
// Copyright (c) 2025 deminearchiver

// ignore_for_file: use_to_and_as_if_applicable

import 'package:material/src/material/flutter.dart';
import 'package:nested/nested.dart' as nested;

/// A widget that simplify the writing of deeply nested widget trees.
///
/// It relies on the new kind of widget [SingleChildWidget], which has two
/// concrete implementations:
/// - [SingleChildStatelessWidget]
/// - [SingleChildStatefulWidget]
///
/// They are both respectively a [SingleChildWidget] variant of [StatelessWidget]
/// and [StatefulWidget].
///
/// The difference between a widget and its single-child variant is that they have
/// a custom `build` method that takes an extra parameter.
///
/// As such, a `StatelessWidget` would be:
///
/// ```dart
/// class MyWidget extends StatelessWidget {
///   MyWidget({Key key, this.child}): super(key: key);
///
///   final Widget child;
///
///   @override
///   Widget build(BuildContext context) {
///     return SomethingWidget(child: child);
///   }
/// }
/// ```
///
/// Whereas a [SingleChildStatelessWidget] would be:
///
/// ```dart
/// class MyWidget extends SingleChildStatelessWidget {
///   MyWidget({Key key, Widget child}): super(key: key, child: child);
///
///   @override
///   Widget buildWithChild(BuildContext context, Widget child) {
///     return SomethingWidget(child: child);
///   }
/// }
/// ```
///
/// This allows our new `MyWidget` to be used both with:
///
/// ```dart
/// MyWidget(
///   child: AnotherWidget(),
/// )
/// ```
///
/// and to be placed inside `children` of [Nested] like so:
///
/// ```dart
/// Nested(
///   children: [
///     MyWidget(),
///     ...
///   ],
///   child: AnotherWidget(),
/// )
/// ```
class Nested extends StatelessWidget implements SingleChildWidget {
  /// Allows configuring key, children and child
  const Nested({super.key, this.children = const [], this.child});

  final List<SingleChildWidget> children;

  final Widget? child;

  @override
  NestedElement createElement() => NestedElement(this);

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      Nested(key: key, children: children, child: child);

  @override
  Widget build(BuildContext context) {
    throw StateError("Implemented internally.");
  }
}

class NestedElement extends StatelessElement
    with SingleChildWidgetElementMixin {
  NestedElement(Nested super.widget);

  Nested get _widget => super.widget as Nested;

  @override
  Widget build() {
    var nextNode = hasNestedChild ? nestedChild : _widget.child;
    for (final child in _widget.children.reversed) {
      nextNode = _NestedNode(wrappedWidget: child, injectedChild: nextNode);
    }
    return nextNode ?? const SizedBox.shrink();
  }
}

class _NestedNode extends StatelessWidget {
  const _NestedNode({
    super.key,
    required this._wrappedWidget,
    this._injectedChild,
  });

  final SingleChildWidget _wrappedWidget;
  final Widget? _injectedChild;

  @override
  _NestedNodeElement createElement() => _NestedNodeElement(this);

  @override
  Widget build(BuildContext context) => _wrappedWidget;
}

class _NestedNodeElement extends StatelessElement {
  _NestedNodeElement(_NestedNode super.widget);

  _NestedNode get _widget => super.widget as _NestedNode;

  Widget? get injectedChild => _widget._injectedChild;

  @override
  void update(_NestedNode newWidget) {
    final oldWidget = _widget;
    if (oldWidget._injectedChild != newWidget._injectedChild) {
      visitChildren((element) => element.markNeedsBuild());
    }
    super.update(newWidget);
  }
}

/// A [Widget] that takes a single descendant.
///
/// As opposed to [ProxyWidget], it may have a "build" method.
///
/// See also:
/// - [SingleChildStatelessWidget]
/// - [SingleChildStatefulWidget]
abstract class SingleChildWidget implements Widget {
  /// Return a copy of this single child widget with the specified [child].
  SingleChildWidget wrap(BuildContext context, Widget? child);

  @override
  SingleChildWidgetElementMixin createElement();
}

mixin SingleChildWidgetElementMixin on Element {
  _NestedNodeElement? _nestedNode;

  @protected
  bool get hasNestedChild => _nestedNode != null;

  @protected
  Widget? get nestedChild => _nestedNode?.injectedChild;

  @override
  void mount(Element? parent, Object? newSlot) {
    _nestedNode = parent is _NestedNodeElement ? parent : null;
    super.mount(parent, newSlot);
  }

  @override
  void activate() {
    super.activate();
    _nestedNode = null;
    visitAncestorElements((ancestor) {
      if (ancestor is _NestedNodeElement) {
        _nestedNode = ancestor;
      }
      return false;
    });
  }
}

/// A [StatelessWidget] that implements [SingleChildWidget] and is therefore
/// compatible with [Nested].
///
/// Its [build] method must **not** be overriden. Instead use [buildWithChild].
abstract class SingleChildStatelessWidget extends StatelessWidget
    implements SingleChildWidget {
  /// Creates a widget that has exactly one child widget.
  const SingleChildStatelessWidget({super.key, this.child});

  final Widget? child;

  /// A [build] method that receives an extra `child` parameter.
  ///
  /// This method may be called with a `child` different from the parameter
  /// passed to the constructor of [SingleChildStatelessWidget].
  /// It may also be called again with a different `child`, without this widget
  /// being recreated.
  Widget buildWithChild(BuildContext context, Widget? child);

  @override
  SingleChildStatelessElement createElement() =>
      SingleChildStatelessElement(this);

  @override
  Widget build(BuildContext context) => buildWithChild(context, child);
}

/// An [Element] that uses a [SingleChildStatelessWidget] as its configuration.
class SingleChildStatelessElement extends StatelessElement
    with SingleChildWidgetElementMixin {
  /// Creates an element that uses the given widget as its configuration.
  SingleChildStatelessElement(SingleChildStatelessWidget super.widget);

  SingleChildStatelessWidget get _widget =>
      super.widget as SingleChildStatelessWidget;

  @override
  Widget build() => hasNestedChild
      ? _widget.buildWithChild(this, nestedChild)
      : super.build();
}

/// A [StatefulWidget] that is compatible with [Nested].
abstract class SingleChildStatefulWidget extends StatefulWidget
    implements SingleChildWidget {
  /// Creates a widget that has exactly one child widget.
  const SingleChildStatefulWidget({super.key, this.child});

  final Widget? child;

  @override
  SingleChildStatefulElement createElement() =>
      SingleChildStatefulElement(this);
}

/// A [State] for [SingleChildStatefulWidget].
///
/// Do not override [build] and instead override [buildWithChild].
abstract class SingleChildState<T extends SingleChildStatefulWidget>
    extends State<T> {
  /// A [build] method that receives an extra `child` parameter.
  ///
  /// This method may be called with a `child` different from the parameter
  /// passed to the constructor of [SingleChildStatelessWidget].
  /// It may also be called again with a different `child`, without this widget
  /// being recreated.
  Widget buildWithChild(BuildContext context, Widget? child);

  @override
  Widget build(BuildContext context) => buildWithChild(context, widget.child);
}

/// An [Element] that uses a [SingleChildStatefulWidget] as its configuration.
class SingleChildStatefulElement extends StatefulElement
    with SingleChildWidgetElementMixin {
  /// Creates an element that uses the given widget as its configuration.
  SingleChildStatefulElement(SingleChildStatefulWidget super.widget);

  SingleChildState<SingleChildStatefulWidget> get _state =>
      super.state as SingleChildState<SingleChildStatefulWidget>;

  @override
  Widget build() =>
      hasNestedChild ? _state.buildWithChild(this, nestedChild) : super.build();
}

/// A [SingleChildWidget] that delegates its implementation to a callback.
///
/// It works like [Builder], but is compatible with [Nested].
class SingleChildBuilder extends SingleChildStatelessWidget {
  /// Creates a widget that delegates its build to a callback.
  ///
  /// The [builder] argument must not be null.
  const SingleChildBuilder({super.key, required this.builder, super.child});

  /// Called to obtain the child widget.
  ///
  /// The `child` parameter may be different from the one parameter passed to
  /// the constructor of [SingleChildBuilder].
  final Widget Function(BuildContext context, Widget? child) builder;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      SingleChildBuilder(key: key, builder: builder, child: child);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      builder(context, child);
}

mixin SingleChildStatelessWidgetMixin
    implements StatelessWidget, SingleChildStatelessWidget {
  @override
  Widget? get child;

  @override
  SingleChildStatelessElement createElement() =>
      SingleChildStatelessElement(this);

  @override
  Widget build(BuildContext context) => buildWithChild(context, child);
}

mixin SingleChildStatefulWidgetMixin on StatefulWidget
    implements SingleChildWidget {
  Widget? get child;

  @override
  SingleChildStatefulMixinElement createElement() =>
      SingleChildStatefulMixinElement(this);
}

mixin SingleChildStateMixin<T extends SingleChildStatefulWidgetMixin>
    on State<T> {
  Widget buildWithChild(BuildContext context, Widget? child);

  @override
  Widget build(BuildContext context) => buildWithChild(context, widget.child);
}

class SingleChildStatefulMixinElement extends StatefulElement
    with SingleChildWidgetElementMixin {
  SingleChildStatefulMixinElement(SingleChildStatefulWidgetMixin super.widget);

  SingleChildStateMixin<SingleChildStatefulWidgetMixin> get _state =>
      super.state as SingleChildStateMixin<SingleChildStatefulWidgetMixin>;

  @override
  Widget build() =>
      hasNestedChild ? _state.buildWithChild(this, nestedChild) : super.build();
}

mixin SingleChildInheritedElementMixin
    on InheritedElement, SingleChildWidgetElementMixin {
  @override
  Widget build() =>
      hasNestedChild ? nestedChild ?? const SizedBox.shrink() : super.build();
}

class LegacyToNestedAdapter extends SingleChildStatelessWidget {
  const LegacyToNestedAdapter({
    super.key,
    this.children = const [],
    super.child,
  });

  final List<nested.SingleChildWidget> children;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      LegacyToNestedAdapter(key: key, children: children, child: child);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      children.isNotEmpty
      ? nested.Nested(children: children, child: child)
      : child ?? const SizedBox.shrink();
}

class NestedToLegacyAdapter extends nested.SingleChildStatelessWidget {
  const NestedToLegacyAdapter({
    super.key,
    this.children = const [],
    super.child,
  });

  final List<SingleChildWidget> children;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      children.isNotEmpty
      ? Nested(children: children, child: child)
      : child ?? const SizedBox.shrink();
}
