FROM ceph/daemon:master-ec8d33f-luminous-ubuntu-16.04-x86_64

ADD etcceph/* /etc/ceph/
ADD scripts/* /usr/bin/
ADD entrypoint.sh /root/

ENTRYPOINT ["/root/entrypoint.sh"]