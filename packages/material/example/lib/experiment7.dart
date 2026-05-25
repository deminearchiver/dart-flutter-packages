import 'package:flutter/material.dart';

class Experiment7View extends StatefulWidget {
  const Experiment7View({super.key});

  @override
  State<Experiment7View> createState() => _Experiment7ViewState();
}

class _Experiment7ViewState extends State<Experiment7View> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _GeminiFillPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final aPath = Path()
      ..moveTo(18.62, 30.94)
      ..relativeCubicTo(7.314, 0, 13.243, -4.778, 13.243, -10.672)
      ..relativeCubicTo(0, -5.893, -5.93, -10.67, -13.243, -10.67)
      ..cubicTo(11.306999999999995, 9.598, 5.376, 14.374, 5.376, 20.267)
      ..relativeCubicTo(0, 5.894, 5.93, 10.672, 13.244, 10.672);
    final bPath = Path()
      ..moveTo(9.87, 24.698)
      ..relativeCubicTo(2.556, 0, 4.628, -2.178, 4.628, -4.866)
      ..relativeCubicTo(0, -2.687999999999999, -2.072, -4.866, -4.628, -4.866)
      ..relativeCubicTo(-2.555999999999999, 0, -4.629, 2.179, -4.629, 4.866)
      ..relativeCubicTo(0, 2.688, 2.073, 4.866, 4.629, 4.866);
    final cPath = Path()
      ..moveTo(8.924, 25.1)
      ..relativeCubicTo(2.556, 0, 4.628, -2.178, 4.628, -4.865)
      ..relativeCubicTo(0, -2.687000000000001, -2.072, -4.866, -4.628, -4.866)
      ..relativeCubicTo(-2.556000000000001, 0, -4.629, 2.179, -4.629, 4.866)
      ..cubicTo(4.295, 22.922, 6.368, 25.1, 8.924, 25.1);
    final dPath = Path()
      ..moveTo(20.714, 10.973)
      ..relativeCubicTo(-1.486, 4.832, -8.682, 8.311, -11.588, 8.356)
      ..relativeLineTo(8.21, -13.49)
      ..close();
    final ePath = Path()
      ..moveTo(20.478, 9.43)
      ..relativeCubicTo(-1.487, 4.832, -8.683, 8.31, -11.588, 8.355)
      ..relativeLineTo(8.21, -13.49)
      ..close();
    final fPath = Path()
      ..moveTo(20.883, 31.779)
      ..relativeCubicTo(-1.486, -4.833, -8.682, -8.311, -11.588, -8.356)
      ..relativeLineTo(8.21, 13.49)
      ..close();
  }

  @override
  bool shouldRepaint(_GeminiFillPainter oldDelegate) {
    return false;
  }
}
