import 'package:material/src/material/flutter.dart';
import 'package:flutter/material.dart' as flutter;

typedef IconLegacy = flutter.Icon;

/// A graphical icon widget drawn with a glyph from a font described in
/// an [IconData] such as material's predefined [IconData]s in [Symbols].
///
/// Icons are not interactive. For an interactive icon, consider material's
/// [IconButton].
///
/// There must be an ambient [Directionality] widget when using [Icon].
/// Typically this is introduced automatically by the [WidgetsApp] or
/// [MaterialApp].
///
/// This widget assumes that the rendered icon is squared. Non-squared icons may
/// render incorrectly.
///
/// See also:
///
///  * [IconButton], for interactive icons.
///  * [IconTheme], which provides ambient configuration for icons.
///  * [ImageIcon], for showing icons from [AssetImage]s or other [ImageProvider]s.
class Icon extends IconLegacy {
  /// Creates an icon.
  const Icon(
    super.icon, {
    super.key,
    this.roundness,
    super.fill,
    super.weight,
    super.grade,
    super.opticalSize,
    super.size,
    super.color,
    super.shadows,
    super.applyTextScaling,
    super.blendMode,
    super.semanticLabel,
    super.textDirection,
  }) : assert(roundness == null || (0.0 <= roundness && roundness <= 100.0)),
       assert(weight == null || (1.0 <= weight && weight <= 1000.0)),
       super(fontWeight: null);

  /// The icon can be null, in which case the widget will render as an empty
  /// space of the specified [size].
  @override
  IconData? get icon => super.icon;

  /// The roundness for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `ROND` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be between 0.0 (sharp) and 100.0 (rounded),
  /// inclusive.
  final double? roundness;

  /// The fill for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `FILL` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be between 0.0 (unfilled) and 1.0 (filled),
  /// inclusive.
  ///
  /// Can be used to convey a state transition for animation or interaction.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.fill].
  ///
  /// See also:
  ///  * [weight], for controlling stroke weight.
  ///  * [grade], for controlling stroke weight in a more granular way.
  ///  * [opticalSize], for controlling optical size.
  @override
  double? get fill => super.fill;

  /// The stroke weight for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `wght` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be greater than 0.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.weight].
  ///
  /// See also:
  ///  * [fill], for controlling fill.
  ///  * [grade], for controlling stroke weight in a more granular way.
  ///  * [opticalSize], for controlling optical size.
  ///  * https://fonts.google.com/knowledge/glossary/weight_axis
  @override
  double? get weight => super.weight;

  /// The grade (granular stroke weight) for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `GRAD` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Can be negative.
  ///
  /// Grade and [weight] both affect a symbol's stroke weight (thickness), but
  /// grade has a smaller impact on the size of the symbol.
  ///
  /// Grade is also available in some text fonts. One can match grade levels
  /// between text and symbols for a harmonious visual effect. For example, if
  /// the text font has a -25 grade value, the symbols can match it with a
  /// suitable value, say -25.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.grade].
  ///
  /// See also:
  ///  * [fill], for controlling fill.
  ///  * [weight], for controlling stroke weight in a less granular way.
  ///  * [opticalSize], for controlling optical size.
  ///  * https://fonts.google.com/knowledge/glossary/grade_axis
  @override
  double? get grade => super.grade;

