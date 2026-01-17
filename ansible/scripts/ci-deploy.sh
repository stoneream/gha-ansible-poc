#!/bin/bash
set -euo pipefail

ENVIRONMENT=${1:-poc}
PLAYBOOK=${2:-playbooks/ping.yml}
EXTRA_VARS=${3:-""}

echo "=== Ansible CI Execution ==="
echo "Environment: $ENVIRONMENT"
echo "Playbook: $PLAYBOOK"
echo "Timestamp: $(date)"

# 環境変数の確認
if [[ -z "${ANSIBLE_VAULT_PASSWORD_FILE:-}" ]] && [[ -z "${VAULT_PASSWORD:-}" ]]; then
  echo "Warning: No vault password configuration found"
fi

export ANSIBLE_CONFIG="./ansible.cfg"

# 実行前チェック
echo "=== Pre-execution checks ==="
uv run ansible-playbook --syntax-check "$PLAYBOOK" -i "inventory/$ENVIRONMENT"

# Dry-run実行
echo "=== Dry-run execution ==="
uv run ansible-playbook "$PLAYBOOK" -i "inventory/$ENVIRONMENT" --check --diff

# 本実行
echo "=== Actual execution ==="
uv run ansible-playbook "$PLAYBOOK" -i "inventory/$ENVIRONMENT"

echo "=== Execution completed ==="
