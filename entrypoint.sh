#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: mermaid <filename.mmd> <png|pdf|svg|output.png|output.pdf|output.svg>"
  echo "Examples: mermaid code.mmd png"
  echo "          mermaid code.mmd output.svg"
  exit 1
fi

INPUT="/work/$1"
ARG2="$2"

if [ ! -f "$INPUT" ]; then
  echo "Input file not found: $1"
  exit 1
fi

case "$ARG2" in
  png|pdf|svg)
    OUTPUT_REL="${1%.*}.$ARG2"
    ;;
  *.png|*.pdf|*.svg)
    OUTPUT_REL="$ARG2"
    ;;
  *)
    echo "Second argument must be one of: png, pdf, svg, or a filename ending in .png/.pdf/.svg"
    exit 1
    ;;
esac

OUTPUT="/work/$OUTPUT_REL"

npx mmdc \
  -i "$INPUT" \
  -o "$OUTPUT" \
  -s 5 \
  -p /app/puppeteer-config.json \
  -c /app/mermaid-config.json

echo "Done! Output: $OUTPUT_REL"
