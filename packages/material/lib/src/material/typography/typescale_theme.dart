import 'package:material/src/material/flutter.dart';

abstract class TypescaleThemeDataPartial with Diagnosticable {
  const TypescaleThemeDataPartial();

  const factory TypescaleThemeDataPartial.from({
    TextGeometryPartial? displayLarge,
    TextGeometryPartial? displayMedium,
    TextGeometryPartial? displaySmall,
    TextGeometryPartial? headlineLarge,
    TextGeometryPartial? headlineMedium,
    TextGeometryPartial? headlineSmall,
    TextGeometryPartial? titleLarge,
    TextGeometryPartial? titleMedium,
    TextGeometryPartial? titleSmall,
    TextGeometryPartial? bodyLarge,
    TextGeometryPartial? bodyMedium,
    TextGeometryPartial? bodySmall,
    TextGeometryPartial? labelLarge,
    TextGeometryPartial? labelMedium,
    TextGeometryPartial? labelSmall,
    TextGeometryPartial? displayLargeEmphasized,
    TextGeometryPartial? displayMediumEmphasized,
    TextGeometryPartial? displaySmallEmphasized,
    TextGeometryPartial? headlineLargeEmphasized,
    TextGeometryPartial? headlineMediumEmphasized,
    TextGeometryPartial? headlineSmallEmphasized,
    TextGeometryPartial? titleLargeEmphasized,
    TextGeometryPartial? titleMediumEmphasized,
    TextGeometryPartial? titleSmallEmphasized,
    TextGeometryPartial? bodyLargeEmphasized,
    TextGeometryPartial? bodyMediumEmphasized,
    TextGeometryPartial? bodySmallEmphasized,
    TextGeometryPartial? labelLargeEmphasized,
    TextGeometryPartial? labelMediumEmphasized,
    TextGeometryPartial? labelSmallEmphasized,
  }) = _TypescaleThemeDataPartial;

  TextGeometryPartial? get displayLarge;

  TextGeometryPartial? get displayMedium;

  TextGeometryPartial? get displaySmall;

  TextGeometryPartial? get headlineLarge;

  TextGeometryPartial? get headlineMedium;

  TextGeometryPartial? get headlineSmall;

  TextGeometryPartial? get titleLarge;

  TextGeometryPartial? get titleMedium;

  TextGeometryPartial? get titleSmall;

  TextGeometryPartial? get bodyLarge;

  TextGeometryPartial? get bodyMedium;

  TextGeometryPartial? get bodySmall;

  TextGeometryPartial? get labelLarge;

  TextGeometryPartial? get labelMedium;

  TextGeometryPartial? get labelSmall;

  TextGeometryPartial? get displayLargeEmphasized;

  TextGeometryPartial? get displayMediumEmphasized;

  TextGeometryPartial? get displaySmallEmphasized;

  TextGeometryPartial? get headlineLargeEmphasized;

  TextGeometryPartial? get headlineMediumEmphasized;

  TextGeometryPartial? get headlineSmallEmphasized;

  TextGeometryPartial? get titleLargeEmphasized;

  TextGeometryPartial? get titleMediumEmphasized;

  TextGeometryPartial? get titleSmallEmphasized;

  TextGeometryPartial? get bodyLargeEmphasized;

  TextGeometryPartial? get bodyMediumEmphasized;

  TextGeometryPartial? get bodySmallEmphasized;

  TextGeometryPartial? get labelLargeEmphasized;

  TextGeometryPartial? get labelMediumEmphasized;

  TextGeometryPartial? get labelSmallEmphasized;

  TypescaleThemeDataPartial copyWith({
    covariant TextGeometryPartial? displayLarge,
    covariant TextGeometryPartial? displayMedium,
    covariant TextGeometryPartial? displaySmall,
    covariant TextGeometryPartial? headlineLarge,
    covariant TextGeometryPartial? headlineMedium,
    covariant TextGeometryPartial? headlineSmall,
    covariant TextGeometryPartial? titleLarge,
    covariant TextGeometryPartial? titleMedium,
    covariant TextGeometryPartial? titleSmall,
    covariant TextGeometryPartial? bodyLarge,
    covariant TextGeometryPartial? bodyMedium,
    covariant TextGeometryPartial? bodySmall,
    covariant TextGeometryPartial? labelLarge,
    covariant TextGeometryPartial? labelMedium,
    covariant TextGeometryPartial? labelSmall,
    covariant TextGeometryPartial? displayLargeEmphasized,
    covariant TextGeometryPartial? displayMediumEmphasized,
    covariant TextGeometryPartial? displaySmallEmphasized,
    covariant TextGeometryPartial? headlineLargeEmphasized,
    covariant TextGeometryPartial? headlineMediumEmphasized,
    covariant TextGeometryPartial? headlineSmallEmphasized,
    covariant TextGeometryPartial? titleLargeEmphasized,
    covariant TextGeometryPartial? titleMediumEmphasized,
    covariant TextGeometryPartial? titleSmallEmphasized,
    covariant TextGeometryPartial? bodyLargeEmphasized,
    covariant TextGeometryPartial? bodyMediumEmphasized,
    covariant TextGeometryPartial? bodySmallEmphasized,
    covariant TextGeometryPartial? labelLargeEmphasized,
    covariant TextGeometryPartial? labelMediumEmphasized,
    covariant TextGeometryPartial? labelSmallEmphasized,
  }) =>
      displayLarge != null ||
          displayMedium != null ||
          displaySmall != null ||
          headlineLarge != null ||
          headlineMedium != null ||
          headlineSmall != null ||
          titleLarge != null ||
          titleMedium != null ||
          titleSmall != null ||
          bodyLarge != null ||
          bodyMedium != null ||
          bodySmall != null ||
          labelLarge != null ||
          labelMedium != null ||
          labelSmall != null ||
          displayLargeEmphasized != null ||
          displayMediumEmphasized != null ||
          displaySmallEmphasized != null ||
          headlineLargeEmphasized != null ||
          headlineMediumEmphasized != null ||
          headlineSmallEmphasized != null ||
          titleLargeEmphasized != null ||
          titleMediumEmphasized != null ||
          titleSmallEmphasized != null ||
          bodyLargeEmphasized != null ||
          bodyMediumEmphasized != null ||
          bodySmallEmphasized != null ||
          labelLargeEmphasized != null ||
          labelMediumEmphasized != null ||
          labelSmallEmphasized != null
      ? TypescaleThemeDataPartial.from(
          displayLarge: displayLarge ?? this.displayLarge,
          displayMedium: displayMedium ?? this.displayMedium,
          displaySmall: displaySmall ?? this.displaySmall,
          headlineLarge: headlineLarge ?? this.headlineLarge,
          headlineMedium: headlineMedium ?? this.headlineMedium,
          headlineSmall: headlineSmall ?? this.headlineSmall,
          titleLarge: titleLarge ?? this.titleLarge,
          titleMedium: titleMedium ?? this.titleMedium,
          titleSmall: titleSmall ?? this.titleSmall,
          bodyLarge: bodyLarge ?? this.bodyLarge,
          bodyMedium: bodyMedium ?? this.bodyMedium,
          bodySmall: bodySmall ?? this.bodySmall,
          labelLarge: labelLarge ?? this.labelLarge,
          labelMedium: labelMedium ?? this.labelMedium,
          labelSmall: labelSmall ?? this.labelSmall,
          displayLargeEmphasized:
              displayLargeEmphasized ?? this.displayLargeEmphasized,
          displayMediumEmphasized:
              displayMediumEmphasized ?? this.displayMediumEmphasized,
          displaySmallEmphasized:
              displaySmallEmphasized ?? this.displaySmallEmphasized,
          headlineLargeEmphasized:
              headlineLargeEmphasized ?? this.headlineLargeEmphasized,
          headlineMediumEmphasized:
              headlineMediumEmphasized ?? this.headlineMediumEmphasized,
          headlineSmallEmphasized:
              headlineSmallEmphasized ?? this.headlineSmallEmphasized,
          titleLargeEmphasized:
              titleLargeEmphasized ?? this.titleLargeEmphasized,
          titleMediumEmphasized:
              titleMediumEmphasized ?? this.titleMediumEmphasized,
          titleSmallEmphasized:
              titleSmallEmphasized ?? this.titleSmallEmphasized,
          bodyLargeEmphasized: bodyLargeEmphasized ?? this.bodyLargeEmphasized,
          bodyMediumEmphasized:
              bodyMediumEmphasized ?? this.bodyMediumEmphasized,
          bodySmallEmphasized: bodySmallEmphasized ?? this.bodySmallEmphasized,
          labelLargeEmphasized:
              labelLargeEmphasized ?? this.labelLargeEmphasized,
          labelMediumEmphasized:
              labelMediumEmphasized ?? this.labelMediumEmphasized,
          labelSmallEmphasized:
              labelSmallEmphasized ?? this.labelSmallEmphasized,
        )
      : this;

