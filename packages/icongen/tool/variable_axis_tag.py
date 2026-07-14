import math

from axisregistry import AxisRegistry, AxisProto

def create_table_lines(header: list[str], rows: list[list[str]]) -> list[str]:
    widths = [max(len(str(item)) for item in col) for col in zip(header, *rows)]

    def row(row: list[str]):
        return "| " + " | ".join(str(item).ljust(width) for item, width in zip(row, widths)) + " |"

    return [
        row(header),
        "| " + " | ".join(["-" * width for width in widths]) + " |",
        *map(row, rows)
    ]

def main():
    axis_registry = AxisRegistry()

    print("extension type const VariableAxisTag._(String _) implements String {")

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
            [[f"{default_value}", f"{min_value}", f"{max_value}", f"{step}"]]
        )

        docs: list[str] = [
            f"Variable font axis tagged \"{tag}\" - {name}.",
            "",
            *description.splitlines(),
            "",
            "The [Google Fonts CSS v2 API](https://developers.google.com/fonts/docs/css2) defines the axis as:",
            "",
            *table,
        ]
        for line in docs:
            print(f"  /// {line}")

        print(f"  static const {tag.lower()} = \"{tag}\" as VariableAxisTag;")

    print("}")

if __name__ == "__main__":
    main()
