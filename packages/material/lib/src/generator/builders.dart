import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'theme_data_generator.dart';

Builder themeBuilder(BuilderOptions options) =>
    SharedPartBuilder([ThemeDataGenerator()], "theme");
