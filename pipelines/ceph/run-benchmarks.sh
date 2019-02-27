#!/bin/bash
# [wf] use SSHKEY variable to execute baseliner
set -ex

if [ -n "$CI" ]; then
  BASELINER_FLAGS='-s'
  SSHKEY="$PWD/insecure_rsa"
fi

if [ -z "$SSHKEY" ]; then
  echo "Expecting SSHKEY variable; will look for .ssh/id_rsa"

  if [ ! -f $HOME/.ssh/id_rsa ]; then
    echo ".ssh/id_rsa not found"
    exit 1
  fi

  echo "Found .ssh/id_rsa , will use this for running experiment"

  SSHKEY="$HOME/.ssh/id_rsa"
fi

# delete previous results
sudo rm -fr results/baseliner_output
mkdir -p results/baseliner_output

docker pull ivotron/baseliner:0.2

# [wf] invoke baseliner
docker run --rm --name=cbt \
  --volume $SSHKEY:/root/.ssh/id_rsa \
  --volume $PWD/results:/cbt/archive \
  --volume $PWD/cbt/conf.yml:/cbt/conf.yml \
  msouppe/cbt