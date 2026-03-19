#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE_NAME="mermaid"
TARGET_BIN="/usr/local/bin/mermaid"

if ! command -v docker >/dev/null 2>&1; then
  echo "Error: Docker is not installed or not in PATH."
  exit 1
fi

echo "Building Docker image '$IMAGE_NAME'..."
cd "$REPO_DIR"
docker build -t "$IMAGE_NAME" .

echo "Making wrapper executable..."
chmod +x "$REPO_DIR/mermaid"

echo "Installing command to $TARGET_BIN ..."
if [ -w "$(dirname "$TARGET_BIN")" ]; then
  ln -sf "$REPO_DIR/mermaid" "$TARGET_BIN"
else
  if command -v sudo >/dev/null 2>&1; then
    sudo ln -sf "$REPO_DIR/mermaid" "$TARGET_BIN"
  else
    echo "Error: No write permission for $(dirname "$TARGET_BIN") and sudo is unavailable."
    exit 1
  fi
fi

echo
echo "Install complete."
echo "Usage from any folder:"
echo "  mermaid file.mmd png"
echo "  mermaid file.mmd output.svg"
