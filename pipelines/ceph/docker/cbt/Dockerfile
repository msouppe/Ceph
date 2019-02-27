FROM python:3.7-slim-stretch

ENV CEPH_CBT_VERSION v0.2

COPY install.sh /tmp/install.sh

RUN /tmp/install.sh && rm /tmp/install.sh

ENTRYPOINT ["cbt.py", "--archive", "/cbt/archive", "/cbt/conf.yml"]