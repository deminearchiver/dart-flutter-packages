import 'dart:async';

import 'package:material/src/material/flutter.dart';
import 'package:flutter/scheduler.dart';

enum FocusRingPlacement { inward, outward }

class _FocusRingStates implements FocusRingStates {
  _FocusRingStates({
    required this.placement,
    this.isVisible = false,
    this.isActive = false,
  }) : assert(isVisible || !isActive);

  _FocusRingStates.hidden({required this.placement})
    : isVisible = false,
      isActive = false;

  _FocusRingStates.visible({required this.placement, this.isActive = false})
    : isVisible = true;

  @override
  final FocusRingPlacement placement;

  @override
  final bool isVisible;

  @override
  final bool isActive;

  _FocusRingStates copyWith({
    FocusRingPlacement? placement,
    bool? isVisible,
    bool? isActive,
  }) => placement != null || isVisible != null || isActive != null
      ? _FocusRingStates(
          placement: placement ?? this.placement,
          isVisible: isVisible ?? this.isVisible,
          isActive: isActive ?? this.isActive,
        )
      : this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _FocusRingStates &&
          placement == other.placement &&
          isVisible == other.isVisible &&
          isActive == other.isActive;

  @override
  int get hashCode => Object.hash(runtimeType, placement, isVisible, isActive);
}

typedef FocusRingLayoutBuilder =
    Widget Function(
      BuildContext context,
      OverlayChildLayoutInfo info,
      Widget child,
    );

class FocusRing extends StatefulWidget {
  const FocusRing({
    super.key,
    required this.visible,
    required this.placement,
    this.layoutBuilder = defaultLayoutBuilder,
    required this.child,
  });

  final bool visible;

  final FocusRingPlacement placement;

  final FocusRingLayoutBuilder layoutBuilder;

  final Widget child;

  @override
  State<FocusRing> createState() => _FocusRingState();

  static Widget defaultLayoutBuilder(
    BuildContext _,
    OverlayChildLayoutInfo _,
    Widget child,
  ) => child;
}

