#!/bin/sh

INPUT="/data/$1"
FORMAT=$2
OUTPUT="/data/${1%.*}.$FORMAT"

npx mmdc \
  -i "$INPUT" \
  -o "$OUTPUT" \
  -s 5 \
  -p /app/puppeteer-config.json \
  -c /app/mermaid-config.json

echo "Done! Output: ~/Documents/mermaid/${1%.*}.$FORMAT"
