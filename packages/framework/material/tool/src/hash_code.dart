import 'dart:math' as math;

String buildObjectHashExpression(List<String> expressions) {
  assert(expressions.isNotEmpty);

  const separator = ", ";
  const limit = 20;
  final size = expressions.length;

  if (size <= limit) {
    return "Object.hash(${expressions.join(separator)})";
  }

  final buffer = StringBuffer();
  final extraItems = size - limit;
  final extraChunks = (extraItems / (limit - 1)).ceil();

  for (var i = 0; i < extraChunks; i++) {
    buffer.write("Object.hash(");
  }

  buffer
    ..write("Object.hash(")
    ..writeAll(expressions.take(20), separator)
    ..write(")");

  var index = limit;
  for (var i = 0; i < extraChunks; i++) {
    final end = math.min(index + limit - 1, size);
    buffer
      ..write(separator)
      ..writeAll(expressions.getRange(index, end), separator)
      ..write(")");
    index += limit - 1;
  }
  return buffer.toString();
}
