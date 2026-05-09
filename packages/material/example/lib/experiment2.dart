import 'dart:math' as math;

import 'package:material_example/flutter.dart';

class Experiment2View extends StatefulWidget {
  const Experiment2View({super.key});

  @override
  State<Experiment2View> createState() => _Experiment2ViewState();
}

class _Experiment2ViewState extends State<Experiment2View> {
  var _width = 1.0;
  var _height = 1.0;

  var _fixedTopLeft = 0.0;
  var _fixedTopRight = 0.0;
  var _fixedBottomLeft = 0.0;
  var _fixedBottomRight = 0.0;

  var _fractionalTopLeft = 0.0;
  var _fractionalTopRight = 0.0;
  var _fractionalBottomLeft = 0.0;
  var _fractionalBottomRight = 0.0;

  String _formatPercentage(double value, bool fill) {
    final unpadded = "${(value * 100).round()}%";
    return fill ? unpadded.padLeft(4, " ") : unpadded;
  }

  String _formatValue(double value, bool fill, String suffix) {
    final unpadded = "${value.round()}$suffix";
    return fill ? unpadded.padLeft(4, " ") : unpadded;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    // Candidates: 128, 192, 256, 312, 360
    const maxWidth = 192.0;
    const maxHeight = 192.0;
    const maxArea = maxWidth * maxHeight;

    final innerCorner = shapeTheme.cornerExtraSmall;
    final outerCorner = shapeTheme.cornerLarge;

    final width = _width * maxWidth;
    final height = _height * maxHeight;

    final area = width * height;

    final progress = area / maxArea;

    // final aspectRatio = width == 0.0 && height == 0.0
    //     ? 0.0
    //     : math.min(width, height) / math.max(width, height);

    // final thickness = lerpDouble(
    //   1.0,
    //   lerpDouble(1.0, 3.0, math.min(_width, _height)),
    //   aspectRatio,
    // );

    final thickness = lerpDouble(1.0, 3.0, progress);

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: colorTheme.surfaceContainer,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "Shape",
                style: typescaleTheme.titleLargeEmphasized.toTextStyle(
                  color: colorTheme.onSurface,
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.0,
                thumbSize: .resolveWith(
                  (states) => states.contains(WidgetState.pressed)
                      ? const Size(2.0, 32.0)
                      : const Size(4.0, 32.0),
                ),
              ),
              child: SliverPadding(
                padding: .symmetric(horizontal: 8.0),
                sliver: SliverList.list(
                  children: [
                    Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: Align.center(
                        child: SizedBox(
                          width: maxWidth,
                          height: maxHeight,
                          child: Material(
                            borderOnForeground: false,
                            shape: CornersBorder.rounded(
                              corners: .all(shapeTheme.cornerLarge),
                            ),
                            color: colorTheme.surfaceContainerLowest,
                            child: Align.center(
                              child: SizedBox(
                                width: width,
                                height: height,
                                child: Material(
                                  clipBehavior: .antiAlias,
                                  borderOnForeground: true,
                                  shape: CornersBorder.rounded(
                                    corners: .only(
                                      topLeft:
                                          (shapeTheme.cornerExtraExtraLarge *
                                                  _fixedTopLeft)
                                              .add(
                                                .fractional(_fractionalTopLeft),
                                              ),
                                      topRight:
                                          (shapeTheme.cornerExtraExtraLarge *
                                                  _fixedTopRight)
                                              .add(
                                                .fractional(
                                                  _fractionalTopRight,
                                                ),
                                              ),
                                      bottomLeft:
                                          (shapeTheme.cornerExtraExtraLarge *
                                                  _fixedBottomLeft)
                                              .add(
                                                .fractional(
                                                  _fractionalBottomLeft,
                                                ),
                                              ),
                                      bottomRight:
                                          (shapeTheme.cornerExtraExtraLarge *
                                                  _fixedBottomRight)
                                              .add(
                                                .fractional(
                                                  _fractionalBottomRight,
                                                ),
                                              ),
                                    ),
                                    side: .new(
                                      width: thickness,
                                      color: colorTheme.onSecondaryContainer,
                                    ),
                                  ),
                                  color: colorTheme.secondaryContainer,
                                  child: InkWell(
                                    overlayColor: WidgetStateLayerColor(
                                      color: .all(
                                        colorTheme.onSecondaryContainer,
                                      ),
                                      opacity:
                                          stateTheme.asWidgetStateLayerOpacity,
                                    ),
                                    onTap: () {},
                                    child: Align.center(
                                      child: ConstrainedBox(
                                        constraints: .new(
                                          maxWidth: 64.0,
                                          maxHeight: 64.0,
                                        ),
                                        child: FittedBox(
                                          fit: .contain,
                                          child: DeterminateLoadingIndicator(
                                            contained: false,
                                            indicatorColor:
                                                colorTheme.onSecondaryContainer,
                                            progress: progress,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    IntrinsicHeight(
                      child: Flex.horizontal(
                        children: [
                          Flexible.tight(
                            child: ListItemContainer(
                              containerShape: .all(
                                CornersBorder.rounded(
                                  corners: .directional(
                                    topStart: outerCorner,
                                    topEnd: innerCorner,
                                    bottomStart: innerCorner,
                                    bottomEnd: innerCorner,
                                  ),
                                ),
                              ),
                              child: Flex.vertical(
                                children: [
                                  ListItemLayout(
                                    leading: const Icon(Symbols.width_rounded),
                                    headline: Text("Width"),
                                    trailing: Text(
                                      _formatPercentage(_width, false),
                                    ),
                                  ),
                                  Slider(
                                    padding: .fromLTRB(16.0, 0.0, 16.0, 10.0),
                                    value: _width,
                                    onChanged: (value) =>
                                        setState(() => _width = value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          Flexible.tight(
                            child: ListItemContainer(
                              containerShape: .all(
                                CornersBorder.rounded(
                                  corners: .directional(
                                    topStart: innerCorner,
                                    topEnd: outerCorner,
                                    bottomStart: innerCorner,
                                    bottomEnd: innerCorner,
                                  ),
                                ),
                              ),
                              child: Flex.vertical(
                                children: [
                                  ListItemLayout(
                                    leading: const Icon(Symbols.width_rounded),
                                    headline: Text("Height"),
                                    trailing: Text(
                                      _formatPercentage(_height, false),
                                    ),
                                  ),
                                  Slider(
                                    padding: .fromLTRB(16.0, 0.0, 16.0, 10.0),
                                    value: _height,
                                    onChanged: (value) =>
                                        setState(() => _height = value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    ListItemContainer(
                      containerShape: .all(
                        CornersBorder.rounded(corners: .all(innerCorner)),
                      ),
                      child: Flex.vertical(
                        children: [
                          ListItemLayout(
                            leading: const Icon(Symbols.width_rounded),
                            headline: Text("Fixed"),
                            trailing: Text(
                              "${_formatValue(shapeTheme.cornerValueExtraExtraLarge * _fixedTopLeft, true, "dp")} "
                              "${_formatValue(shapeTheme.cornerValueExtraExtraLarge * _fixedTopRight, true, "dp")}\n"
                              "${_formatValue(shapeTheme.cornerValueExtraExtraLarge * _fixedBottomLeft, true, "dp")} "
                              "${_formatValue(shapeTheme.cornerValueExtraExtraLarge * _fixedBottomRight, true, "dp")}",
                              textAlign: .end,
                              style: const TextStyle(
                                fontFamily: "Monaspace Argon",
                              ),
                            ),
                          ),
                          Padding(
                            padding: .fromLTRB(16.0, 6.0, 16.0, 16.0),
                            child: Flex.vertical(
                              children: [
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedTopLeft,
                                        onChanged: (value) => setState(
                                          () => _fixedTopLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedTopRight,
                                        onChanged: (value) => setState(
                                          () => _fixedTopRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedBottomLeft,
                                        onChanged: (value) => setState(
                                          () => _fixedBottomLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fixedBottomRight,
                                        onChanged: (value) => setState(
                                          () => _fixedBottomRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    ListItemContainer(
                      containerShape: .all(
                        CornersBorder.rounded(
                          corners: .vertical(
                            top: innerCorner,
                            bottom: outerCorner,
                          ),
                        ),
                      ),
                      child: Flex.vertical(
                        children: [
                          ListItemLayout(
                            leading: const Icon(Symbols.width_rounded),
                            headline: Text("Fractional"),
                            trailing: Text(
                              "${_formatPercentage(_fractionalTopLeft, true)} "
                              "${_formatPercentage(_fractionalTopRight, true)}\n"
                              "${_formatPercentage(_fractionalBottomLeft, true)} "
                              "${_formatPercentage(_fractionalBottomRight, true)}",
                              textAlign: .end,
                              style: const TextStyle(
                                fontFamily: "Monaspace Argon",
                              ),
                            ),
                          ),
                          Padding(
                            padding: .fromLTRB(16.0, 6.0, 16.0, 16.0),
                            child: Flex.vertical(
                              children: [
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalTopLeft,
                                        onChanged: (value) => setState(
                                          () => _fractionalTopLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalTopRight,
                                        onChanged: (value) => setState(
                                          () => _fractionalTopRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flex.horizontal(
                                  spacing: 12.0,
                                  children: [
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalBottomLeft,
                                        onChanged: (value) => setState(
                                          () => _fractionalBottomLeft = value,
                                        ),
                                      ),
                                    ),
                                    Flexible.tight(
                                      child: Slider(
                                        value: _fractionalBottomRight,
                                        onChanged: (value) => setState(
                                          () => _fractionalBottomRight = value,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
