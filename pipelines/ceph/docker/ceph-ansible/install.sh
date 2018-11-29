#!/bin/bash
set -ex
apt update
apt install -y git
git clone https://github.com/ceph/ceph-ansible
cd ceph-ansible

git checkout "$CEPH_ANSIBLE_VERSION"

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  pip install ansible
fi