  TypescaleThemeDataPartial mergeWith({
    TextGeometryPartial? displayLarge,
    TextGeometryPartial? displayMedium,
    TextGeometryPartial? displaySmall,
    TextGeometryPartial? headlineLarge,
    TextGeometryPartial? headlineMedium,
    TextGeometryPartial? headlineSmall,
    TextGeometryPartial? titleLarge,
    TextGeometryPartial? titleMedium,
    TextGeometryPartial? titleSmall,
    TextGeometryPartial? bodyLarge,
    TextGeometryPartial? bodyMedium,
    TextGeometryPartial? bodySmall,
    TextGeometryPartial? labelLarge,
    TextGeometryPartial? labelMedium,
    TextGeometryPartial? labelSmall,
    TextGeometryPartial? displayLargeEmphasized,
    TextGeometryPartial? displayMediumEmphasized,
    TextGeometryPartial? displaySmallEmphasized,
    TextGeometryPartial? headlineLargeEmphasized,
    TextGeometryPartial? headlineMediumEmphasized,
    TextGeometryPartial? headlineSmallEmphasized,
    TextGeometryPartial? titleLargeEmphasized,
    TextGeometryPartial? titleMediumEmphasized,
    TextGeometryPartial? titleSmallEmphasized,
    TextGeometryPartial? bodyLargeEmphasized,
    TextGeometryPartial? bodyMediumEmphasized,
    TextGeometryPartial? bodySmallEmphasized,
    TextGeometryPartial? labelLargeEmphasized,
    TextGeometryPartial? labelMediumEmphasized,
    TextGeometryPartial? labelSmallEmphasized,
  }) =>
      displayLarge != null ||
          displayMedium != null ||
          displaySmall != null ||
          headlineLarge != null ||
          headlineMedium != null ||
          headlineSmall != null ||
          titleLarge != null ||
          titleMedium != null ||
          titleSmall != null ||
          bodyLarge != null ||
          bodyMedium != null ||
          bodySmall != null ||
          labelLarge != null ||
          labelMedium != null ||
          labelSmall != null ||
          displayLargeEmphasized != null ||
          displayMediumEmphasized != null ||
          displaySmallEmphasized != null ||
          headlineLargeEmphasized != null ||
          headlineMediumEmphasized != null ||
          headlineSmallEmphasized != null ||
          titleLargeEmphasized != null ||
          titleMediumEmphasized != null ||
          titleSmallEmphasized != null ||
          bodyLargeEmphasized != null ||
          bodyMediumEmphasized != null ||
          bodySmallEmphasized != null ||
          labelLargeEmphasized != null ||
          labelMediumEmphasized != null ||
          labelSmallEmphasized != null
      ? TypescaleThemeDataPartial.from(
          displayLarge: this.displayLarge?.merge(displayLarge) ?? displayLarge,
          displayMedium:
              this.displayMedium?.merge(displayMedium) ?? displayMedium,
          displaySmall: this.displaySmall?.merge(displaySmall) ?? displaySmall,
          headlineLarge:
              this.headlineLarge?.merge(headlineLarge) ?? headlineLarge,
          headlineMedium:
              this.headlineMedium?.merge(headlineMedium) ?? headlineMedium,
          headlineSmall:
              this.headlineSmall?.merge(headlineSmall) ?? headlineSmall,
          titleLarge: this.titleLarge?.merge(titleLarge) ?? titleLarge,
          titleMedium: this.titleMedium?.merge(titleMedium) ?? titleMedium,
          titleSmall: this.titleSmall?.merge(titleSmall) ?? titleSmall,
          bodyLarge: this.bodyLarge?.merge(bodyLarge) ?? bodyLarge,
          bodyMedium: this.bodyMedium?.merge(bodyMedium) ?? bodyMedium,
          bodySmall: this.bodySmall?.merge(bodySmall) ?? bodySmall,
          labelLarge: this.labelLarge?.merge(labelLarge) ?? labelLarge,
          labelMedium: this.labelMedium?.merge(labelMedium) ?? labelMedium,
          labelSmall: this.labelSmall?.merge(labelSmall) ?? labelSmall,
          displayLargeEmphasized:
              this.displayLargeEmphasized?.merge(displayLargeEmphasized) ??
              displayLargeEmphasized,
          displayMediumEmphasized:
              this.displayMediumEmphasized?.merge(displayMediumEmphasized) ??
              displayMediumEmphasized,
          displaySmallEmphasized:
              this.displaySmallEmphasized?.merge(displaySmallEmphasized) ??
              displaySmallEmphasized,
          headlineLargeEmphasized:
              this.headlineLargeEmphasized?.merge(headlineLargeEmphasized) ??
              headlineLargeEmphasized,
          headlineMediumEmphasized:
              this.headlineMediumEmphasized?.merge(headlineMediumEmphasized) ??
              headlineMediumEmphasized,
          headlineSmallEmphasized:
              this.headlineSmallEmphasized?.merge(headlineSmallEmphasized) ??
              headlineSmallEmphasized,
          titleLargeEmphasized:
              this.titleLargeEmphasized?.merge(titleLargeEmphasized) ??
              titleLargeEmphasized,
          titleMediumEmphasized:
              this.titleMediumEmphasized?.merge(titleMediumEmphasized) ??
              titleMediumEmphasized,
          titleSmallEmphasized:
              this.titleSmallEmphasized?.merge(titleSmallEmphasized) ??
              titleSmallEmphasized,
          bodyLargeEmphasized:
              this.bodyLargeEmphasized?.merge(bodyLargeEmphasized) ??
              bodyLargeEmphasized,
          bodyMediumEmphasized:
              this.bodyMediumEmphasized?.merge(bodyMediumEmphasized) ??
              bodyMediumEmphasized,
          bodySmallEmphasized:
              this.bodySmallEmphasized?.merge(bodySmallEmphasized) ??
              bodySmallEmphasized,
          labelLargeEmphasized:
              this.labelLargeEmphasized?.merge(labelLargeEmphasized) ??
              labelLargeEmphasized,
          labelMediumEmphasized:
              this.labelMediumEmphasized?.merge(labelMediumEmphasized) ??
              labelMediumEmphasized,
          labelSmallEmphasized:
              this.labelSmallEmphasized?.merge(labelSmallEmphasized) ??
              labelSmallEmphasized,
        )
      : this;

