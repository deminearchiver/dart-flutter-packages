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
        "io.qzz.deminearchiver.system_colors_android.SystemColorsAndroidPlugin",
      ],
    ),
  );
}
