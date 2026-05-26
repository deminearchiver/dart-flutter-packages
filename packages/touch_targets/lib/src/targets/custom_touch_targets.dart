import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:touch_targets/touch_targets.dart';

mixin TouchClientRenderObjectBaseMixin on RenderObject {
  TouchGroupRegistry? get registry;
  set registry(covariant TouchGroupRegistry? value);

  @protected
  TouchClient createTouchClient();
}

mixin TouchClientRenderObjectOptionalMixin on RenderObject
    implements TouchClientRenderObjectBaseMixin {
  TouchGroupRegistry? _registry;

  @override
  TouchGroupRegistry? get registry => _registry;

  @override
  set registry(TouchGroupRegistry? value) {
    if (_registry == value) return;
    final client = _client;
    if (attached && client != null) {
      _registry?.unregisterClient(client);
    }
    _registry = value;
    if (attached && client != null) {
      _registry?.registerClient(client);
    }
  }

  TouchClient? _client;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(_client == null);
    _client = createTouchClient();
    registry?.registerClient(_client!);
  }

  @override
  void detach() {
    super.detach();
    assert(_client != null);
    registry?.unregisterClient(_client!);
    _client = null;
  }
}

mixin TouchClientRenderObjectRequiredMixin on RenderObject
    implements TouchClientRenderObjectBaseMixin {
  TouchGroupRegistry? _registry;

  TouchGroupRegistry? get registryOrNull => _registry;

  @override
  TouchGroupRegistry get registry {
    assert(debugCheckHasTouchGroupRegistry(_registry, runtimeType.toString()));
    return _registry!;
  }

  @override
  set registry(TouchGroupRegistry value) {
    if (_registry == value) return;
    final client = _client;
    if (attached && client != null) {
      _registry?.unregisterClient(client);
    }
    _registry = value;
    if (attached && client != null) {
      _registry!.registerClient(client);
    }
  }

  TouchClient? _client;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    assert(_client == null);
    _client = createTouchClient();
    registry.registerClient(_client!);
  }

  @override
  void detach() {
    super.detach();
    assert(_client != null);
    registry.unregisterClient(_client!);
    _client = null;
  }
}
