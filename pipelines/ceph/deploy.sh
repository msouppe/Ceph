#!/bin/bash
set -e

docker pull mariettesouppe/ceph-ansible:v0.1

docker run --name=ceph-ansible-cluster-1 souppe/ceph-ansible:v0.1 