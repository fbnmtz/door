#!/bin/bash

set -e

DOOR_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)

if [[ ${1:-} == "--help" || ${1:-} == "-h" ]]; then
  echo "Usage: bash scripts/door-iso-make.sh [--arch x86_64|aarch64] [builder options]"
  echo "Builds from this DOOR checkout and the package recipes in packages/."
  exit 0
fi

cd "$DOOR_ROOT/iso"

exec "$DOOR_ROOT/iso/bin/omarchy-iso-make" --local-source "$DOOR_ROOT" "$DOOR_ROOT/packages" "$@"
