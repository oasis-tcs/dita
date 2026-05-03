#!/usr/bin/env python3
"""Generate an attribute coverage report from RngToJson JSON output.

Output format is a DITA reference topic:
- Uses a DITA simple list
- Each attribute name is wrapped in <xmlatt>...</xmlatt>
- Each element name is linked using keyref, as <xref keyref="elements-<name>"/>
- Additional information is included about the usage of the list
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any, Iterable


Report = dict[str, dict[str, str]]

DEFAULT_DITA_ELEMENT_ATTRS: dict[str, str] = {
    "dir": "(lro | ltr | rlo | rtl | -dita-use-conref-target)",
    "ditaarch:DITAArchVersion": "2.0",
    "specializations": "@props/audience @props/deliveryTarget @props/platform @props/product @props/otherprops",
    "translate": "(no | yes | -dita-use-conref-target)",
    "xml:lang": "CDATA",
    "xmlns:ditaarch": "http://dita.oasis-open.org/architecture/2005/",
}


def element_ref(name: str) -> str:
    return f'<xref keyref="elements-{name}"/>'


def load_report(path: Path) -> Report:
    try:
        with path.open("r", encoding="utf-8") as report_file:
            data: Any = json.load(report_file)
    except FileNotFoundError as exc:
        raise ValueError(f"File not found: {path}") from exc
    except json.JSONDecodeError as exc:
        raise ValueError(f"Invalid JSON in {path}: {exc}") from exc

    if not isinstance(data, dict):
        raise ValueError(f"Report must be a JSON object: {path}")

    report: Report = {}
    for element_name, attrs in data.items():
        if not isinstance(element_name, str):
            raise ValueError(f"Element names must be strings in {path}")
        if not isinstance(attrs, dict):
            raise ValueError(f"Element {element_name!r} must map to an object in {path}")

        report[element_name] = {}
        for attr_name, attr_value in attrs.items():
            if not isinstance(attr_name, str) or not isinstance(attr_value, str):
                raise ValueError(
                    f"Attributes on element {element_name!r} must map string names to string values in {path}"
                )
            report[element_name][attr_name] = attr_value

    return report


def merge_reports(paths: Iterable[Path]) -> dict[str, set[str]]:
    element_attr_map: dict[str, set[str]] = defaultdict(set)
    for path in paths:
        report = load_report(path)
        for element_name, attrs in report.items():
            element_attr_map[element_name].update(attrs.keys())

    if "dita" not in element_attr_map:
        element_attr_map["dita"].update(DEFAULT_DITA_ELEMENT_ATTRS.keys())

    return element_attr_map


def load_excluded_elements(paths: Iterable[Path]) -> set[str]:
    excluded: set[str] = set()
    for path in paths:
        excluded.update(load_report(path).keys())
    return excluded


def build_report(
    json_files: Iterable[Path],
    exclude_elements: set[str],
    exceptions_threshold: int,
) -> str:
    element_attr_map = merge_reports(json_files)
    scope_elements = set(element_attr_map) - exclude_elements

    attr_to_elements: dict[str, set[str]] = defaultdict(set)
    for elem, attrs in element_attr_map.items():
        if elem not in scope_elements:
            continue
        for attr in attrs:
            attr_to_elements[attr].add(elem)

    lines: list[str] = ["<sl id=\"attributelist\">"]

    for attr in sorted(attr_to_elements, key=str.lower):
        present = attr_to_elements[attr]
        missing = sorted(scope_elements - present, key=str.lower)
        attr_xml = f"<xmlatt>{attr}</xmlatt>"

        if not missing:
            lines.append(f"  <sli>{attr_xml}: All elements</sli>")
        elif len(missing) < exceptions_threshold:
            exc = ", ".join(element_ref(e) for e in missing)
            lines.append(f"  <sli>{attr_xml}: All elements except {exc}</sli>")
        else:
            elems = ", ".join(element_ref(e) for e in sorted(present, key=str.lower))
            lines.append(f"  <sli>{attr_xml}: {elems}</sli>")

    lines.append("</sl>")
    return "\n".join(lines)


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate an HTML attribute coverage report from RngToJson JSON files."
    )
    parser.add_argument(
        "json_files",
        nargs="+",
        type=Path,
        help="One or more JSON files produced by RngToJson.",
    )
    parser.add_argument(
        "--exclude-element",
        action="append",
        default=["no-topic-nesting"],
        help="Element name to exclude. Can be provided multiple times (default includes no-topic-nesting).",
    )
    parser.add_argument(
        "--exclude-json",
        action="append",
        default=[],
        type=Path,
        help=(
            "JSON report whose element names should be excluded from the final report. "
            "Can be provided multiple times."
        ),
    )
    parser.add_argument(
        "--exceptions-threshold",
        type=int,
        default=10,
        help="If fewer than this many elements are missing an attribute, list Missing exceptions (default: 10).",
    )
    parser.add_argument(
        "--spec",
        choices=("base", "techcomm"),
        default="base",
        help="Specification scope for the report. Use techcomm to add the technical communications note (default: base).",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    try:
        exclude_elements = set(args.exclude_element)
        exclude_elements.update(load_excluded_elements(args.exclude_json))
        report_list = build_report(
            json_files=args.json_files,
            exclude_elements=exclude_elements,
            exceptions_threshold=args.exceptions_threshold,
        )
    except ValueError as exc:
        print(exc, file=sys.stderr)
        return 2

    print('<?xml version="1.0" encoding="UTF-8"?>')
    print("<!DOCTYPE reference PUBLIC \"-//OASIS//DTD DITA 2.0 Reference//EN\" \"reference.dtd\">")
    print("<reference id=\"attributes-a-to-z\">")
    print("<title>DITA Attributes, A to Z</title>")
    print("<shortdesc>This topic includes a simple list of all attributes defined on all elements in this specification.</shortdesc>")
    print("<refbody><section>")
    if args.spec == "techcomm":
        print("<p>This report includes only elements from the technical communications specification; it does not include elements from the base specification.</p>")
    else:
        print("<p>The following exceptions apply:</p>")
        print("<ul>")
        print("<li>DITAVAL elements are not included.</li>")
        print("<li>The <xref keyref=\"elements-no-topic-nesting\"/> element is not included.</li>")
        print("</ul>")
    print('<note>Some attributes are defined differently for different elements; ')
    print('check the element description for details on values and any expected processing.</note>')
    print(report_list)
    print("</section></refbody>")
    print("</reference>")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
