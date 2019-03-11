#!/bin/bash

set -ex

if [ -z "$SSHKEY" ]; then
  echo "Expecting SSHKEY variable; will look for .ssh/id_rsa"

  if [ ! -f $HOME/.ssh/id_rsa ]; then
    echo ".ssh/id_rsa not found"
    exit 1
  fi

  echo "Found .ssh/id_rsa , will use this for running experiment"

  SSHKEY="$HOME/.ssh/id_rsa"
fi

# Retrieving files from ceph cluster and placing them into cbt
SVR='node0.ceph-msouppe.schedock-PG0.clemson.cloudlab.us'
SRC=$CLOUDLAB_USER@$SVR:/etc/ceph/*
DST=$PWD/cbt/

# Change keyring file permission
ssh -i $SSH_KEY $CLOUDLAB_USER@$SVR 'sudo chmod 644 /etc/ceph/ceph.client.admin.keyring'

# Copying all files from /etc/ceph to local machine
scp -i $SSH_KEY -r $SRC $DST

#python `pwd`/cbt/conf_config.py

echo `pwd`

# Run ceph benchmarks using containers
docker run --rm --name=cbt \
  -v $SSH_KEY:/root/.ssh/id_rsa \
  -v `pwd`/results:/cbt/archive \
  -v `pwd`/cbt/ceph.conf:/cbt/ceph.conf \
  -v `pwd`/cbt/conf.yml:/cbt/conf.yml \
  mariettesouppe/cbt:v0.1