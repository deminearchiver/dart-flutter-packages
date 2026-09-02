// ignore_for_file: remove_deprecations_in_breaking_versions

import 'package:material_ui/material_ui.dart' as flutter;
import 'package:material/src/material/flutter.dart';

// TODO: is the usage of ProxyWidget justified here?
/// A surface which implements the Material Metaphor from Material Design.
///
/// The [Surface] widget is responsible for:
///
/// 1. Clipping: If [clipBehavior] is not [Clip.none], [Surface] clips its
///    widget sub-tree to the shape specified by [shape].
///    By default, [clipBehavior] is [Clip.none] for performance considerations.
///    See [Ink] for an example of how this affects clipping [Ink] widgets.
/// 2. Elevation: [Surface] elevates its widget sub-tree on the Z axis by
///    [elevation] pixels, and draws the appropriate shadow.
/// 3. Ink effects: [Surface] shows ink effects implemented by [InkFeature]s
///    like [InkSplash] and [InkHighlight] below its children.
///
/// ## The Material Metaphor
///
/// Material is the central metaphor in Material Design. Each piece of material
/// exists at a given elevation, which influences how that piece of material
/// visually relates to other pieces of material and how that material casts
/// shadows.
///
/// Most user interface elements are either conceptually printed on a piece of
/// material (surface) or themselves made of material (surface). Surfaces react
/// to user input using [InkSplash] and [InkHighlight] effects. To trigger a
/// reaction on the surface, use a [MaterialInkController] obtained via
/// [Surface.inkControllerOf].
///
/// ## Shape
///
/// The shape for the surface is determined by [shape].
/// If [shape] is non null, it determines the shape.
///
/// ## Border
///
/// If [shape] is not null, then its border will also be painted (if any).
///
/// ## Layout change notifications
///
/// If the layout changes (e.g. because there's a list on the surface, and it's
/// been scrolled), a [LayoutChangedNotification] must be dispatched at the
/// relevant subtree. This in particular means that transitions (e.g.
/// [SlideTransition]) should not be placed inside [Surface] widgets so as to
/// move subtrees that contain [InkResponse]s, [InkWell]s, [Ink]s, or other
/// widgets that use the [InkFeature] mechanism. Otherwise, in-progress ink
/// features (e.g., ink splashes and ink highlights) won't move to account for
/// the new layout.
///
/// ## Painting over the surface
///
/// Surface widgets will often trigger reactions on their nearest surface
/// ancestor. For example, [InkWell] triggers a reaction on the
/// tile's surface when a pointer is hovering over it. These reactions will be
/// obscured if any widget in between them and the surface paints in such a
/// way as to obscure the surface (such as setting a [BoxDecoration.color] on
/// a [DecoratedBox]). To avoid this behavior, use [InkDecoration] to decorate
/// the surface itself.
///
/// See also:
///
///  * <https://material.io/design/>
///  * <https://m3.material.io/styles/color/the-color-system/color-roles>
class Surface extends StatelessWidget implements ProxyWidget {
  /// Creates a surface.
  ///
  /// Unspecified properties will be filled using inherited themes.
  ///
  /// The [elevation] must be non-negative if provided.
  const Surface({
    super.key,
    this.clipBehavior = .none,
    this.borderOnForeground = true,
    this.shape,
    this.color,
    this.elevation,
    this.shadowColor,
    Widget? child,
  }) : assert(elevation == null || elevation >= 0.0),
       child = child ?? const SizedBox.shrink();

