#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

ENVIRONMENT=${1:-""} # poc
PLAYBOOK=${2:""} # playbooks/ping.yml

echo "Environment: $ENVIRONMENT"
echo "Playbook: $PLAYBOOK"
echo "Timestamp: $(date)"

if [[ -z "$ENVIRONMENT" || -z "$PLAYBOOK" ]]; then
  echo "Usage: $0 <environment> <playbook>"
  exit 1
fi

# シンタックスチェック
uv run ansible-playbook --syntax-check "$PLAYBOOK" -i "inventory/$ENVIRONMENT"

# ドライラン
uv run ansible-playbook "$PLAYBOOK" -i "inventory/$ENVIRONMENT" --check --diff

# 実行
uv run ansible-playbook "$PLAYBOOK" -i "inventory/$ENVIRONMENT"

