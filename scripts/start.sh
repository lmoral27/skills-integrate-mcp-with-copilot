#!/usr/bin/env bash
# Start script for skills-getting-started-with-github-copilot
# Activates the virtual environment and runs uvicorn for the FastAPI app
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV="$ROOT_DIR/.venv"

if [ ! -d "$VENV" ]; then
  echo "Virtual environment not found at $VENV"
  echo "Create it with: python3 -m venv $VENV"
  exit 1
fi

# Activate the venv
# shellcheck source=/dev/null
source "$VENV/bin/activate"

# Ensure uvicorn is available
if ! command -v uvicorn >/dev/null 2>&1; then
  echo "uvicorn not found in venv. Installing from requirements.txt..."
  pip install -r "$ROOT_DIR/requirements.txt"
fi

# Run the app (adjust module:path if needed)
exec uvicorn src.app:app --reload --host 127.0.0.1 --port 8000
