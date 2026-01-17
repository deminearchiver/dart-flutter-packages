import 'dart:math' as math;

import 'package:material/src/material/flutter.dart';
import 'package:flutter/material.dart' as flutter;

typedef SwitchLegacy = flutter.Switch;
typedef SwitchThemeLegacy = flutter.SwitchTheme;
typedef SwitchThemeDataLegacy = flutter.SwitchThemeData;

sealed class _SwitchStates implements SwitchStates {
  const _SwitchStates({required this.hasIcon, required this.isSelected});

  const factory _SwitchStates.enabled({
    required bool hasIcon,
    required bool isSelected,
    bool isHovered,
    bool isFocused,
    bool isPressed,
  }) = _SwitchEnabledStates;

  const factory _SwitchStates.disabled({
    required bool hasIcon,
    required bool isSelected,
  }) = _SwitchDisabledStates;

  factory _SwitchStates.fromWidgetStates(
    WidgetStates states, {
    required bool hasIcon,
    bool? isSelected,
    bool? isDisabled,
    bool? isHovered,
    bool? isFocused,
    bool? isPressed,
  }) {
    states as StrictSet<WidgetState>;
    final resolvedIsSelected = isSelected ?? states.contains(.selected);
    final resolvedIsDisabled = isDisabled ?? states.contains(.disabled);
    return resolvedIsDisabled
        ? .disabled(hasIcon: hasIcon, isSelected: resolvedIsSelected)
        : .enabled(
            hasIcon: hasIcon,
            isSelected: resolvedIsSelected,
            isHovered: isHovered ?? states.contains(.hovered),
            isFocused: isFocused ?? states.contains(.focused),
            isPressed: isPressed ?? states.contains(.pressed),
          );
  }

  bool get isDisabled;

  bool get isHovered;

  bool get isFocused;

  bool get isPressed;

  @override
  final bool hasIcon;

  @override
  final bool isSelected;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _SwitchStates &&
          hasIcon == other.hasIcon &&
          isSelected == other.isSelected &&
          isDisabled == other.isDisabled &&
          isHovered == other.isHovered &&
          isFocused == other.isFocused &&
          isPressed == other.isPressed;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasIcon,
    isSelected,
    isDisabled,
    isHovered,
    isFocused,
    isPressed,
  );
}

class _SwitchDisabledStates extends _SwitchStates
    implements SwitchDisabledStates {
  const _SwitchDisabledStates({
    required super.hasIcon,
    required super.isSelected,
  });

  @override
  bool get isDisabled => true;

  @override
  bool get isHovered => false;

  @override
  bool get isFocused => false;

  @override
  bool get isPressed => false;
}

class _SwitchEnabledStates extends _SwitchStates
    implements SwitchEnabledStates {
  const _SwitchEnabledStates({
    required super.hasIcon,
    required super.isSelected,
    this.isHovered = false,
    this.isFocused = false,
    this.isPressed = false,
  });

  @override
  bool get isDisabled => false;

  @override
  final bool isHovered;

  @override
  final bool isFocused;

  @override
  final bool isPressed;
}

class Switch extends StatefulWidget {
  const Switch({
    super.key,
    required this.onCheckedChanged,
    required this.checked,
  });