class _FocusRingState extends State<FocusRing>
    with SingleTickerProviderStateMixin {
  final OverlayPortalController _overlayPortalController =
      OverlayPortalController();

  late FocusRingThemeData _focusRingTheme;

  late AnimationController _animationController;

  final _growCurveTween = CurveTween(
    curve: const EasingThemeData.fallback().linear,
  );

  final _shrinkCurveTween = CurveTween(
    curve: const EasingThemeData.fallback().linear,
  );

  final Tween<double> _offsetGrowTween = Tween<double>();
  final Tween<double> _offsetShrinkTween = Tween<double>();
  late Animation<double> _offsetAnimation;

  final Tween<OutlinedBorder?> _shapeGrowTween = OutlinedBorderTween();
  final Tween<OutlinedBorder?> _shapeShrinkTween = OutlinedBorderTween();
  late Animation<OutlinedBorder?> _shapeAnimation;

  final Tween<Outline?> _outlineGrowTween = OutlineTween();
  final Tween<Outline?> _outlineShrinkTween = OutlineTween();
  late Animation<Outline?> _outlineAnimation;

  late _FocusRingStates _hiddenStates;
  late _FocusRingStates _visibleStates;
  late _FocusRingStates _activeStates;

  _FocusRingStates get _defaultStates =>
      widget.visible ? _visibleStates : _hiddenStates;

  bool _showOverlay() {
    if (_overlayPortalController.isShowing) return false;
    _overlayPortalController.show();
    return true;
  }

  bool _hideOverlay() {
    if (!_overlayPortalController.isShowing) return false;
    _overlayPortalController.hide();
    return true;
  }

  void _toggleOverlay([bool? show]) {
    final VoidCallback callback = show != null
        ? show
              ? _showOverlay
              : _hideOverlay
        : _overlayPortalController.toggle;
    _callDeferred(callback);
  }

  void _animationStatusListener(AnimationStatus status) {
    _toggleOverlay(status != .dismissed);
  }

  void _callDeferred(VoidCallback callback) {
    if (SchedulerBinding.instance.schedulerPhase == .persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        callback();
      });
    } else {
      callback();
    }
  }

  void _updateStates() {
    _hiddenStates = _FocusRingStates.hidden(placement: widget.placement);
    _visibleStates = _hiddenStates.copyWith(isVisible: true);
    _activeStates = _visibleStates.copyWith(isActive: true);
  }

  @override
  void initState() {
    super.initState();

    _updateStates();

    if (widget.visible) {
      _toggleOverlay(true);
    }

    _animationController = AnimationController(
      vsync: this,
      value: widget.visible ? 1.0 : 0.0,
    )..addStatusListener(_animationStatusListener);

    const growTweenWeight = 0.25;
    const shrinkTweenWeight = 0.75;

    _offsetAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: _offsetGrowTween.chain(_growCurveTween),
        weight: growTweenWeight,
      ),
      TweenSequenceItem(
        tween: _offsetShrinkTween.chain(_shrinkCurveTween),
        weight: shrinkTweenWeight,
      ),
    ]).animate(_animationController);

    _shapeAnimation = TweenSequence<OutlinedBorder?>([
      TweenSequenceItem(
        tween: _shapeGrowTween.chain(_growCurveTween),
        weight: growTweenWeight,
      ),
      TweenSequenceItem(
        tween: _shapeShrinkTween.chain(_shrinkCurveTween),
        weight: shrinkTweenWeight,
      ),
    ]).animate(_animationController);

    _outlineAnimation = TweenSequence<Outline?>([
      TweenSequenceItem(
        tween: _outlineGrowTween.chain(_growCurveTween),
        weight: growTweenWeight,
      ),
      TweenSequenceItem(
        tween: _outlineShrinkTween.chain(_shrinkCurveTween),
        weight: shrinkTweenWeight,
      ),
    ]).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant FocusRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.placement != oldWidget.placement) {
      _updateStates();
    }
    if (widget.visible != oldWidget.visible) {
      if (widget.visible) {
        unawaited(
          _animationController.animateTo(
            1.0,
            duration: _focusRingTheme.duration,
          ),
        );
      } else {
        unawaited(_animationController.animateBack(0.0, duration: .zero));
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final easingTheme = EasingTheme.of(context);
    _focusRingTheme = FocusRingTheme.of(context);

    _growCurveTween.curve = easingTheme.standard;
    _shrinkCurveTween.curve = easingTheme.standard;

    final hiddenOffset = _focusRingTheme.offset.resolve(_hiddenStates);
    final visibleOffset = _focusRingTheme.offset.resolve(_visibleStates);
    final activeOffset = _focusRingTheme.offset.resolve(_activeStates);

    _offsetGrowTween.begin = hiddenOffset;
    _offsetGrowTween.end = activeOffset;
    _offsetShrinkTween.begin = activeOffset;
    _offsetShrinkTween.end = visibleOffset;

    final hiddenShape = _focusRingTheme.shape.resolve(_hiddenStates);
    final visibleShape = _focusRingTheme.shape.resolve(_visibleStates);
    final activeShape = _focusRingTheme.shape.resolve(_activeStates);

    _shapeGrowTween.begin = hiddenShape;
    _shapeGrowTween.end = activeShape;
    _shapeShrinkTween.begin = activeShape;
    _shapeShrinkTween.end = visibleShape;

    final hiddenOutline = _focusRingTheme.outline.resolve(_hiddenStates);
    final visibleOutline = _focusRingTheme.outline.resolve(_visibleStates);
    final activeOutline = _focusRingTheme.outline.resolve(_activeStates);

    _outlineGrowTween.begin = hiddenOutline;
    _outlineGrowTween.end = activeOutline;
    _outlineShrinkTween.begin = activeOutline;
    _outlineShrinkTween.end = visibleOutline;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Widget _buildGlobalOverlay(
  //   BuildContext context,
  //   OverlayChildLayoutInfo info,
  //   Widget child,
  // ) {
  //   final transform = info.childPaintTransform;
  //   final translateX = transform.storage[12];
  //   final translateY = transform.storage[13];
  //   final translationOffset = Offset(translateX, translateY);
  //   final scaleX = transform.storage[0];
  //   final scaleY = transform.storage[5];
  //   final childSize = info.childSize;
  //   final scaledChildSize = Size(
  //     childSize.width * scaleX,
  //     childSize.height * scaleY,
  //   );
  //   final focusIndicatorOffset = 2.0;
  //   final scaledFocusIndicatorSize = Size(
  //     childSize.width + focusIndicatorOffset * 2.0,
  //     childSize.height + focusIndicatorOffset * 2.0,
  //   );
  //   return IgnorePointer(
  //     child: Align.topLeft(
  //       child: Transform.translate(
  //         offset: translationOffset,
  //         child: SizedBox.fromSize(
  //           size: scaledChildSize,
  //           child: Align.center(
  //             child: SizedBox.fromSize(
  //               size: scaledFocusIndicatorSize,
  //               child: child,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLocalOverlay(
    BuildContext context,
    OverlayChildLayoutInfo info,
    Widget child,
  ) => IgnorePointer(
    child: Align.topLeft(
      child: Transform(
        transform: info.childPaintTransform,
        child: SizedBox.fromSize(
          size: info.childSize,
          child: widget.layoutBuilder(context, info, child),
        ),
      ),
    ),
  );

  Widget _buildIndicator(BuildContext context) {
    final offset = _focusRingTheme.offset.resolve(_defaultStates);
    final shape = _focusRingTheme.shape.resolve(_defaultStates);
    final outline = _focusRingTheme.outline.resolve(_defaultStates);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        final resolvedOffset = _offsetAnimation.value;
        final padding = switch (widget.placement) {
          .inward => resolvedOffset,
          .outward => -resolvedOffset,
        };
        final resolvedShape = _shapeAnimation.value ?? shape;
        final resolvedOutline = _outlineAnimation.value ?? outline;
        return Padding(
          padding: .all(padding),
          child: DecoratedBox(
            position: .foreground,
            decoration: ShapeDecoration(
              shape: resolvedOutline.apply(resolvedShape),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final indicator = _buildIndicator(context);
    return OverlayPortal.overlayChildLayoutBuilder(
      controller: _overlayPortalController,
      overlayChildBuilder: (context, info) =>
          _buildLocalOverlay(context, info, indicator),
      child: widget.child,
    );
  }
}
