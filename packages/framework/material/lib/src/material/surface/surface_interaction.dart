import 'package:material/src/material/flutter.dart';

class SurfaceInteraction extends StatefulWidget {
  const SurfaceInteraction({
    super.key,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressUp,
    this.onSecondaryTap,
    this.onSecondaryTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.shape,
    this.stateLayerColor,
    this.stateLayerOpacity,
    this.splashFactory,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.statesController,
    this.hoverDuration,
    required this.child,
  });

  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap;

  /// Called when the user taps down this part of the material.
  final GestureTapDownCallback? onTapDown;

  /// Called when the user releases a tap that was started on this part of the
  /// material. [onTap] is called immediately after.
  final GestureTapUpCallback? onTapUp;

  /// Called when the user cancels a tap that was started on this part of the
  /// material.
  final GestureTapCallback? onTapCancel;

  /// Called when the user double taps this part of the material.
  final GestureTapCallback? onDoubleTap;

  /// Called when the user long-presses on this part of the material.
  final GestureLongPressCallback? onLongPress;

  /// Called when the user lifts their finger after a long press on the button.
  ///
  /// This callback is triggered at the end of a long press gesture, specifically
  /// after the user holds a long press and then releases it. It does not include
  /// position details.
  ///
  /// Common use cases include performing an action only after the long press completes,
  /// such as displaying a context menu or confirming a held gesture.
  ///
  /// See also:
  ///  * [onLongPress], which is triggered when the long press gesture is first recognized.
  final GestureLongPressUpCallback? onLongPressUp;

  /// Called when the user taps this part of the material with a secondary button.
  ///
  /// See also:
  ///
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapCallback? onSecondaryTap;

  /// Called when the user taps down on this part of the material with a
  /// secondary button.
  ///
  /// See also:
  ///
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Called when the user releases a secondary button tap that was started on
  /// this part of the material. [onSecondaryTap] is called immediately after.
  ///
  /// See also:
  ///
  ///  * [onSecondaryTap], a handler triggered right after this one that doesn't
  ///    pass any details about the tap.
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// Called when the user cancels a secondary button tap that was started on
  /// this part of the material.
  ///
  /// See also:
  ///
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapCallback? onSecondaryTapCancel;

  /// Called when this part of the material either becomes highlighted or stops
  /// being highlighted.
  ///
  /// The value passed to the callback is true if this part of the material has
  /// become highlighted and false if this part of the material has stopped
  /// being highlighted.
  ///
  /// If all of [onTap], [onDoubleTap], [onLongPress], and [onLongPressUp] become null while a
  /// gesture is ongoing, then [onTapCancel] will be fired and
  /// [onHighlightChanged] will be fired with the value false _during the
  /// build_. This means, for instance, that in that scenario [State.setState]
  /// cannot be called.
  final ValueChanged<bool>? onHighlightChanged;

  /// Called when a pointer enters or exits the ink response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// {@template flutter.material.InkWell.mouseCursor}
  /// If [mouseCursor] is a [WidgetStateMouseCursor],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  /// {@endtemplate}
  ///
  /// If this property is null, [WidgetStateMouseCursor.adaptiveClickable] will be used.
  final MouseCursor? mouseCursor;

  /// The custom clip border.
  ///
  /// If this is null, the ink response will not clip its content.
  final ShapeBorder? shape;

  final WidgetStateProperty<Color?>? stateLayerColor;

  final WidgetStateProperty<double?>? stateLayerOpacity;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory: [ThemeData.splashFactory].
  ///
  /// See also:
  ///
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  final InteractiveInkFeatureFactory? splashFactory;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// Whether to exclude the gestures introduced by this widget from the
  /// semantics tree.
  ///
  /// For example, a long-press gesture for showing a tooltip is usually
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// {@template flutter.material.inkwell.onFocusChange}
  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  /// {@endtemplate}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.canRequestFocus}
  final bool canRequestFocus;

  /// {@template flutter.material.inkwell.statesController}
  /// Represents the interactive "state" of this widget in terms of
  /// a set of [WidgetState]s, like [WidgetState.pressed] and
  /// [WidgetState.focused].
  ///
  /// Classes based on this one can provide their own
  /// [WidgetStatesController] to which they've added listeners.
  /// They can also update the controller's [WidgetStatesController.value]
  /// however, this may only be done when it's safe to call
  /// [State.setState], like in an event handler.
  /// {@endtemplate}
  final WidgetStatesController? statesController;

  /// The duration of the animation that animates the hover effect.
  ///
  /// The default is 50ms.
  final Duration? hoverDuration;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  State<SurfaceInteraction> createState() => _SurfaceInteractionState();
}

