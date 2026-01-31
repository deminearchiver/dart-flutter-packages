import 'dart:collection';

import 'package:layout/src/layout/flutter.dart';

// TODO(deminearchiver): consider implementing
//  a multi-dimensional multi-child render object widget which would be able to hold
//  multiple arrays of children, maps of slots and other custom dimensions.

class KeyedSlot<T extends Object?> {
  const KeyedSlot(this.key);

  final T key;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is KeyedSlot<T> &&
          key == other.key;

  @override
  int get hashCode => Object.hash(runtimeType, key);
}

abstract class CompoundRenderObjectWidget<
  SlotType extends Object?,
  ChildType extends RenderObject
>
    extends RenderObjectWidget
    with CompoundRenderObjectWidgetMixin<SlotType, ChildType> {
  const CompoundRenderObjectWidget({super.key, this.children = const []});

  @override
  final List<Widget> children;
}

mixin CompoundRenderObjectWidgetMixin<
  SlotType extends Object?,
  ChildType extends RenderObject
>
    on RenderObjectWidget {
  List<Widget> get children;

  @protected
  Iterable<SlotType> get slots;

  @protected
  Widget? childForSlot(SlotType slot);

  @override
  CompoundRenderObjectMixin<
    SlotType,
    ChildType,
    ContainerParentDataMixin<ChildType>
  >
  createRenderObject(BuildContext context);

  @override
  void updateRenderObject(
    BuildContext context,
    CompoundRenderObjectMixin<
      SlotType,
      ChildType,
      ContainerParentDataMixin<ChildType>
    >
    renderObject,
  );

  @override
  CompoundRenderObjectElement<SlotType, ChildType> createElement() =>
      CompoundRenderObjectElement(this);
}

class CompoundRenderObjectElement<
  SlotType extends Object?,
  ChildType extends RenderObject
