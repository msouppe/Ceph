#!/usr/bin/env bash

git clone https://github.com/ceph/ceph-ansible.git && \
cd ceph-ansible && \
git checkout tags/v3.1.10 && \
echo "Git clone and checkout complete!"

add-apt-repository --yes --update ppa:ansible/ansible && \
echo "Install ppa:ansible/ansible complete!"

apt-get update -y && \
yes "" | apt-get install -y ansible
echo 'Ansible install complete!'

echo `pwd`
echo `ls`