import yaml
from subprocess import call

def mon_config(self, hostname, ip_addr):
	data = dict(
		monitor_interface: get_interface(hostname, ip_addr), 
		public_network: 10.20.30.0/24, 
		cluster_network: ip_addr, 
		ceph_conf_overrides:
		    osd:
		        osd scrub during recovery: false
		ceph_docker_image: "ceph/daemon",
		ceph_docker_image_tag: "latest",
		ceph_docker_registry: 10.20.30.1:5000,
		containerized_deployment: 'true',
	)







#with open('all.yml', 'w') as outfile:
#    yaml.dump(data, outfile, default_flow_style=False)