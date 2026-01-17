## required

- https://github.com/astral-sh/uv

## Github Actionsのセットアップ

### シークレット

| 名前                   | 説明                                               |
| ---------------------- | -------------------------------------------------- |
| SSH_PRIVATE_KEY        | Ansibleがターゲットホストに接続するためのSSH秘密鍵 |
| ANSIBLE_VAULT_PASSWORD | Ansible Vaultのパスワード                          |

## development

```bash
uv sync

uv run ansible --version

# Installed 10 packages in 364ms
# ansible [core 2.20.1]
#   config file = None
#   configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
#   ansible python module location = /home/user/ghq/github.com/stoneream/gha-ansible-poc/ansible/.venv/lib/python3.13/site-packages/ansible
#   ansible collection location = /home/user/.ansible/collections:/usr/share/ansible/collections
#   executable location = /home/user/ghq/github.com/stoneream/gha-ansible-poc/ansible/.venv/bin/ansible
#   python version = 3.13.0 (main, Oct 12 2024, 22:36:00) [GCC 11.4.0] (/home/user/ghq/github.com/stoneream/gha-ansible-poc/ansible/.venv/bin/python3)
#   jinja version = 3.1.6
#   pyyaml version = 6.0.3 (with libyaml v0.2.5)
```
