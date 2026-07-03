import 'dart:async';
import 'dart:math' as math;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';

class ThemeDataGenerator extends Generator {
  final bool throwOnUnresolved = false;

  TypeChecker _typeChecker<T extends Object?>() => TypeChecker.typeNamed(T);

  bool _hasAnnotation<T extends Object?>(Element element) => _typeChecker<T>()
      .hasAnnotationOfExact(element, throwOnUnresolved: throwOnUnresolved);

  ConstantReader _firstAnnotation<T extends Object?>(Element element) =>
      ConstantReader(
        _typeChecker<T>().firstAnnotationOfExact(
          element,
          throwOnUnresolved: throwOnUnresolved,
        ),
      );

  String _hashCode(List<String> expressions) {
    assert(expressions.isNotEmpty);

    const limit = 20;
    final size = expressions.length;

    if (size <= limit) {
      return "Object.hash(${expressions.join(",")})";
    }

    final buffer = StringBuffer();
    final extraItems = size - limit;
    final extraChunks = (extraItems / (limit - 1)).ceil();

    for (var i = 0; i < extraChunks; i++) {
      buffer.write("Object.hash(");
    }

    buffer
      ..write("Object.hash(")
      ..writeAll(expressions.take(20), ",")
      ..write(")");

    var index = limit;
    for (var i = 0; i < extraChunks; i++) {
      final end = math.min(index + limit - 1, size);
      buffer
        ..write(",")
        ..writeAll(expressions.getRange(index, end), ",")
        ..write(")");
      index += limit - 1;
    }
    return buffer.toString();
  }

  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final typeSystem = library.element.typeSystem;

    final buffer = StringBuffer();