  /// Creates a surface.
  ///
  /// Unspecified properties will be set to constant values.
  ///
  /// The [elevation] must be non-negative.
  const Surface.raw({
    super.key,
    this.clipBehavior = .none,
    this.borderOnForeground = true,
    ShapeBorder this.shape = defaultRawShape,
    Color this.color = defaultRawColor,
    double this.elevation = defaultRawElevation,
    Color this.shadowColor = defaultRawShadowColor,
    Widget? child,
  }) : assert(elevation >= 0.0),
       child = child ?? const SizedBox.shrink();

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none].
  final Clip clipBehavior;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  final bool borderOnForeground;

  /// Defines the shape of the surface as well as of its shadow.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  final ShapeBorder? shape;

  /// The color to paint the surface.
  ///
  /// By default, the color is transparent.
  final Color? color;

  /// The z-coordinate at which to place this surface relative to its parent.
  ///
  /// This controls the size of the shadow below the surface.
  ///
  /// If this is non-zero, the contents of the material are clipped, because the
  /// widget conceptually defines an independent printed piece of material.
  ///
  /// Defaults to [ElevationThemeData.level0] when using [Surface.new] or to
  /// 0 when [Surface.raw] is used.
  ///
  /// The value is non-negative.
  ///
  /// See also:
  ///
  ///  * [Surface.shadowColor] which will be used for the color of a drop shadow.
  final double? elevation;

  /// The color to paint the shadow below the surface.
  ///
  /// If null then [ColorTheme]'s [ColorThemeData.shadow] will be used.
  ///
  /// To remove the drop shadow when [elevation] is greater than 0, set
  /// [shadowColor] to [Colors.transparent].
  final Color? shadowColor;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final capturedTextStyle = DefaultTextStyle.of(context);
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);

    final resolvedShape =
        shape ?? shapeTheme.applyCorner(corner: shapeTheme.cornerNone);
    final resolvedColor = color ?? Colors.transparent;
    final resolvedElevation = elevation ?? elevationTheme.level0;
    final resolvedShadowColor = shadowColor ?? colorTheme.shadow;

    final isTransparent =
        resolvedColor.a == 0.0 &&
        switch (resolvedShape) {
          LinearBorder() ||
          RoundedRectangleBorder(borderRadius: .zero) ||
          RoundedSuperellipseBorder(borderRadius: .zero) ||
          BeveledRectangleBorder(borderRadius: .zero) ||
          ContinuousRectangleBorder(borderRadius: .zero) ||
          CornersBorder(corners: .zero) => true,
          _ => false,
        };

    return flutter.Material(
      animationDuration: .zero,
      animateColor: false,
      // TODO: MaterialType.transparency disables hit test absorption internally
      type: isTransparent ? .transparency : .canvas,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      shape: resolvedShape,
      color: resolvedColor,
      elevation: resolvedElevation,
      shadowColor: resolvedShadowColor,
      surfaceTintColor: Colors.transparent,
      textStyle: null,
      child: capturedTextStyle.wrap(context, child),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        EnumProperty<Clip>(
          "clipBehavior",
          clipBehavior,
          defaultValue: Clip.none,
        ),
      )
      ..add(
        DiagnosticsProperty<bool>(
          "borderOnForeground",
          borderOnForeground,
          defaultValue: true,
        ),
      )
      ..add(
        DiagnosticsProperty<ShapeBorder>("shape", shape, defaultValue: null),
      )
      ..add(ColorProperty("color", color, defaultValue: null))
      ..add(DoubleProperty("elevation", elevation, defaultValue: null))
      ..add(ColorProperty("shadowColor", shadowColor, defaultValue: null));
  }

  static const defaultRawShape = RoundedRectangleBorder();
  static const defaultRawColor = Colors.transparent;
  static const defaultRawElevation = 0.0;
  static const defaultRawShadowColor = Colors.black;

  /// The ink controller from the closest instance of [Surface] that encloses
  /// the given context within the closest [LookupBoundary].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController? inkController = Surface.maybeInkControllerOf(context);
  /// ```
  ///
  /// This method can be expensive (it walks the element tree).
  ///
  /// See also:
  ///
  /// * [Surface.inkControllerOf], which is similar to this method, but asserts
  ///   if no [Surface] ancestor is found.
  static MaterialInkController? maybeInkControllerOf(BuildContext context) =>
      flutter.Material.maybeOf(context);

  /// The ink controller from the closest instance of [Surface] that encloses
  /// the given context within the closest [LookupBoundary].
  ///
  /// If no [Surface] widget ancestor can be found then this method will assert
  /// in debug mode, and throw an exception in release mode.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController inkController = Surface.inkControllerOf(context);
  /// ```
  ///
  /// This method can be expensive (it walks the element tree).
  ///
  /// See also:
  ///
  /// * [Surface.maybeInkControllerOf], which is similar to this method,
  ///   but returns null if no [Surface] ancestor is found.
  static MaterialInkController inkControllerOf(BuildContext context) =>
      flutter.Material.of(context);
}