  /// The optical size for drawing the icon.
  ///
  /// Requires the underlying icon font to support the `opsz` [FontVariation]
  /// axis, otherwise has no effect. Variable font filenames often indicate
  /// the supported axes. Must be greater than 0.
  ///
  /// For an icon to look the same at different sizes, the stroke weight
  /// (thickness) must change as the icon size scales. Optical size offers a way
  /// to automatically adjust the stroke weight as icon size changes.
  ///
  /// Defaults to nearest [IconTheme]'s [IconThemeData.opticalSize].
  ///
  /// See also:
  ///  * [fill], for controlling fill.
  ///  * [weight], for controlling stroke weight.
  ///  * [grade], for controlling stroke weight in a more granular way.
  ///  * https://fonts.google.com/knowledge/glossary/optical_size_axis
  @override
  double? get opticalSize => super.opticalSize;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.size].
  ///
  /// If this [Icon] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the splash
  /// area the appropriate size as well. The [IconButton] uses an [IconTheme] to
  /// pass down the size to the [Icon].
  @override
  double? get size => super.size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.color].
  ///
  /// The color (whether specified explicitly here or obtained from the
  /// [IconTheme]) will be further adjusted by the nearest [IconTheme]'s
  /// [IconThemeData.opacity].
  ///
  /// {@tool snippet}
  /// Typically, a Material Design color will be used, as follows:
  ///
  /// ```dart
  /// Icon(
  ///   Icons.widgets,
  ///   color: Colors.blue.shade400,
  /// )
  /// ```
  /// {@end-tool}
  @override
  Color? get color => super.color;

  /// A list of [Shadow]s that will be painted underneath the icon.
  ///
  /// Multiple shadows are supported to replicate lighting from multiple light
  /// sources.
  ///
  /// Shadows must be in the same order for [Icon] to be considered as
  /// equivalent as order produces differing transparency.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.shadows].
  @override
  List<Shadow>? get shadows => super.shadows;

  /// Whether to scale the size of this widget using the ambient [MediaQuery]'s [TextScaler].
  ///
  /// This is specially useful when you have an icon associated with a text, as
  /// scaling the text without scaling the icon would result in a confusing
  /// interface.
  ///
  /// Defaults to the nearest [IconTheme]'s
  /// [IconThemeData.applyTextScaling].
  @override
  bool? get applyTextScaling => super.applyTextScaling;

  /// The [BlendMode] to apply to the foreground of the icon.
  ///
  /// Defaults to [BlendMode.srcOver]
  @override
  BlendMode? get blendMode => super.blendMode;

  /// Semantic label for the icon.
  ///
  /// Announced by assistive technologies (e.g TalkBack/VoiceOver).
  /// This label does not show in the UI.
  ///
  ///  * [SemanticsProperties.label], which is set to [semanticLabel] in the
  ///    underlying	 [Semantics] widget.
  @override
  String? get semanticLabel => super.semanticLabel;

  /// The text direction to use for rendering the icon.
  ///
  /// If this is null, the ambient [Directionality] is used instead.
  ///
  /// Some icons follow the reading direction. For example, "back" buttons point
  /// left in left-to-right environments and right in right-to-left
  /// environments. Such icons have their [IconData.matchTextDirection] field
  /// set to true, and the [Icon] widget uses the [textDirection] to determine
  /// the orientation in which to draw the icon.
  ///
  /// This property has no effect if the [icon]'s [IconData.matchTextDirection]
  /// field is false, but for consistency a text direction value must always be
  /// specified, either directly using this property or using [Directionality].
  @override
  TextDirection? get textDirection => super.textDirection;

  @override
  FontWeight? get fontWeight {
    final weight = this.weight;
    return weight != null ? .new(clampInt(weight.round(), 1, 1000)) : null;
  }

  @override
  Widget build(BuildContext context) {
    assert(this.textDirection != null || debugCheckHasDirectionality(context));
    final textDirection = this.textDirection ?? Directionality.of(context);

    final iconTheme = IconTheme.of(context, allowLegacy: true);

    final icon = this.icon;
    final roundness = this.roundness ?? iconTheme.roundness;
    final fill = this.fill ?? iconTheme.fill;
    final weight = this.weight ?? iconTheme.weight;
    final grade = this.grade ?? iconTheme.grade;
    final opticalSize = this.opticalSize ?? iconTheme.opticalSize;
    var size = this.size ?? iconTheme.size;
    final shadows = this.shadows ?? iconTheme.shadows;
    final applyTextScaling =
        this.applyTextScaling ?? iconTheme.applyTextScaling;

    size = applyTextScaling
        ? MediaQuery.textScalerOf(context).scale(size)
        : size;

    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox(width: size, height: size),
      );
    }

    Color? color = this.color ?? iconTheme.color;

    final opacity = iconTheme.opacity;
    if (opacity != 1.0) {
      color = color.withValues(alpha: color.a * opacity);
    }

    Paint? foreground;
    if (blendMode != null) {
      foreground = Paint()
        ..blendMode = blendMode!
        ..color = color;
      color = null;
    }

    final fontStyle = TextStyle(
      inherit: false,
      color: color,
      fontSize: size,
      height: 1.0,
      leadingDistribution: .even,
      foreground: foreground,
      shadows: shadows,
      fontVariations: [
        FontVariation("ROND", roundness),
        FontVariation("FILL", fill),
        FontVariation("wght", weight),
        FontVariation("GRAD", grade),
        FontVariation("opsz", opticalSize),
      ],
      fontFamily: icon.fontFamily,
      fontFamilyFallback: icon.fontFamilyFallback,
      package: icon.fontPackage,
    );

    Widget result = RichText(
      overflow: .visible,
      textDirection: textDirection,
      text: TextSpan(text: .fromCharCode(icon.codePoint), style: fontStyle),
    );

    if (icon.matchTextDirection && textDirection == .rtl) {
      // TextDirection changes infrequently and the tree is relatively small,
      // which means that we can conditionally wrap the widget in Transform.
      result = Transform.flip(
        flipX: true,
        transformHitTests: false,
        child: result,
      );
    }

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: SizedBox(
          width: size,
          height: size,
          child: Align.center(child: result),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IconDataProperty("icon", icon, ifNull: "<empty>", showName: false))
      ..add(DoubleProperty("fill", fill, defaultValue: null))
      ..add(DoubleProperty("weight", weight, defaultValue: null))
      ..add(DoubleProperty("grade", grade, defaultValue: null))
      ..add(DoubleProperty("opticalSize", opticalSize, defaultValue: null))
      ..add(DoubleProperty("size", size, defaultValue: null))
      ..add(ColorProperty("color", color, defaultValue: null))
      ..add(IterableProperty<Shadow>("shadows", shadows, defaultValue: null))
      ..add(
        DiagnosticsProperty<bool>(
          "applyTextScaling",
          applyTextScaling,
          defaultValue: null,
        ),
      )
      ..add(StringProperty("semanticLabel", semanticLabel, defaultValue: null))
      ..add(
        EnumProperty<TextDirection>(
          "textDirection",
          textDirection,
          defaultValue: null,
        ),
      );
  }
}
