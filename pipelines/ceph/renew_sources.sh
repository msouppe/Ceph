#!/bin/bash
set -e

if [ -z $CLOUDLAB_USER ]; then
  echo "Expecting CLOUDLAB_USER variable"
  exit 1
fi
if [ -z $CLOUDLAB_PASSWORD ]; then
  echo "Expecting CLOUDLAB_PASSWORD variable"
  exit 1
fi
if [ -z $CLOUDLAB_PROJECT ]; then
  echo "Expecting CLOUDLAB_PROJECT variable"
  exit 1
fi
if [ -z $CLOUDLAB_PUBKEY_PATH ]; then
  echo "Expecting CLOUDLAB_PUBKEY_PATH variable"
  exit 1
fi
if [ -z $CLOUDLAB_CERT_PATH ]; then
  echo "Expecting CLOUDLAB_CERT_PATH variable"
  exit 1
fi

docker run --rm --name=geni-lib \
  -e CLOUDLAB_USER=$CLOUDLAB_USER \
  -e CLOUDLAB_PASSWORD=$CLOUDLAB_PASSWORD \
  -e CLOUDLAB_PROJECT=$CLOUDLAB_PROJECT \
  -e CLOUDLAB_PUBKEY_PATH=$CLOUDLAB_PUBKEY_PATH \
  -e CLOUDLAB_CERT_PATH=$CLOUDLAB_CERT_PATH \
  -v $CLOUDLAB_PUBKEY_PATH:$CLOUDLAB_PUBKEY_PATH \
  -v $CLOUDLAB_CERT_PATH:$CLOUDLAB_CERT_PATH \
  -v `pwd`/geni/renew.py:/renew.py \
  --entrypoint=python \
  ivotron/geni-lib:v0.9.7.9 -u /renew.py
