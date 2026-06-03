import 'dart:ui' as ui;

import 'package:material_example/flutter.dart';

class Experiment8View extends StatefulWidget {
  const Experiment8View({super.key});

  @override
  State<Experiment8View> createState() => _Experiment8ViewState();
}

class _Experiment8ViewState extends State<Experiment8View> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final measurementTheme = MeasurementTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final springTheme = SpringTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: Align.center(
        child: _GeminiIcon(
          child: Icon(Symbols.search_rounded, fill: 1.0, size: 512.0),
        ),
      ),
    );
  }
}

class _GeminiIcon extends StatefulWidget {
  const _GeminiIcon({super.key, required this.child});

  final Widget child;

  @override
  State<_GeminiIcon> createState() => _GeminiIconState();
}

class _GeminiIconState extends State<_GeminiIcon> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.maybeDevicePixelRatioOf(context) ?? 1.0;
    return Stack(
      fit: .passthrough,
      children: [
        RepaintBoundary(key: _key, child: widget.child),
        Positioned.fill(
          child: CustomPaint(
            painter: _GeminiFillPainter(
              key: _key,
              devicePixelRatio: devicePixelRatio,
            ),
          ),
        ),
      ],
    );
  }
}

class _GeminiFillPainter extends CustomPainter {
  const _GeminiFillPainter({required this._key, this.devicePixelRatio = 1.0});

  final GlobalKey _key;
  final double devicePixelRatio;

