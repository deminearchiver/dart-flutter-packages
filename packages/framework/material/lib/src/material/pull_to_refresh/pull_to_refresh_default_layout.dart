import 'package:material/src/material/flutter.dart';

class const PullToRefreshDefaultLayout({
  super.key,
  required final ValueListenable<PullToRefreshStates> states,
  final Clip clipBehavior = .hardEdge,
  final Widget? child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: states,
    builder: (context, states, child) {
      final height = states.verticalOffset;
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
