FROM ceph/daemon:master-40dfb3f-luminous-ubuntu-16.04-x86_64

RUN git clone https://github.com/ceph/ceph-ansible.git
	git checkout tags/v3.1.10

	pip install -r requirements.txt

docker run -v /geni/machines:/etc/ansible/hosts