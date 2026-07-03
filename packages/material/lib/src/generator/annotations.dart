import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class Partial {
  const Partial();
}

@Target({TargetKind.classType})
class Concrete {
  const Concrete();
}

@Target({TargetKind.classType})
class Defaults {
  const Defaults({required this.overrides});

  final Type overrides;
}
