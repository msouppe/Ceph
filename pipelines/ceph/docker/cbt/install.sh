#!/bin/bash
set -ex
apt update
apt install -y git
git clone https://github.com/ceph/cbt

apt install -y python-yaml python-lxml pdsh

git checkout "$CEPH_CBT_VERSION"

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  pip install ansible
fi