import 'package:material/src/material/flutter.dart';
import 'package:flutter/material.dart' as flutter;

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
/// ancestor. For example, [ListTile.hoverColor] triggers a reaction on the
/// tile's material when a pointer is hovering over it. These reactions will be
/// obscured if any widget in between them and the material paints in such a
/// way as to obscure the material (such as setting a [BoxDecoration.color] on
/// a [DecoratedBox]). To avoid this behavior, use [InkDecoration] to decorate
/// the material itself.
///
/// See also:
///
///  * [MergeableMaterial], a piece of material that can split and re-merge.
///  * [Card], a wrapper for a [Material] of [type] [MaterialType.card].
///  * <https://material.io/design/>
///  * <https://m3.material.io/styles/color/the-color-system/color-roles>
class Material extends StatelessWidget {
  /// Creates a piece of material.
  ///
  /// The [elevation] must be non-negative.
  ///
  /// If a [shape] is specified, then the [borderRadius] property must be
  /// null and the [type] property must not be [MaterialType.circle]. If the
  /// [borderRadius] is specified, then the [type] property must not be
  /// [MaterialType.circle]. In both cases, these restrictions are intended to
  /// catch likely errors.
  const Material({
    super.key,
    this.clipBehavior = Clip.none,
    this.borderOnForeground = true,
    this.shape,
    this.color,
    this.elevation,
    this.shadowColor,
    this.child,
  }) : assert(elevation == null || elevation >= 0.0);

  const Material.empty({
    super.key,
    this.clipBehavior = Clip.none,
    this.borderOnForeground = true,
    ShapeBorder this.shape = const RoundedRectangleBorder(),
    Color this.color = Colors.transparent,
    double this.elevation = 0.0,
    Color this.shadowColor = Colors.black,
    this.child,
  }) : assert(elevation >= 0.0);

  /// {@template flutter.material.Material.clipBehavior}
  /// The content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common
  /// use cases.
  /// {@endtemplate}
  ///
  /// Defaults to [Clip.none].
  final Clip clipBehavior;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  final bool borderOnForeground;

  /// Defines the material's shape as well its shadow.
  ///
  /// {@template flutter.material.material.shape}
  /// If shape is non null, the [borderRadius] is ignored and the material's
  /// clip boundary and shadow are defined by the shape.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// The color to paint the material.
  ///
  /// By default, the color is transparent.
  final Color? color;

  /// {@macro flutter.material.material.elevation}
  final double? elevation;

  /// The color to paint the shadow below the material.
  ///
  /// {@macro flutter.material.material.shadowColor}
  final Color? shadowColor;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final capturedTextStyle = DefaultTextStyle.of(context);

    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);

    final resolvedShape =
        shape ?? CornersBorder.rounded(corners: .all(shapeTheme.corner.none));
    final resolvedColor = color ?? Colors.transparent;
    final resolvedElevation = elevation ?? elevationTheme.level0;
    final resolvedShadowColor = shadowColor ?? colorTheme.shadow;
    final resolvedChild = child ?? const SizedBox.shrink();

    // TODO(deminearchiver): is this optimization really required?
    final isTransparent =
        resolvedColor.a == 0.0 &&
        switch (resolvedShape) {
          LinearBorder() ||
          RoundedRectangleBorder(borderRadius: .zero) ||
          RoundedSuperellipseBorder(borderRadius: .zero) ||
          BeveledRectangleBorder(borderRadius: .zero) ||
          ContinuousRectangleBorder(borderRadius: .zero) ||
          CornersBorder(corners: .none) => true,
          _ => false,
        };

    final flutter.MaterialType resolvedType = isTransparent
        ? .transparency
        : .canvas;

    return flutter.Material(
      animationDuration: .zero,
      animateColor: false,
      type: resolvedType,
      clipBehavior: clipBehavior,
      borderOnForeground: borderOnForeground,
      shape: resolvedShape,
      color: resolvedColor,
      elevation: resolvedElevation,
      shadowColor: resolvedShadowColor,
      surfaceTintColor: Colors.transparent,
      textStyle: null,
      child: capturedTextStyle.wrap(context, resolvedChild),
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
      flutter.Material.maybeOf(context);

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
      flutter.Material.of(context);
}

extension DefaultTextStyleExtension on DefaultTextStyle {
  Widget wrap(BuildContext context, Widget child) => DefaultTextStyle(
    style: style,
    textAlign: textAlign,
    maxLines: maxLines,
    softWrap: softWrap,
    overflow: overflow,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    child: child,
  );
}
