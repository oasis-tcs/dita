#!/usr/bin/env python3
"""Compare two element/attribute JSON reports."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any


Report = dict[str, dict[str, str]]


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


def compare_reports(left_path: Path, left: Report, right_path: Path, right: Report) -> list[str]:
    messages: list[str] = []
    left_label = str(left_path)
    right_label = str(right_path)

    for element_name in sorted(set(left) | set(right)):
        if element_name not in left:
            messages.append(f"In file {left_label}, the element <{element_name}> is missing")
            continue
        if element_name not in right:
            messages.append(f"In file {right_label}, the element <{element_name}> is missing")
            continue

        left_attrs = left[element_name]
        right_attrs = right[element_name]
        for attr_name in sorted(set(left_attrs) | set(right_attrs)):
            if attr_name not in left_attrs:
                messages.append(
                    f"In file {left_label}, the element <{element_name}> is missing the attribute @{attr_name}"
                )
                continue
            if attr_name not in right_attrs:
                messages.append(
                    f"In file {right_label}, the element <{element_name}> is missing the attribute @{attr_name}"
                )
                continue

            left_value = left_attrs[attr_name]
            right_value = right_attrs[attr_name]
            if left_value != right_value:
                messages.append(
                    f"In file {left_label}, the attribute @{attr_name!r} on element <{element_name}> "
                    f"has value [{left_value}], while in file {right_label}, the attribute @{attr_name!r} "
                    f"on element <{element_name}> has value [{right_value}]"
                )

    return messages


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Compare two JSON reports containing elements and attributes."
    )
    parser.add_argument(
        "left",
        nargs="?",
        default="compare.json",
        type=Path,
        help="First JSON report, usually the DTD output (default: compare.json)",
    )
    parser.add_argument(
        "right",
        nargs="?",
        default="rng-compare.json",
        type=Path,
        help="Second JSON report, usually the RNG output (default: rng-compare.json)",
    )
    parser.add_argument(
        "--quiet",
        action="store_true",
        help="Only set the exit code; do not print a success message when reports match.",
    )
    args = parser.parse_args()

    try:
        left = load_report(args.left)
        right = load_report(args.right)
    except ValueError as exc:
        print(exc, file=sys.stderr)
        return 2

    messages = compare_reports(args.left, left, args.right, right)
    if messages:
        print("\n".join(messages))
        print(f"\nFound {len(messages)} difference(s).")
        return 1

    if not args.quiet:
        print(f"No differences found between {args.left} and {args.right}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
