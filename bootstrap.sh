#!/bin/bash
sudo apt update -y
sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update -y
sudo apt install -y ansible git rsync apt-utils locales
git clone https://github.com/carlstrand/crazy.git
cd ~/crazy
sudo ansible-playbook -i hosts.yml install/playbooks/main.yml -vvv