#!/usr/bin/env bash

git clone https://github.com/ceph/ceph-ansible.git && \
cd ceph-ansible && \
#git checkout tags/v3.1.10 && \
echo '# Git clone and checkout complete!'
echo ''

add-apt-repository --yes --update ppa:ansible/ansible && \
echo '# ppa:ansible/ansible complete!'
echo ''

apt-get update -y && \
yes "" | apt-get install -y ansible
echo '# Ansible install complete!'
echo ''

cp /temp-ceph-ansible/site-container.yml /ceph-ansible
cp /temp-ceph-ansible/site-docker.yml /ceph-ansible
cp /temp-ceph-ansible/group_vars/* /ceph-ansible/group_vars

echo '# Running ansible-playbook'
ansible-playbook site-container.yml