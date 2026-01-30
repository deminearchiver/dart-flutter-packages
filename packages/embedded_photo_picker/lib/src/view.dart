import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class EmbeddedPhotoPickerView extends StatefulWidget {
  const EmbeddedPhotoPickerView({super.key});

  @override
  State<EmbeddedPhotoPickerView> createState() =>
      _EmbeddedPhotoPickerViewState();
}

class _EmbeddedPhotoPickerViewState extends State<EmbeddedPhotoPickerView> {
  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: "embedded_photo_picker",
      gestureRecognizers: {
        Factory<EagerGestureRecognizer>(EagerGestureRecognizer.new),
      },
    );
  }
}
