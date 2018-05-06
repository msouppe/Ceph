#!/usr/bin/env bash
# [wf] execute setup.sh stage

docker run --rm --name=bl \
    -v `pwd`:/bl \
    -v /home/yeyette/Desktop/Ceph/pipelines/ceph:/hosts \
    -v /home/yeyette:/.ssh/id_rsa \
    --workdir=/bl \
    --net=host \
    baseliner -e -s -i /hosts