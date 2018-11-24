FROM ubuntu:16.04

RUN apt-get clean && apt-get update && apt-get upgrade -y && apt-get install -y \
    bash \
    python \
    python-pip \
    git \
    sudo \
    software-properties-common \
    python-software-properties

ADD entrypoint-ceph-ansible.sh /root/

ENTRYPOINT ["/root/entrypoint-ceph-ansible.sh"]