>
    extends RenderObjectElement {
  CompoundRenderObjectElement(
    CompoundRenderObjectWidgetMixin<SlotType, ChildType> super.widget,
  ) : assert(!debugChildrenHaveDuplicateKeys(widget, widget.children));

  late List<Element> _indexedChildren;
  final Set<Element> _forgottenChildren = HashSet<Element>();

  Map<SlotType, Element> _slotToChild = <SlotType, Element>{};
  Map<Key, Element> _keyedChildren = <Key, Element>{};
  List<SlotType>? _debugPreviousSlots;

  void _createIndexedChildren() {
    final multiChildRenderObjectWidget =
        widget as CompoundRenderObjectWidget<SlotType, ChildType>;
    final indexedChildren = List<Element>.filled(
      multiChildRenderObjectWidget.children.length,
      _NullElement.instance,
    );
    Element? previousIndexedChild;
    for (var i = 0; i < indexedChildren.length; i += 1) {
      final newIndexedChild = inflateWidget(
        multiChildRenderObjectWidget.children[i],
        IndexedSlot<Element?>(i, previousIndexedChild),
      );
      indexedChildren[i] = newIndexedChild;
      previousIndexedChild = newIndexedChild;
    }
    _indexedChildren = indexedChildren;
  }

  void _updateIndexedChildren() {
    final multiChildRenderObjectWidget =
        widget as CompoundRenderObjectWidgetMixin<SlotType, ChildType>;
    assert(
      !debugChildrenHaveDuplicateKeys(
        widget,
        multiChildRenderObjectWidget.children,
      ),
    );
    final newWidgets = multiChildRenderObjectWidget.children;
    _indexedChildren = updateChildren(
      _indexedChildren,
      newWidgets,
      forgottenChildren: _forgottenChildren,
    );
    _forgottenChildren.clear();
  }

  void _updateSlottedChildren() {
    final multiChildRenderObjectWidget =
        widget as CompoundRenderObjectWidgetMixin<SlotType, ChildType>;
    assert(() {
      _debugPreviousSlots ??= multiChildRenderObjectWidget.slots.toList();
      return listEquals(
        _debugPreviousSlots,
        multiChildRenderObjectWidget.slots.toList(),
      );
    }(), "${widget.runtimeType}.slots must not change.");
    assert(
      multiChildRenderObjectWidget.slots.toSet().length ==
          multiChildRenderObjectWidget.slots.length,
      "slots must be unique",
    );

    final oldKeyedElements = _keyedChildren;
    _keyedChildren = <Key, Element>{};
    final oldSlotToChild = _slotToChild;
    _slotToChild = <SlotType, Element>{};

    Map<Key, List<Element>>? debugDuplicateKeys;

    for (final slot in multiChildRenderObjectWidget.slots) {
      final widget = multiChildRenderObjectWidget.childForSlot(slot);
      final newWidgetKey = widget?.key;

      final oldSlotChild = oldSlotToChild[slot];
      final oldKeyChild = oldKeyedElements[newWidgetKey];

      // Try to find the slot for the correct Element that `widget` should update.
      // If key matching fails, resort to `oldSlotChild` from the same slot.
      final Element? fromElement;
      if (oldKeyChild != null) {
        final oldKeySlot = oldKeyChild.slot as KeyedSlot<SlotType>;
        fromElement = oldSlotToChild.remove(oldKeySlot.key);
      } else if (oldSlotChild?.widget.key == null) {
        fromElement = oldSlotToChild.remove(slot);
      } else {
        // The only case we can't use `oldSlotChild` is when its widget has a key.
        assert(oldSlotChild!.widget.key != newWidgetKey);
        fromElement = null;
      }
      final newChild = updateChild(
        fromElement,
        widget,
        KeyedSlot<SlotType>(slot),
      );

      if (newChild != null) {
        _slotToChild[slot] = newChild;

        if (newWidgetKey != null) {
          assert(() {
            final existingElement = _keyedChildren[newWidgetKey];
            if (existingElement != null) {
              (debugDuplicateKeys ??= <Key, List<Element>>{})
                  .putIfAbsent(newWidgetKey, () => [existingElement])
                  .add(newChild);
            }
            return true;
          }());
          _keyedChildren[newWidgetKey] = newChild;
        }
      }
    }
    oldSlotToChild.values.forEach(deactivateChild);
    assert(_debugDuplicateKeys(debugDuplicateKeys));
    assert(
      _keyedChildren.values.every(_slotToChild.values.contains),
      "_keyedChildren ${_keyedChildren.values} should be a subset of ${_slotToChild.values}",
    );
  }

  bool _debugCheckHasAssociatedRenderObject(Element newChild) {
    assert(() {
      if (newChild.renderObject == null) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: FlutterError.fromParts(<DiagnosticsNode>[
              ErrorSummary(
                "The children of `CompoundRenderObjectElement` must each has an associated render object.",
              ),
              ErrorHint(
                "This typically means that the `${newChild.widget}` or its children\n"
                "are not a subtype of `RenderObjectWidget`.",
              ),
              newChild.describeElement(
                "The following element does not have an associated render object",
              ),
              DiagnosticsDebugCreator(DebugCreator(newChild)),
            ]),
          ),
        );
      }
      return true;
    }());
    return true;
  }

  bool _debugDuplicateKeys(Map<Key, List<Element>>? debugDuplicateKeys) {
    if (debugDuplicateKeys == null) {
      return true;
    }
    for (final duplicateKey in debugDuplicateKeys.entries) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary(
          "Multiple widgets used the same key in ${widget.runtimeType}.",
        ),
        ErrorDescription(
          "The key ${duplicateKey.key} was used by multiple widgets. The offending widgets were:\n",
        ),
        for (final Element element in duplicateKey.value)
          ErrorDescription("  - $element\n"),
        ErrorDescription(
          "A key can only be specified on one widget at a time in the same parent widget.",
        ),
      ]);
    }
    return true;
  }

  /// The current list of children of this element.
  ///
  /// This list is filtered to hide elements that have been forgotten (using
  /// [forgetChild]).
  @protected
  @visibleForTesting
  Iterable<Element> get indexedChildren =>
      _indexedChildren.where((child) => !_forgottenChildren.contains(child));

  @override
  CompoundRenderObjectMixin<
    SlotType,
    ChildType,
    ContainerParentDataMixin<ChildType>
  >
  get renderObject =>
      super.renderObject
          as CompoundRenderObjectMixin<
            SlotType,
            ChildType,
            ContainerParentDataMixin<ChildType>
          >;

  @override
  void visitChildren(ElementVisitor visitor) {
    for (final child in _indexedChildren) {
      if (!_forgottenChildren.contains(child)) {
        visitor(child);
      }
    }
    _slotToChild.values.forEach(visitor);
  }

  @override
  void forgetChild(Element child) {
    switch (child.slot) {
      case IndexedSlot<Element?>():
        assert(_indexedChildren.contains(child));
        assert(!_forgottenChildren.contains(child));
        _forgottenChildren.add(child);
      case KeyedSlot<SlotType>(key: final slot):
        assert(_slotToChild.containsValue(child));
        assert(_slotToChild.containsKey(slot));
        _slotToChild.remove(slot);
      default:
        assert(
          false,
          "Invalid slot type. Expected one of: `IndexedSlot` or `$SlotType`.",
        );
    }
    super.forgetChild(child);
  }

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    _createIndexedChildren();
    _updateSlottedChildren();
  }

  @override
  void update(CompoundRenderObjectWidgetMixin<SlotType, ChildType> newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    _updateIndexedChildren();
    _updateSlottedChildren();
  }

  @override
  Element inflateWidget(Widget newWidget, Object? newSlot) {
    final newChild = super.inflateWidget(newWidget, newSlot);
    assert(_debugCheckHasAssociatedRenderObject(newChild));
    return newChild;
  }

  @override
  void insertRenderObjectChild(ChildType child, Object? slot) {
    final CompoundRenderObjectMixin<
      Object?,
      RenderObject,
      ContainerParentDataMixin<RenderObject>
    >
    renderObject = this.renderObject;
    assert(renderObject.debugValidateChild(child));
    switch (slot) {
      case IndexedSlot<Element?>(:final value):
        renderObject.insertIndexedChild(child, after: value?.renderObject);
      case KeyedSlot<SlotType>(key: final slot):
        renderObject._setSlottedChild(child, slot);
        assert(renderObject._slotToChild[slot] == child);
      default:
        assert(
          false,
          "Invalid slot type. Expected one of: `IndexedSlot` or `$SlotType`.",
        );
    }
    assert(renderObject == this.renderObject);
  }

  @override
  void removeRenderObjectChild(ChildType child, Object? slot) {
    final CompoundRenderObjectMixin<
      Object?,
      RenderObject,
      ContainerParentDataMixin<RenderObject>
    >
    renderObject = this.renderObject;
    assert(renderObject.debugValidateChild(child));
    switch (slot) {
      case IndexedSlot<Element?>():
        renderObject.removeIndexedChild(child);
      case KeyedSlot<SlotType>(key: final slot):
        if (renderObject._slotToChild[slot] == child) {
          renderObject._setSlottedChild(null, slot);
          assert(renderObject._slotToChild[slot] == null);
        }
      default:
        assert(
          false,
          "Invalid slot type. Expected one of: `IndexedSlot` or `$SlotType`.",
        );
    }
    assert(renderObject == this.renderObject);
  }

  @override
  void moveRenderObjectChild(ChildType child, Object oldSlot, Object newSlot) {
    final CompoundRenderObjectMixin<
      Object?,
      RenderObject,
      ContainerParentDataMixin<RenderObject>
    >
    renderObject = this.renderObject;
    assert(child.parent == renderObject);
    switch ((newSlot, oldSlot)) {
      case (IndexedSlot<Element?>(:final value), IndexedSlot<Element?>()):
        renderObject.moveIndexedChild(child, after: value?.renderObject);
      case (
        KeyedSlot<SlotType>(key: final newSlot),
        KeyedSlot<SlotType>(key: final oldSlot),
      ):
        renderObject._moveSlottedChild(child, newSlot, oldSlot);
      case (
        IndexedSlot<Element?>(:final value),
        KeyedSlot<SlotType>(key: final oldSlot),
      ):
        if (renderObject._slotToChild[oldSlot] == child) {
          renderObject._slotToChild.remove(oldSlot);
        }
        renderObject._insertIntoChildList(child, after: value?.renderObject);
      case (KeyedSlot<SlotType>(key: final newSlot), IndexedSlot<Element?>()):
        renderObject._removeFromChildList(child);
        renderObject._setSlottedChild(child, newSlot);
        assert(renderObject._slotToChild[newSlot] == child);
      default:
        assert(
          false,
          "Invalid slot type. Expected one of: `IndexedSlot` or `$SlotType`.",
        );
    }
    assert(renderObject == this.renderObject);
  }
}