class _SurfaceInteractionState extends State<SurfaceInteraction> {
  late ColorThemeData _colorTheme;
  late StateThemeData _stateTheme;
  late WidgetStateProperty<Color> _stateLayerColor;
  late WidgetStateProperty<double> _stateLayerOpacity;

  @override
  void initState() {
    super.initState();
    _stateLayerColor = WidgetStateProperty.resolveWith(
      (states) =>
          widget.stateLayerColor?.resolve(states) ?? _colorTheme.onSurface,
    );
    _stateLayerOpacity = WidgetStateProperty.resolveWith(
      (states) =>
          widget.stateLayerOpacity?.resolve(states) ??
          _stateTheme.asWidgetStateLayerOpacity.resolve(states),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorTheme = ColorTheme.of(context);
    _stateTheme = StateTheme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return RawSurfaceInteraction(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onLongPressUp: widget.onLongPressUp,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      onSecondaryTap: widget.onSecondaryTap,
      onSecondaryTapUp: widget.onSecondaryTapUp,
      onSecondaryTapDown: widget.onSecondaryTapDown,
      onSecondaryTapCancel: widget.onSecondaryTapCancel,
      onHighlightChanged: widget.onHighlightChanged,
      onHover: widget.onHover,
      mouseCursor: widget.mouseCursor,
      stateLayerColor: _stateLayerColor,
      stateLayerOpacity: _stateLayerOpacity,
      splashFactory: widget.splashFactory,
      shape: widget.shape,
      enableFeedback: widget.enableFeedback,
      excludeFromSemantics: widget.excludeFromSemantics,
      focusNode: widget.focusNode,
      canRequestFocus: widget.canRequestFocus,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus,
      statesController: widget.statesController,
      hoverDuration: widget.hoverDuration,
      child: widget.child,
    );
  }
}

class RawSurfaceInteraction extends StatefulWidget {
  const RawSurfaceInteraction({
    super.key,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressUp,
    this.onSecondaryTap,
    this.onSecondaryTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.shape,
    required this.stateLayerColor,
    required this.stateLayerOpacity,
    this.splashFactory,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.statesController,
    this.hoverDuration,
    required this.child,
  });

  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap;

  /// Called when the user taps down this part of the material.
  final GestureTapDownCallback? onTapDown;

  /// Called when the user releases a tap that was started on this part of the
  /// material. [onTap] is called immediately after.
  final GestureTapUpCallback? onTapUp;

  /// Called when the user cancels a tap that was started on this part of the
  /// material.
  final GestureTapCallback? onTapCancel;

  /// Called when the user double taps this part of the material.
  final GestureTapCallback? onDoubleTap;

  /// Called when the user long-presses on this part of the material.
  final GestureLongPressCallback? onLongPress;

  /// Called when the user lifts their finger after a long press on the button.
  ///
  /// This callback is triggered at the end of a long press gesture, specifically
  /// after the user holds a long press and then releases it. It does not include
  /// position details.
  ///
  /// Common use cases include performing an action only after the long press completes,
  /// such as displaying a context menu or confirming a held gesture.
  ///
  /// See also:
  ///  * [onLongPress], which is triggered when the long press gesture is first recognized.
  final GestureLongPressUpCallback? onLongPressUp;

  /// Called when the user taps this part of the material with a secondary button.
  ///
  /// See also:
  ///
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapCallback? onSecondaryTap;

  /// Called when the user taps down on this part of the material with a
  /// secondary button.
  ///
  /// See also:
  ///
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Called when the user releases a secondary button tap that was started on
  /// this part of the material. [onSecondaryTap] is called immediately after.
  ///
  /// See also:
  ///
  ///  * [onSecondaryTap], a handler triggered right after this one that doesn't
  ///    pass any details about the tap.
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// Called when the user cancels a secondary button tap that was started on
  /// this part of the material.
  ///
  /// See also:
  ///
  ///  * [kSecondaryButton], the button this callback responds to.
  final GestureTapCallback? onSecondaryTapCancel;

  /// Called when this part of the material either becomes highlighted or stops
  /// being highlighted.
  ///
  /// The value passed to the callback is true if this part of the material has
  /// become highlighted and false if this part of the material has stopped
  /// being highlighted.
  ///
  /// If all of [onTap], [onDoubleTap], [onLongPress], and [onLongPressUp] become null while a
  /// gesture is ongoing, then [onTapCancel] will be fired and
  /// [onHighlightChanged] will be fired with the value false _during the
  /// build_. This means, for instance, that in that scenario [State.setState]
  /// cannot be called.
  final ValueChanged<bool>? onHighlightChanged;

  /// Called when a pointer enters or exits the ink response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// {@template flutter.material.InkWell.mouseCursor}
  /// If [mouseCursor] is a [WidgetStateMouseCursor],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  /// {@endtemplate}
  ///
  /// If this property is null, [WidgetStateMouseCursor.adaptiveClickable] will be used.
  final MouseCursor? mouseCursor;

