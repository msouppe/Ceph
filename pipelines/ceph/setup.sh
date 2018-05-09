#!/usr/bin/env bash
# [wf] execute setup.sh stage

# Creates virtual network in Docker
CEPH_NET=175.20.0.0/16

netexists=`docker network ls --filter name=cephnet -q | wc -l`
if [ $netexists -eq 0 ]; then
  docker network create --subnet=$CEPH_NET cephnet
fi

MON_IP=175.20.0.12

# Launch Nodes
function launch_node {
  docker run -d --name=node$1 \
    -p 222$1:22 \
    -e ADD_INSECURE_KEY=true \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp:/tmp \
    ivotron/python-sshd:debian-9
}

launch_node 0
launch_node 1