mixin CompoundRenderObjectMixin<
  SlotType extends Object?,
  ChildType extends RenderObject,
  ParentDataType extends ContainerParentDataMixin<ChildType>
>
    on RenderObject
// implements
// ContainerRenderObjectMixin<ChildType, ParentDataType>
// SlottedContainerRenderObjectMixin<SlotType, ChildType>
{
  int _childCount = 0;
  ChildType? _firstChild;
  ChildType? _lastChild;

  final _slotToChild = <SlotType, ChildType>{};

  void _insertIntoChildList(ChildType child, {ChildType? after}) {
    final childParentData = child.parentData! as ParentDataType;
    assert(childParentData.nextSibling == null);
    assert(childParentData.previousSibling == null);
    _childCount += 1;
    assert(_childCount > 0);
    if (after == null) {
      // insert at the start (_firstChild)
      childParentData.nextSibling = _firstChild;
      if (_firstChild != null) {
        (_firstChild!.parentData! as ParentDataType).previousSibling = child;
      }
      _firstChild = child;
      _lastChild ??= child;
    } else {
      assert(_firstChild != null);
      assert(_lastChild != null);
      assert(_debugUltimatePreviousSiblingOf(after, equals: _firstChild));
      assert(_debugUltimateNextSiblingOf(after, equals: _lastChild));
      final afterParentData = after.parentData! as ParentDataType;
      if (afterParentData.nextSibling == null) {
        // insert at the end (_lastChild); we'll end up with two or more children
        assert(after == _lastChild);
        childParentData.previousSibling = after;
        afterParentData.nextSibling = child;
        _lastChild = child;
      } else {
        // insert in the middle; we'll end up with three or more children
        // set up links from child to siblings
        childParentData
          ..nextSibling = afterParentData.nextSibling
          ..previousSibling = after;
        // set up links from siblings to child
        final childPreviousSiblingParentData =
            childParentData.previousSibling!.parentData! as ParentDataType;
        final childNextSiblingParentData =
            childParentData.nextSibling!.parentData! as ParentDataType;
        childPreviousSiblingParentData.nextSibling = child;
        childNextSiblingParentData.previousSibling = child;
        assert(afterParentData.nextSibling == child);
      }
    }
  }

  void _removeFromChildList(ChildType child) {
    final childParentData = child.parentData! as ParentDataType;
    assert(_debugUltimatePreviousSiblingOf(child, equals: _firstChild));
    assert(_debugUltimateNextSiblingOf(child, equals: _lastChild));
    assert(_childCount >= 0);
    if (childParentData.previousSibling == null) {
      assert(_firstChild == child);
      _firstChild = childParentData.nextSibling;
    } else {
      (childParentData.previousSibling!.parentData! as ParentDataType)
              .nextSibling =
          childParentData.nextSibling;
    }
    if (childParentData.nextSibling == null) {
      assert(_lastChild == child);
      _lastChild = childParentData.previousSibling;
    } else {
      (childParentData.nextSibling!.parentData! as ParentDataType)
              .previousSibling =
          childParentData.previousSibling;
    }
    childParentData
      ..previousSibling = null
      ..nextSibling = null;
    _childCount -= 1;
  }

  void _setSlottedChild(ChildType? child, SlotType slot) {
    final oldChild = _slotToChild[slot];
    if (oldChild != null) {
      dropChild(oldChild);
      _slotToChild.remove(slot);
    }
    if (child != null) {
      (child.parentData as ParentDataType?)
        ?..previousSibling = null
        ..nextSibling = null;
      _slotToChild[slot] = child;
      adoptChild(child);
    }
  }

  void _moveSlottedChild(ChildType child, SlotType slot, SlotType oldSlot) {
    assert(slot != oldSlot);
    final oldChild = _slotToChild[oldSlot];
    if (oldChild == child) {
      _setSlottedChild(null, oldSlot);
    }
    _setSlottedChild(child, slot);
  }

  bool _debugUltimatePreviousSiblingOf(ChildType child, {ChildType? equals}) {
    var childParentData = child.parentData! as ParentDataType;
    while (childParentData.previousSibling != null) {
      assert(childParentData.previousSibling != child);
      child = childParentData.previousSibling!;
      childParentData = child.parentData! as ParentDataType;
    }
    return child == equals;
  }

  bool _debugUltimateNextSiblingOf(ChildType child, {ChildType? equals}) {
    var childParentData = child.parentData! as ParentDataType;
    while (childParentData.nextSibling != null) {
      assert(childParentData.nextSibling != child);
      child = childParentData.nextSibling!;
      childParentData = child.parentData! as ParentDataType;
    }
    return child == equals;
  }

  Iterable<DiagnosticsNode> _debugDescribeIndexedChildren() sync* {
    if (firstIndexedChild != null) {
      var child = firstIndexedChild!;
      var count = 1;
      while (true) {
        yield child.toDiagnosticsNode(name: "child $count");
        if (child == lastIndexedChild) break;
        count += 1;
        child = (child.parentData! as ParentDataType).nextSibling!;
      }
    }
  }

  Iterable<DiagnosticsNode> _debugDescribeSlottedChildren() sync* {
    final childToSlot = Map.fromIterables(
      _slotToChild.values,
      _slotToChild.keys,
    );
    for (final child in slottedChildren) {
      yield child.toDiagnosticsNode(
        name: debugNameForSlot(childToSlot[child] as SlotType),
      );
    }
  }

  int get indexedChildCount => _childCount;

  /// The first child in the child list.
  ChildType? get firstIndexedChild => _firstChild;

  /// The last child in the child list.
  ChildType? get lastIndexedChild => _lastChild;

  /// Returns an [Iterable] of all non-null children.
  ///
  /// This getter is used by the default implementation of [attach], [detach],
  /// [redepthChildren], [visitChildren], and [debugDescribeChildren] to iterate
  /// over the children of this [RenderObject]. The base implementation makes no
  /// guarantee about the order in which the children are returned. Subclasses
  /// for which the child order is important should override this getter and
  /// return the children in the desired order.
  @protected
  Iterable<ChildType> get slottedChildren => _slotToChild.values;

  /// Insert child into this render object's child list after the given child.
  ///
  /// If `after` is null, then this inserts the child at the start of the list,
  /// and the child becomes the new [firstIndexedChild].
  void insertIndexedChild(ChildType child, {ChildType? after}) {
    assert(child != this, "A RenderObject cannot be inserted into itself.");
    assert(
      after != this,
      "A RenderObject cannot simultaneously be both the parent and the sibling of another RenderObject.",
    );
    assert(child != after, "A RenderObject cannot be inserted after itself.");
    assert(child != _firstChild);
    assert(child != _lastChild);
    adoptChild(child);
    assert(
      child.parentData is ParentDataType,
      "A child of $runtimeType has parentData of type ${child.parentData.runtimeType}, "
      "which does not conform to $ParentDataType. Class using ContainerRenderObjectMixin "
      "should override setupParentData() to set parentData to type $ParentDataType.",
    );
    _insertIntoChildList(child, after: after);
  }

  /// Append child to the end of this render object's child list.
  void addIndexedChild(ChildType child) {
    insertIndexedChild(child, after: _lastChild);
  }

  /// Add all the children to the end of this render object's child list.
  void addAllIndexedChildren(List<ChildType>? children) {
    children?.forEach(addIndexedChild);
  }

  /// Remove this child from the child list.
  ///
  /// Requires the child to be present in the child list.
  void removeIndexedChild(ChildType child) {
    _removeFromChildList(child);
    dropChild(child);
  }

  /// Remove all their children from this render object's child list.
  ///
  /// More efficient than removing them individually.
  void removeAllIndexedChildren() {
    var child = _firstChild;
    while (child != null) {
      final childParentData = child.parentData! as ParentDataType;
      final next = childParentData.nextSibling;
      childParentData
        ..previousSibling = null
        ..nextSibling = null;
      dropChild(child);
      child = next;
    }
    _firstChild = null;
    _lastChild = null;
    _childCount = 0;
  }

  /// Move the given `child` in the child list to be after another child.
  ///
  /// More efficient than removing and re-adding the child. Requires the child
  /// to already be in the child list at some position. Pass null for `after` to
  /// move the child to the start of the child list.
  void moveIndexedChild(ChildType child, {ChildType? after}) {
    assert(child != this);
    assert(after != this);
    assert(child != after);
    assert(child.parent == this);
    if ((child.parentData! as ParentDataType).previousSibling == after) return;
    _removeFromChildList(child);
    _insertIntoChildList(child, after: after);
    markNeedsLayout();
  }

  /// The previous child before the given child in the child list.
  ChildType? indexedChildBefore(ChildType child) {
    assert(child.parent == this);
    return (child.parentData! as ParentDataType).previousSibling;
  }

  /// The next child after the given child in the child list.
  ChildType? indexedChildAfter(ChildType child) {
    assert(child.parent == this);
    return (child.parentData! as ParentDataType).nextSibling;
  }

  /// Checks whether the given render object has the correct [runtimeType] to be
  /// a child of this render object.
  ///
  /// Does nothing if assertions are disabled.
  ///
  /// Always returns true.
  bool debugValidateChild(RenderObject child) {
    assert(() {
      if (child is! ChildType) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
            "A $runtimeType expected a child of type $ChildType but received a "
            "child of type ${child.runtimeType}.",
          ),
          ErrorDescription(
            "RenderObjects expect specific types of children because they "
            "coordinate with their children during layout and paint. For "
            "example, a RenderSliver cannot be the child of a RenderBox because "
            "a RenderSliver does not understand the RenderBox layout protocol.",
          ),
          ErrorSpacer(),
          DiagnosticsProperty<Object?>(
            "The $runtimeType that expected a $ChildType child was created by",
            debugCreator,
            style: DiagnosticsTreeStyle.errorProperty,
          ),
          ErrorSpacer(),
          DiagnosticsProperty<Object?>(
            "The ${child.runtimeType} that did not match the expected child type "
            "was created by",
            child.debugCreator,
            style: DiagnosticsTreeStyle.errorProperty,
          ),
        ]);
      }
      return true;
    }());
    return true;
  }

  /// Returns the [RenderObject] child that is currently occupying the provided
  /// `slot`.
  ///
  /// Returns null if no [RenderObject] is configured for the given slot.
  @protected
  ChildType? childForSlot(SlotType slot) => _slotToChild[slot];

  @protected
  String debugNameForSlot(SlotType slot) =>
      slot is Enum ? slot.name : slot.toString();

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    var child = _firstChild;
    while (child != null) {
      child.attach(owner);
      child = (child.parentData! as ParentDataType).nextSibling;
    }
    for (final child in slottedChildren) {
      child.attach(owner);
    }
  }

  @override
  void detach() {
    super.detach();
    var child = _firstChild;
    while (child != null) {
      child.detach();
      child = (child.parentData! as ParentDataType).nextSibling;
    }
    for (final child in slottedChildren) {
      child.detach();
    }
  }

  @override
  void redepthChildren() {
    var child = _firstChild;
    while (child != null) {
      redepthChild(child);
      child = (child.parentData! as ParentDataType).nextSibling;
    }
    slottedChildren.forEach(redepthChild);
  }

  @override
  void visitChildren(RenderObjectVisitor visitor) {
    var child = _firstChild;
    while (child != null) {
      visitor(child);
      child = (child.parentData! as ParentDataType).nextSibling;
    }
    slottedChildren.forEach(visitor);
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() => [
    DiagnosticsBlock(
      name: "Indexed children",
      children: _debugDescribeIndexedChildren().toList(),
    ),
    DiagnosticsBlock(
      name: "Slotted children",
      children: _debugDescribeSlottedChildren().toList(),
    ),
  ];
}

/// Used as a placeholder in [List<Element>] objects when the actual
/// elements are not yet determined.
class _NullElement extends Element {
  _NullElement() : super(const _NullWidget());

  @override
  bool get debugDoingBuild => throw UnimplementedError();

  static final instance = _NullElement();
}

class _NullWidget extends Widget {
  const _NullWidget();

  @override
  Element createElement() => throw UnimplementedError();
}
