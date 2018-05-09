#!/usr/bin/env bash
# [wf] execute setup.sh stage

docker run --rm --name=bl \
    -v `pwd`:/bl \
    -v /home/yeyette/Desktop/Ceph/pipelines/ceph/hosts:/hosts \
    -v /home/yeyette/.ssh/id_rsa:/id_rsa \
    --workdir=/bl \
    --net=host \
    ivotron/baseliner:0.2 -e -s -i /hosts