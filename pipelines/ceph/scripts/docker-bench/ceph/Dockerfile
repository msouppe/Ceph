FROM ceph/daemon:master-40dfb3f-luminous-ubuntu-16.04-x86_64

ADD etcceph/* /etc/ceph/
ADD scripts/* /usr/bin/
ADD entrypoint.sh /root/
ADD var_lib_ceph/* /var/lib/ceph/

ENTRYPOINT ["/root/entrypoint.sh"]