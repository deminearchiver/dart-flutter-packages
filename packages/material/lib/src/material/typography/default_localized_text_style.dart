part of 'typography.dart';

/// A widget that provides localized text style defaults to its descendants.
class DefaultLocalizedTextStyle extends SingleChildStatelessWidget {
  const DefaultLocalizedTextStyle({
    super.key,
    this.scriptCategory,
    required this.style,
    super.child,
  });

  /// The [ScriptCategory] used to determine the localized properties of the
  /// text.
  ///
  /// If this is null, the value is fetched from the nearest
  /// [MaterialLocalizations] ancestor delegate. If no [MaterialLocalizations]
  /// are found, it defaults to [ScriptCategory.englishLike].
  final ScriptCategory? scriptCategory;

  /// Default [TextStyle] to use.
  ///
  /// Localized defaults will be provided for this text style.
  final TextStyle style;

  @override
  SingleChildWidget wrap(BuildContext context, Widget? child) =>
      DefaultLocalizedTextStyle(
        key: key,
        scriptCategory: scriptCategory,
        style: style,
        child: child,
      );

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    final scriptCategory = this.scriptCategory;
    final localizedStyle = scriptCategory != null
        ? localizedStyleFor(scriptCategory)
        : localizedStyleOf(context);
    final resolvedStyle = localizedStyle.merge(style);
    return DefaultTextStyle.merge(style: resolvedStyle, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        EnumProperty<ScriptCategory>(
          "scriptCategory",
          scriptCategory,
          defaultValue: null,
        ),
      )
      ..add(DiagnosticsProperty<TextStyle>("style", style));
  }

  /// Defines text style defaults for `ScriptCategory.englishLike` scripts,
  /// such as English, French, Russian, etc.
  static const englishLike = TextStyle(
    debugLabel: "englishLike default 2021",
    inherit: true,
    decoration: .none,
    textBaseline: .alphabetic,
    leadingDistribution: .even,
  );

  /// Defines text style defaults for dense scripts, such as Chinese, Japanese
  /// and Korean.
  static const dense = TextStyle(
    debugLabel: "dense default 2021",
    inherit: true,
    decoration: .none,
    textBaseline: .ideographic,
    leadingDistribution: .even,
  );

  /// Defines text style defaults for tall scripts, such as Farsi, Hindi,
  /// and Thai.
  static const tall = TextStyle(
    debugLabel: "tall default 2021",
    inherit: true,
    decoration: .none,
    textBaseline: .alphabetic,
    leadingDistribution: .even,
  );

  /// Returns the [TextStyle] containing localized defaults for the
  /// specified [scriptCategory].
  static TextStyle localizedStyleFor(ScriptCategory scriptCategory) =>
      switch (scriptCategory) {
        .englishLike => englishLike,
        .dense => dense,
        .tall => tall,
      };

  /// Returns the [ScriptCategory] from the closest [MaterialLocalizations]
  /// ancestor delegate, or `null` if none is found.
  static ScriptCategory? maybeScriptCategoryOf(BuildContext context) =>
      Localizations.of<MaterialLocalizations>(
        context,
        MaterialLocalizations,
      )?.scriptCategory;

  /// Returns the [ScriptCategory] from the closest [MaterialLocalizations]
  /// ancestor delegate, defaulting to [.englishLike] if none is found.
  static ScriptCategory scriptCategoryOf(BuildContext context) =>
      maybeScriptCategoryOf(context) ?? .englishLike;

  /// Returns the localized [TextStyle] for the ambient [ScriptCategory],
  /// or `null` if no [MaterialLocalizations] are found.
  static TextStyle? maybeLocalizedStyleOf(BuildContext context) {
    final scriptCategory = maybeScriptCategoryOf(context);
    return scriptCategory != null ? localizedStyleFor(scriptCategory) : null;
  }

  /// Returns the localized [TextStyle] for the ambient [ScriptCategory].
  ///
  /// Defaults to [englishLike] if no [MaterialLocalizations] ancestor delegate
  /// exists.
  static TextStyle localizedStyleOf(BuildContext context) =>
      localizedStyleFor(scriptCategoryOf(context));
}
