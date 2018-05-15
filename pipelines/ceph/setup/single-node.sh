#!/bin/bash
set -x

docker stop node1 node2 node3
docker rm node1 node2 node3

set -e

# create virtual network in docker
CEPH_NET=175.20.0.0/16

netexists=`docker network ls --filter name=cephnet -q | wc -l`
if [ $netexists -eq 0 ]; then
  docker network create --subnet=$CEPH_NET cephnet
fi

MON_IP=175.20.0.12

# launch nodes
function launch_node {
  docker run -d --name=node$1 \
    -p 222$1:22 \
    -e ADD_INSECURE_KEY=true \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp:/tmp \
    ivotron/python-sshd:debian-9
}

launch_node 1
launch_node 2
launch_node 3

echo "node1 ansible_host=localhost ansible_port=2221 ansible_user=root" > hosts
echo "node2 ansible_host=localhost ansible_port=2222 ansible_user=root" >> hosts
echo "node3 ansible_host=localhost ansible_port=2223 ansible_user=root" >> hosts

# get insecure key
curl -O https://raw.githubusercontent.com/ivotron/docker-openssh/master/insecure_rsa
chmod 600 insecure_rsa

# configure the test
cat > config.yml << EOL
install_facter: false
benchmarks:
- name: rados-bench
  image: rados_bench:master-ec8d33f-luminous-ubuntu-16.04-x86_64
  network_mode: ceph_net
  environment_host:
    node1:
      MONITOR: true
      CEPH_NET: $CEPH_NET
    node2:
      OSD: true
      MONITOR_IP: $MONITOR_IP
      CEPH_NET: $CEPH_NET
    node3:
      CLIENT: true
      MONITOR_IP: $MONITOR_IP
      CEPH_NET: $CEPH_NET
  ip_host:
    node0: $MONITOR_IP
EOL
