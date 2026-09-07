#!/usr/bin/env zsh

set -euo pipefail

PIPX_PACKAGES=(
    mypy
    pytest
    ruff
)

VENV="$HOME/.venv"
REQUIREMENTS="$(dirname "$0")/../packages/requirements.txt"

command -v pipx >/dev/null 2>&1
command -v python3.13 >/dev/null 2>&1
[ -f "$REQUIREMENTS" ]

for package in "${PIPX_PACKAGES[@]}"; do
    pipx upgrade --install "$package"
done

if [ ! -d "$VENV" ]; then
    python3.13 -m venv "$VENV"
fi

"$VENV/bin/python" -m pip install --upgrade pip
"$VENV/bin/python" -m pip install --upgrade -r "$REQUIREMENTS"
