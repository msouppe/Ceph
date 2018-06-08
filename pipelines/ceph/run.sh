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
docker run --rm --name=baseliner \
  --volume `pwd`:/experiment:z \
  --volume $SSHKEY:/root/.ssh/id_rsa:z \
  --volume /var/run/docker.sock:/var/run/docker.sock:z \
  --workdir=/experiment/ \
  --net=host \
  ivotron/baseliner:0.2 \
    -i /experiment/geni/machines \
    -f /experiment/config.yml \
    -o /experiment/results/baseliner_output \
    -m parallel \
    $BASELINER_FLAGS