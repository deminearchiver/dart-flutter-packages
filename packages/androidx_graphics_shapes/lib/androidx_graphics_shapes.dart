/// A library for easy creation, transformation,
/// and morphing of rounded polygonal shapes.
library;

export 'src/shapes/shapes.dart'
    show
        CornerRounding,
        CubicBezier,
        Feature,
        Matrix2PointTransformer,
        Matrix3PointTransformer,
        Matrix4PointTransformer,
        Morph,
        pathFromCubics,
        PointTransformer,
        RoundedPolygon;

export 'src/material_shapes.dart';
export 'src/material_shape_border.dart';
export 'src/path_borders.dart';
