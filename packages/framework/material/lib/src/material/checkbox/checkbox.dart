import 'dart:async';
import 'dart:math' as math;

import 'package:material_ui/material_ui.dart' as flutter;

import 'package:material/src/material/flutter.dart';

typedef CheckboxLegacy = flutter.Checkbox;
typedef CheckboxThemeLegacy = flutter.CheckboxTheme;
typedef CheckboxThemeDataLegacy = flutter.CheckboxThemeData;

enum _CheckboxSelectionState { off, indeterminate, checked }

sealed class _CheckboxStates with Diagnosticable implements CheckboxStates {
  const _CheckboxStates({required this.isSelected});

  const factory _CheckboxStates.enabled({
    required bool isSelected,
    bool isHovered,
    bool isFocused,
    bool isPressed,
  }) = _CheckboxEnabledStates;

  const factory _CheckboxStates.disabled({required bool isSelected}) =
      _CheckboxDisabledStates;

  factory _CheckboxStates.fromWidgetStates(
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
          other is _CheckboxStates &&
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

class _CheckboxDisabledStates extends _CheckboxStates
    implements CheckboxDisabledStates {
  const _CheckboxDisabledStates({required super.isSelected});

  @override
  bool get isDisabled => true;

  @override
  bool get isHovered => false;

  @override
  bool get isFocused => false;

  @override
  bool get isPressed => false;
}

class _CheckboxEnabledStates extends _CheckboxStates
    implements CheckboxEnabledStates {
  const _CheckboxEnabledStates({
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

sealed class Checkbox extends StatefulWidget {
  const Checkbox._({super.key});

  const factory Checkbox.bistate({
    Key? key,
    required ValueChanged<bool>? onCheckedChanged,
    required bool checked,
  }) = _BistateCheckbox;

  const factory Checkbox.tristate({
    Key? key,
    required VoidCallback? onTap,
    required bool? state,
  }) = _TristateCheckbox;

  _CheckboxSelectionState get _state;
  VoidCallback? get _onTap;

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _BistateCheckbox extends Checkbox {
  const _BistateCheckbox({
    super.key,
    required this.onCheckedChanged,
    required this.checked,
  }) : super._();

  final ValueChanged<bool>? onCheckedChanged;
  final bool checked;

  @override
  _CheckboxSelectionState get _state => checked ? .checked : .off;

  @override
  VoidCallback? get _onTap => onCheckedChanged != null ? _onTapCallback : null;

  void _onTapCallback() {
    assert(onCheckedChanged != null);
    onCheckedChanged!(!checked);
  }
}

class _TristateCheckbox extends Checkbox {
  const _TristateCheckbox({super.key, required this.onTap, required this.state})
    : super._();

  final VoidCallback? onTap;
  final bool? state;

  @override
  _CheckboxSelectionState get _state => switch (state) {
    false => .off,
    null => .indeterminate,
    true => .checked,
  };

  @override
  VoidCallback? get _onTap => onTap;
}

class _CheckboxState extends State<Checkbox> with TickerProviderStateMixin {
  bool get _isIndeterminate => widget._state == .indeterminate;
  bool get _isChecked => widget._state == .checked;
  bool get _isCheckedOrIndeterminate => widget._state != .off;

  double get _checkedFraction => _isCheckedOrIndeterminate ? 1.0 : 0.0;
  double get _crossCenterGravitation => _isIndeterminate ? 1.0 : 0.0;

  late ShapeThemeData _shapeTheme;
  late SpringThemeData _springTheme;
  late CheckboxThemeData _checkboxTheme;

  late final WidgetStatesController _statesController;
  bool _pressed = false;
  bool _focused = false;

  late OutlinedBorder _resolvedContainerShape;
  late Color _resolvedContainerColor;
  late Outline _resolvedContainerOutline;
  late Color _resolvedIconColor;

  late final AnimationController _checkFractionController;
  late final AnimationController _crossCenterGravitationController;

  late final AnimationController _effectsController;

  final Tween<OutlinedBorder?> _containerShapeTween = OutlinedBorderTween();
  final Tween<Color?> _containerColorTween = ColorTween();
  final Tween<Outline?> _containerOutlineTween = OutlineTween();
  final Tween<Color?> _iconColorTween = ColorTween();

  late Animation<OutlinedBorder?> _containerShapeAnimation;
  late Animation<Color?> _containerColorAnimation;
  late Animation<Outline?> _containerOutlineAnimation;
  late Animation<Color?> _iconColorAnimation;

  late Animation<OutlinedBorder> _resolvedContainerShapeAnimation;
  late Animation<Color> _resolvedContainerColorAnimation;
  late Animation<Color> _resolvedIconColorAnimation;

  _CheckboxStates? _lastStates;
  late _CheckboxStates _states;

  void _updateColorAnimations({
    required OutlinedBorder containerShape,
    required Color containerColor,
    required Outline containerOutline,
    required Color iconColor,
  }) {
    if (containerShape == _containerShapeTween.end &&
        containerColor == _containerColorTween.end &&
        containerOutline == _containerOutlineTween.end &&
        iconColor == _iconColorTween.end) {
      return;
    }

    _containerShapeTween.begin =
        _containerShapeAnimation.value ?? containerShape;
    _containerShapeTween.end = containerShape;

    _containerColorTween.begin =
        _containerColorAnimation.value ?? containerColor;
    _containerColorTween.end = containerColor;

    _containerOutlineTween.begin =
        _containerOutlineAnimation.value ?? containerOutline;
    _containerOutlineTween.end = containerOutline;

    _iconColorTween.begin = _iconColorAnimation.value ?? iconColor;
    _iconColorTween.end = iconColor;

    if (_states == _lastStates) {
      _effectsController.value = 1.0;
      return;
    }

    if (_containerShapeTween.begin == _containerShapeTween.end &&
        _containerColorTween.begin == _containerColorTween.end &&
        _containerOutlineTween.begin == _containerOutlineTween.end &&
        _iconColorTween.begin == _iconColorTween.end) {
      _effectsController.value = 1.0;
      return;
    }

    final spring = _isCheckedOrIndeterminate
        ? _springTheme.defaultEffects.toSpringDescription()
        : _springTheme.fastEffects.toSpringDescription();
    final simulation = SpringSimulation(spring, 0.0, 1.0, 0.0);
    unawaited(_effectsController.animateWith(simulation));
  }

  void _resolveStates() {
    final states = _statesController.value as StrictSet<WidgetState>;

    final _CheckboxStates result = widget._onTap == null
        ? .disabled(isSelected: _isCheckedOrIndeterminate)
        : .enabled(
            isSelected: _isCheckedOrIndeterminate,
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
    _checkFractionController = AnimationController.unbounded(
      vsync: this,
      value: _checkedFraction,
    );
    _crossCenterGravitationController = AnimationController.unbounded(
      vsync: this,
      value: _crossCenterGravitation,
    );
    _effectsController = AnimationController(vsync: this, value: 0.0);
    _containerShapeAnimation = _containerShapeTween.animate(_effectsController);
    _containerColorAnimation = _containerColorTween.animate(_effectsController);
    _containerOutlineAnimation = _containerOutlineTween.animate(
      _effectsController,
    );
    _iconColorAnimation = _iconColorTween.animate(_effectsController);

    _resolvedContainerShapeAnimation = _containerShapeAnimation
        .nonNullOrElse(() => _resolvedContainerShape)
        .mapValue(
          (value) =>
              (_containerOutlineAnimation.value ?? _resolvedContainerOutline)
                  .apply(value),
        );

    _resolvedContainerColorAnimation = _containerColorAnimation.nonNullOrElse(
      () => _resolvedContainerColor,
    );

    _resolvedIconColorAnimation = _iconColorAnimation.nonNullOrElse(
      () => _resolvedIconColor,
    );
  }

  @override
  void didUpdateWidget(covariant Checkbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldState = oldWidget._state;
    final newState = widget._state;
    if (oldState != newState) {
      final oldCheckFraction = oldState == .off
          ? 0.0
          : _checkFractionController.value;
      final newCheckFraction = _checkedFraction;
      const springTheme = SpringThemeData.defaultsExpressive();
      final spring = springTheme.defaultSpatial.toSpringDescription();
      final checkFractionSimulation = SpringSimulation(
        spring,
        oldCheckFraction,
        newCheckFraction,
        0.0,
      );
      if (oldState != .off && newState == .off) {
        const duration = Duration(milliseconds: 100);
        const curve = Threshold(1.0);
        if (newCheckFraction >= oldCheckFraction) {
          unawaited(
            _checkFractionController.animateTo(
              newCheckFraction,
              duration: duration,
              curve: curve,
            ),
          );
        } else {
          unawaited(
            _checkFractionController.animateBack(
              newCheckFraction,
              duration: duration,
              curve: curve,
            ),
          );
        }
      } else {
        if (newCheckFraction >= oldCheckFraction) {
          unawaited(
            _checkFractionController.animateWith(checkFractionSimulation),
          );
        } else {
          unawaited(
            _checkFractionController.animateBackWith(checkFractionSimulation),
          );
        }
      }

      final oldCrossCenterGravitation = _crossCenterGravitationController.value;
      final newCrossCenterGravitation = _crossCenterGravitation;
      final crossCenterGravitationSimulation = SpringSimulation(
        spring,
        oldCrossCenterGravitation,
        newCrossCenterGravitation,
        0.0,
      );
      if (oldState == .off) {
        _crossCenterGravitationController.value = newCrossCenterGravitation;
      } else if (newState == .off) {
        const duration = Duration(milliseconds: 100);
        const curve = Threshold(1.0);
        if (newCrossCenterGravitation >= oldCrossCenterGravitation) {
          unawaited(
            _crossCenterGravitationController.animateTo(
              newCrossCenterGravitation,
              duration: duration,
              curve: curve,
            ),
          );
        } else {
          unawaited(
            _crossCenterGravitationController.animateBack(
              newCrossCenterGravitation,
              duration: duration,
              curve: curve,
            ),
          );
        }
      } else {
        if (newCrossCenterGravitation >= oldCrossCenterGravitation) {
          unawaited(
            _crossCenterGravitationController.animateWith(
              crossCenterGravitationSimulation,
            ),
          );
        } else {
          unawaited(
            _crossCenterGravitationController.animateBackWith(
              crossCenterGravitationSimulation,
            ),
          );
        }
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shapeTheme = ShapeTheme.of(context);
    _springTheme = SpringTheme.of(context);
    _checkboxTheme = CheckboxTheme.of(context);
  }

  @override
  void dispose() {
    _effectsController.dispose();
    _crossCenterGravitationController.dispose();
    _checkFractionController.dispose();
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _resolveStates();

    const minTapTargetSize = Size.square(48.0);
    final stateLayerSize = _checkboxTheme.stateLayerSize.resolve(_states);
    final stateLayerShape = _checkboxTheme.stateLayerShape.resolve(_states);
    final stateLayerColor = _checkboxTheme.stateLayerColor;
    final stateLayerOpacity = _checkboxTheme.stateLayerOpacity;
    final containerSize = _checkboxTheme.containerSize.resolve(_states);
    _resolvedContainerShape = _checkboxTheme.containerShape.resolve(_states);
    _resolvedContainerColor = _checkboxTheme.containerColor.resolve(_states);
    _resolvedContainerOutline = _checkboxTheme.containerOutline.resolve(
      _states,
    );
    final iconSize = _checkboxTheme.iconSize.resolve(_states);
    _resolvedIconColor = _checkboxTheme.iconColor.resolve(_states);

    final overlayColor = MixedWidgetStateLayerColor<CheckboxStates>.from(
      (widgetStates) => _CheckboxStates.fromWidgetStates(
        widgetStates,
        isSelected: _states.isSelected,
      ),
      color: stateLayerColor,
      opacity: stateLayerOpacity,
    );

    _updateColorAnimations(
      containerShape: _resolvedContainerShape,
      containerColor: _resolvedContainerColor,
      containerOutline: _resolvedContainerOutline,
      iconColor: _resolvedIconColor,
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
            onTap: !_states.isDisabled ? () => widget._onTap?.call() : null,
            onTapDown: !_states.isDisabled ? _onTapDown : null,
            onTapUp: !_states.isDisabled ? _onTapUp : null,
            onTapCancel: !_states.isDisabled ? _onTapCancel : null,
            onFocusChange: !_states.isDisabled ? _onFocusChange : null,
          ),
        ),
      ),
    );

    final Widget paint = _CheckboxPaint(
      minTapTargetSize: minTapTargetSize,
      containerSize: .square(containerSize),
      containerShape: _resolvedContainerShapeAnimation,
      containerColor: _resolvedContainerColorAnimation,
      iconSize: iconSize,
      iconColor: _resolvedIconColorAnimation,
      iconStrokeWidth: 2.0,
      iconStrokeCap: .round,
      iconStrokeJoin: .round,
      checkFraction: _checkFractionController,
      crossCenterGravitation: _crossCenterGravitationController,
      childPosition: .bottom,
      child: child,
    );

    return RepaintBoundary(
      child: Semantics(
        enabled: !_states.isDisabled,
        label: null,
        checked: _isChecked,
        mixed: _isIndeterminate,
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

enum _CheckboxChildPosition { bottom, middle, top }

class _CheckboxPaint extends SingleChildRenderObjectWidget {
  const _CheckboxPaint({
    // super.key,
    required this.minTapTargetSize,
    required this.containerSize,
    required this.containerShape,
    required this.containerColor,
    required this.iconSize,
    required this.iconColor,
    required this.iconStrokeWidth,
    required this.iconStrokeCap,
    required this.iconStrokeJoin,
    required this.checkFraction,
    required this.crossCenterGravitation,
    required this.childPosition,
    super.child,
  });

  final Size minTapTargetSize;

  final Size containerSize;
  final ValueListenable<OutlinedBorder> containerShape;
  final ValueListenable<Color> containerColor;

  final double iconSize;
  final ValueListenable<Color> iconColor;
  final double iconStrokeWidth;
  final StrokeCap iconStrokeCap;
  final StrokeJoin iconStrokeJoin;
  final ValueListenable<double> checkFraction;
  final ValueListenable<double> crossCenterGravitation;

  final _CheckboxChildPosition childPosition;

  @override
  _RenderCheckboxPaint createRenderObject(BuildContext context) =>
      _RenderCheckboxPaint(
        minTapTargetSize: minTapTargetSize,
        containerSize: containerSize,
        containerShape: containerShape,
        containerColor: containerColor,
        iconSize: iconSize,
        iconColor: iconColor,
        iconStrokeWidth: iconStrokeWidth,
        iconStrokeCap: iconStrokeCap,
        iconStrokeJoin: iconStrokeJoin,
        checkFraction: checkFraction,
        crossCenterGravitation: crossCenterGravitation,
        childPosition: childPosition,
        textDirection: Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderCheckboxPaint renderObject,
  ) {
    renderObject
      ..minTapTargetSize = minTapTargetSize
      ..containerSize = containerSize
      ..containerShape = containerShape
      ..containerColor = containerColor
      ..iconSize = iconSize
      ..iconColor = iconColor
      ..iconStrokeWidth = iconStrokeWidth
      ..iconStrokeCap = iconStrokeCap
      ..iconStrokeJoin = iconStrokeJoin
      ..checkFraction = checkFraction
      ..crossCenterGravitation = crossCenterGravitation
      ..childPosition = childPosition
      ..textDirection = Directionality.maybeOf(context);
  }
}

class _RenderCheckboxPaint extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  _RenderCheckboxPaint({
    required Size minTapTargetSize,
    required Size containerSize,
    required ValueListenable<OutlinedBorder> containerShape,
    required ValueListenable<Color> containerColor,
    required double iconSize,
    required ValueListenable<Color> iconColor,
    required double iconStrokeWidth,
    required StrokeCap iconStrokeCap,
    required StrokeJoin iconStrokeJoin,
    required ValueListenable<double> checkFraction,
    required ValueListenable<double> crossCenterGravitation,
    required _CheckboxChildPosition childPosition,
    TextDirection? textDirection,
    RenderBox? child,
  }) : _minTapTargetSize = minTapTargetSize,
       _containerSize = containerSize,
       _containerShape = containerShape,
       _containerColor = containerColor,
       _iconSize = iconSize,
       _iconColor = iconColor,
       _iconStrokeWidth = iconStrokeWidth,
       _iconStrokeCap = iconStrokeCap,
       _iconStrokeJoin = iconStrokeJoin,
       _checkFraction = checkFraction,
       _crossCenterGravitation = crossCenterGravitation,
       _childPosition = childPosition,
       _textDirection = textDirection {
    this.child = child;
  }

  // Tap target

  Size _minTapTargetSize;
  Size get minTapTargetSize => _minTapTargetSize;
  set minTapTargetSize(Size value) {
    if (_minTapTargetSize == value) return;
    _minTapTargetSize = value;
    markNeedsLayout();
  }

  // Container

  Size _containerSize;
  Size get containerSize => _containerSize;
  set containerSize(Size value) {
    if (_containerSize == value) return;
    _containerSize = value;
    markNeedsLayout();
  }

  ValueListenable<OutlinedBorder> _containerShape;
  ValueListenable<OutlinedBorder> get containerShape => _containerShape;
  set containerShape(ValueListenable<OutlinedBorder> value) {
    if (_containerShape == value) return;
    _containerShape.removeListener(markNeedsPaint);
    _containerShape = value;
    _containerShape.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  ValueListenable<Color> _containerColor;
  ValueListenable<Color> get containerColor => _containerColor;
  set containerColor(ValueListenable<Color> value) {
    if (_containerColor == value) return;
    _containerColor.removeListener(markNeedsPaint);
    _containerColor = value;
    _containerColor.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  // Icon

  double _iconSize;
  double get iconSize => _iconSize;
  set iconSize(double value) {
    if (_iconSize == value) return;
    _iconSize = value;
    markNeedsPaint();
  }

  ValueListenable<Color> _iconColor;
  ValueListenable<Color> get iconColor => _iconColor;
  set iconColor(ValueListenable<Color> value) {
    if (_iconColor == value) return;
    _iconColor.removeListener(markNeedsPaint);
    _iconColor = value;
    _iconColor.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  double _iconStrokeWidth;
  double get iconStrokeWidth => _iconStrokeWidth;
  set iconStrokeWidth(double value) {
    if (_iconStrokeWidth == value) return;
    _iconStrokeWidth = value;
    markNeedsPaint();
  }

  StrokeCap _iconStrokeCap;
  StrokeCap get iconStrokeCap => _iconStrokeCap;
  set iconStrokeCap(StrokeCap value) {
    if (_iconStrokeCap == value) return;
    _iconStrokeCap = value;
    markNeedsPaint();
  }

  StrokeJoin _iconStrokeJoin;
  StrokeJoin get iconStrokeJoin => _iconStrokeJoin;
  set iconStrokeJoin(StrokeJoin value) {
    if (_iconStrokeJoin == value) return;
    _iconStrokeJoin = value;
    markNeedsPaint();
  }

  ValueListenable<double> _checkFraction;
  ValueListenable<double> get checkFraction => _checkFraction;
  set checkFraction(ValueListenable<double> value) {
    if (_checkFraction == value) return;
    _checkFraction.removeListener(markNeedsPaint);
    _checkFraction = value;
    _checkFraction.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  ValueListenable<double> _crossCenterGravitation;
  ValueListenable<double> get crossCenterGravitation => _crossCenterGravitation;
  set crossCenterGravitation(ValueListenable<double> value) {
    if (_crossCenterGravitation == value) return;
    _crossCenterGravitation.removeListener(markNeedsPaint);
    _crossCenterGravitation = value;
    _crossCenterGravitation.addListener(markNeedsPaint);
    markNeedsPaint();
  }

  // Child

  _CheckboxChildPosition _childPosition;
  _CheckboxChildPosition get childPosition => _childPosition;
  set childPosition(_CheckboxChildPosition value) {
    if (_childPosition == value) return;
    _childPosition = value;
    markNeedsPaint();
  }

  TextDirection? _textDirection;
  TextDirection? get textDirection => _textDirection;
  set textDirection(TextDirection? value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsPaint();
  }

  Size _computeOuterSize() => Size(
    math.max(containerSize.width, minTapTargetSize.width),
    math.max(containerSize.height, minTapTargetSize.height),
  );

  Rect _computeInnerRect(Size outerSize) {
    assert(
      outerSize.width >= containerSize.width &&
          outerSize.height >= containerSize.height,
    );
    return Rect.fromLTWH(
      (outerSize.width - containerSize.width) / 2.0,
      (outerSize.height - containerSize.height) / 2.0,
      containerSize.width,
      containerSize.height,
    );
  }

  Offset _computeOuterCenter(Size outerSize) => outerSize.center(.zero);

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _containerShape.addListener(markNeedsPaint);
    _containerColor.addListener(markNeedsPaint);
    _iconColor.addListener(markNeedsPaint);
    _checkFraction.addListener(markNeedsPaint);
    _crossCenterGravitation.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    super.detach();
    _containerShape.removeListener(markNeedsPaint);
    _containerColor.removeListener(markNeedsPaint);
    _iconColor.removeListener(markNeedsPaint);
    _checkFraction.removeListener(markNeedsPaint);
    _crossCenterGravitation.removeListener(markNeedsPaint);
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
    final outerCenter = _computeOuterCenter(outerSize);
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
          outerCenter.dx - childSize.width / 2.0,
          outerCenter.dy - childSize.height / 2.0,
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

  void _paintBox(PaintingContext context, Rect shiftedRect) {
    final shape = containerShape.value;
    final paint = Paint()
      ..style = .fill
      ..color = containerColor.value;
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

  void _paintCheck(PaintingContext context, Rect shiftedRect) {
    const relativeIconSize = 18.0;

    final iconColor = this.iconColor.value;
    final checkFraction = this.checkFraction.value;
    final crossCenterGravitation = this.crossCenterGravitation.value;

    if (checkFraction <= 0.0 || iconColor.a <= 0.0) return;

    final center = size.center(.zero);
    final scale = iconSize / relativeIconSize;

    final paint = Paint()
      ..style = .stroke
      ..color = iconColor
      ..strokeWidth = iconStrokeWidth
      ..strokeCap = iconStrokeCap
      ..strokeJoin = iconStrokeJoin;

    context.withCanvasTransform((context) {
      context.canvas.translate(center.dx, center.dy);
      context.canvas.scale(scale);
      context.canvas.translate(-center.dx, -center.dy);

      const leftX = 0.25;
      const leftY = 0.5;

      const middleX = 0.4;
      const middleY = 0.65;
      const rightX = 0.75;
      const rightY = 0.3;

      final hasOvershoot = checkFraction > 1.0;

      final gravitatedMiddleX = lerpDouble(
        middleX,
        0.5,
        crossCenterGravitation,
      );
      final gravitatedMiddleY = lerpDouble(
        middleY,
        0.5,
        crossCenterGravitation,
      );
      // gravitate only Y for end to achieve center line
      final gravitatedLeftY = lerpDouble(leftY, 0.5, crossCenterGravitation);
      final gravitatedRightY = lerpDouble(rightY, 0.5, crossCenterGravitation);

      final scaledLeftX = iconSize * leftX;
      final scaledLeftY = iconSize * gravitatedLeftY;
      final scaledMiddleX = iconSize * gravitatedMiddleX;
      final scaledMiddleY = iconSize * gravitatedMiddleY;
      final scaledRightX = iconSize * rightX;
      final scaledRightY = iconSize * gravitatedRightY;

      final relativeLeftX = scaledMiddleX - scaledLeftX;
      final relativeLeftY = scaledMiddleY - scaledLeftY;
      final relativeRightX = scaledRightX - scaledMiddleX;
      final relativeRightY = scaledRightY - scaledMiddleY;
      final leftLength = math.sqrt(
        relativeLeftX * relativeLeftX + relativeLeftY * relativeLeftY,
      );
      final rightLength = math.sqrt(
        relativeRightX * relativeRightX + relativeRightY * relativeRightY,
      );
      final totalLength = leftLength + rightLength;
      assert(rightLength > 0.0);
      var extendedTotalLength = totalLength;
      var extendedRightLength = rightLength;
      var extendedRightX = scaledRightX;
      var extendedRightY = scaledRightY;
      if (hasOvershoot) {
        extendedTotalLength = totalLength * 2.0;
        extendedRightLength = extendedTotalLength - leftLength;
        extendedRightX =
            scaledMiddleX + relativeRightX / rightLength * extendedRightLength;
        extendedRightY =
            scaledMiddleY + relativeRightY / rightLength * extendedRightLength;
      }

      final fullPath = Path()
        ..moveTo(scaledLeftX, scaledLeftY)
        ..lineTo(scaledMiddleX, scaledMiddleY)
        ..lineTo(extendedRightX, extendedRightY);
      final checkPathMetric = fullPath.computeMetrics(forceClosed: false).first;
      // final totalLength2 = checkPathMetric.length;
      // final checkLength2 = hasOvershoot
      //     ? (totalLength - (extendedTotalLength - leftLength) + rightLength)
      //     : totalLength;
      final checkLength = totalLength;
      final segmentPath = checkPathMetric
          .extractPath(0.0, checkLength * checkFraction, startWithMoveTo: true)
          .shift(shiftedRect.topLeft);
      context.canvas.drawPath(segmentPath, paint);
    });
  }

  void _paintChild(PaintingContext context) {
    if (child case final child?) {
      context.paintChild(child, (child.parentData! as BoxParentData).offset);
    }
  }

  void _paintChildFor(
    PaintingContext context,
    _CheckboxChildPosition position,
  ) {
    if (childPosition == position) {
      _paintChild(context);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final outerSize = _computeOuterSize();
    final innerRect = _computeInnerRect(outerSize);

    context.withCanvasTransform((context) {
      if (offset != .zero) {
        context.canvas.translate(offset.dx, offset.dy);
      }

      // Paint the child below the container, if any
      _paintChildFor(context, .bottom);

      // Paint the container
      _paintBox(context, innerRect);

      // Paint the child between the container and the icon, if any
      _paintChildFor(context, .middle);

      // Paint the icon
      _paintCheck(context, innerRect);

      // Paint the child above the icon, if any
      _paintChildFor(context, .top);
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
