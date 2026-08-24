// TODO: do this after implementing progress indicators
// class PullToRefreshProgressIndicator extends StatefulWidget {
//   const PullToRefreshProgressIndicator({super.key, required this.controller});

//   final PullToRefreshController controller;

//   @override
//   State<PullToRefreshProgressIndicator> createState() =>
//       _PullToRefreshProgressIndicatorState();
// }

// class _PullToRefreshProgressIndicatorState
//     extends State<PullToRefreshProgressIndicator> {
//   late _PullToRefreshArrowIndicatorPainter _painter;

//   @override
//   void initState() {
//     super.initState();
//     _painter = .new(controller: widget.controller);
//   }

//   @override
//   void didUpdateWidget(covariant PullToRefreshProgressIndicator oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     _painter.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class _PullToRefreshArrowIndicatorPainter
//     extends StatefulCustomPainter<_PullToRefreshArrowIndicatorPainter> {
//   _PullToRefreshArrowIndicatorPainter({required this._controller}) {
//     controller.addListener(notifyListeners);
//   }

//   PullToRefreshController _controller;

//   PullToRefreshController get controller => _controller;

//   set controller(PullToRefreshController value) {
//     if (_controller == value) return;
//     _controller.removeListener(notifyListeners);
//     _controller = value;
//     _controller.addListener(notifyListeners);
//     notifyListeners();
//   }

//   @override
//   void paint(Canvas canvas, Size size) {}
// }
