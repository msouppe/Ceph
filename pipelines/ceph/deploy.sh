#!/bin/bash
set -ex

if [ -z "$SSH_KEY" ]; then
  echo "Expecting SSH_KEY variable"
  exit 1
fi

# Deploy ceph using containers
docker run --rm --name=ceph-ansible \
  -v $SSH_KEY:/root/.ssh/id_rsa \
  -v `pwd`/geni/machines:/etc/ansible/hosts \
  -v `pwd`/ceph-ansible/purge_cluster.yml:/ceph-ansible/purge_cluster.yml \
  -v `pwd`/ceph-ansible/site.yml:/ceph-ansible/site.yml \
  -v `pwd`/ceph-ansible/group_vars:/ceph-ansible/group_vars \
  mariettesouppe/ceph-ansible:v0.2