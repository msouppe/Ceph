#!/usr/bin/env bash

git clone https://github.com/ceph/ceph-ansible.git && \
cd ceph-ansible && \
git checkout tags/v3.1.10 && \
echo "# Git clone and checkout complete!"

add-apt-repository --yes --update ppa:ansible/ansible && \
echo "# Install ppa:ansible/ansible complete!"

apt-get update -y && \
yes "" | apt-get install -y ansible
echo '# Ansible install complete!'

cd ..
echo `pwd`
echo `ls`

cd temp-ceph-ansible
head -9 site-docker.yml
mv site-docker.yml ../ceph-ansible/
echo `pwd`
echo `ls`

cd ../ceph-ansible
echo `pwd`
echo `ls`