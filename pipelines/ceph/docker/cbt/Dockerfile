FROM python:3.7-slim-stretch

ENV CEPH_CBT_VERSION v0.2

COPY install.sh /tmp/install.sh

RUN /tmp/install.sh && rm /tmp/install.sh

WORKDIR "/cbt"

RUN conf_config.py 

ENTRYPOINT ["cbt.py", "--archive=archive", "conf.yml"]