  TypescaleThemeDataPartial merge(TypescaleThemeDataPartial? other) =>
      other != null
      ? mergeWith(
          displayLarge: other.displayLarge,
          displayMedium: other.displayMedium,
          displaySmall: other.displaySmall,
          headlineLarge: other.headlineLarge,
          headlineMedium: other.headlineMedium,
          headlineSmall: other.headlineSmall,
          titleLarge: other.titleLarge,
          titleMedium: other.titleMedium,
          titleSmall: other.titleSmall,
          bodyLarge: other.bodyLarge,
          bodyMedium: other.bodyMedium,
          bodySmall: other.bodySmall,
          labelLarge: other.labelLarge,
          labelMedium: other.labelMedium,
          labelSmall: other.labelSmall,
          displayLargeEmphasized: other.displayLargeEmphasized,
          displayMediumEmphasized: other.displayMediumEmphasized,
          displaySmallEmphasized: other.displaySmallEmphasized,
          headlineLargeEmphasized: other.headlineLargeEmphasized,
          headlineMediumEmphasized: other.headlineMediumEmphasized,
          headlineSmallEmphasized: other.headlineSmallEmphasized,
          titleLargeEmphasized: other.titleLargeEmphasized,
          titleMediumEmphasized: other.titleMediumEmphasized,
          titleSmallEmphasized: other.titleSmallEmphasized,
          bodyLargeEmphasized: other.bodyLargeEmphasized,
          bodyMediumEmphasized: other.bodyMediumEmphasized,
          bodySmallEmphasized: other.bodySmallEmphasized,
          labelLargeEmphasized: other.labelLargeEmphasized,
          labelMediumEmphasized: other.labelMediumEmphasized,
          labelSmallEmphasized: other.labelSmallEmphasized,
        )
      : this;

  TextTheme toBaselineTextTheme() => TextTheme(
    displayLarge: displayLarge?.toTextStyle(),
    displayMedium: displayMedium?.toTextStyle(),
    displaySmall: displaySmall?.toTextStyle(),
    headlineLarge: headlineLarge?.toTextStyle(),
    headlineMedium: headlineMedium?.toTextStyle(),
    headlineSmall: headlineSmall?.toTextStyle(),
    titleLarge: titleLarge?.toTextStyle(),
    titleMedium: titleMedium?.toTextStyle(),
    titleSmall: titleSmall?.toTextStyle(),
    bodyLarge: bodyLarge?.toTextStyle(),
    bodyMedium: bodyMedium?.toTextStyle(),
    bodySmall: bodySmall?.toTextStyle(),
    labelLarge: labelLarge?.toTextStyle(),
    labelMedium: labelMedium?.toTextStyle(),
    labelSmall: labelSmall?.toTextStyle(),
  );

