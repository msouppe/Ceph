FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    bash \
    python \
    python-pip \
    git \
    sudo \
    software-properties-common \
    python-software-properties

RUN	git clone https://github.com/ceph/ceph-ansible.git && \
	cd ceph-ansible && \
	git checkout tags/v3.1.10 && \
	add-apt-repository ppa:ansible/ansible && \
	apt-get update && \
	apt-get install -y ansible

COPY ../geni/machines /etc/ansible/hosts
COPY ../ceph-ansible/site-docker.yml ceph-ansible/
COPY ../ceph-ansible/group_vars/* ceph-ansible/group_vars/

RUN ansible-playbook site-docker.yml