  /// The custom clip border.
  ///
  /// If this is null, the ink response will not clip its content.
  final ShapeBorder? shape;

  final WidgetStateProperty<Color> stateLayerColor;

  final WidgetStateProperty<double> stateLayerOpacity;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory: [ThemeData.splashFactory].
  ///
  /// See also:
  ///
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  final InteractiveInkFeatureFactory? splashFactory;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// Whether to exclude the gestures introduced by this widget from the
  /// semantics tree.
  ///
  /// For example, a long-press gesture for showing a tooltip is usually
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// {@template flutter.material.inkwell.onFocusChange}
  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  /// {@endtemplate}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.canRequestFocus}
  final bool canRequestFocus;

  /// {@template flutter.material.inkwell.statesController}
  /// Represents the interactive "state" of this widget in terms of
  /// a set of [WidgetState]s, like [WidgetState.pressed] and
  /// [WidgetState.focused].
  ///
  /// Classes based on this one can provide their own
  /// [WidgetStatesController] to which they've added listeners.
  /// They can also update the controller's [WidgetStatesController.value]
  /// however, this may only be done when it's safe to call
  /// [State.setState], like in an event handler.
  /// {@endtemplate}
  final WidgetStatesController? statesController;

  /// The duration of the animation that animates the hover effect.
  ///
  /// The default is 50ms.
  final Duration? hoverDuration;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  State<RawSurfaceInteraction> createState() => _RawSurfaceInteractionState();
}

class _RawSurfaceInteractionState extends State<RawSurfaceInteraction> {
  late WidgetStateProperty<Color> _overlayColor;

  @override
  void initState() {
    super.initState();
    _overlayColor = WidgetStateProperty.resolveWith((states) {
      final color = widget.stateLayerColor.resolve(states);
      final opacity = widget.stateLayerOpacity.resolve(states);
      return switch (opacity) {
        >= 1.0 => color,
        <= 0.0 => color.withAlpha(0),
        _ => color.withValues(alpha: opacity),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onLongPressUp: widget.onLongPressUp,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      onSecondaryTap: widget.onSecondaryTap,
      onSecondaryTapUp: widget.onSecondaryTapUp,
      onSecondaryTapDown: widget.onSecondaryTapDown,
      onSecondaryTapCancel: widget.onSecondaryTapCancel,
      onHighlightChanged: widget.onHighlightChanged,
      onHover: widget.onHover,
      mouseCursor: widget.mouseCursor,
      overlayColor: _overlayColor,
      splashFactory: widget.splashFactory,
      radius: null,
      customBorder: widget.shape,
      enableFeedback: widget.enableFeedback,
      excludeFromSemantics: widget.excludeFromSemantics,
      focusNode: widget.focusNode,
      canRequestFocus: widget.canRequestFocus,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus,
      statesController: widget.statesController,
      hoverDuration: widget.hoverDuration,
      child: widget.child,
    );
  }
}

class _SurfaceInteraction extends SingleChildRenderObjectWidget {
  const _SurfaceInteraction({
    super.key,
    this.shape,
    this.textDirection,
    required Widget super.child,
  });

  final ShapeBorder? shape;

  final TextDirection? textDirection;

  @override
  _RenderSurfaceInteraction createRenderObject(BuildContext context) => .new(
    shape: shape,
    textDirection: textDirection ?? Directionality.maybeOf(context),
  );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSurfaceInteraction renderObject,
  ) {
    renderObject
      ..shape = shape
      ..textDirection = textDirection;
  }
}

class _RenderSurfaceInteraction extends RenderProxyBox {
  _RenderSurfaceInteraction({
    this._shape,
    this._textDirection,
    RenderBox? child,
  }) : super(child);

  ShapeBorder? _shape;
  ShapeBorder? get shape => _shape;
  set shape(ShapeBorder? value) {
    if (_shape == value) return;
    _shape = value;
    _markNeedsClip();
  }

  TextDirection? _textDirection;
  TextDirection? get textDirection => _textDirection;
  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _markNeedsClip();
  }

  Path? _clipPathCache;
  Path? get _clipPath => _clipPathCache ??= shape?.getOuterPath(
    Offset.zero & size,
    textDirection: textDirection,
  );

  void _markNeedsClip() {
    _clipPathCache = null;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  void detach() {
    _clipPathCache = null;
    super.detach();
    markNeedsPaint();
  }

  @override
  void performLayout() {
    final oldSize = hasSize ? size : null;
    super.performLayout();
    if (oldSize != size) {
      _clipPathCache = null;
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (_clipPath?.contains(position) == false) {
      return false;
    }
    return super.hitTest(result, position: position);
  }
}
