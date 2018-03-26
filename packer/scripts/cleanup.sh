#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
apt -y remove --purge ansible
apt-add-repository --remove ppa:ansible/ansible

# Apt cleanup.
apt -y autoremove
apt -y update
