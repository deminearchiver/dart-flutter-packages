import 'dart:io';

import 'package:jnigen/jnigen.dart';

Future<void> main() async {
  final packageRoot = Platform.script.resolve("../");
  final generator = JniGenerator(
    input: .new(
      sourcePath: [packageRoot.resolve("android/src/main/kotlin")],
      classes: [
        "io.qzz.deminearchiver.system_colors_android.SystemColorsPlugin",
        "io.qzz.deminearchiver.system_colors_android.DynamicTonalPalette",
        "io.qzz.deminearchiver.system_colors_android.DynamicColorScheme",
      ],
      androidSdk: .new(
        addGradleDeps: true,
        androidExample: packageRoot.resolve("example/"),
      ),
    ),
    output: .new(
      dart: .new(
        path: packageRoot.resolve("lib/src/jni_bindings.g.dart"),
        structure: .singleFile,
      ),
      generateStubs: false,
    ),
    visitors: [_CompanionVisitor()],
  );
  await generator.generate();
}

final class _CompanionVisitor() extends Visitor {
  this : super.base();

  @override
  void visitMethod(Method method) {
    // Exclude constructors because the generated code is quite unpleasant.
    // It has been decided to treat all constructors as internal.
    if (method.isConstructor) {
      method.isIncluded = false;
    }
  }

  @override
  void visitField(Field field) {
    // Exclude INSTANCE (object) / Companion (companion object) / TAG (log)
    // fields. It has been decided to treat these fields as internal.
    const exclude = <String>["INSTANCE", "Companion", "TAG"];
    if (exclude.any(
      (name) => field.name == name || field.originalName == name,
    )) {
      field.isIncluded = false;
    }
  }
}