  void _paint(Canvas canvas) {
    final paint0 = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(6.82, 16.06),
        const Offset(19.29, 5.55),
        [
          const Color(0xFF4893FC),
          const Color(0xFF4893FC),
          const Color(0xFF969DFF),
          const Color(0xFFBD99FE),
        ],
        [0.0, .27, .78, 1.0],
      );
    canvas.drawRect(const Rect.fromLTRB(0.0, 0.0, 24.0, 24.0), paint0);
    final path1 = Path()
      ..moveTo(0.2, 17.64)
      ..relativeCubicTo(2.3, 0.82, 4.96, -0.72, 5.93, -3.44)
      ..cubicTo(7.1, 11.48, 6, 8.6, 3.69, 7.79)
      ..relativeCubicTo(-2.31, -0.8099999999999996, -4.97, 0.72, -5.93, 3.44)
      ..relativeCubicTo(-0.97, 2.72, 0.12, 5.59, 2.43, 6.4);
    final paint1 = Paint()
      ..color = const Color(0xFFFFE432)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, .76);
    canvas.drawPath(path1, paint1);
    final path2 = Path()
      ..moveTo(10.45, 8.67)
      ..arcToPoint(
        const Offset(16.2, 2.8),
        radius: const Radius.elliptical(5.8, 5.8),
        largeArc: false,
        clockwise: false,
      )
      ..relativeArcToPoint(
        const Offset(-5.75, -5.88),
        radius: const Radius.elliptical(5.8, 5.8),
        largeArc: false,
        clockwise: false,
      )
      ..arcToPoint(
        const Offset(4.71, 2.8),
        radius: const Radius.elliptical(5.8, 5.8),
        largeArc: false,
        clockwise: false,
      )
      ..relativeArcToPoint(
        const Offset(5.74, 5.87),
        radius: const Radius.elliptical(5.8, 5.8),
        largeArc: false,
        clockwise: false,
      );
    final paint2 = Paint()
      ..color = const Color(0xFFFC413D)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 3.66);
    canvas.drawPath(path2, paint2);
    final path3 = Path()
      ..moveTo(8.22, 27.46)
      ..relativeCubicTo(3.31, -0.16, 5.83, -3.77, 5.62, -8.07)
      ..relativeCubicTo(-0.2, -4.29, -3.07, -7.64, -6.38, -7.48)
      ..relativeCubicTo(
        -3.3099999999999996,
        0.16000000000000014,
        -5.83,
        3.78,
        -5.62,
        8.07,
      )
      ..relativeCubicTo(
        0.20999999999999996,
        4.290000000000001,
        3.07,
        7.64,
        6.38,
        7.48,
      );
    final paint3 = Paint()
      ..color = const Color(0xFF00B95C)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 3.12);
    canvas.drawPath(path3, paint3);
    final path4 = Path()
      ..moveTo(8.22, 27.46)
      ..relativeCubicTo(3.31, -0.16, 5.83, -3.77, 5.62, -8.07)
      ..relativeCubicTo(-0.2, -4.29, -3.07, -7.64, -6.38, -7.48)
      ..relativeCubicTo(
        -3.3099999999999996,
        0.16000000000000014,
        -5.83,
        3.78,
        -5.62,
        8.07,
      )
      ..relativeCubicTo(
        0.20999999999999996,
        4.290000000000001,
        3.07,
        7.64,
        6.38,
        7.48,
      );
    final paint4 = Paint()
      ..color = const Color(0xFF00B95C)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 3.12);
    canvas.drawPath(path4, paint4);
    final path5 = Path()
      ..moveTo(11.54, 24.86)
      ..relativeCubicTo(2.78, -1.69, 3.52, -5.54, 1.66, -8.6)
      ..cubicTo(11.34, 13.199999999999996, 7.58, 12.1, 4.8, 13.8)
      ..relativeCubicTo(
        -2.7800000000000002,
        1.700000000000001,
        -3.52,
        5.54,
        -1.66,
        8.6,
      )
      ..relativeCubicTo(
        1.8599999999999999,
        3.0599999999999987,
        5.62,
        4.16,
        8.4,
        2.47,
      );
    final paint5 = Paint()
      ..color = const Color(0xFF00B95C)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 3.12);
    canvas.drawPath(path5, paint5);
    final path6 = Path()
      ..moveTo(22.77, 15.25)
      ..relativeArcToPoint(
        const Offset(5.65, -5.44),
        radius: const Radius.elliptical(5.55, 5.55),
        largeArc: false,
        clockwise: false,
      )
      ..relativeCubicTo(0, -3.01, -2.53, -5.45, -5.65, -5.45)
      ..relativeArcToPoint(
        const Offset(-5.65, 5.45),
        radius: const Radius.elliptical(5.55, 5.55),
        largeArc: false,
        clockwise: false,
      )
      ..relativeCubicTo(0, 3, 2.53, 5.44, 5.65, 5.44);
    final paint6 = Paint()
      ..color = const Color(0xFF3186FF)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 2.96);
    canvas.drawPath(path6, paint6);
    final path7 = Path()
      ..moveTo(-2.03, 14.62)
      ..relativeCubicTo(2.88, 2.19, 7.08, 1.5, 9.39, -1.53)
      ..relativeCubicTo(2.3, -3.04, 1.84, -7.27, -1.03, -9.45)
      ..relativeCubicTo(-2.88, -2.19, -7.08, -1.5, -9.39, 1.53)
      ..relativeCubicTo(-2.3, 3.03, -1.84, 7.26, 1.03, 9.45);
    final paint7 = Paint()
      ..color = const Color(0xFFFBBC04)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 2.68);
    canvas.drawPath(path7, paint7);
    final path8 = Path()
      ..moveTo(12.7, 17.85)
      ..relativeCubicTo(3.44, 2.36, 7.99, 1.7, 10.17, -1.47)
      ..relativeCubicTo(
        2.1799999999999997,
        -3.169999999999998,
        1.16,
        -7.65,
        -2.27,
        -10.01,
      )
      ..relativeCubicTo(
        -3.4299999999999997,
        -2.3599999999999994,
        -7.98,
        -1.7,
        -10.16,
        1.47,
      )
      ..relativeCubicTo(-2.1799999999999997, 3.17, -1.17, 7.65, 2.27, 10.01);
    final paint8 = Paint()
      ..color = const Color(0xFF3186FF)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 2.4);
    canvas.drawPath(path8, paint8);
    final path9 = Path()
      ..moveTo(18.95, 1.28)
      ..relativeCubicTo(0.87, 1.19, -0.25, 3.5, -2.51, 5.16)
      ..relativeCubicTo(
        -2.2600000000000016,
        1.6600000000000001,
        -4.8,
        2.04,
        -5.67,
        0.85,
      )
      ..relativeCubicTo(
        -0.8699999999999992,
        -1.1900000000000004,
        0.25,
        -3.5,
        2.5,
        -5.15,
      )
      ..relativeCubicTo(2.25, -1.6500000000000004, 4.8, -2.05, 5.68, -0.86);
    final paint9 = Paint()
      ..color = const Color(0xFF749BFF)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 2.14);
    canvas.drawPath(path9, paint9);
    final path10 = Path()
      ..moveTo(11.78, 6.96)
      ..relativeCubicTo(3.49, -3.23, 4.69, -7.62, 2.67, -9.79)
      ..relativeCubicTo(-2, -2.17, -6.47, -1.3, -9.96, 1.94)
      ..cubicTo(0.99, 2.34, -0.2, 6.73, 1.81, 8.9)
      ..relativeCubicTo(2.0100000000000002, 2.17, 6.48, 1.3, 9.97, -1.94);
    final paint10 = Paint()
      ..color = const Color(0xFFFC413D)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 1.81);
    canvas.drawPath(path10, paint10);
    final path11 = Path()
      ..moveTo(4.62, 18.6)
      ..relativeCubicTo(2.08, 1.48, 4.46, 1.7, 5.32, 0.5)
      ..relativeCubicTo(0.87, -1.21, -0.12, -3.4, -2.2, -4.88)
      ..relativeCubicTo(-2.06, -1.48, -4.45, -1.7, -5.31, -0.5)
      ..relativeCubicTo(
        -0.8599999999999994,
        1.1999999999999993,
        0.12,
        3.39,
        2.2,
        4.87,
      );
    final paint11 = Paint()
      ..color = const Color(0xFFFFEE48)
      ..style = .fill
      ..maskFilter = const MaskFilter.blur(.normal, 2.24);
    canvas.drawPath(path11, paint11);
  }

  @override
  void paint(Canvas canvas, Size size) {
    const referenceSize = Size.square(24.0);

    canvas
      ..saveLayer(Offset.zero & size, Paint())
      ..scale(
        size.width / referenceSize.width,
        size.height / referenceSize.height,
      );

    _paint(canvas);

    final repaintBoundary =
        _key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = repaintBoundary.toImageSync(pixelRatio: devicePixelRatio);

    paintImage(
      canvas: canvas,
      rect: Offset.zero & referenceSize,
      image: image,
      fit: .fill,
      blendMode: .dstIn,
      alignment: .center,
      filterQuality: .none,
      isAntiAlias: false,
    );

    canvas.drawImageRect(
      image,
      .fromLTWH(0.0, 0.0, image.width.toDouble(), image.height.toDouble()),
      Offset.zero & referenceSize,
      Paint()
        ..blendMode = .dstIn
        ..filterQuality = .none,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(_GeminiFillPainter oldDelegate) =>
      _key != oldDelegate._key ||
      devicePixelRatio != oldDelegate.devicePixelRatio;
}