  final ValueChanged<bool>? onCheckedChanged;
  final bool checked;

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> with TickerProviderStateMixin {
  bool get _isSelected => widget.checked;

  late double _selectionProgress;
  late double _handlePosition;
  late OutlinedBorder _trackShape;
  late Color _trackColor;
  late Outline _trackOutline;
  late Size _handleSize;
  late OutlinedBorder _handleShape;
  late Color _handleColor;
  late Outline _handleOutline;
  late IconThemeData _resolvedIconTheme;

  late final WidgetStatesController _statesController;

  late SpringDescription _spatialSpring;
  late AnimationController _spatialController;

  final Tween<double> _handlePositionTween = Tween<double>();
  late Animation<double> _handlePositionAnimation;

  final Tween<double> _selectionSpatialProgressTween = Tween<double>();
  late Animation<double> _selectionSpatialProgressAnimation;

  late SpringDescription _effectsSpring;
  late AnimationController _effectsController;

  final Tween<OutlinedBorder?> _trackShapeTween = OutlinedBorderTween();
  late Animation<OutlinedBorder?> _trackShapeAnimation;

  final Tween<Color?> _trackColorTween = ColorTween();
  late Animation<Color?> _trackColorAnimation;

  final Tween<Outline?> _trackOutlineTween = OutlineTween();
  late Animation<Outline?> _trackOutlineAnimation;

  final Tween<Size?> _handleSizeTween = SizeTween();
  late Animation<Size?> _handleSizeAnimation;

  final Tween<OutlinedBorder?> _handleShapeTween = OutlinedBorderTween();
  late Animation<OutlinedBorder?> _handleShapeAnimation;

  final Tween<Color?> _handleColorTween = ColorTween();
  late Animation<Color?> _handleColorAnimation;

  final Tween<Outline?> _handleOutlineTween = OutlineTween();
  late Animation<Outline?> _handleOutlineAnimation;

  final Tween<IconThemeData?> _iconThemeTween = IconThemeDataTween();
  late Animation<IconThemeData?> _iconThemeAnimation;

  final Tween<double> _selectionEffectsProgressTween = Tween<double>();
  late Animation<double> _selectionEffectsProgressAnimation;

  late Animation<OutlinedBorder> _resolvedTrackShapeAnimation;
  late Animation<Color> _resolvedTrackColorAnimation;
  late Animation<Size> _resolvedHandleSizeAnimation;
  late Animation<OutlinedBorder> _resolvedHandleShapeAnimation;
  late Animation<Color> _resolvedHandleColorAnimation;
  late Animation<IconThemeData> _resolvedIconThemeAnimation;

  late SpringThemeData _springTheme;
  late IconThemeData _iconTheme;
  late SwitchThemeData _switchTheme;

  bool _pressed = false;
  bool _focused = false;

  @pragma("wasm:prefer-inline")
  @pragma("vm:prefer-inline")
  @pragma("dart2js:prefer-inline")
  SpringSimulation _createImplicitSpringSimulation(SpringDescription spring) =>
      // TODO(deminearchiver): does snapToEnd degrade animation quality?
      SpringSimulation(spring, 0.0, 1.0, 0.0, snapToEnd: true);

  void _updateSpatialAnimations({
    required double selectionProgress,
    required double handlePosition,
  }) {
    if (selectionProgress == _selectionSpatialProgressTween.end &&
        handlePosition == _handlePositionTween.end) {
      return;
    }

    _selectionSpatialProgressTween.begin =
        _selectionSpatialProgressAnimation.value;
    _selectionSpatialProgressTween.end = selectionProgress;

    _handlePositionTween.begin = _handlePositionAnimation.value;
    _handlePositionTween.end = handlePosition;

    if (_selectionSpatialProgressTween.begin ==
            _selectionSpatialProgressTween.end &&
        _handlePositionTween.begin == _handlePositionTween.end) {
      _spatialController.value = 1.0;
      return;
    }

    final simulation = _createImplicitSpringSimulation(_spatialSpring);
    _spatialController.animateWith(simulation);
  }

  void _updateEffectsAnimations({
    required double selectionProgress,
    required OutlinedBorder trackShape,
    required Color trackColor,
    required Outline trackOutline,
    required Size handleSize,
    required OutlinedBorder handleShape,
    required Color handleColor,
    required Outline handleOutline,
    required IconThemeData iconTheme,
  }) {
    if (selectionProgress == _selectionEffectsProgressTween.end &&
        trackShape == _trackShapeTween.end &&
        trackColor == _trackColorTween.end &&
        trackOutline == _trackOutlineTween.end &&
        handleSize == _handleSizeTween.end &&
        handleShape == _handleShapeTween.end &&
        handleColor == _handleColorTween.end &&
        handleOutline == _handleOutlineTween.end &&
        iconTheme == _iconThemeTween.end) {
      return;
    }

    _selectionEffectsProgressTween.begin =
        _selectionEffectsProgressAnimation.value;
    _selectionEffectsProgressTween.end = selectionProgress;

    _trackShapeTween.begin = _trackShapeAnimation.value ?? trackShape;
    _trackShapeTween.end = trackShape;

    _trackColorTween.begin = _trackColorAnimation.value ?? trackColor;
    _trackColorTween.end = trackColor;

    _trackOutlineTween.begin = _trackOutlineAnimation.value ?? trackOutline;
    _trackOutlineTween.end = trackOutline;

    _handleSizeTween.begin = _handleSizeAnimation.value ?? handleSize;
    _handleSizeTween.end = handleSize;

    _handleShapeTween.begin = _handleShapeAnimation.value ?? handleShape;
    _handleShapeTween.end = handleShape;

    _handleColorTween.begin = _handleColorAnimation.value ?? handleColor;
    _handleColorTween.end = handleColor;

    _handleOutlineTween.begin = _handleOutlineAnimation.value ?? handleOutline;
    _handleOutlineTween.end = handleOutline;

    _iconThemeTween.begin = _iconThemeAnimation.value ?? iconTheme;
    _iconThemeTween.end = iconTheme;

    if (_selectionEffectsProgressTween.begin ==
            _selectionEffectsProgressTween.end &&
        _trackShapeTween.begin == _trackShapeTween.end &&
        _trackColorTween.begin == _trackColorTween.end &&
        _trackOutlineTween.begin == _trackOutlineTween.end &&
        _handleSizeTween.begin == _handleSizeTween.end &&
        _handleShapeTween.begin == _handleShapeTween.end &&
        _handleColorTween.begin == _handleColorTween.end &&
        _handleOutlineTween.begin == _handleOutlineTween.end &&
        _iconThemeTween.begin == _iconThemeTween.end) {
      _effectsController.value = 1.0;
      return;
    }

    final simulation = _createImplicitSpringSimulation(_effectsSpring);
    _effectsController.animateWith(simulation);
  }

  _SwitchStates _resolveStates() {
    final states = _statesController.value as StrictSet<WidgetState>;

    final _SwitchStates result = widget.onCheckedChanged == null
        ? .disabled(hasIcon: true, isSelected: widget.checked)
        : .enabled(
            hasIcon: true,
            isSelected: widget.checked,
            isHovered: states.contains(.hovered),
            isPressed: _pressed,
            isFocused: _focused && !_pressed,
          );

    if (result.isSelected) {
      states.add(.selected);
    } else {
      states.remove(.selected);
    }
    if (result.isDisabled) {
      states.add(.disabled);
    } else {
      states.remove(.disabled);
    }
    if (result.isHovered) {
      states.add(.pressed);
    } else {
      states.remove(.pressed);
    }
    if (result.isFocused) {
      states.add(.focused);
    } else {
      states.remove(.focused);
    }
    if (result.isPressed) {
      states.add(.pressed);
    } else {
      states.remove(.pressed);
    }
    return result;
  }

  void _statesListener() {
    setState(() {});
  }

  void _onPointerDown(PointerDownEvent _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
      _pressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
      _pressed = false;
    });
  }

  void _onPointerCancel(PointerCancelEvent _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
      _pressed = false;
    });
  }

  void _onTapDown(TapDownDetails _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
      _pressed = true;
    });
  }

  void _onTapUp(TapUpDetails _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
      _pressed = false;
    });
  }

  void _onTapCancel() {
    if (!mounted) return;
    setState(() {
      _focused = false;
      _pressed = false;
    });
  }

  void _onFocusChange(bool value) {
    if (!mounted) return;
    setState(() => _focused = value);
  }

  void _onTapOutside(PointerDownEvent _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
    });
  }

  void _onTapUpOutside(PointerUpEvent _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _statesController = WidgetStatesController()..addListener(_statesListener);

    _selectionProgress = _isSelected ? 1.0 : 0.0;
    _selectionSpatialProgressTween.begin = _selectionProgress;
    _selectionSpatialProgressTween.end = _selectionProgress;
    _selectionEffectsProgressTween.begin = _selectionProgress;
    _selectionEffectsProgressTween.end = _selectionProgress;

    _handlePosition = _isSelected ? 1.0 : 0.0;
    _handlePositionTween.begin = _handlePosition;
    _handlePositionTween.end = _handlePosition;

    _spatialController = AnimationController.unbounded(vsync: this, value: 1.0);
    _handlePositionAnimation = _handlePositionTween.animate(_spatialController);
    _selectionSpatialProgressAnimation = _selectionSpatialProgressTween.animate(
      _spatialController,
    );

    _effectsController = AnimationController(vsync: this, value: 1.0);
    _trackShapeAnimation = _trackShapeTween.animate(_effectsController);
    _trackColorAnimation = _trackColorTween.animate(_effectsController);
    _trackOutlineAnimation = _trackOutlineTween.animate(_effectsController);
    _handleSizeAnimation = _handleSizeTween.animate(_effectsController);
    _handleShapeAnimation = _handleShapeTween.animate(_effectsController);
    _handleColorAnimation = _handleColorTween.animate(_effectsController);
    _handleOutlineAnimation = _handleOutlineTween.animate(_effectsController);
    _iconThemeAnimation = _iconThemeTween.animate(_effectsController);
    _selectionEffectsProgressAnimation = _selectionEffectsProgressTween.animate(
      _effectsController,
    );

    _resolvedTrackShapeAnimation = _trackShapeAnimation
        .nonNullOrElse(() => _trackShape)
        .mapValue(
          (value) =>
              (_trackOutlineAnimation.value ?? _trackOutline).apply(value),
        );

    _resolvedTrackColorAnimation = _trackColorAnimation.nonNullOrElse(
      () => _trackColor,
    );

    _resolvedHandleSizeAnimation = _handleSizeAnimation.nonNullOrElse(
      () => _handleSize,
    );

    _resolvedHandleShapeAnimation = _handleShapeAnimation
        .nonNullOrElse(() => _handleShape)
        .mapValue(
          (value) =>
              (_handleOutlineAnimation.value ?? _handleOutline).apply(value),
        );

    _resolvedHandleColorAnimation = _handleColorAnimation.nonNullOrElse(
      () => _handleColor,
    );

    _resolvedIconThemeAnimation = _iconThemeAnimation.nonNullOrElse(
      () => _resolvedIconTheme,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _springTheme = SpringTheme.of(context);
    _iconTheme = IconTheme.of(context);
    _switchTheme = SwitchTheme.of(context);

    _spatialSpring = _springTheme.fastSpatial.toSpringDescription();
    _effectsSpring = _springTheme.defaultEffects.toSpringDescription();
  }

  @override
  void dispose() {
    _effectsController.dispose();
    _spatialController.dispose();
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final states = _resolveStates();

    final minTapTargetSize = _switchTheme.minTapTargetSize.resolve(states);
    final trackSize = _switchTheme.trackSize.resolve(states);
    _trackShape = _switchTheme.trackShape.resolve(states);
    _trackColor = _switchTheme.trackColor.resolve(states);
    _trackOutline = _switchTheme.trackOutline.resolve(states);
    final stateLayerSize = _switchTheme.stateLayerSize.resolve(states);
    final stateLayerShape = _switchTheme.stateLayerShape.resolve(states);
    final stateLayerColor = _switchTheme.stateLayerColor;
    final stateLayerOpacity = _switchTheme.stateLayerOpacity;
    _handleSize = _switchTheme.handleSize.resolve(states);
    _handleShape = _switchTheme.handleShape.resolve(states);
    _handleColor = _switchTheme.handleColor.resolve(states);
    _handleOutline = _switchTheme.handleOutline.resolve(states);
    _resolvedIconTheme = _iconTheme.merge(
      _switchTheme.iconTheme.resolve(states),
    );

    final overlayColor = MixedWidgetStateLayerColor<SwitchStates>.from(
      (widgetStates) => _SwitchStates.fromWidgetStates(
        widgetStates,
        hasIcon: states.hasIcon,
        isSelected: states.isSelected,
      ),
      color: stateLayerColor,
      opacity: stateLayerOpacity,
    );

    _selectionProgress = states.isSelected ? 1.0 : 0.0;
    _handlePosition = _isSelected ? 1.0 : 0.0;

    _updateSpatialAnimations(
      selectionProgress: _selectionProgress,
      handlePosition: _handlePosition,
    );

    _updateEffectsAnimations(
      selectionProgress: _selectionProgress,
      trackShape: _trackShape,
      trackColor: _trackColor,
      trackOutline: _trackOutline,
      handleSize: _handleSize,
      handleShape: _handleShape,
      handleColor: _handleColor,
      handleOutline: _handleOutline,
      iconTheme: _resolvedIconTheme,
    );

    final Widget trackChild = SizedBox.fromSize(
      size: stateLayerSize,
      child: Listener(
        behavior: .deferToChild,
        onPointerDown: !states.isDisabled ? _onPointerDown : null,
        onPointerUp: !states.isDisabled ? _onPointerUp : null,
        onPointerCancel: !states.isDisabled ? _onPointerCancel : null,
        child: Material.raw(
          child: InkWell(
            statesController: _statesController,
            customBorder: stateLayerShape,
            overlayColor: overlayColor,
            enableFeedback: !states.isDisabled,
            onTap: !states.isDisabled
                ? () => widget.onCheckedChanged?.call(!_isSelected)
                : null,
            onTapDown: !states.isDisabled ? _onTapDown : null,
            onTapUp: !states.isDisabled ? _onTapUp : null,
            onTapCancel: !states.isDisabled ? _onTapCancel : null,
            onFocusChange: !states.isDisabled ? _onFocusChange : null,
          ),
        ),
      ),
    );

    const iconRotationDisplacement = math.pi / 3.0;
    const iconOpacityInterval = Interval(1.0 / 3.0, 1.0);

    final Widget unselectedIcon = Transform.rotate(
      angle: iconRotationDisplacement,
      transformHitTests: false,
      child: const Icon(Symbols.close_rounded),
    );

    final Widget selectedIcon = Transform.rotate(
      angle: 0.0,
      transformHitTests: false,
      child: const Icon(Symbols.check_rounded),
    );

    final Widget handleChild = AnimatedBuilder(
      animation: _spatialController,
      builder: (context, child) => Transform.rotate(
        angle: lerpDouble(
          -iconRotationDisplacement,
          0.0,
          _selectionSpatialProgressAnimation.value,
        ),
        transformHitTests: false,
        child: child!,
      ),
      child: AnimatedBuilder(
        animation: _effectsController,
        builder: (context, child) {
          final animatedIconTheme = _resolvedIconThemeAnimation.value;
          final progress = clampDouble(
            _selectionEffectsProgressAnimation.value,
            0.0,
            1.0,
          );
          final unselectedIconOpacity = iconOpacityInterval.transform(
            1.0 - progress,
          );
          final selectedIconOpacity = iconOpacityInterval.transform(progress);
          return Stack(
            alignment: .center,
            children: [
              if (unselectedIconOpacity > 0.0)
                IconTheme(
                  data: animatedIconTheme.copyWith(
                    opacity: animatedIconTheme.opacity * unselectedIconOpacity,
                  ),
                  child: unselectedIcon,
                ),
              if (selectedIconOpacity > 0.0)
                IconTheme(
                  data: animatedIconTheme.copyWith(
                    opacity: animatedIconTheme.opacity * selectedIconOpacity,
                  ),
                  child: selectedIcon,
                ),
            ],
          );
        },
      ),
    );

    final Widget paint = _SwitchPaint(
      handlePosition: _handlePositionAnimation,
      trackShape: _resolvedTrackShapeAnimation,
      trackColor: _resolvedTrackColorAnimation,
      minTapTargetSize: minTapTargetSize,
      trackSize: trackSize,
      handleSize: _resolvedHandleSizeAnimation,
      handleShape: _resolvedHandleShapeAnimation,
      handleColor: _resolvedHandleColorAnimation,
      childrenPaintOrder: .handleChildIsTop,
      trackChildPosition: .middle,
      trackChild: trackChild,
      handleChildPosition: .top,
      handleChild: handleChild,
    );

    return RepaintBoundary(
      child: Semantics(
        enabled: !states.isDisabled,
        toggled: _isSelected,
        child: Align.center(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: TapRegion(
            behavior: .deferToChild,
            consumeOutsideTaps: false,
            onTapOutside: !states.isDisabled ? _onTapOutside : null,
            onTapUpOutside: !states.isDisabled ? _onTapUpOutside : null,
            child: AnimatedBuilder(
              animation: _effectsController,
              builder: (context, child) => FocusRingTheme.merge(
                data: .from(
                  // Don't use _resolvedTrackShapeAnimation because it has border.
                  shape: .all(_trackShapeAnimation.value ?? _trackShape),
                ),
                child: child!,
              ),
              child: FocusRing(
                visible: states.isFocused,
                placement: .outward,
                layoutBuilder: (context, info, child) => Align.center(
                  child: SizedBox.fromSize(size: trackSize, child: child),
                ),
                child: paint,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _SwitchSlot { trackChild, handleChild }

enum SwitchChildPosition { bottom, middle, top }

enum _SwitchChildrenPaintOrder { trackChildIsTop, handleChildIsTop }

class _SwitchPaint
    extends SlottedMultiChildRenderObjectWidget<_SwitchSlot, RenderBox> {
  const _SwitchPaint({
    super.key,
    required this.handlePosition,
    required this.minTapTargetSize,
    required this.trackSize,
    required this.trackShape,
    required this.trackColor,
    required this.handleSize,
    required this.handleShape,
    required this.handleColor,
    required this.childrenPaintOrder,
    required this.trackChildPosition,
    this.trackChild,
    required this.handleChildPosition,
    this.handleChild,
  });

  final ValueListenable<double> handlePosition;
  final Size minTapTargetSize;

  final Size trackSize;
  final ValueListenable<OutlinedBorder> trackShape;
  final ValueListenable<Color> trackColor;
  final ValueListenable<Size> handleSize;
  final ValueListenable<ShapeBorder> handleShape;
  final ValueListenable<Color> handleColor;

  final _SwitchChildrenPaintOrder childrenPaintOrder;
  final SwitchChildPosition trackChildPosition;
  final Widget? trackChild;
  final SwitchChildPosition handleChildPosition;
  final Widget? handleChild;

  @override
  Iterable<_SwitchSlot> get slots => _SwitchSlot.values;

  @override
  Widget? childForSlot(_SwitchSlot slot) => switch (slot) {
    .trackChild => trackChild,
    .handleChild => handleChild,
  };

  @override
  _RenderSwitchPaint createRenderObject(BuildContext context) =>
      _RenderSwitchPaint(
        handlePosition: handlePosition,
        minTapTargetSize: minTapTargetSize,
        trackSize: trackSize,
        trackShape: trackShape,
        trackColor: trackColor,
        handleSize: handleSize,
        handleShape: handleShape,
        handleColor: handleColor,
        childrenPaintOrder: childrenPaintOrder,
        trackChildPosition: trackChildPosition,
        handleChildPosition: handleChildPosition,
        textDirection: Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSwitchPaint renderObject,
  ) {
    renderObject
      ..handlePosition = handlePosition
      ..minTapTargetSize = minTapTargetSize
      ..trackSize = trackSize
      ..trackShape = trackShape
      ..trackColor = trackColor
      ..handleSize = handleSize
      ..handleShape = handleShape
      ..handleColor = handleColor
      ..childrenPaintOrder = childrenPaintOrder
      ..trackChildPosition = trackChildPosition
      ..handleChildPosition = handleChildPosition
      ..textDirection = Directionality.maybeOf(context);
  }
}

class _RenderSwitchPaint extends RenderBox
    with SlottedContainerRenderObjectMixin<_SwitchSlot, RenderBox> {
  _RenderSwitchPaint({
    required ValueListenable<double> handlePosition,
    required Size minTapTargetSize,
    // Track
    required Size trackSize,
    required ValueListenable<OutlinedBorder> trackShape,
    required ValueListenable<Color> trackColor,
    // Handle
    required ValueListenable<Size> handleSize,
    required ValueListenable<ShapeBorder> handleShape,
    required ValueListenable<Color> handleColor,
    // Children
    required _SwitchChildrenPaintOrder childrenPaintOrder,
    required SwitchChildPosition trackChildPosition,
    required SwitchChildPosition handleChildPosition,
    // Context
    TextDirection? textDirection,
  }) : _handlePosition = handlePosition,
       _minTapTargetSize = minTapTargetSize,
       _trackSize = trackSize,
       _trackShape = trackShape,
       _trackColor = trackColor,
       _handleSize = handleSize,
       _handleShape = handleShape,
       _handleColor = handleColor,
       _textDirection = textDirection,
       _childrenPaintOrder = childrenPaintOrder,
       _trackChildPosition = trackChildPosition,
       _handleChildPosition = handleChildPosition;

  ValueListenable<double> _handlePosition;
  ValueListenable<double> get handlePosition => _handlePosition;
  set handlePosition(ValueListenable<double> value) {
    if (_handlePosition == value) return;
    _handlePosition.removeListener(markNeedsLayout);
    _handlePosition = value;
    _handlePosition.addListener(markNeedsLayout);
    markNeedsLayout();
  }

  Size _minTapTargetSize;
  Size get minTapTargetSize => _minTapTargetSize;
  set minTapTargetSize(Size value) {
    if (_minTapTargetSize == value) return;
    _minTapTargetSize = value;
    markNeedsLayout();
  }

  Size _trackSize;
  Size get trackSize => _trackSize;
  set trackSize(Size value) {
    if (_trackSize == value) return;
    _trackSize = value;
    markNeedsLayout();
  }

  ValueListenable<OutlinedBorder> _trackShape;
  ValueListenable<OutlinedBorder> get trackShape => _trackShape;
  set trackShape(ValueListenable<OutlinedBorder> value) {
    if (_trackShape == value) return;
    _trackShape.removeListener(markNeedsPaint);
    _trackShape = value;
    _trackShape.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  ValueListenable<Color> _trackColor;
  ValueListenable<Color> get trackColor => _trackColor;
  set trackColor(ValueListenable<Color> value) {
    if (_trackColor == value) return;
    _trackColor.removeListener(markNeedsPaint);
    _trackColor = value;
    _trackColor.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  ValueListenable<Size> _handleSize;
  ValueListenable<Size> get handleSize => _handleSize;
  set handleSize(ValueListenable<Size> value) {
    if (_handleSize == value) return;
    _handleSize.removeListener(markNeedsLayout);
    _handleSize = value;
    _handleSize.addListener(markNeedsLayout);
    markNeedsLayout();
  }

  ValueListenable<ShapeBorder> _handleShape;
  ValueListenable<ShapeBorder> get handleShape => _handleShape;
  set handleShape(ValueListenable<ShapeBorder> value) {
    if (_handleShape == value) return;
    _handleShape.removeListener(markNeedsPaint);
    _handleShape = value;
    _handleShape.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  ValueListenable<Color> _handleColor;
  ValueListenable<Color> get handleColor => _handleColor;
  set handleColor(ValueListenable<Color> value) {
    if (_handleColor == value) return;
    _handleColor.removeListener(markNeedsPaint);
    _handleColor = value;
    _handleColor.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  _SwitchChildrenPaintOrder _childrenPaintOrder;
  _SwitchChildrenPaintOrder get childrenPaintOrder => _childrenPaintOrder;
  set childrenPaintOrder(_SwitchChildrenPaintOrder value) {
    if (_childrenPaintOrder == value) return;
    _childrenPaintOrder = value;
    markNeedsPaint();
  }

  SwitchChildPosition _trackChildPosition;
  SwitchChildPosition get trackChildPosition => _trackChildPosition;
  set trackChildPosition(SwitchChildPosition value) {
    if (_trackChildPosition == value) return;
    _trackChildPosition = value;
    markNeedsPaint();
  }

  SwitchChildPosition _handleChildPosition;
  SwitchChildPosition get handleChildPosition => _handleChildPosition;
  set handleChildPosition(SwitchChildPosition value) {
    if (_handleChildPosition == value) return;
    _handleChildPosition = value;
    markNeedsPaint();
  }

  TextDirection? _textDirection;
  TextDirection? get textDirection => _textDirection;
  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsPaint();
  }

  RenderBox? get _trackChild => childForSlot(.trackChild);

  RenderBox? get _handleChild => childForSlot(.handleChild);

  Size _computeOuterSize() {
    return Size(
      math.max(
        trackSize.width,
        // This calculation was derived from handle center equations
        trackSize.width - trackSize.shortestSide + minTapTargetSize.width,
      ),
      math.max(trackSize.height, minTapTargetSize.height),
    );
  }

  Rect _computeInnerRect(Size outerSize) {
    assert(
      outerSize.width >= trackSize.width &&
          outerSize.height >= trackSize.height,
    );
    return Rect.fromLTWH(
      (outerSize.width - trackSize.width) / 2.0,
      (outerSize.height - trackSize.height) / 2.0,
      trackSize.width,
      trackSize.height,
    );
  }

  // Offset _computeHandleInnerCenter() {}
  Offset _computeHandleOuterCenter(Rect innerRect) {
    final innerCenterStart = trackSize.shortestSide / 2.0;
    final outerCenterStart = innerRect.left + innerCenterStart;
    final innerCenterEnd = trackSize.width - innerCenterStart;
    final outerCenterEnd = innerRect.left + innerCenterEnd;
    return Offset(
      lerpDouble(outerCenterStart, outerCenterEnd, _handlePosition.value),
      innerRect.top + innerRect.height / 2.0,
    );
  }

  Rect _computeHandleRect(Offset center) {
    final handleSize = this.handleSize.value;
    return Rect.fromLTWH(
      center.dx - handleSize.width / 2.0,
      center.dy - handleSize.height / 2.0,
      handleSize.width,
      handleSize.height,
    );
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _handlePosition.addListener(markNeedsLayout);
    _trackShape.addListener(markNeedsPaint);
    _trackColor.addListener(markNeedsPaint);
    _handleSize.addListener(markNeedsLayout);
    _handleShape.addListener(markNeedsLayout);
    _handleColor.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    super.detach();
    _handlePosition.removeListener(markNeedsLayout);
    _trackShape.removeListener(markNeedsPaint);
    _trackColor.removeListener(markNeedsPaint);
    _handleSize.removeListener(markNeedsLayout);
    _handleShape.removeListener(markNeedsLayout);
    _handleColor.removeListener(markNeedsPaint);
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _computeOuterSize().width;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _computeOuterSize().height;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _computeOuterSize().width;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _computeOuterSize().height;
  }

  void _positionChild(RenderBox child, Offset position) {
    assert(child.parentData != null && child.parentData is BoxParentData);
    (child.parentData! as BoxParentData).offset = position;
  }

  Size _layout({
    required BoxConstraints constraints,
    required ChildLayouter layoutChild,
    required ChildPositioner positionChild,
  }) {
    final outerSize = _computeOuterSize();
    final innerRect = _computeInnerRect(outerSize);

    final outerCenter = _computeHandleOuterCenter(innerRect);
    if (_trackChild case final trackChild?) {
      layoutChild(
        trackChild,
        BoxConstraints(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: minTapTargetSize.width,
          maxHeight: minTapTargetSize.height,
        ),
      );
      final trackChildSize = trackChild.size;
      positionChild(
        trackChild,
        Offset(
          outerCenter.dx - trackChildSize.width / 2.0,
          outerCenter.dy - trackChildSize.height / 2.0,
        ),
      );
    }
    if (_handleChild case final handleChild?) {
      final handleSize = this.handleSize.value;
      layoutChild(
        handleChild,
        BoxConstraints(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: handleSize.width,
          maxHeight: handleSize.height,
        ),
      );
      final handleChildSize = handleChild.size;
      positionChild(
        handleChild,
        Offset(
          outerCenter.dx - handleChildSize.width / 2.0,
          outerCenter.dy - handleChildSize.height / 2.0,
        ),
      );
    }
    return constraints.constrain(outerSize);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) => _layout(
    constraints: constraints,
    layoutChild: ChildLayoutHelper.dryLayoutChild,
    positionChild: (_, _) {},
  );

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    return null;
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return null;
  }

  @override
  void performLayout() {
    size = _layout(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
      positionChild: _positionChild,
    );
  }

  void _paintTrack(PaintingContext context, Rect shiftedRect) {
    final shape = trackShape.value;
    final paint = Paint()
      ..style = .fill
      ..color = trackColor.value;
    if (shape.preferPaintInterior) {
      shape.paintInterior(
        context.canvas,
        shiftedRect,
        paint,
        textDirection: textDirection,
      );
    } else {
      final path = shape.getOuterPath(
        shiftedRect,
        textDirection: textDirection,
      );
      context.canvas.drawPath(path, paint);
    }
    shape.paint(context.canvas, shiftedRect);
  }

  void _paintTrackChild(PaintingContext context) {
    if (_trackChild case final trackChild?) {
      context.paintChild(
        trackChild,
        (trackChild.parentData! as BoxParentData).offset,
      );
    }
  }

  void _paintHandle(PaintingContext context, Rect shiftedRect) {
    final shape = handleShape.value;
    final paint = Paint()
      ..style = .fill
      ..color = handleColor.value;
    if (shape.preferPaintInterior) {
      shape.paintInterior(
        context.canvas,
        shiftedRect,
        paint,
        textDirection: textDirection,
      );
    } else {
      final path = shape.getOuterPath(
        shiftedRect,
        textDirection: textDirection,
      );
      context.canvas.drawPath(path, paint);
    }
    shape.paint(context.canvas, shiftedRect);
  }

  void _paintHandleChild(PaintingContext context) {
    if (_handleChild case final handleChild?) {
      context.paintChild(
        handleChild,
        (handleChild.parentData! as BoxParentData).offset,
      );
    }
  }

  void _paintChildFor(PaintingContext context, SwitchChildPosition position) {
    if (trackChildPosition == position && handleChildPosition == position) {
      switch (childrenPaintOrder) {
        case .trackChildIsTop:
          _paintHandleChild(context);
          _paintTrackChild(context);
        case .handleChildIsTop:
          _paintTrackChild(context);
          _paintHandleChild(context);
      }
    } else if (trackChildPosition == position) {
      _paintTrackChild(context);
    } else if (handleChildPosition == position) {
      _paintHandleChild(context);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final innerRect = _computeInnerRect(size);
    final outerCenter = _computeHandleOuterCenter(innerRect);
    final handleRect = _computeHandleRect(outerCenter);

    context.withCanvasTransform((context) {
      if (offset != .zero) {
        context.canvas.translate(offset.dx, offset.dy);
      }

      // Paint the child below the track, if any
      _paintChildFor(context, .bottom);

      // Paint the track
      _paintTrack(context, innerRect);

      // Paint the child between the track and the handle, if any
      _paintChildFor(context, .middle);

      // Paint the handle
      _paintHandle(context, handleRect);

      // Paint the child above the handle, if any
      _paintChildFor(context, .top);
    });
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final trackChild = _trackChild;
    if (trackChild == null) {
      return false;
    }
    final center = trackChild.size.center(.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (result, position) {
        assert(position == center);
        return trackChild.hitTest(result, position: center);
      },
    );
  }
}
