#!/bin/bash
set -e

docker pull mariettesouppe/ceph-ansible:v0.1

docker run -t --name=ceph-ansible-cluster \
  --entrypoint=bash \
  -v `pwd`/geni/machines:/etc/ansible/hosts \
  mariettesouppe/ceph-ansible:v0.1 -u /etc/ansible/hosts
