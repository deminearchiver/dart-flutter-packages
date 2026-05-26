import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:touch_targets/touch_targets.dart';

bool debugCheckHasTouchGroup(BuildContext context) {
  assert(() {
    if (context.widget is! _TouchGroupStateScope &&
        context
                .getElementForInheritedWidgetOfExactType<
                  _TouchGroupStateScope
                >() ==
            null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary("No TouchGroup widget ancestor found."),
        ErrorDescription(
          "${context.widget.runtimeType} widgets require a TouchGroup widget "
          "ancestor.",
        ),
        context.describeWidget(
          "The specific widget that could not find a TouchGroup ancestor was",
        ),
        context.describeOwnershipChain(
          "The ownership chain for the affected widget is",
        ),
        ErrorHint(
          "No TouchGroup ancestor could be found starting from the context "
          "that was passed to TouchGroup.of(). This can happen because the "
          "context used is not a descendant of a TouchGroup widget.",
        ),
      ]);
    }
    return true;
  }());
  return true;
}

class TouchGroup extends StatefulWidget implements ProxyWidget {
  const TouchGroup({super.key, required this.child});

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  @override
  final Widget child;

  @override
  State<TouchGroup> createState() => _TouchGroupState();

  static TouchGroupRegistry? maybeOf(BuildContext context) =>
      _TouchGroupStateScope.maybeOf(context);

  static TouchGroupRegistry of(BuildContext context) {
    assert(debugCheckHasTouchGroup(context));
    return maybeOf(context)!;
  }
}

class _TouchGroupState extends State<TouchGroup> implements TouchGroupRegistry {
  // TODO: improve state management here

  final Set<TouchClient> _clients = HashSet<TouchClient>();

  @override
  void registerClient(TouchClient client) {
    assert(() {
      if (_clients.contains(client)) {
        throw FlutterError(
          "Attempted to register an already registered TouchClient.\n"
          "Client $client was registered previously.",
        );
      }
      return true;
    }());
    _clients.add(client);
  }

  @override
  void unregisterClient(TouchClient client) {
    assert(() {
      if (!_clients.contains(client)) {
        throw FlutterError(
          "Attempted to unregister a TouchClient which was not registered.\n"
          "Client $client wasn't registered.",
        );
      }
      return true;
    }());
    _clients.remove(client);
  }

  @override
  void dispose() {
    _clients.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _TouchTheatre(
      registry: this,
      clients: _clients,
      child: _TouchGroupStateScope(state: this, child: widget.child),
    );
  }
}

class _TouchGroupStateScope extends InheritedWidget {
  const _TouchGroupStateScope({
    // super.key,
    required this.state,
    required super.child,
  });

  final _TouchGroupState state;

  @override
  bool updateShouldNotify(_TouchGroupStateScope oldWidget) =>
      state != oldWidget.state;

  static _TouchGroupState? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_TouchGroupStateScope>()
      ?.state;
}

class _TouchTheatre extends SingleChildRenderObjectWidget {
  const _TouchTheatre({
    // super.key,
    required this.registry,
    required this.clients,
    super.child,
  });

  final TouchGroupRegistry registry;
  final Iterable<TouchClient> clients;

  @override
  _RenderTouchTheatre createRenderObject(BuildContext context) =>
      _RenderTouchTheatre(registry: registry, clients: clients);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderTouchTheatre renderObject,
  ) {
    renderObject
      ..registry = registry
      ..clients = clients;
  }
}

class _RenderTouchTheatre extends RenderProxyBox {
  _RenderTouchTheatre({
    required this._registry,
    required this._clients,
    RenderBox? child,
  }) : super(child);

  // TODO: implement debug paint (don't forget to add markNeedsPaint EVERYWHERE)

  TouchGroupRegistry _registry;

  TouchGroupRegistry get registry => _registry;

  set registry(TouchGroupRegistry value) {
    if (_registry == value) return;
    _registry = value;
  }

  Iterable<TouchClient> _clients;
  Iterable<TouchClient> get clients => _clients;
  set clients(Iterable<TouchClient> value) {
    if (_clients == value) return;
    _clients = value;
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    // Find the best candidate for hit testing.
    TouchClient? resolvedClient;
    double minimumWeightedDistance = .infinity;
    for (final client in _clients) {
      if (!client.isActive) continue;
      final targetRect = client.getRectIn(this);
      if (targetRect.contains(position)) {
        // Weight is proportional to child's size.
        final distanceToEdge = client.getDistanceToEdgeIn(this, position);
        final childSize = client.innerSize;
        final childDiagonal = math.sqrt(
          childSize.width * childSize.width +
              childSize.height * childSize.height,
        );
        // Smaller targets receive higher priority.
        final weightedDistance = distanceToEdge * (childDiagonal + 1.0);
        if (weightedDistance < minimumWeightedDistance) {
          minimumWeightedDistance = weightedDistance;
          resolvedClient = client;
        }
      }
    }

    if (resolvedClient != null) {
      // Find the render object which was actually hit if it's not the target.
      final dryResult = BoxHitTestResult();
      final dryHit = super.hitTest(dryResult, position: position);
      RenderObject? topmostObject;
      if (dryHit) {
        for (final HitTestEntry(:target) in dryResult.path) {
          if (target is RenderObject) {
            topmostObject = target;
            break;
          }
        }
      }

      // If the target was hit directly or the object hit has a lineal relation
      // with target, force hit test redirection to target's inner contents.
      if (topmostObject == null ||
          resolvedClient.hasLinealRelationWith(topmostObject)) {
        return resolvedClient.hitTestInnerFrom(this, result, position);
      }
    }

    return super.hitTest(result, position: position);
  }
}
