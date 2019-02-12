#!/bin/sh

sudo bash sync.sh
sudo ansible-playbook -i hosts.yml install/playbooks/main.yml -f 30