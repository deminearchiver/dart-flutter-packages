import 'dart:io';

import 'package:jnigen/jnigen.dart';

void main(List<String> args) async {
  final packageRoot = Platform.script.resolve("../");
  await generateJniBindings(
    .new(
      outputConfig: .new(
        dartConfig: .new(
          path: packageRoot.resolve("lib/src/jni_bindings.g.dart"),
          structure: .singleFile,
        ),
      ),
      androidSdkConfig: .new(
        addGradleDeps: true,
        androidExample: packageRoot.resolve("example").toFilePath(),
      ),
      sourcePath: [packageRoot.resolve("android/src/main/kotlin")],
      classes: [
        "io.qzz.deminearchiver.system_colors_android.SystemColorsPlugin",
        "io.qzz.deminearchiver.system_colors_android.SystemColorsDynamicPalette",
        "io.qzz.deminearchiver.system_colors_android.SystemColorsDynamicScheme",
      ],
      generateStubs: false,
      visitors: [_CompanionVisitor()],
    ),
  );
}

class _CompanionVisitor extends Visitor {
  @override
  void visitMethod(Method method) {
    // Exclude constructors because the generated code is quite unpleasant.
    // It has been decided to treat all constructors as internal.
    if (method.isConstructor) {
      method.isExcluded = true;
    }
  }

  @override
  void visitField(Field field) {
    // Exclude INSTANCE (object) / Companion (companion object) fields.
    // It has been decided to treat these fields as internal.
    const exclude = <String>["INSTANCE", "Companion"];
    if (exclude.any(
      (name) => field.name == name || field.originalName == name,
    )) {
      field.isExcluded = true;
    }
  }
}