  TextTheme toEmphasizedTextTheme() => TextTheme(
    displayLarge: displayLargeEmphasized?.toTextStyle(),
    displayMedium: displayMediumEmphasized?.toTextStyle(),
    displaySmall: displaySmallEmphasized?.toTextStyle(),
    headlineLarge: headlineLargeEmphasized?.toTextStyle(),
    headlineMedium: headlineMediumEmphasized?.toTextStyle(),
    headlineSmall: headlineSmallEmphasized?.toTextStyle(),
    titleLarge: titleLargeEmphasized?.toTextStyle(),
    titleMedium: titleMediumEmphasized?.toTextStyle(),
    titleSmall: titleSmallEmphasized?.toTextStyle(),
    bodyLarge: bodyLargeEmphasized?.toTextStyle(),
    bodyMedium: bodyMediumEmphasized?.toTextStyle(),
    bodySmall: bodySmallEmphasized?.toTextStyle(),
    labelLarge: labelLargeEmphasized?.toTextStyle(),
    labelMedium: labelMediumEmphasized?.toTextStyle(),
    labelSmall: labelSmallEmphasized?.toTextStyle(),
  );

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "displayLarge",
          displayLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "displayMedium",
          displayMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "displaySmall",
          displaySmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "headlineLarge",
          headlineLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "headlineMedium",
          headlineMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "headlineSmall",
          headlineSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "titleLarge",
          titleLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "titleMedium",
          titleMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "titleSmall",
          titleSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "bodyLarge",
          bodyLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "bodyMedium",
          bodyMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "bodySmall",
          bodySmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "labelLarge",
          labelLarge,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "labelMedium",
          labelMedium,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "labelSmall",
          labelSmall,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "displayLargeEmphasized",
          displayLargeEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "displayMediumEmphasized",
          displayMediumEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "displaySmallEmphasized",
          displaySmallEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "headlineLargeEmphasized",
          headlineLargeEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "headlineMediumEmphasized",
          headlineMediumEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "headlineSmallEmphasized",
          headlineSmallEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "titleLargeEmphasized",
          titleLargeEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "titleMediumEmphasized",
          titleMediumEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "titleSmallEmphasized",
          titleSmallEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "bodyLargeEmphasized",
          bodyLargeEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "bodyMediumEmphasized",
          bodyMediumEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "bodySmallEmphasized",
          bodySmallEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "labelLargeEmphasized",
          labelLargeEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "labelMediumEmphasized",
          labelMediumEmphasized,
          defaultValue: null,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometryPartial>(
          "labelSmallEmphasized",
          labelSmallEmphasized,
          defaultValue: null,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TypescaleThemeDataPartial &&
          displayLarge == other.displayLarge &&
          displayMedium == other.displayMedium &&
          displaySmall == other.displaySmall &&
          headlineLarge == other.headlineLarge &&
          headlineMedium == other.headlineMedium &&
          headlineSmall == other.headlineSmall &&
          titleLarge == other.titleLarge &&
          titleMedium == other.titleMedium &&
          titleSmall == other.titleSmall &&
          bodyLarge == other.bodyLarge &&
          bodyMedium == other.bodyMedium &&
          bodySmall == other.bodySmall &&
          labelLarge == other.labelLarge &&
          labelMedium == other.labelMedium &&
          labelSmall == other.labelSmall &&
          displayLargeEmphasized == other.displayLargeEmphasized &&
          displayMediumEmphasized == other.displayMediumEmphasized &&
          displaySmallEmphasized == other.displaySmallEmphasized &&
          headlineLargeEmphasized == other.headlineLargeEmphasized &&
          headlineMediumEmphasized == other.headlineMediumEmphasized &&
          headlineSmallEmphasized == other.headlineSmallEmphasized &&
          titleLargeEmphasized == other.titleLargeEmphasized &&
          titleMediumEmphasized == other.titleMediumEmphasized &&
          titleSmallEmphasized == other.titleSmallEmphasized &&
          bodyLargeEmphasized == other.bodyLargeEmphasized &&
          bodyMediumEmphasized == other.bodyMediumEmphasized &&
          bodySmallEmphasized == other.bodySmallEmphasized &&
          labelLargeEmphasized == other.labelLargeEmphasized &&
          labelMediumEmphasized == other.labelMediumEmphasized &&
          labelSmallEmphasized == other.labelSmallEmphasized;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
    displayLargeEmphasized,
    displayMediumEmphasized,
    displaySmallEmphasized,
    Object.hash(
      headlineLargeEmphasized,
      headlineMediumEmphasized,
      headlineSmallEmphasized,
      titleLargeEmphasized,
      titleMediumEmphasized,
      titleSmallEmphasized,
      bodyLargeEmphasized,
      bodyMediumEmphasized,
      bodySmallEmphasized,
      labelLargeEmphasized,
      labelMediumEmphasized,
      labelSmallEmphasized,
    ),
  );
}

class _TypescaleThemeDataPartial extends TypescaleThemeDataPartial {
  const _TypescaleThemeDataPartial({
    this.displayLarge,
    this.displayMedium,
    this.displaySmall,
    this.headlineLarge,
    this.headlineMedium,
    this.headlineSmall,
    this.titleLarge,
    this.titleMedium,
    this.titleSmall,
    this.bodyLarge,
    this.bodyMedium,
    this.bodySmall,
    this.labelLarge,
    this.labelMedium,
    this.labelSmall,
    this.displayLargeEmphasized,
    this.displayMediumEmphasized,
    this.displaySmallEmphasized,
    this.headlineLargeEmphasized,
    this.headlineMediumEmphasized,
    this.headlineSmallEmphasized,
    this.titleLargeEmphasized,
    this.titleMediumEmphasized,
    this.titleSmallEmphasized,
    this.bodyLargeEmphasized,
    this.bodyMediumEmphasized,
    this.bodySmallEmphasized,
    this.labelLargeEmphasized,
    this.labelMediumEmphasized,
    this.labelSmallEmphasized,
  });

  @override
  final TextGeometryPartial? displayLarge;

  @override
  final TextGeometryPartial? displayMedium;

  @override
  final TextGeometryPartial? displaySmall;

  @override
  final TextGeometryPartial? headlineLarge;

  @override
  final TextGeometryPartial? headlineMedium;

  @override
  final TextGeometryPartial? headlineSmall;

  @override
  final TextGeometryPartial? titleLarge;

  @override
  final TextGeometryPartial? titleMedium;

  @override
  final TextGeometryPartial? titleSmall;

  @override
  final TextGeometryPartial? bodyLarge;

  @override
  final TextGeometryPartial? bodyMedium;

  @override
  final TextGeometryPartial? bodySmall;

  @override
  final TextGeometryPartial? labelLarge;

  @override
  final TextGeometryPartial? labelMedium;

  @override
  final TextGeometryPartial? labelSmall;

  @override
  final TextGeometryPartial? displayLargeEmphasized;

  @override
  final TextGeometryPartial? displayMediumEmphasized;

  @override
  final TextGeometryPartial? displaySmallEmphasized;

  @override
  final TextGeometryPartial? headlineLargeEmphasized;

  @override
  final TextGeometryPartial? headlineMediumEmphasized;

  @override
  final TextGeometryPartial? headlineSmallEmphasized;

  @override
  final TextGeometryPartial? titleLargeEmphasized;

  @override
  final TextGeometryPartial? titleMediumEmphasized;

  @override
  final TextGeometryPartial? titleSmallEmphasized;

  @override
  final TextGeometryPartial? bodyLargeEmphasized;

  @override
  final TextGeometryPartial? bodyMediumEmphasized;

  @override
  final TextGeometryPartial? bodySmallEmphasized;

  @override
  final TextGeometryPartial? labelLargeEmphasized;

  @override
  final TextGeometryPartial? labelMediumEmphasized;

  @override
  final TextGeometryPartial? labelSmallEmphasized;
}

abstract class TypescaleThemeData extends TypescaleThemeDataPartial {
  const TypescaleThemeData();

  const factory TypescaleThemeData.from({
    required TextGeometry displayLarge,
    required TextGeometry displayMedium,
    required TextGeometry displaySmall,
    required TextGeometry headlineLarge,
    required TextGeometry headlineMedium,
    required TextGeometry headlineSmall,
    required TextGeometry titleLarge,
    required TextGeometry titleMedium,
    required TextGeometry titleSmall,
    required TextGeometry bodyLarge,
    required TextGeometry bodyMedium,
    required TextGeometry bodySmall,
    required TextGeometry labelLarge,
    required TextGeometry labelMedium,
    required TextGeometry labelSmall,
    required TextGeometry displayLargeEmphasized,
    required TextGeometry displayMediumEmphasized,
    required TextGeometry displaySmallEmphasized,
    required TextGeometry headlineLargeEmphasized,
    required TextGeometry headlineMediumEmphasized,
    required TextGeometry headlineSmallEmphasized,
    required TextGeometry titleLargeEmphasized,
    required TextGeometry titleMediumEmphasized,
    required TextGeometry titleSmallEmphasized,
    required TextGeometry bodyLargeEmphasized,
    required TextGeometry bodyMediumEmphasized,
    required TextGeometry bodySmallEmphasized,
    required TextGeometry labelLargeEmphasized,
    required TextGeometry labelMediumEmphasized,
    required TextGeometry labelSmallEmphasized,
  }) = _TypescaleThemeData;

