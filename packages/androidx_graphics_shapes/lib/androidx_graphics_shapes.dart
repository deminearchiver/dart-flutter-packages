/// A library for easy creation, transformation,
/// and morphing of rounded polygonal shapes.
library;

export 'src/shapes/shapes.dart'
    show
        CornerRounding,
        CubicBezier,
        Matrix2ShapePointTransformer,
        Matrix3ShapePointTransformer,
        Matrix4ShapePointTransformer,
        Morph,
        pathFromCubics,
        PolygonFeature,
        RoundedPolygon,
        ShapePointTransformer;

export 'src/material_shapes.dart';
export 'src/material_shape_border.dart';
export 'src/path_borders.dart';
