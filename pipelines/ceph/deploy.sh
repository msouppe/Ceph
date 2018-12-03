#!/bin/bash
set -ex

if [ -z "$SSH_KEY" ]; then
  echo "Expecting SSH_KEY variable"
  exit 1
fi

# deploy ceph using containers
docker run --rm --name=ceph-ansible \
  -v $SSH_KEY:/root/.ssh/id_dsa \
  -v `pwd`/geni/machines:/etc/ansible/hosts \
  -v `pwd`/ceph-ansible/site-docker.yml:/ceph-ansible/site.yml \
  -v `pwd`/ceph-ansible/group_vars:/ceph-ansible/group_vars \
  mariettesouppe/ceph-ansible:v0.2