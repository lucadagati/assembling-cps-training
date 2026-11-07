#!/usr/bin/env bash
# Module I (IoT metrics) validator: wraps experiments/metrics/verify-metrics-lab.py.
# Usage: ./validate-lab-metrics.sh [LAB_HOST]
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST="${1:-${S4T_LAB_HOST:-$(cat "${SCRIPT_DIR}/vm-ip.txt" 2>/dev/null || hostname -I | awk '{print $1}')}}"
export S4T_LAB_HOST="$HOST"

PY="${SCRIPT_DIR}/.venv/bin/python3"
[[ -x "$PY" ]] || PY="python3"

exec "$PY" "${SCRIPT_DIR}/experiments/metrics/verify-metrics-lab.py"
