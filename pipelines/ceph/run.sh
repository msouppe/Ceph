#!/bin/bash
# [wf] prepare SSH and execute baseliner
set -ex

# [wf] prepare SSH key config
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

  echo "Found .ssh/id_rsa, will use this for running experiment"

  SSHKEY="$HOME/.ssh/id_rsa"
fi

# delete previous results
rm -fr results/baseliner_output
mkdir -p results/baseliner_output

docker pull ivotron/baseliner:0.2

# [wf] invoke baseliner
docker run --rm --name=bl \
    -v `pwd`:/bl \
    -v $SSHKEY:/root/.ssh/id_rsa \
    --workdir=/bl \
    --net=host \
    ivotron/baseliner:0.2 \
    -o /bl/results/baseliner_output \
    $BASELINER_FLAGS