  const factory TypescaleThemeData.fallback({
    required TypefaceThemeData typefaceTheme,
  }) = _TypescaleThemeDataFallback;

  @override
  TextGeometry get displayLarge;

  @override
  TextGeometry get displayMedium;

  @override
  TextGeometry get displaySmall;

  @override
  TextGeometry get headlineLarge;

  @override
  TextGeometry get headlineMedium;

  @override
  TextGeometry get headlineSmall;

  @override
  TextGeometry get titleLarge;

  @override
  TextGeometry get titleMedium;

  @override
  TextGeometry get titleSmall;

  @override
  TextGeometry get bodyLarge;

  @override
  TextGeometry get bodyMedium;

  @override
  TextGeometry get bodySmall;

  @override
  TextGeometry get labelLarge;

  @override
  TextGeometry get labelMedium;

  @override
  TextGeometry get labelSmall;

  @override
  TextGeometry get displayLargeEmphasized;

  @override
  TextGeometry get displayMediumEmphasized;

  @override
  TextGeometry get displaySmallEmphasized;

  @override
  TextGeometry get headlineLargeEmphasized;

  @override
  TextGeometry get headlineMediumEmphasized;

  @override
  TextGeometry get headlineSmallEmphasized;

  @override
  TextGeometry get titleLargeEmphasized;

  @override
  TextGeometry get titleMediumEmphasized;

  @override
  TextGeometry get titleSmallEmphasized;

  @override
  TextGeometry get bodyLargeEmphasized;

  @override
  TextGeometry get bodyMediumEmphasized;

  @override
  TextGeometry get bodySmallEmphasized;

  @override
  TextGeometry get labelLargeEmphasized;

  @override
  TextGeometry get labelMediumEmphasized;

  @override
  TextGeometry get labelSmallEmphasized;

  @override
  TypescaleThemeData copyWith({
    covariant TextGeometry? displayLarge,
    covariant TextGeometry? displayMedium,
    covariant TextGeometry? displaySmall,
    covariant TextGeometry? headlineLarge,
    covariant TextGeometry? headlineMedium,
    covariant TextGeometry? headlineSmall,
    covariant TextGeometry? titleLarge,
    covariant TextGeometry? titleMedium,
    covariant TextGeometry? titleSmall,
    covariant TextGeometry? bodyLarge,
    covariant TextGeometry? bodyMedium,
    covariant TextGeometry? bodySmall,
    covariant TextGeometry? labelLarge,
    covariant TextGeometry? labelMedium,
    covariant TextGeometry? labelSmall,
    covariant TextGeometry? displayLargeEmphasized,
    covariant TextGeometry? displayMediumEmphasized,
    covariant TextGeometry? displaySmallEmphasized,
    covariant TextGeometry? headlineLargeEmphasized,
    covariant TextGeometry? headlineMediumEmphasized,
    covariant TextGeometry? headlineSmallEmphasized,
    covariant TextGeometry? titleLargeEmphasized,
    covariant TextGeometry? titleMediumEmphasized,
    covariant TextGeometry? titleSmallEmphasized,
    covariant TextGeometry? bodyLargeEmphasized,
    covariant TextGeometry? bodyMediumEmphasized,
    covariant TextGeometry? bodySmallEmphasized,
    covariant TextGeometry? labelLargeEmphasized,
    covariant TextGeometry? labelMediumEmphasized,
    covariant TextGeometry? labelSmallEmphasized,
  }) =>
      displayLarge != null ||
          displayMedium != null ||
          displaySmall != null ||
          headlineLarge != null ||
          headlineMedium != null ||
          headlineSmall != null ||
          titleLarge != null ||
          titleMedium != null ||
          titleSmall != null ||
          bodyLarge != null ||
          bodyMedium != null ||
          bodySmall != null ||
          labelLarge != null ||
          labelMedium != null ||
          labelSmall != null ||
          displayLargeEmphasized != null ||
          displayMediumEmphasized != null ||
          displaySmallEmphasized != null ||
          headlineLargeEmphasized != null ||
          headlineMediumEmphasized != null ||
          headlineSmallEmphasized != null ||
          titleLargeEmphasized != null ||
          titleMediumEmphasized != null ||
          titleSmallEmphasized != null ||
          bodyLargeEmphasized != null ||
          bodyMediumEmphasized != null ||
          bodySmallEmphasized != null ||
          labelLargeEmphasized != null ||
          labelMediumEmphasized != null ||
          labelSmallEmphasized != null
      ? TypescaleThemeData.from(
          displayLarge: displayLarge ?? this.displayLarge,
          displayMedium: displayMedium ?? this.displayMedium,
          displaySmall: displaySmall ?? this.displaySmall,
          headlineLarge: headlineLarge ?? this.headlineLarge,
          headlineMedium: headlineMedium ?? this.headlineMedium,
          headlineSmall: headlineSmall ?? this.headlineSmall,
          titleLarge: titleLarge ?? this.titleLarge,
          titleMedium: titleMedium ?? this.titleMedium,
          titleSmall: titleSmall ?? this.titleSmall,
          bodyLarge: bodyLarge ?? this.bodyLarge,
          bodyMedium: bodyMedium ?? this.bodyMedium,
          bodySmall: bodySmall ?? this.bodySmall,
          labelLarge: labelLarge ?? this.labelLarge,
          labelMedium: labelMedium ?? this.labelMedium,
          labelSmall: labelSmall ?? this.labelSmall,
          displayLargeEmphasized:
              displayLargeEmphasized ?? this.displayLargeEmphasized,
          displayMediumEmphasized:
              displayMediumEmphasized ?? this.displayMediumEmphasized,
          displaySmallEmphasized:
              displaySmallEmphasized ?? this.displaySmallEmphasized,
          headlineLargeEmphasized:
              headlineLargeEmphasized ?? this.headlineLargeEmphasized,
          headlineMediumEmphasized:
              headlineMediumEmphasized ?? this.headlineMediumEmphasized,
          headlineSmallEmphasized:
              headlineSmallEmphasized ?? this.headlineSmallEmphasized,
          titleLargeEmphasized:
              titleLargeEmphasized ?? this.titleLargeEmphasized,
          titleMediumEmphasized:
              titleMediumEmphasized ?? this.titleMediumEmphasized,
          titleSmallEmphasized:
              titleSmallEmphasized ?? this.titleSmallEmphasized,
          bodyLargeEmphasized: bodyLargeEmphasized ?? this.bodyLargeEmphasized,
          bodyMediumEmphasized:
              bodyMediumEmphasized ?? this.bodyMediumEmphasized,
          bodySmallEmphasized: bodySmallEmphasized ?? this.bodySmallEmphasized,
          labelLargeEmphasized:
              labelLargeEmphasized ?? this.labelLargeEmphasized,
          labelMediumEmphasized:
              labelMediumEmphasized ?? this.labelMediumEmphasized,
          labelSmallEmphasized:
              labelSmallEmphasized ?? this.labelSmallEmphasized,
        )
      : this;

