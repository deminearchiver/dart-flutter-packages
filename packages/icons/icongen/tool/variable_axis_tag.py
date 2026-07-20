import math

from axisregistry import AxisRegistry, AxisProto


def create_table_lines(header: list[str], rows: list[list[str]]) -> list[str]:
    widths = [max(len(str(item)) for item in col) for col in zip(header, *rows)]

    def row(row: list[str]):
        return (
            "| "
            + " | ".join(str(item).ljust(width) for item, width in zip(row, widths))
            + " |"
        )

    return [
        row(header),
        "| " + " | ".join(["-" * width for width in widths]) + " |",
        *map(row, rows),
    ]


def main():
    axis_registry = AxisRegistry()

    print("extension type const VariableAxisTag._(String _) implements String {")
    print(
        "  const VariableAxisTag.fromJson(String json): "
        'assert(json.length == 4, "Variable axis tag must contain exactly 4 characters.",), '
        "_ = json;"
    )
    print("")
    print("  String toJson() => _;")
    print("")

    tag: str
    proto: AxisProto
    for index, (tag, proto) in enumerate(axis_registry.items()):
        if index > 0:
            print("")

        name: str = proto.display_name
        description: str = proto.description
        default_value: float = proto.default_value
        min_value: float = proto.min_value
        max_value: float = proto.max_value
        precision: int = proto.precision
        step = math.pow(10, precision)

        table = create_table_lines(
            ["Default:", "Min:", "Max:", "Step:"],
            [[f"{default_value}", f"{min_value}", f"{max_value}", f"{step}"]],
        )

        docs: list[str] = [
            f'Variable font axis tagged "{tag}" - {name}.',
            "",
            *(line for line in description.splitlines()),
            "",
            "The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) "
            "defines the axis as:",
            "",
            *table,
        ]
        for line in docs:
            print(f"  /// {line}")

        print(f'  static const {tag.lower()} = VariableAxisTag.fromJson("{tag}");')

    print("}")


if __name__ == "__main__":
    main()
