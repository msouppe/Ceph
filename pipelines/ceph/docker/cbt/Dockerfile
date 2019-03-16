FROM python:2.7-slim-stretch

ENV CEPH_CBT_VERSION master

COPY install.sh /tmp/install.sh

RUN /tmp/install.sh && rm /tmp/install.sh

WORKDIR "/cbt" 
ENTRYPOINT ["python", "cbt.py", "--archive=archive", "--conf=ceph.conf", "conf.yml"]