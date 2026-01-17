#!/bin/bash
# <UDF name="ansible_public_key" label="ansible user authorized public key" example="ssh-ed25519 AAA..." default="">
apt-get -q update && apt-get -q -y upgrade

ANSIBLE_USER="ansible"
SUDOERS_FILE="/etc/sudoers.d/${ANSIBLE_USER}"

useradd -m -s /bin/bash "${ANSIBLE_USER}"

mkdir -p "/home/${ANSIBLE_USER}/.ssh"
chmod 700 "/home/${ANSIBLE_USER}/.ssh"
echo "${ANSIBLE_PUBLIC_KEY}" | tee "/home/${ANSIBLE_USER}/.ssh/authorized_keys"
chmod 600 "/home/${ANSIBLE_USER}/.ssh/authorized_keys"
chown -R "${ANSIBLE_USER}:${ANSIBLE_USER}" "/home/${ANSIBLE_USER}/.ssh"

echo "${ANSIBLE_USER} ALL=(ALL) NOPASSWD: ALL" | tee "${SUDOERS_FILE}"
chmod 440 "${SUDOERS_FILE}"
