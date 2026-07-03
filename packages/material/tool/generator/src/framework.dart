import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

class Generator {
  Generator({
    Allocator allocator = .none,
    bool orderDirectives = true,
    DartFormatter? formatter,
  }) : _emitter = DartEmitter(
         allocator: allocator,
         useNullSafetySyntax: true,
         orderDirectives: orderDirectives,
       ),
       formatter =
           formatter ??
           DartFormatter(languageVersion: DartFormatter.latestLanguageVersion);

  final DartEmitter _emitter;

  Allocator get allocator => _emitter.allocator;

  bool get orderDirectives => _emitter.orderDirectives;

  final DartFormatter formatter;

  String generate() {
    return "";
  }
}

abstract class Template {
  const Template();

  Iterable<Spec> build();
}

abstract class Feature {
  const Feature();

  void applyToAbstractClass(ClassBuilder builder) {}

  void applyToPrivateClass(ClassBuilder builder) {}

  Iterable<Spec> buildAdditionalSpecs() => const [];
}
