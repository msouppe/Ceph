#!/usr/bin/env bash

git clone https://github.com/ceph/ceph-ansible.git && \
cd ceph-ansible && \
git checkout tags/v3.1.10 && \
add-apt-repository --yes --update ppa:ansible/ansible && \
apt-get update --yes && \
yes "" | apt-get install -y ansible