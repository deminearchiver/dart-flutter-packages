/// # Material Color Utilities
///
/// Algorithms and utilities that power
/// the Material Design 3 (M3) color system,
/// including choosing theme colors from images
/// and creating tones of colors;
/// all in a new color space.
library;

// Quantizers are replaced by the Flutter-specific implementation.

export 'package:libmonet/material_color_utilities.dart'
    hide QuantizerCelebi, QuantizerMap, QuantizerWsmeans, QuantizerWu;

export 'src/material_color_utilities/quantizer_celebi.dart';
export 'src/material_color_utilities/quantizer_map.dart';
export 'src/material_color_utilities/quantizer_wsmeans.dart';
export 'src/material_color_utilities/quantizer_wu.dart';
