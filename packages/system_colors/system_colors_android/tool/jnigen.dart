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
        "io.qzz.deminearchiver.system_colors_android.SystemColorsTonalPalettes",
        "io.qzz.deminearchiver.system_colors_android.SystemColorsDynamicScheme",
      ],
      generateStubs: false,
      visitors: [_CompanionVisitor()],
    ),
  );
}

class _CompanionVisitor extends Visitor {
  @override
  void visitClass(ClassDecl c) {
    if (c.binaryName.endsWith(r"$Companion")) {
      c.isExcluded = true;
    }
  }

  @override
  void visitField(Field field) {
    if (field.name == "Companion" || field.originalName == "Companion") {
      field.isExcluded = true;
    }
  }
}
