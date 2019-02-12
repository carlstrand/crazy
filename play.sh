#!/bin/bash

sudo bash sync.sh
sudo ansible-playbook -i hosts.yml install/playbooks/main.yml