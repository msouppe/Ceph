#!/bin/bash
set -ex
apt update
apt install -y git
git clone https://github.com/ceph/cbt
cd cbt

git checkout "$CEPH_CBT_VERSION"

apt install -y python-yaml python-lxml pdsh

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  pip install ansible
fi