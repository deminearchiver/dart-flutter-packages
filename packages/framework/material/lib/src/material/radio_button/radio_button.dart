// ignore_for_file: deprecated_member_use_from_same_package, deprecated_member_use

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart' as flutter;

import 'package:material/src/material/flutter.dart';

typedef RadioLegacy<T extends Object?> = flutter.Radio<T>;
typedef RadioThemeLegacy = flutter.RadioTheme;
typedef RadioThemeDataLegacy = flutter.RadioThemeData;
typedef RadioListTileLegacy<T extends Object?> = flutter.RadioListTile<T>;

sealed class _RadioButtonStates
    with Diagnosticable
    implements RadioButtonStates {
  const _RadioButtonStates({required this.isSelected});

  const factory _RadioButtonStates.enabled({
    required bool isSelected,
    bool isHovered,
    bool isFocused,
    bool isPressed,
  }) = _RadioButtonEnabledStates;

  const factory _RadioButtonStates.disabled({required bool isSelected}) =
      _RadioButtonDisabledStates;

  factory _RadioButtonStates.fromWidgetStates(
    WidgetStates states, {
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
        ? .disabled(isSelected: resolvedIsSelected)
        : .enabled(
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
  final bool isSelected;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>("isSelected", isSelected));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _RadioButtonStates &&
          isSelected == other.isSelected &&
          isDisabled == other.isDisabled &&
          isHovered == other.isHovered &&
          isFocused == other.isFocused &&
          isPressed == other.isPressed;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isSelected,
    isDisabled,
    isHovered,
    isFocused,
    isPressed,
  );
}

class _RadioButtonDisabledStates extends _RadioButtonStates
    implements RadioButtonDisabledStates {
  const _RadioButtonDisabledStates({required super.isSelected});

  @override
  bool get isDisabled => true;

  @override
  bool get isHovered => false;

  @override
  bool get isFocused => false;

  @override
  bool get isPressed => false;
}

class _RadioButtonEnabledStates extends _RadioButtonStates
    implements RadioButtonEnabledStates {
  const _RadioButtonEnabledStates({
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>("isHovered", isHovered))
      ..add(DiagnosticsProperty<bool>("isFocused", isFocused))
      ..add(DiagnosticsProperty<bool>("isPressed", isPressed));
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({super.key, required this.onTap, required this.selected});

  final VoidCallback? onTap;
  final bool selected;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton>
    with TickerProviderStateMixin {
  bool get _isSelected => widget.selected;

  late final WidgetStatesController _statesController;
  bool _pressed = false;
  bool _focused = false;

  late Color _resolvedIconBackgroundColor;
  late Color _resolvedIconOutlineColor;
  late Color _resolvedIconDotColor;

  late AnimationController _animationController;

  late AnimationController _effectsController;

  final Tween<Color?> _iconBackgroundColorTween = ColorTween();
  late Animation<Color?> _iconBackgroundColorAnimation;

  final Tween<Color?> _iconOutlineColorTween = ColorTween();
  late Animation<Color?> _iconOutlineColorAnimation;

  final Tween<Color?> _iconDotColorTween = ColorTween();
  late Animation<Color?> _iconDotColorAnimation;

  late Animation<Color> _resolvedIconBackgroundColorAnimation;
  late Animation<Color> _resolvedIconOutlineColorAnimation;
  late Animation<Color> _resolvedIconDotColorAnimation;

  late ShapeThemeData _shapeTheme;
  late SpringThemeData _springTheme;
  late RadioButtonThemeData _radioButtonTheme;

  _RadioButtonStates? _lastStates;
  late _RadioButtonStates _states;

  void _updateColorAnimations({
    required Color iconBackgroundColor,
    required Color iconOutlineColor,
    required Color iconDotColor,
  }) {
    if (iconBackgroundColor == _iconBackgroundColorTween.end &&
        iconOutlineColor == _iconOutlineColorTween.end &&
        iconDotColor == _iconDotColorTween.end) {
      return;
    }

    _iconBackgroundColorTween.begin =
        _iconBackgroundColorAnimation.value ?? iconBackgroundColor;
    _iconBackgroundColorTween.end = iconBackgroundColor;

    _iconOutlineColorTween.begin =
        _iconOutlineColorAnimation.value ?? iconOutlineColor;
    _iconOutlineColorTween.end = iconOutlineColor;

    _iconDotColorTween.begin = _iconDotColorAnimation.value ?? iconDotColor;
    _iconDotColorTween.end = iconDotColor;

    if (_states == _lastStates) {
      _effectsController.value = 1.0;
      return;
    }

    if (_iconBackgroundColorTween.begin == _iconBackgroundColorTween.end &&
        _iconOutlineColorTween.begin == _iconOutlineColorTween.end &&
        _iconDotColorTween.begin == _iconDotColorTween.end) {
      _effectsController.value = 1.0;
      return;
    }

    final spring = _springTheme.defaultEffects.toSpringDescription();
    final simulation = SpringSimulation(spring, 0.0, 1.0, 0.0);
    unawaited(_effectsController.animateWith(simulation));
  }

  void _resolveStates() {
    final states = _statesController.value as StrictSet<WidgetState>;

    final _RadioButtonStates result = widget.onTap == null
        ? .disabled(isSelected: widget.selected)
        : .enabled(
            isSelected: widget.selected,
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
    _states = result;
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

  void _onTapOutside(PointerEvent _) {
    if (!mounted) return;
    setState(() {
      _focused = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _statesController = WidgetStatesController()..addListener(_statesListener);

    _animationController = AnimationController.unbounded(
      vsync: this,
      value: _isSelected ? 1.0 : 0.0,
    );
    _effectsController = AnimationController(vsync: this, value: 0.0);
    _iconBackgroundColorAnimation = _iconBackgroundColorTween.animate(
      _effectsController,
    );
    _iconOutlineColorAnimation = _iconOutlineColorTween.animate(
      _effectsController,
    );
    _iconDotColorAnimation = _iconDotColorTween.animate(_effectsController);

    _resolvedIconBackgroundColorAnimation = _iconBackgroundColorAnimation
        .nonNullOrElse(() => _resolvedIconBackgroundColor);

    _resolvedIconOutlineColorAnimation = _iconOutlineColorAnimation
        .nonNullOrElse(() => _resolvedIconOutlineColor);

    _resolvedIconDotColorAnimation = _iconDotColorAnimation.nonNullOrElse(
      () => _resolvedIconDotColor,
    );
  }

  @override
  void didUpdateWidget(covariant RadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldSelected = oldWidget.selected;
    final newSelected = widget.selected;
    if (newSelected != oldSelected) {
      const springTheme = SpringThemeData.defaultsExpressive();
      final spring = springTheme.fastSpatial;
      final oldValue = _animationController.value;
      final newValue = newSelected ? 1.0 : 0.0;
      final simulation = SpringSimulation(
        spring.toSpringDescription(),
        oldValue,
        newValue,
        0.0,
      );
      if (newValue >= oldValue) {
        unawaited(_animationController.animateWith(simulation));
      } else {
        unawaited(_animationController.animateBackWith(simulation));
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shapeTheme = ShapeTheme.of(context);
    _springTheme = SpringTheme.of(context);
    _radioButtonTheme = RadioButtonTheme.of(context);
  }

  @override
  void dispose() {
    _effectsController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _resolveStates();

    const minTapTargetSize = Size.square(48.0);
    final stateLayerSize = _radioButtonTheme.stateLayerSize.resolve(_states);
    final stateLayerShape = _radioButtonTheme.stateLayerShape.resolve(_states);
    final stateLayerColor = _radioButtonTheme.stateLayerColor;
    final stateLayerOpacity = _radioButtonTheme.stateLayerOpacity;
    final iconSize = _radioButtonTheme.iconSize.resolve(_states);
    _resolvedIconBackgroundColor = _radioButtonTheme.iconBackgroundColor
        .resolve(_states);
    _resolvedIconOutlineColor = _radioButtonTheme.iconOutlineColor.resolve(
      _states,
    );
    _resolvedIconDotColor = _radioButtonTheme.iconDotColor.resolve(_states);

    final overlayColor = MixedWidgetStateLayerColor<RadioButtonStates>.from(
      (widgetStates) => _RadioButtonStates.fromWidgetStates(
        widgetStates,
        isSelected: _states.isSelected,
      ),
      color: stateLayerColor,
      opacity: stateLayerOpacity,
    );

    _updateColorAnimations(
      iconBackgroundColor: _resolvedIconBackgroundColor,
      iconOutlineColor: _resolvedIconOutlineColor,
      iconDotColor: _resolvedIconDotColor,
    );

    _lastStates = _states;

    final Widget child = SizedBox.fromSize(
      size: stateLayerSize,
      child: Listener(
        behavior: .deferToChild,
        onPointerDown: !_states.isDisabled ? _onPointerDown : null,
        onPointerUp: !_states.isDisabled ? _onPointerUp : null,
        onPointerCancel: !_states.isDisabled ? _onPointerCancel : null,
        child: Surface.raw(
          child: InkWell(
            statesController: _statesController,
            customBorder: stateLayerShape,
            overlayColor: overlayColor,
            enableFeedback: !_states.isDisabled,
            onTap: !_states.isDisabled ? () => widget.onTap?.call() : null,
            onTapDown: !_states.isDisabled ? _onTapDown : null,
            onTapUp: !_states.isDisabled ? _onTapUp : null,
            onTapCancel: !_states.isDisabled ? _onTapCancel : null,
            onFocusChange: !_states.isDisabled ? _onFocusChange : null,
          ),
        ),
      ),
    );

    final Widget paint = _RadioButtonPaint(
      minTapTargetSize: const _ValueListenable(minTapTargetSize),
      iconSize: _ValueListenable(iconSize),
      iconBackgroundColor: _resolvedIconBackgroundColorAnimation,
      iconOutlineColor: _resolvedIconOutlineColorAnimation,
      iconDotColor: _resolvedIconDotColorAnimation,
      animation: _animationController,
      child: child,
    );

    return RepaintBoundary(
      child: Semantics(
        enabled: !_states.isDisabled,
        label: null,
        checked: _isSelected,
        child: Align.center(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: TapRegion(
            behavior: .deferToChild,
            consumeOutsideTaps: false,
            onTapOutside: !_states.isDisabled ? _onTapOutside : null,
            onTapUpOutside: !_states.isDisabled ? _onTapOutside : null,
            child: FocusRingTheme.mergeWithData(
              data: .from(
                shape: .all(
                  _shapeTheme.applyCorner(corner: _shapeTheme.cornerFull),
                ),
              ),
              child: FocusRing(
                visible: _states.isFocused,
                placement: .outward,
                layoutBuilder: (context, info, child) => Align.center(
                  child: SizedBox.fromSize(size: stateLayerSize, child: child),
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

class _RadioButtonPaint extends SingleChildRenderObjectWidget {
  const _RadioButtonPaint({
    // super.key,
    required this.minTapTargetSize,
    required this.iconSize,
    required this.iconBackgroundColor,
    required this.iconOutlineColor,
    required this.iconDotColor,
    required this.animation,
    super.child,
  });

  final ValueListenable<Size> minTapTargetSize;
  final ValueListenable<double> iconSize;
  final ValueListenable<Color> iconBackgroundColor;
  final ValueListenable<Color> iconOutlineColor;
  final ValueListenable<Color> iconDotColor;
  final ValueListenable<double> animation;

  @override
  _RenderRadioButtonPaint createRenderObject(BuildContext context) {
    return _RenderRadioButtonPaint(
      minTapTargetSize: minTapTargetSize,
      iconSize: iconSize,
      iconBackgroundColor: iconBackgroundColor,
      iconOutlineColor: iconOutlineColor,
      iconDotColor: iconDotColor,
      animation: animation,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderRadioButtonPaint renderObject,
  ) {
    renderObject
      ..minTapTargetSize = minTapTargetSize
      ..iconSize = iconSize
      ..iconBackgroundColor = iconBackgroundColor
      ..iconOutlineColor = iconOutlineColor
      ..iconDotColor = iconDotColor
      ..animation = animation;
  }
}

class _RenderRadioButtonPaint extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  _RenderRadioButtonPaint({
    required ValueListenable<Size> minTapTargetSize,
    required ValueListenable<double> iconSize,
    required ValueListenable<Color> iconBackgroundColor,
    required ValueListenable<Color> iconOutlineColor,
    required ValueListenable<Color> iconDotColor,
    required ValueListenable<double> animation,
    RenderBox? child,
  }) : _minTapTargetSize = minTapTargetSize,
       _iconSize = iconSize,
       _iconBackgroundColor = iconBackgroundColor,
       _iconOutlineColor = iconOutlineColor,
       _iconDotColor = iconDotColor,
       _animation = animation {
    this.child = child;
  }

  ValueListenable<Size> _minTapTargetSize;
  ValueListenable<Size> get minTapTargetSize => _minTapTargetSize;
  set minTapTargetSize(ValueListenable<Size> value) {
    if (_minTapTargetSize == value) return;
    _minTapTargetSize.removeListener(markNeedsLayout);
    _minTapTargetSize = value;
    _minTapTargetSize.addListener(markNeedsLayout);
  }

  ValueListenable<double> _iconSize;
  ValueListenable<double> get iconSize => _iconSize;
  set iconSize(ValueListenable<double> value) {
    if (_iconSize == value) return;
    _iconSize.removeListener(markNeedsLayout);
    _iconSize = value;
    _iconSize.addListener(markNeedsLayout);
  }

  ValueListenable<Color> _iconBackgroundColor;
  ValueListenable<Color> get iconBackgroundColor => _iconBackgroundColor;
  set iconBackgroundColor(ValueListenable<Color> value) {
    if (_iconBackgroundColor == value) return;
    _iconBackgroundColor.removeListener(markNeedsLayout);
    _iconBackgroundColor = value;
    _iconBackgroundColor.addListener(markNeedsLayout);
    markNeedsPaint();
  }

  ValueListenable<Color> _iconOutlineColor;
  ValueListenable<Color> get iconOutlineColor => _iconOutlineColor;
  set iconOutlineColor(ValueListenable<Color> value) {
    if (_iconOutlineColor == value) return;
    _iconOutlineColor.removeListener(markNeedsLayout);
    _iconOutlineColor = value;
    _iconOutlineColor.addListener(markNeedsLayout);
    markNeedsPaint();
  }

  ValueListenable<Color> _iconDotColor;
  ValueListenable<Color> get iconDotColor => _iconDotColor;
  set iconDotColor(ValueListenable<Color> value) {
    if (_iconDotColor == value) return;
    _iconDotColor.removeListener(markNeedsLayout);
    _iconDotColor = value;
    _iconDotColor.addListener(markNeedsLayout);
    markNeedsPaint();
  }

  ValueListenable<double> _animation;
  ValueListenable<double> get animation => _animation;
  set animation(ValueListenable<double> value) {
    if (_animation == value) return;
    _animation.removeListener(markNeedsPaint);
    _animation = value;
    _animation.addListener(markNeedsPaint);
  }

  Size _computeOuterSize() {
    final minTapTargetSize = this.minTapTargetSize.value;
    final iconSize = this.iconSize.value;
    return Size(
      math.max(minTapTargetSize.width, iconSize),
      math.max(minTapTargetSize.height, iconSize),
    );
  }

  // Offset _computeOuterCenter(Size outerSize) => outerSize.center(Offset.zero);
  // Rect _computeIconRect(Offset center) {
  //   final iconSize = this.iconSize.value;
  //   return Rect.fromCenter(center: center, width: iconSize, height: iconSize);
  // }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    minTapTargetSize.addListener(markNeedsLayout);
    iconSize.addListener(markNeedsLayout);
    iconBackgroundColor.addListener(markNeedsPaint);
    iconOutlineColor.addListener(markNeedsPaint);
    iconDotColor.addListener(markNeedsPaint);
    _animation.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    super.detach();
    minTapTargetSize.removeListener(markNeedsLayout);
    iconSize.removeListener(markNeedsLayout);
    iconBackgroundColor.removeListener(markNeedsPaint);
    iconOutlineColor.removeListener(markNeedsPaint);
    iconDotColor.removeListener(markNeedsPaint);
    _animation.removeListener(markNeedsPaint);
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

  Size _layout(BoxChildLayoutStrategy strategy, BoxConstraints constraints) {
    final outerSize = _computeOuterSize();
    final center = outerSize.center(.zero);
    if (child case final child?) {
      final childSize = strategy.layoutChildForSize(
        child,
        BoxConstraints(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: outerSize.width,
          maxHeight: outerSize.height,
        ),
      );
      strategy.positionChild(
        child,
        Offset(
          center.dx - childSize.width / 2.0,
          center.dy - childSize.height / 2.0,
        ),
      );
    }
    return constraints.constrain(outerSize);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _layout(.dry, constraints);

  @override
  void performLayout() {
    size = _layout(.wet, constraints);
  }

  @override
  double? computeDryBaseline(
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => null;

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) => null;

  void _paintIcon(PaintingContext context) {
    const relativeIconSize = 20.0;
    const relativeCircleRadius = relativeIconSize / 2.0;
    const relativeStrokeWidth = 2.0;
    const relativeDotSize = 12.0;
    const relativeDotRadius = relativeDotSize / 2.0;

    final iconBackgroundColor = this.iconBackgroundColor.value;
    final iconOutlineColor = this.iconOutlineColor.value;
    final iconDotColor = this.iconDotColor.value;

    if (iconBackgroundColor.a <= 0.0 &&
        iconOutlineColor.a <= 0.0 &&
        iconDotColor.a <= 0.0) {
      return;
    }

    final center = size.center(.zero);
    final scale = iconSize.value / relativeIconSize;

    final dotRadius = lerpDouble(0.0, relativeDotRadius, animation.value);

    // TODO: remove scaling once the magic numbers are extracted into theme.
    // TODO: reconsider above statement as it seems wrong now
    context.withCanvasTransform((context) {
      context.canvas.translate(center.dx, center.dy);
      context.canvas.scale(scale);
      context.canvas.translate(-center.dx, -center.dy);

      final paint = Paint();

      if (iconBackgroundColor.a > 0.0) {
        context.canvas.drawCircle(
          center,
          relativeCircleRadius,
          paint
            ..style = .fill
            ..color = iconBackgroundColor
            ..strokeWidth = 0.0,
        );
      }

      if (iconOutlineColor.a > 0.0) {
        context.canvas.drawCircle(
          center,
          relativeCircleRadius - relativeStrokeWidth / 2.0,
          paint
            ..style = .stroke
            ..color = iconOutlineColor
            ..strokeWidth = relativeStrokeWidth,
        );
      }

      if (dotRadius > 0.0 && iconDotColor.a > 0.0) {
        context.canvas.drawCircle(
          center,
          // TODO: dot radius shouldn't depend on stroke width. It's counter-intuitive.
          dotRadius - relativeStrokeWidth / 2.0,
          paint
            ..style = .fill
            ..color = iconDotColor
            ..strokeWidth = 0.0,
        );
      }
    });
  }

  void _paintChild(PaintingContext context) {
    if (child case final child?) {
      context.paintChild(child, (child.parentData! as BoxParentData).offset);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.withCanvasTransform((context) {
      if (offset != .zero) {
        context.canvas.translate(offset.dx, offset.dy);
      }
      _paintChild(context);
      _paintIcon(context);
    });
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final child = this.child;
    if (child == null) return false;
    final center = child.size.center(.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (result, position) {
        assert(position == center);
        return child.hitTest(result, position: center);
      },
    );
  }
}

class RadioGroupButton<T extends Object?> extends StatefulWidget {
  const RadioGroupButton({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable = false,
    this.focusNode,
    this.autofocus = false,
    this.enabled,
    this.groupRegistry,
  });

  /// {@macro flutter.widget.RawRadio.value}
  final T value;

  /// {@macro flutter.material.Radio.groupValue}
  @Deprecated("Use a RadioGroup ancestor to manage group value instead.")
  final T? groupValue;

  /// {@macro flutter.material.Radio.onChanged}
  /// Called when the user selects this radio button.
  ///
  /// The radio button passes [value] as a parameter to this callback. The radio
  /// button does not actually change state until the parent widget rebuilds the
  /// radio button with the new [groupValue].
  ///
  /// If null, the radio button will be displayed as disabled.
  ///
  /// The provided callback will not be invoked if this radio button is already
  /// selected and [toggleable] is not set to true.
  ///
  /// If the [toggleable] is set to true, tapping a already selected radio will
  /// invoke this callback with `null` as value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt.
  ///
  /// For example:
  ///
  /// ```dart
  /// RadioGroupButton<SingingCharacter>(
  ///   value: SingingCharacter.lafayette,
  ///   groupValue: _character,
  ///   onChanged: (SingingCharacter? newValue) {
  ///     setState(() {
  ///       _character = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  ///
  /// This is deprecated, use [RadioGroup] to handle value change instead.
  @Deprecated(
    "Use RadioGroup to handle value change instead. "
    "This feature was deprecated after v3.32.0-0.0.pre.",
  )
  final ValueChanged<T?>? onChanged;

  /// {@macro flutter.widget.RawRadio.toggleable}
  final bool toggleable;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether this widget is interactive.
  ///
  /// If not provided, this widget will be interactable if one of the following
  /// is true:
  ///
  /// * Having a [RadioGroup] with the same type T above this widget.
  /// * A [groupRegistry] is provided.
  ///
  /// If this is set to true, one of the above condition must also be true.
  /// Otherwise, an assertion error is thrown.
  final bool? enabled;

  /// {@macro flutter.widget.RawRadio.groupRegistry}
  ///
  /// Unless provided, the [BuildContext] will be used to look up the ancestor
  /// [RadioGroupRegistry].
  final RadioGroupRegistry<T>? groupRegistry;

  @override
  State<RadioGroupButton<T>> createState() => _RadioGroupButtonState<T>();
}

class _RadioGroupButtonState<T extends Object?>
    extends State<RadioGroupButton<T>> {
  FocusNode? _internalFocusNode;
  FocusNode get _focusNode =>
      widget.focusNode ?? (_internalFocusNode ??= FocusNode());

  bool get _enabled =>
      widget.enabled ??
      (widget.onChanged != null ||
          widget.groupRegistry != null ||
          RadioGroup.maybeOf<T>(context) != null);

  _LegacyRadioGroupRegistry<T>? _internalRadioRegistry;
  RadioGroupRegistry<T> get _effectiveRegistry {
    if (widget.groupRegistry != null) return widget.groupRegistry!;

    final inheritedRegistry = RadioGroup.maybeOf<T>(context);
    if (inheritedRegistry != null) return inheritedRegistry;

    // Handles deprecated API.
    return _internalRadioRegistry ??= _LegacyRadioGroupRegistry<T>(this);
  }

  @override
  void dispose() {
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(
      !(widget.enabled ?? false) ||
          widget.onChanged != null ||
          widget.groupRegistry != null ||
          RadioGroup.maybeOf<T>(context) != null,
      "Radio is enabled but has no Radio.onChange or registry above",
    );

    // TODO: remove this if not needed due to an internal transparent Material
    assert(debugCheckHasMaterial(context));

    return _RawRadio(
      value: widget.value,
      // mouseCursor: WidgetStateMouseCursor.clickable,
      toggleable: widget.toggleable,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      groupRegistry: _effectiveRegistry,
      enabled: _enabled,
      builder: (context, state) => RadioButton(
        onTap: () => state.onChanged?.call(!state.value),
        selected: state.value,
      ),
    );
  }
}

class _RawRadio<T extends Object?> extends StatefulWidget {
  /// Creates a radio button.
  ///
  /// If [enabled] is true, the [groupRegistry] must not be null.
  const _RawRadio({
    super.key,
    required this.value,
    // required this.mouseCursor,
    required this.toggleable,
    required this.focusNode,
    required this.autofocus,
    required this.groupRegistry,
    required this.enabled,
    required this.builder,
  }) : assert(
         !enabled || groupRegistry != null,
         "an enabled raw radio must have a registry",
       );

  /// {@macro flutter.widget.RawRadio.value}
  final T value;

  // /// {@macro flutter.widget.RawRadio.mouseCursor}
  // final WidgetStateProperty<MouseCursor> mouseCursor;

  /// {@macro flutter.widget.RawRadio.toggleable}
  final bool toggleable;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// The builder for the radio button visual.
  ///
  /// Use the input `state` to determine the current state of the radio.
  ///
  /// {@macro flutter.widgets.ToggleableStateMixin.buildToggleableWithChild}
  final Widget Function(BuildContext context, _RawRadioState<T> state) builder;

  /// Whether this widget is enabled.
  final bool enabled;

  /// {@macro flutter.widget.RawRadio.groupRegistry}
  ///
  /// {@macro flutter.widget.RawRadio.groupValue}
  final RadioGroupRegistry<T>? groupRegistry;

  @override
  State<_RawRadio<T>> createState() => _RawRadioState<T>();
}

class _RawRadioState<T extends Object?> extends State<_RawRadio<T>>
    with RadioClient<T> {
  /// Handle selection status changed.
  ///
  /// if `selected` is false, nothing happens.
  ///
  /// if `selected` is true, select this radio. i.e. [Radio.onChanged] is called
  /// with [Radio.value]. This also updates the group value in [RadioGroup] if it
  /// is in use.
  ///
  /// if `selected` is null, unselect this radio. Same as `selected` is true
  /// except group value is set to null.
  void _handleChanged(bool? selected) {
    assert(registry != null);
    if (!(selected ?? true)) {
      return;
    }
    if (selected ?? false) {
      registry!.onChanged(widget.value);
    } else {
      registry!.onChanged(null);
    }
  }

  @override
  FocusNode get focusNode => widget.focusNode;

  @override
  // ignore: override_on_non_overriding_member
  bool get enabled => isInteractive;

  @override
  T get radioValue => widget.value;

  ValueChanged<bool?>? get onChanged =>
      registry != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  bool get value => widget.value == registry?.groupValue;

  bool get isInteractive => widget.enabled;

  @override
  void initState() {
    super.initState();
    // [ToggleableStateMixin] is not used so this could be below
    // the init state
    registry = widget.groupRegistry;
  }

  @override
  void didUpdateWidget(covariant _RawRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    registry = widget.groupRegistry;
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: investigate why this is below dispose in the original implementation
    registry = null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: consider this refactor
    // final (
    //   bool? accessibilitySelected,
    //   String? semanticsHint,
    // ) = switch (defaultTargetPlatform) {
    //   .android || .fuchsia || .linux || .windows => (null, null),
    //   .iOS || .macOS => (
    //     value,
    //     !value
    //         ? WidgetsLocalizations.of(context)._radioButtonUnselectedLabel
    //         : null,
    //   ),
    // };

    final bool? accessibilitySelected;
    final String? semanticsHint;
    switch (defaultTargetPlatform) {
      case .android || .fuchsia || .linux || .windows:
        accessibilitySelected = null;
        semanticsHint = null;
      case .iOS || .macOS:
        accessibilitySelected = value;
        // Only provide hint for unselected radio buttons to avoid duplication
        // of the selected state announcement.
        // Selected state is already announced by iOS via the 'selected' property.
        semanticsHint = !value
            ? WidgetsLocalizations.of(context)._radioButtonUnselectedLabel
            : null;
    }
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: value,
      selected: accessibilitySelected,
      hint: semanticsHint,
      child: widget.builder(context, this),
    );
  }
}

// TODO: Remove this once deprecated API is removed.
/// A registry for deprecated API.
class _LegacyRadioGroupRegistry<T> extends RadioGroupRegistry<T> {
  _LegacyRadioGroupRegistry(this.state);

  final _RadioGroupButtonState<T> state;

  @override
  T? get groupValue => state.widget.groupValue;

  @override
  ValueChanged<T?> get onChanged => state.widget.onChanged!;

  @override
  void registerClient(RadioClient<T> radio) {}

  @override
  void unregisterClient(RadioClient<T> radio) {}
}

class _ValueListenable<T extends Object?> extends ValueListenable<T> {
  const _ValueListenable(this.value);

  @override
  final T value;

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
}

extension on WidgetsLocalizations {
  // TODO: remove when radioButtonUnselectedLabel lands on stable
  String? get _radioButtonUnselectedLabel {
    try {
      final Object? result = (this as dynamic).radioButtonUnselectedLabel;
      return result != null && result is String ? result : null;
    } on NoSuchMethodError {
      return null;
    }
  }
}
