#!/bin/bash
set -e

docker pull mariettesouppe/ceph-ansible:v0.1

docker run --rm -t --name=ceph-ansible-cluster \
  -v `pwd`/geni/machines:/etc/ansible/hosts \
  -v `pwd`/ceph-ansible/site-docker.yml:/ceph-ansible/ \
  mariettesouppe/ceph-ansible:v0.2