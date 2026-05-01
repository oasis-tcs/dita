#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BUILD_DIR="$REPO_ROOT/build/attribute-report"
CLASS_DIR="$BUILD_DIR/classes"
JSON_DIR="$BUILD_DIR/json"
OUTPUT="$SCRIPT_DIR/base-attributes-a-to-z.dita"

mkdir -p "$CLASS_DIR" "$JSON_DIR"

javac -d "$CLASS_DIR" "$REPO_ROOT/.github/resources/RngToJson.java"

java -cp "$CLASS_DIR" RngToJson \
  --catalog "$REPO_ROOT/doctypes/catalog.xml" \
  -o "$JSON_DIR/rng-topic.json" \
  "$REPO_ROOT/doctypes/rng/base/basetopic.rng"

java -cp "$CLASS_DIR" RngToJson \
  --catalog "$REPO_ROOT/doctypes/catalog.xml" \
  -o "$JSON_DIR/rng-map.json" \
  "$REPO_ROOT/doctypes/rng/base/basemap.rng"

java -cp "$CLASS_DIR" RngToJson \
  --catalog "$REPO_ROOT/doctypes/catalog.xml" \
  -o "$JSON_DIR/rng-subjectScheme.json" \
  "$REPO_ROOT/doctypes/rng/subjectScheme/subjectScheme.rng"

python3 "$SCRIPT_DIR/rng_json_attribute_report.py" \
  "$JSON_DIR/rng-topic.json" \
  "$JSON_DIR/rng-map.json" \
  "$JSON_DIR/rng-subjectScheme.json" \
  > "$OUTPUT"

echo "Wrote $OUTPUT"
