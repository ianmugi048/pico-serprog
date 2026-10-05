#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$PROJECT_DIR/build"

echo "==> Project"
echo "    $PROJECT_DIR"
echo

echo "==> Configuring pico-serprog"
cmake \
    -S "$PROJECT_DIR" \
    -B "$BUILD_DIR" \
    -DCMAKE_BUILD_TYPE=Release \
    -DPICO_BOARD=pico \
    -DPICO_SDK_PATH="$PROJECT_DIR/pico-sdk"

echo
echo "==> Building pico-serprog"
cmake --build "$BUILD_DIR" --parallel

echo
echo "==> Firmware"
ls -lh "$BUILD_DIR/pico_serprog.uf2"

echo
echo "==> SHA-256"
sha256sum "$BUILD_DIR/pico_serprog.uf2"

echo
echo "Build complete."