    for (final element in library.allElements) {
      if (element is! ClassElement) continue;

      final isPartial = _hasAnnotation<Partial>(element);
      final isConcrete = _hasAnnotation<Concrete>(element);
      final isDefaults = _hasAnnotation<Defaults>(element);

      if (isPartial || isConcrete) {
        final getters = element.getters
            .where((getter) => !getter.isStatic)
            .toList(growable: false);
        {
          buffer.write("mixin _\$${element.name} on Diagnosticable {");
          for (final getter in getters) {
            final returnType = getter.returnType.getDisplayString();
            buffer.write("$returnType get ${getter.name};");
          }

          if (getters.isNotEmpty) {
            buffer.write("${element.name} copy()=>copyWith();");

            {
              buffer.write("${element.name} copyWith({");
              for (final getter in getters) {
                final nonNullableType = typeSystem
                    .promoteToNonNull(getter.returnType)
                    .getDisplayString();
                buffer.write("$nonNullableType?${getter.name},");
              }
              buffer.write("})=>_${element.name}(");
              for (final getter in getters) {
                final name = getter.name;
                buffer.write("$name:$name??this.$name,");
              }
              buffer.write(");");
            }
            {
              buffer.write("${element.name} maybeCopyWith({");
              for (final getter in getters) {
                final nonNullableType = typeSystem
                    .promoteToNonNull(getter.returnType)
                    .getDisplayString();
                buffer.write("$nonNullableType? ${getter.name},");
              }
              buffer
                ..write("})=>")
                ..write(
                  getters.map((getter) => "${getter.name} != null").join("||"),
                )
                ..write("?copyWith(")
                ..write(
                  getters
                      .map((getter) => "${getter.name}:${getter.name}")
                      .join(","),
                )
                ..write("):this as ${element.name};");
            }
          }

          buffer.writeln("}\n");
        }

        {
          buffer.write(
            "final class _${element.name} extends ${element.name} {",
          );
          if (getters.isNotEmpty) {
            buffer.write("const _${element.name}({");
            for (final getter in getters) {
              final isNullable = typeSystem.isNullable(getter.returnType);
              buffer.write(
                "${!isNullable ? "required " : ""}this.${getter.name},",
              );
            }
            buffer.write("});");
            for (final getter in getters) {
              final returnType = getter.returnType.getDisplayString();
              buffer.write("@override final $returnType ${getter.name};");
            }

            buffer
              ..write("@override bool operator==(Object other)=>")
              ..write("identical(this, other)")
              ..write("||other is _${element.name}");
            for (final getter in getters) {
              buffer.write("&& ${getter.name} == other.${getter.name}");
            }
            buffer.write(";");

            {
              buffer
                ..write("@override int get hashCode=>")
                ..write(
                  _hashCode(
                    getters
                        .map((getter) => getter.name)
                        .nonNulls
                        .toList(growable: false),
                  ),
                )
                ..write(";");
            }
          } else {
            buffer.write("const _${element.name}();");
          }

          buffer.writeln("}\n");
        }
      }

      if (isDefaults) {
        final annotation = _firstAnnotation<Defaults>(element);
        final supertype = element.supertype;
        final supertypeElement = switch (supertype?.element) {
          final InterfaceElement element when element.name != null => element,
          _ => null,
        };
        final overridesElement = annotation
            .peek("overrides")
            ?.typeValue
            .element;
        final overridesAreValid =
            overridesElement is InterfaceElement &&
            _hasAnnotation<Partial>(overridesElement);

        {
          buffer.write("mixin _\$${element.name}");
          if (supertypeElement != null) {
            buffer.write(" on ${supertypeElement.name}");
          }
          buffer.write("{");
          if (overridesAreValid) {
            final getters = overridesElement.getters
                .where((getter) => !getter.isStatic)
                .toList(growable: false);
            for (final getter in getters) {
              buffer
                ..write(getter.returnType.getDisplayString())
                ..write(" get _${getter.name};");
            }
          }
          buffer.writeln("}\n");
        }

        {
          final generativeConstructor = element.constructors.singleWhere(
            (constructor) =>
                constructor.isGenerative &&
                constructor.formalParameters.every(
                  (parameter) => parameter.isOptional,
                ),
          );

          Future<String?> redirectingConstructorName(
            ConstructorElement element,
            BuildStep buildStep,
          ) async {
            if (!element.isFactory) return null;
            final node = await buildStep.resolver.astNodeFor(
              element.firstFragment,
            );
            if (node is! ConstructorDeclaration) return null;
            return node.redirectedConstructor?.type.name.lexeme;
          }

          final factoryConstructor = element.constructors.singleWhere(
            (constructor) =>
                constructor.isFactory &&
                constructor.formalParameters.every(
                  (parameter) => parameter.isNamed,
                ) &&
                constructor.formalParameters.any(
                  (parameter) =>
                      parameter.name == "overrides" &&
                      parameter.type.element?.name == overridesElement?.name,
                ),
          );

          final parameters = factoryConstructor.formalParameters.toList(
            growable: false,
          );

          buffer.write(
            "final class _${element.name} extends ${element.name} {",
          );
          if (overridesAreValid) {
            buffer.write("const _${element.name}({");
            for (final parameter in parameters) {
              if (parameter.name == "overrides") continue;
              if (parameter.isRequired) {
                buffer.write("required ");
              }
              buffer.write("this._${parameter.name},");
            }
            buffer
              ..write("${overridesElement.name}? overrides,")
              ..write("}): ")
              ..write(
                "_overrides = overrides ?? const _${overridesElement.name}(),",
              )
              ..write("super.${generativeConstructor.name}();");

            for (final parameter in parameters) {
              if (parameter.name == "overrides") continue;

              buffer
                ..write("final ")
                ..write(parameter.type.getDisplayString())
                ..write(" _${parameter.name};");
            }

            buffer.write("final ${overridesElement.name} _overrides;");

            final getters = overridesElement.getters
                .where((getter) => !getter.isStatic)
                .toList(growable: false);
            for (final getter in getters) {
              buffer
                ..write("@override ")
                ..write(getter.returnType.getDisplayString())
                ..write(" get _${getter.name}=>_overrides.${getter.name};");
            }

            {
              buffer
                ..write("@override bool operator==(Object other)=>")
                ..write("identical(this, other)")
                ..write("||other is _${element.name}");
              for (final parameter in parameters) {
                buffer.write(
                  "&& _${parameter.name} == other._${parameter.name}",
                );
              }
              buffer.write(";");
            }

            buffer
              ..write("@override int get hashCode=>")
              ..write(
                _hashCode(
                  parameters
                      .map((parameter) => "_${parameter.name}")
                      .nonNulls
                      .toList(growable: false),
                ),
              )
              ..write(";");
          }
          buffer.writeln("}\n");
        }
      }
    }
    return buffer.isNotEmpty ? buffer.toString() : null;
  }
}