  @override
  TypescaleThemeData mergeWith({
    TextGeometryPartial? displayLarge,
    TextGeometryPartial? displayMedium,
    TextGeometryPartial? displaySmall,
    TextGeometryPartial? headlineLarge,
    TextGeometryPartial? headlineMedium,
    TextGeometryPartial? headlineSmall,
    TextGeometryPartial? titleLarge,
    TextGeometryPartial? titleMedium,
    TextGeometryPartial? titleSmall,
    TextGeometryPartial? bodyLarge,
    TextGeometryPartial? bodyMedium,
    TextGeometryPartial? bodySmall,
    TextGeometryPartial? labelLarge,
    TextGeometryPartial? labelMedium,
    TextGeometryPartial? labelSmall,
    TextGeometryPartial? displayLargeEmphasized,
    TextGeometryPartial? displayMediumEmphasized,
    TextGeometryPartial? displaySmallEmphasized,
    TextGeometryPartial? headlineLargeEmphasized,
    TextGeometryPartial? headlineMediumEmphasized,
    TextGeometryPartial? headlineSmallEmphasized,
    TextGeometryPartial? titleLargeEmphasized,
    TextGeometryPartial? titleMediumEmphasized,
    TextGeometryPartial? titleSmallEmphasized,
    TextGeometryPartial? bodyLargeEmphasized,
    TextGeometryPartial? bodyMediumEmphasized,
    TextGeometryPartial? bodySmallEmphasized,
    TextGeometryPartial? labelLargeEmphasized,
    TextGeometryPartial? labelMediumEmphasized,
    TextGeometryPartial? labelSmallEmphasized,
  }) =>
      displayLarge != null ||
          displayMedium != null ||
          displaySmall != null ||
          headlineLarge != null ||
          headlineMedium != null ||
          headlineSmall != null ||
          titleLarge != null ||
          titleMedium != null ||
          titleSmall != null ||
          bodyLarge != null ||
          bodyMedium != null ||
          bodySmall != null ||
          labelLarge != null ||
          labelMedium != null ||
          labelSmall != null ||
          displayLargeEmphasized != null ||
          displayMediumEmphasized != null ||
          displaySmallEmphasized != null ||
          headlineLargeEmphasized != null ||
          headlineMediumEmphasized != null ||
          headlineSmallEmphasized != null ||
          titleLargeEmphasized != null ||
          titleMediumEmphasized != null ||
          titleSmallEmphasized != null ||
          bodyLargeEmphasized != null ||
          bodyMediumEmphasized != null ||
          bodySmallEmphasized != null ||
          labelLargeEmphasized != null ||
          labelMediumEmphasized != null ||
          labelSmallEmphasized != null
      ? TypescaleThemeData.from(
          displayLarge: this.displayLarge.merge(displayLarge),
          displayMedium: this.displayMedium.merge(displayMedium),
          displaySmall: this.displaySmall.merge(displaySmall),
          headlineLarge: this.headlineLarge.merge(headlineLarge),
          headlineMedium: this.headlineMedium.merge(headlineMedium),
          headlineSmall: this.headlineSmall.merge(headlineSmall),
          titleLarge: this.titleLarge.merge(titleLarge),
          titleMedium: this.titleMedium.merge(titleMedium),
          titleSmall: this.titleSmall.merge(titleSmall),
          bodyLarge: this.bodyLarge.merge(bodyLarge),
          bodyMedium: this.bodyMedium.merge(bodyMedium),
          bodySmall: this.bodySmall.merge(bodySmall),
          labelLarge: this.labelLarge.merge(labelLarge),
          labelMedium: this.labelMedium.merge(labelMedium),
          labelSmall: this.labelSmall.merge(labelSmall),
          displayLargeEmphasized: this.displayLargeEmphasized.merge(
            displayLargeEmphasized,
          ),
          displayMediumEmphasized: this.displayMediumEmphasized.merge(
            displayMediumEmphasized,
          ),
          displaySmallEmphasized: this.displaySmallEmphasized.merge(
            displaySmallEmphasized,
          ),
          headlineLargeEmphasized: this.headlineLargeEmphasized.merge(
            headlineLargeEmphasized,
          ),
          headlineMediumEmphasized: this.headlineMediumEmphasized.merge(
            headlineMediumEmphasized,
          ),
          headlineSmallEmphasized: this.headlineSmallEmphasized.merge(
            headlineSmallEmphasized,
          ),
          titleLargeEmphasized: this.titleLargeEmphasized.merge(
            titleLargeEmphasized,
          ),
          titleMediumEmphasized: this.titleMediumEmphasized.merge(
            titleMediumEmphasized,
          ),
          titleSmallEmphasized: this.titleSmallEmphasized.merge(
            titleSmallEmphasized,
          ),
          bodyLargeEmphasized: this.bodyLargeEmphasized.merge(
            bodyLargeEmphasized,
          ),
          bodyMediumEmphasized: this.bodyMediumEmphasized.merge(
            bodyMediumEmphasized,
          ),
          bodySmallEmphasized: this.bodySmallEmphasized.merge(
            bodySmallEmphasized,
          ),
          labelLargeEmphasized: this.labelLargeEmphasized.merge(
            labelLargeEmphasized,
          ),
          labelMediumEmphasized: this.labelMediumEmphasized.merge(
            labelMediumEmphasized,
          ),
          labelSmallEmphasized: this.labelSmallEmphasized.merge(
            labelSmallEmphasized,
          ),
        )
      : this;

