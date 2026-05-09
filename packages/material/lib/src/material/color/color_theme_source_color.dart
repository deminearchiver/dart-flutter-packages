part of 'color_theme.dart';

// TODO: keep in sync with libmonet
extension type const _SingletonList<E extends Object?>._(List<E> _)
    implements List<E> {
  _SingletonList(E element)
    : this._(UnmodifiableListView(List.filled(1, element, growable: false)));
}

abstract class ColorThemeSourceColor extends TonalPaletteSourceColor {
  const ColorThemeSourceColor();

  factory ColorThemeSourceColor.fromColor(Color color) = _ColorThemeColorSource;

  factory ColorThemeSourceColor.fromColorList(List<Color> colorList) =
      _ColorThemeColorListSource;

  Color get asColor;

  List<Color> get asColorList;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is ColorThemeSourceColor &&
          asArgb == other.asArgb &&
          asHct == other.asHct &&
          asColor == other.asColor &&
          TonalPaletteSourceColor.argbListEquality.equals(
            asArgbList,
            other.asArgbList,
          ) &&
          TonalPaletteSourceColor.hctListEquality.equals(
            asHctList,
            other.asHctList,
          ) &&
          ColorThemeSourceColor.colorListEquality.equals(
            asColorList,
            other.asColorList,
          );

  @override
  int get hashCode => Object.hash(
    runtimeType,
    asArgb,
    asHct,
    TonalPaletteSourceColor.argbListEquality.hash(asArgbList),
    TonalPaletteSourceColor.hctListEquality.hash(asHctList),
    ColorThemeSourceColor.colorListEquality.hash(asColorList),
  );

  static const colorListEquality = ListEquality<Color>();
}

class _ColorThemeColorSource extends ColorThemeSourceColor {
  _ColorThemeColorSource(this._color);

  final Color _color;

  @override
  Color get asColor => _color;

  @override
  late final int asArgb = _color.toARGB32();

  @override
  late final Hct asHct = .fromInt(asArgb);

  @override
  late final List<int> asArgbList = _SingletonList(asArgb);

  @override
  late final List<Hct> asHctList = _SingletonList(asHct);

  @override
  List<Color> get asColorList => _SingletonList(asColor);

  @override
  String toString() => "ColorThemeSourceColor.fromColor($asColor)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorThemeColorSource &&
          _color == other._color;

  @override
  int get hashCode => Object.hash(runtimeType, _color);
}

class _ColorThemeColorListSource extends ColorThemeSourceColor {
  _ColorThemeColorListSource(List<Color> colorList) {
    if (colorList.isEmpty) {
      throw ArgumentError("Must have at least one source color.");
    }
    _colorList = .unmodifiable(_colorList);
  }

  late final List<Color> _colorList;

  @override
  List<Color> get asColorList => _colorList;

  @override
  late final int asArgb = asColor.toARGB32();

  @override
  late final Hct asHct = Hct.fromInt(asArgb);

  @override
  late final Color asColor = asColorList.first;

  @override
  late final List<int> asArgbList = .unmodifiable([
    for (final color in asColorList) color.toARGB32(),
  ]);

  @override
  late final List<Hct> asHctList = .unmodifiable([
    for (final argb in asArgbList) Hct.fromInt(argb),
  ]);

  @override
  String toString() {
    final value = asColorList.length > 1
        ? "[${asColorList.join(", ")}]"
        : "$asColor";
    return "ColorThemeSourceColor.fromColorList($value)";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      runtimeType == other.runtimeType &&
          other is _ColorThemeColorListSource &&
          ColorThemeSourceColor.colorListEquality.equals(
            _colorList,
            other._colorList,
          );

  @override
  int get hashCode => Object.hash(
    runtimeType,
    ColorThemeSourceColor.colorListEquality.hash(_colorList),
  );
}