/// A piece of material.
///
/// The Material widget is responsible for:
///
/// 1. Clipping: If [clipBehavior] is not [Clip.none], Material clips its widget
///    sub-tree to the shape specified by [shape].
///    By default, [clipBehavior] is [Clip.none] for performance considerations.
///    See [Ink] for an example of how this affects clipping [Ink] widgets.
/// 2. Elevation: Material elevates its widget sub-tree on the Z axis by
///    [elevation] pixels, and draws the appropriate shadow.
/// 3. Ink effects: Material shows ink effects implemented by [InkFeature]s
///    like [InkSplash] and [InkHighlight] below its children.
///
/// ## The Material Metaphor
///
/// Material is the central metaphor in Material Design. Each piece of material
/// exists at a given elevation, which influences how that piece of material
/// visually relates to other pieces of material and how that material casts
/// shadows.
///
/// Most user interface elements are either conceptually printed on a piece of
/// material or themselves made of material. Material reacts to user input using
/// [InkSplash] and [InkHighlight] effects. To trigger a reaction on the
/// material, use a [MaterialInkController] obtained via [Material.of].
///
/// ## Shape
///
/// The shape for material is determined by [shape].
/// If [shape] is non null, it determines the shape.
///
/// ## Border
///
/// If [shape] is not null, then its border will also be painted (if any).
///
/// ## Layout change notifications
///
/// If the layout changes (e.g. because there's a list on the material, and it's
/// been scrolled), a [LayoutChangedNotification] must be dispatched at the
/// relevant subtree. This in particular means that transitions (e.g.
/// [SlideTransition]) should not be placed inside [Material] widgets so as to
/// move subtrees that contain [InkResponse]s, [InkWell]s, [Ink]s, or other
/// widgets that use the [InkFeature] mechanism. Otherwise, in-progress ink
/// features (e.g., ink splashes and ink highlights) won't move to account for
/// the new layout.
///
/// ## Painting over the material
///
/// Material widgets will often trigger reactions on their nearest material
/// ancestor. For example, [InkWell] triggers a reaction on the
/// tile's material when a pointer is hovering over it. These reactions will be
/// obscured if any widget in between them and the material paints in such a
/// way as to obscure the material (such as setting a [BoxDecoration.color] on
/// a [DecoratedBox]). To avoid this behavior, use [InkDecoration] to decorate
/// the material itself.
///
/// See also:
///
///  * [MergeableMaterial], a piece of material that can split and re-merge.
///  * <https://material.io/design/>
///  * <https://m3.material.io/styles/color/the-color-system/color-roles>
@Deprecated("Use Surface instead.")
class Material extends Surface {
  /// Creates a piece of material.
  ///
  /// Unspecified properties will be filled using inherited themes.
  ///
  /// The [elevation] must be non-negative if provided.
  @Deprecated("Use Surface() instead.")
  const Material({
    super.key,
    super.clipBehavior,
    super.borderOnForeground,
    super.shape,
    super.color,
    super.elevation,
    super.shadowColor,
    super.child,
  });

  /// Creates a piece of material.
  ///
  /// Unspecified properties will be set to constant values.
  ///
  /// The [elevation] must be non-negative.
  @Deprecated("Use Surface.raw() instead.")
  const Material.raw({
    super.key,
    super.clipBehavior,
    super.borderOnForeground,
    super.shape,
    super.color,
    super.elevation,
    super.shadowColor,
    super.child,
  });

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none].
  @override
  Clip get clipBehavior => super.clipBehavior;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  @override
  bool get borderOnForeground => super.borderOnForeground;

  /// Defines the material's shape as well its shadow.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  @override
  ShapeBorder? get shape => super.shape;

  /// The color to paint the material.
  ///
  /// By default, the color is transparent.
  @override
  Color? get color => super.color;

  /// The z-coordinate at which to place this material relative to its parent.
  ///
  /// This controls the size of the shadow below the material.
  ///
  /// If this is non-zero, the contents of the material are clipped, because the
  /// widget conceptually defines an independent printed piece of material.
  ///
  /// Defaults to [ElevationThemeData.level0] when using [Material.new] or to
  /// 0 when [Material.raw] is used.
  ///
  /// The value is non-negative.
  ///
  /// See also:
  ///
  ///  * [Material.shadowColor] which will be used for the color of a drop
  ///    shadow.
  @override
  double? get elevation => super.elevation;

  /// The color to paint the shadow below the material.
  ///
  /// If null then [ColorTheme]'s [ColorThemeData.shadow] will be used.
  ///
  /// To remove the drop shadow when [elevation] is greater than 0, set
  /// [shadowColor] to [Colors.transparent].
  @override
  Color? get shadowColor => super.shadowColor;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  @override
  Widget get child => super.child;

  static const defaultRawShape = Surface.defaultRawShape;
  static const defaultRawColor = Surface.defaultRawColor;
  static const defaultRawElevation = Surface.defaultRawElevation;
  static const defaultRawShadowColor = Surface.defaultRawShadowColor;

  /// The ink controller from the closest instance of this class that
  /// encloses the given context within the closest [LookupBoundary].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController? inkController = Material.maybeOf(context);
  /// ```
  ///
  /// This method can be expensive (it walks the element tree).
  ///
  /// See also:
  ///
  /// * [Material.of], which is similar to this method, but asserts if
  ///   no [Material] ancestor is found.
  static MaterialInkController? maybeOf(BuildContext context) =>
      Surface.maybeInkControllerOf(context);

  /// The ink controller from the closest instance of [Material] that encloses
  /// the given context within the closest [LookupBoundary].
  ///
  /// If no [Material] widget ancestor can be found then this method will assert
  /// in debug mode, and throw an exception in release mode.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// MaterialInkController inkController = Material.of(context);
  /// ```
  ///
  /// This method can be expensive (it walks the element tree).
  ///
  /// See also:
  ///
  /// * [Material.maybeOf], which is similar to this method, but returns null if
  ///   no [Material] ancestor is found.
  static MaterialInkController of(BuildContext context) =>
      Surface.inkControllerOf(context);
}