  @override
  TypescaleThemeData merge(TypescaleThemeDataPartial? other) => other != null
      ? mergeWith(
          displayLarge: other.displayLarge,
          displayMedium: other.displayMedium,
          displaySmall: other.displaySmall,
          headlineLarge: other.headlineLarge,
          headlineMedium: other.headlineMedium,
          headlineSmall: other.headlineSmall,
          titleLarge: other.titleLarge,
          titleMedium: other.titleMedium,
          titleSmall: other.titleSmall,
          bodyLarge: other.bodyLarge,
          bodyMedium: other.bodyMedium,
          bodySmall: other.bodySmall,
          labelLarge: other.labelLarge,
          labelMedium: other.labelMedium,
          labelSmall: other.labelSmall,
          displayLargeEmphasized: other.displayLargeEmphasized,
          displayMediumEmphasized: other.displayMediumEmphasized,
          displaySmallEmphasized: other.displaySmallEmphasized,
          headlineLargeEmphasized: other.headlineLargeEmphasized,
          headlineMediumEmphasized: other.headlineMediumEmphasized,
          headlineSmallEmphasized: other.headlineSmallEmphasized,
          titleLargeEmphasized: other.titleLargeEmphasized,
          titleMediumEmphasized: other.titleMediumEmphasized,
          titleSmallEmphasized: other.titleSmallEmphasized,
          bodyLargeEmphasized: other.bodyLargeEmphasized,
          bodyMediumEmphasized: other.bodyMediumEmphasized,
          bodySmallEmphasized: other.bodySmallEmphasized,
          labelLargeEmphasized: other.labelLargeEmphasized,
          labelMediumEmphasized: other.labelMediumEmphasized,
          labelSmallEmphasized: other.labelSmallEmphasized,
        )
      : this;

  @override
  // ignore: must_call_super
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty<TextGeometry>("displayLarge", displayLarge))
      ..add(DiagnosticsProperty<TextGeometry>("displayMedium", displayMedium))
      ..add(DiagnosticsProperty<TextGeometry>("displaySmall", displaySmall))
      ..add(DiagnosticsProperty<TextGeometry>("headlineLarge", headlineLarge))
      ..add(DiagnosticsProperty<TextGeometry>("headlineMedium", headlineMedium))
      ..add(DiagnosticsProperty<TextGeometry>("headlineSmall", headlineSmall))
      ..add(DiagnosticsProperty<TextGeometry>("titleLarge", titleLarge))
      ..add(DiagnosticsProperty<TextGeometry>("titleMedium", titleMedium))
      ..add(DiagnosticsProperty<TextGeometry>("titleSmall", titleSmall))
      ..add(DiagnosticsProperty<TextGeometry>("bodyLarge", bodyLarge))
      ..add(DiagnosticsProperty<TextGeometry>("bodyMedium", bodyMedium))
      ..add(DiagnosticsProperty<TextGeometry>("bodySmall", bodySmall))
      ..add(DiagnosticsProperty<TextGeometry>("labelLarge", labelLarge))
      ..add(DiagnosticsProperty<TextGeometry>("labelMedium", labelMedium))
      ..add(DiagnosticsProperty<TextGeometry>("labelSmall", labelSmall))
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "displayLargeEmphasized",
          displayLargeEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "displayMediumEmphasized",
          displayMediumEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "displaySmallEmphasized",
          displaySmallEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "headlineLargeEmphasized",
          headlineLargeEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "headlineMediumEmphasized",
          headlineMediumEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "headlineSmallEmphasized",
          headlineSmallEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "titleLargeEmphasized",
          titleLargeEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "titleMediumEmphasized",
          titleMediumEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "titleSmallEmphasized",
          titleSmallEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "bodyLargeEmphasized",
          bodyLargeEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "bodyMediumEmphasized",
          bodyMediumEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "bodySmallEmphasized",
          bodySmallEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "labelLargeEmphasized",
          labelLargeEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "labelMediumEmphasized",
          labelMediumEmphasized,
        ),
      )
      ..add(
        DiagnosticsProperty<TextGeometry>(
          "labelSmallEmphasized",
          labelSmallEmphasized,
        ),
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is TypescaleThemeData &&
          displayLarge == other.displayLarge &&
          displayMedium == other.displayMedium &&
          displaySmall == other.displaySmall &&
          headlineLarge == other.headlineLarge &&
          headlineMedium == other.headlineMedium &&
          headlineSmall == other.headlineSmall &&
          titleLarge == other.titleLarge &&
          titleMedium == other.titleMedium &&
          titleSmall == other.titleSmall &&
          bodyLarge == other.bodyLarge &&
          bodyMedium == other.bodyMedium &&
          bodySmall == other.bodySmall &&
          labelLarge == other.labelLarge &&
          labelMedium == other.labelMedium &&
          labelSmall == other.labelSmall &&
          displayLargeEmphasized == other.displayLargeEmphasized &&
          displayMediumEmphasized == other.displayMediumEmphasized &&
          displaySmallEmphasized == other.displaySmallEmphasized &&
          headlineLargeEmphasized == other.headlineLargeEmphasized &&
          headlineMediumEmphasized == other.headlineMediumEmphasized &&
          headlineSmallEmphasized == other.headlineSmallEmphasized &&
          titleLargeEmphasized == other.titleLargeEmphasized &&
          titleMediumEmphasized == other.titleMediumEmphasized &&
          titleSmallEmphasized == other.titleSmallEmphasized &&
          bodyLargeEmphasized == other.bodyLargeEmphasized &&
          bodyMediumEmphasized == other.bodyMediumEmphasized &&
          bodySmallEmphasized == other.bodySmallEmphasized &&
          labelLargeEmphasized == other.labelLargeEmphasized &&
          labelMediumEmphasized == other.labelMediumEmphasized &&
          labelSmallEmphasized == other.labelSmallEmphasized;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
    displayLargeEmphasized,
    displayMediumEmphasized,
    displaySmallEmphasized,
    Object.hash(
      headlineLargeEmphasized,
      headlineMediumEmphasized,
      headlineSmallEmphasized,
      titleLargeEmphasized,
      titleMediumEmphasized,
      titleSmallEmphasized,
      bodyLargeEmphasized,
      bodyMediumEmphasized,
      bodySmallEmphasized,
      labelLargeEmphasized,
      labelMediumEmphasized,
      labelSmallEmphasized,
    ),
  );
}

class _TypescaleThemeData extends TypescaleThemeData {
  const _TypescaleThemeData({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.displayLargeEmphasized,
    required this.displayMediumEmphasized,
    required this.displaySmallEmphasized,
    required this.headlineLargeEmphasized,
    required this.headlineMediumEmphasized,
    required this.headlineSmallEmphasized,
    required this.titleLargeEmphasized,
    required this.titleMediumEmphasized,
    required this.titleSmallEmphasized,
    required this.bodyLargeEmphasized,
    required this.bodyMediumEmphasized,
    required this.bodySmallEmphasized,
    required this.labelLargeEmphasized,
    required this.labelMediumEmphasized,
    required this.labelSmallEmphasized,
  });

  @override
  final TextGeometry displayLarge;

  @override
  final TextGeometry displayMedium;

  @override
  final TextGeometry displaySmall;

  @override
  final TextGeometry headlineLarge;

