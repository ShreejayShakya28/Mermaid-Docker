#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: ./mermaid <filename.mmd> <png|pdf|svg>"
  echo "Example: ./mermaid diagram.mmd png"
  exit 1
fi

INPUT="/data/input/$1"
FORMAT=$2
OUTPUT="/data/output/${1%.*}.$FORMAT"

npx mmdc \
  -i "$INPUT" \
  -o "$OUTPUT" \
  -s 5 \
  -p /app/puppeteer-config.json \
  -c /app/mermaid-config.json

echo "Done! Output: ~/Documents/mermaid/output/${1%.*}.$FORMAT"
