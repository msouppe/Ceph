FROM python:3.7-slim-stretch

ENV CEPH_ANSIBLE_VERSION v3.2.5

COPY install.sh /tmp/install.sh

RUN /tmp/install.sh && rm /tmp/install.sh

WORKDIR "/ceph-ansible"
ENTRYPOINT ["ansible-playbook", "site.yml"]