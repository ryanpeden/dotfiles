#!/usr/bin/env zsh

set -e

PIPX_PACKAGES=(
    mypy
    pytest
    ruff
)

VENV="$HOME/.venv"
REQUIREMENTS="$(dirname "$0")/../packages/requirements.txt"

for package in $PIPX_PACKAGES; do
    pipx upgrade --install "$package"
done

if [ ! -d "$VENV" ]; then
    python3 -m venv "$VENV"
fi

"$VENV/bin/python" -m pip install --upgrade pip

if [ -f "$REQUIREMENTS" ]; then
    "$VENV/bin/pip" install --upgrade -r "$REQUIREMENTS"
fi
