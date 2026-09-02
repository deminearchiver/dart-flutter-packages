import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:cue/cue.dart';
import 'package:material_example/flutter.dart' hide Spring;

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

  var _delegate = CornersBorderDelegate.rounded;

  String _formatPercentage(double value, bool fill) {
    final unpadded = "${(value * 100).round()}%";
    return fill ? unpadded.padLeft(4, " ") : unpadded;
  }

  String _formatValue(double value, bool fill, String suffix) {
    final unpadded = "${value.round()}$suffix";
    return fill ? unpadded.padLeft(4, " ") : unpadded;
  }

  static const _delegateToName = <CornersBorderDelegate, String>{
    .rounded: "Rounded",
    .smooth: "Smooth",
    .cut: "Cut",
  };

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);

    // Candidates: 128, 192, 256, 312, 360

    const scrollFieldHeight = 200.0; // md.sys.comp.scroll-field.height
    const maxWidth = 200.0;
    const maxHeight = scrollFieldHeight;
    const maxArea = maxWidth * maxHeight;

    final innerCorner = shapeTheme.cornerExtraSmall;
    final outerCorner = shapeTheme.cornerLarge;

    final width = _width * maxWidth;
    final height = _height * maxHeight;

    final area = width * height;

    final progress = area / maxArea;

    final thickness = lerpDouble(0.0, 8.0, progress);

    final corners = Corners.only(
      topLeft: (shapeTheme.cornerExtraExtraLarge * _fixedTopLeft).add(
        .fractional(_fractionalTopLeft),
      ),
      topRight: (shapeTheme.cornerExtraExtraLarge * _fixedTopRight).add(
        .fractional(_fractionalTopRight),
      ),
      bottomLeft: (shapeTheme.cornerExtraExtraLarge * _fixedBottomLeft).add(
        .fractional(_fractionalBottomLeft),
      ),
      bottomRight: (shapeTheme.cornerExtraExtraLarge * _fixedBottomRight).add(
        .fractional(_fractionalBottomRight),
      ),
    );

    final deflatedCorners = _delegate.deflateCorners(corners, thickness);

    final containerCorners = Corners.all(shapeTheme.cornerLarge);

    final emptyProgress = 1.0 - clampDouble(progress / 0.25, 0.0, 1.0);
    final smallProgress = clampDouble(progress / 0.5, 0.0, 1.0);

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
                padding: .zero,
                trackHeight: 8.0,
                trackGap: 6.0,
                thumbSize: .resolveWith(
                  (states) => states.contains(WidgetState.pressed)
                      ? const Size(2.0, 32.0)
                      : const Size(4.0, 32.0),
                ),
              ),
              child: SliverPadding(
                padding: .symmetric(horizontal: measurementTheme.space100),
                sliver: SliverList.list(
                  children: [
                    Padding(
                      padding: .symmetric(
                        horizontal: measurementTheme.space200,
                      ),
                      child: Align.center(
                        child: SizedBox(
                          width: maxWidth,
                          height: maxHeight,
                          child: Surface(
                            shape: shapeTheme.applyCorners(
                              corners: containerCorners,
                            ),
                            color: colorTheme.surfaceContainerLowest,
                            child: Stack(
                              fit: .expand,
                              children: [
                                // md.comp.scroll-field
                                Visibility(
                                  visible: emptyProgress > 0.0,
                                  child: ClipPath(
                                    clipBehavior: .antiAlias,
                                    clipper: ShapeBorderClipper(
                                      shape: shapeTheme.applyCorners(
                                        corners: containerCorners,
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: emptyProgress,
                                      child: ImageFiltered(
                                        imageFilter: .blur(
                                          sigmaX: lerpDouble(
                                            8.0,
                                            0.0,
                                            emptyProgress,
                                          ),
                                          sigmaY: lerpDouble(
                                            8.0,
                                            0.0,
                                            emptyProgress,
                                          ),
                                        ),
                                        child: OverflowBox(
                                          alignment: .center,
                                          maxHeight: .infinity,
                                          child: Flex.vertical(
                                            mainAxisSize: .min,
                                            mainAxisAlignment: .center,
                                            crossAxisAlignment: .stretch,
                                            children: [
                                              SizedBox(
                                                height: scrollFieldHeight / 3.0,
                                                child: Align.center(
                                                  widthFactor: 1.0,
                                                  child: Text(
                                                    "Base",
                                                    textAlign: .center,
                                                    style: typescaleTheme
                                                        .displayMedium
                                                        .toTextStyle(
                                                          color: colorTheme
                                                              .outline,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: scrollFieldHeight / 3.0,
                                                child: Align.center(
                                                  widthFactor: 1.0,
                                                  child: Text(
                                                    "Expr",
                                                    textAlign: .center,
                                                    style:
                                                        TextGeometry.lerp(
                                                          typescaleTheme
                                                              .displayMedium,
                                                          typescaleTheme
                                                              .displayLargeEmphasized,
                                                          emptyProgress,
                                                        ).toTextStyle(
                                                          color: Color.lerp(
                                                            colorTheme.outline,
                                                            colorTheme
                                                                .onSurface,
                                                            emptyProgress,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: scrollFieldHeight / 3.0,
                                                child: Align.center(
                                                  widthFactor: 1.0,
                                                  child: Text(
                                                    "Neur",
                                                    textAlign: .center,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    overflow: .ellipsis,
                                                    style: typescaleTheme
                                                        .displayMedium
                                                        .toTextStyle(
                                                          color: colorTheme
                                                              .outline,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Custom
                                Align.center(
                                  child: SizedBox(
                                    width: width,
                                    height: height,
                                    child: Surface(
                                      clipBehavior: .antiAlias,
                                      shape: CornersBorder(
                                        delegate: _delegate,
                                        corners: corners,
                                        side: BorderSide(
                                          width: thickness,
                                          color: colorTheme.primary,
                                        ),
                                      ),
                                      color: colorTheme.surfaceContainerHighest,
                                      child: InkWell(
                                        overlayColor: WidgetStateLayerColor(
                                          color: .all(colorTheme.primary),
                                          opacity: stateTheme
                                              .asWidgetStateLayerOpacity,
                                        ),
                                        onTap: () {},
                                        child: CenterOptically(
                                          corners: deflatedCorners,
                                          maxOffsets: .infinity,
                                          child: Align.center(
                                            child: OverflowBox(
                                              minWidth: 48.0,
                                              maxWidth: 48.0,
                                              minHeight: 48.0,
                                              maxHeight: 48.0,
                                              child: Opacity(
                                                opacity: smallProgress,
                                                child: ImageFiltered(
                                                  imageFilter: .blur(
                                                    sigmaX:
                                                        (1.0 - smallProgress) *
                                                        8.0,
                                                    sigmaY:
                                                        (1.0 - smallProgress) *
                                                        8.0,
                                                  ),
                                                  child: Transform.scale(
                                                    scale: smallProgress,
                                                    child:
                                                        DeterminateLoadingIndicator(
                                                          contained: false,
                                                          activeIndicatorColor:
                                                              .all(
                                                                colorTheme
                                                                    .primary,
                                                              ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: measurementTheme.space200 - 4.0),
                    Padding(
                      padding: .fromLTRB(
                        measurementTheme.space200,
                        0.0,
                        measurementTheme.space200,
                        0.0,
                      ),
                      child: Flex.horizontal(
                        spacing: measurementTheme.space25,
                        children: _delegateToName.entries
                            .mapIndexed<Widget>((index, entry) {
                              final MapEntry(key: value, value: label) = entry;
                              final isFirst = index == 0;
                              final isLast =
                                  index == _delegateToName.length - 1;
                              final innerCorner = shapeTheme.cornerSmall;
                              final outerCorner = shapeTheme.cornerFull;
                              final isSelected = _delegate == value;
                              final unselectedCorners =
                                  CornersDirectional.horizontal(
                                    start: isFirst ? outerCorner : innerCorner,
                                    end: isLast ? outerCorner : innerCorner,
                                  );
                              final selectedCorners = Corners.all(outerCorner);
                              return KeyedSubtree(
                                key: ValueKey(index),
                                child: Flexible.tight(
                                  child: Cue.onToggle(
                                    toggled: isSelected,
                                    child: TweenActor<double>(
                                      motion: Spring.custom(
                                        desc:
                                            const SpringThemeData.defaultsExpressive()
                                                .fastSpatial
                                                .toSpringDescription(),
                                        snapToEnd: true,
                                      ),
                                      from: 0.0,
                                      to: 1.0,
                                      builder: (context, animation) =>
                                          AnimatedBuilder(
                                            animation: animation,
                                            builder: (context, _) {
                                              final corners =
                                                  CornersGeometry.lerp(
                                                    unselectedCorners,
                                                    selectedCorners,
                                                    animation.value,
                                                  )!.clamp(maximum: .circle);

                                              if (index == 0) {
                                                // print(animation.value);
                                                // print(corners);
                                              }
                                              return FilledButton(
                                                style:
                                                    LegacyThemeFactory.createButtonStyle(
                                                      colorTheme: colorTheme,
                                                      elevationTheme:
                                                          elevationTheme,
                                                      shapeTheme: shapeTheme,
                                                      stateTheme: stateTheme,
                                                      typescaleTheme:
                                                          typescaleTheme,
                                                      size: .small,
                                                      color: .tonal,
                                                      isSelected: isSelected,
                                                    ).copyWith(
                                                      shape: .all(
                                                        shapeTheme.applyCorners(
                                                          corners: corners,
                                                        ),
                                                      ),
                                                    ),
                                                onPressed: () => setState(
                                                  () => _delegate = value,
                                                ),
                                                child: CenterOptically(
                                                  corners: corners,
                                                  maxOffsets: .infinity,
                                                  child: Align.center(
                                                    widthFactor: 1.0,
                                                    heightFactor: 1.0,
                                                    child: Text(
                                                      label,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      overflow: .ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            })
                            .toList(growable: false),
                      ),
                    ),
                    SizedBox(height: measurementTheme.space200 - 4.0),
                    IntrinsicHeight(
                      child: Flex.horizontal(
                        children: [
                          Flexible.tight(
                            child: ListItemContainer(
                              containerShape: .all(
                                shapeTheme.applyCorners(
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
                                    leading: const Icon(
                                      MaterialSymbols.width_rounded,
                                    ),
                                    headline: Text("Width"),
                                    trailing: Text(
                                      "${_formatValue(width, true, "dp")} ",
                                    ),
                                  ),
                                  Slider(
                                    padding: .fromLTRB(
                                      measurementTheme.space200,
                                      0.0,
                                      measurementTheme.space200,
                                      measurementTheme.space125,
                                    ),
                                    value: _width,
                                    onChanged: (value) =>
                                        setState(() => _width = value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: measurementTheme.space25),
                          Flexible.tight(
                            child: ListItemContainer(
                              containerShape: .all(
                                shapeTheme.applyCorners(
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
                                    leading: const Icon(
                                      MaterialSymbols.height_rounded,
                                    ),
                                    headline: Text("Height"),
                                    trailing: Text(
                                      "${_formatValue(height, true, "dp")} ",
                                    ),
                                  ),
                                  Slider(
                                    padding: .fromLTRB(
                                      measurementTheme.space200,
                                      0.0,
                                      measurementTheme.space200,
                                      measurementTheme.space125,
                                    ),
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
                    SizedBox(height: measurementTheme.space25),
                    ListItemContainer(
                      containerShape: .all(
                        shapeTheme.applyCorner(corner: innerCorner),
                      ),
                      child: Flex.vertical(
                        children: [
                          ListItemLayout(
                            leading: const Icon(
                              MaterialSymbols.rounded_corner_rounded,
                            ),
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
                            padding: .fromLTRB(
                              measurementTheme.space200,
                              measurementTheme.space75,
                              measurementTheme.space200,
                              measurementTheme.space200,
                            ),
                            child: Flex.vertical(
                              children: [
                                Flex.horizontal(
                                  spacing: measurementTheme.space150,
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
                                  spacing: measurementTheme.space150,
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
                    SizedBox(height: measurementTheme.space25),
                    ListItemContainer(
                      containerShape: .all(
                        shapeTheme.applyCorners(
                          corners: .vertical(
                            top: innerCorner,
                            bottom: outerCorner,
                          ),
                        ),
                      ),
                      child: Flex.vertical(
                        children: [
                          ListItemLayout(
                            leading: const Icon(
                              MaterialSymbols.percent_rounded,
                            ),
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
                            padding: .fromLTRB(
                              measurementTheme.space200,
                              measurementTheme.space75,
                              measurementTheme.space200,
                              measurementTheme.space200,
                            ),
                            child: Flex.vertical(
                              children: [
                                Flex.horizontal(
                                  spacing: measurementTheme.space150,
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
                                  spacing: measurementTheme.space150,
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
