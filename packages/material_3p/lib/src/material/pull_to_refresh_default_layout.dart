import 'package:flutter/widgets.dart';
import 'package:material_3p/material.dart';

class const PullToRefreshDefaultLayout({
  super.key,
  required final PullToRefreshController controller,
  final Clip clipBehavior = .hardEdge,
  final Widget? child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final height = controller.verticalOffset;
      return SizedBox(
        height: height,
        child: ClipRect(
          clipBehavior: clipBehavior,
          child: OverflowBox(
            alignment: .center,
            minHeight: 0.0,
            maxHeight: PullToRefreshController.defaultThreshold,
            child: Visibility(visible: height > 0.0, child: child!),
          ),
        ),
      );
    },
    child: child,
  );
}