  @override
  final TextGeometry headlineMedium;

  @override
  final TextGeometry headlineSmall;

  @override
  final TextGeometry titleLarge;

  @override
  final TextGeometry titleMedium;

  @override
  final TextGeometry titleSmall;

  @override
  final TextGeometry bodyLarge;

  @override
  final TextGeometry bodyMedium;

  @override
  final TextGeometry bodySmall;

  @override
  final TextGeometry labelLarge;

  @override
  final TextGeometry labelMedium;

  @override
  final TextGeometry labelSmall;

  @override
  final TextGeometry displayLargeEmphasized;

  @override
  final TextGeometry displayMediumEmphasized;

  @override
  final TextGeometry displaySmallEmphasized;

  @override
  final TextGeometry headlineLargeEmphasized;

  @override
  final TextGeometry headlineMediumEmphasized;

  @override
  final TextGeometry headlineSmallEmphasized;

  @override
  final TextGeometry titleLargeEmphasized;

  @override
  final TextGeometry titleMediumEmphasized;

  @override
  final TextGeometry titleSmallEmphasized;

  @override
  final TextGeometry bodyLargeEmphasized;

  @override
  final TextGeometry bodyMediumEmphasized;

  @override
  final TextGeometry bodySmallEmphasized;

  @override
  final TextGeometry labelLargeEmphasized;

  @override
  final TextGeometry labelMediumEmphasized;

  @override
  final TextGeometry labelSmallEmphasized;
}

class _TypescaleThemeDataFallback extends TypescaleThemeData {
  const _TypescaleThemeDataFallback({required TypefaceThemeData typefaceTheme})
    : _typefaceTheme = typefaceTheme;

  final TypefaceThemeData _typefaceTheme;

  @override
  TextGeometry get displayLarge => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 57.0,
    tracking: -0.25,
    lineHeight: 64.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 57.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get displayMedium => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 45.0,
    tracking: 0.0,
    lineHeight: 52.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 45.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get displaySmall => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 36.0,
    tracking: 0.0,
    lineHeight: 44.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 36.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get headlineLarge => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 32.0,
    tracking: 0.0,
    lineHeight: 40.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 32.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get headlineMedium => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 28.0,
    tracking: 0.0,
    lineHeight: 36.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 28.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get headlineSmall => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 24.0,
    tracking: 0.0,
    lineHeight: 32.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 24.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get titleLarge => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 22.0,
    tracking: 0.0,
    lineHeight: 28.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 22.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get titleMedium => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 16.0,
    tracking: 0.15,
    lineHeight: 24.0,
    wght: _typefaceTheme.weightMedium,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 16.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get titleSmall => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 14.0,
    tracking: 0.1,
    lineHeight: 20.0,
    wght: _typefaceTheme.weightMedium,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 14.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get bodyLarge => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightRegular,
    size: 16.0,
    tracking: 0.5,
    lineHeight: 24.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 16.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get bodyMedium => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightRegular,
    size: 14.0,
    tracking: 0.25,
    lineHeight: 20.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 14.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get bodySmall => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightRegular,
    size: 12.0,
    tracking: 0.4,
    lineHeight: 16.0,
    wght: _typefaceTheme.weightRegular,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 12.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get labelLarge => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 14.0,
    tracking: 0.1,
    lineHeight: 20.0,
    wght: _typefaceTheme.weightMedium,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 14.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get labelMedium => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 12.0,
    tracking: 0.5,
    lineHeight: 16.0,
    wght: _typefaceTheme.weightMedium,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 12.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get labelSmall => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 11.0,
    tracking: 0.5,
    lineHeight: 16.0,
    wght: _typefaceTheme.weightMedium,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 11.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get displayLargeEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightMedium,
    size: 57.0,
    tracking: -0.25,
    lineHeight: 64.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 57.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get displayMediumEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightMedium,
    size: 45.0,
    tracking: 0.0,
    lineHeight: 52.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 45.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get displaySmallEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightMedium,
    size: 36.0,
    tracking: 0.0,
    lineHeight: 44.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 36.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get headlineLargeEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightMedium,
    size: 32.0,
    tracking: 0.0,
    lineHeight: 40.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 32.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get headlineMediumEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightRegular,
    size: 28.0,
    tracking: 0.0,
    lineHeight: 36.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 28.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get headlineSmallEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightMedium,
    size: 24.0,
    tracking: 0.0,
    lineHeight: 32.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 24.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get titleLargeEmphasized => .from(
    font: _typefaceTheme.brand,
    weight: _typefaceTheme.weightMedium,
    size: 22.0,
    tracking: 0.0,
    lineHeight: 28.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 22.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get titleMediumEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightBold,
    size: 16.0,
    tracking: 0.15,
    lineHeight: 24.0,
    wght: 600.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 16.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get titleSmallEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightBold,
    size: 14.0,
    tracking: 0.1,
    lineHeight: 20.0,
    wght: 600.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 14.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get bodyLargeEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 16.0,
    tracking: 0.5,
    lineHeight: 24.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 16.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get bodyMediumEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 14.0,
    tracking: 0.25,
    lineHeight: 20.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 14.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get bodySmallEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightMedium,
    size: 12.0,
    tracking: 0.4,
    lineHeight: 16.0,
    wght: 500.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 12.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get labelLargeEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightBold,
    size: 14.0,
    tracking: 0.1,
    lineHeight: 20.0,
    wght: 700.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 14.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get labelMediumEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightBold,
    size: 12.0,
    tracking: 0.5,
    lineHeight: 16.0,
    wght: 600.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 12.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );

  @override
  TextGeometry get labelSmallEmphasized => .from(
    font: _typefaceTheme.plain,
    weight: _typefaceTheme.weightBold,
    size: 11.0,
    tracking: 0.5,
    lineHeight: 16.0,
    wght: 600.0,
    grad: 0.0,
    wdth: 100.0,
    rond: 0.0,
    opsz: 11.0,
    crsv: 0.0,
    slnt: 0.0,
    fill: 0.0,
    hexp: 0.0,
  );
}

class TypescaleTheme extends InheritedTheme {
  const TypescaleTheme({super.key, required this.data, required super.child});

  final TypescaleThemeData data;

  @override
  bool updateShouldNotify(TypescaleTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) =>
      TypescaleTheme(data: data, child: child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TypescaleThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required TypescaleThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        TypescaleTheme(key: key, data: of(context).merge(data), child: child),
  );

  static TypescaleThemeData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TypescaleTheme>()?.data;

  static TypescaleThemeData of(BuildContext context) =>
      maybeOf(context) ??
      TypescaleThemeData.fallback(typefaceTheme: TypefaceTheme.of(context));
}
