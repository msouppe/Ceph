#!/usr/bin/env python
import os
import os.path
import geni.cloudlab_util as cl
from geni.rspec import pg as rspec

nodeCount = 3

if not os.path.isdir('/output'):
    raise Exception("expecting '/output folder'")

img = "urn:publicid:IDN+clemson.cloudlab.us+image+schedock-PG0:docker-ubuntu16"

requests = {}

# Function: create_request(site, hw_type, num_nodes)
# site: Location of cluster site
# hw_type: Node type
# num_nodes: Number of nodes to be requested
# Node specifications for ClouLab sites: http://docs.cloudlab.us/hardware.html#%28part._cloudlab-clemson%29
def create_request(site, hw_type, num_nodes):

    for i in range(0, num_nodes):

        node = rspec.RawPC('node' + str(i))
        node.disk_image = img
        node.hardware_type = hw_type

        if site not in requests:
            requests[site] = rspec.Request()

        requests[site].addResource(node)

create_request('cl-clemson', 'c6320', nodeCount)

print("Executing cloudlab request")
manifests = cl.request(experiment_name=('ceph1-'+os.environ['CLOUDLAB_USER']),
                       requests=requests, timeout=30, expiration=1200,
                       ignore_failed_slivers=False)

# Need algorithm to determine number of mons, osds, and clients

# Writing machines file and grouping allocated resources from CloudLab
print("Writing /output/machines file")
with open('/output/machines', 'w') as f:
    for site, manifest in manifests.iteritems():
        for i,n in enumerate(manifest.nodes):
            if i == 0:
                f.write('[mons]' + os.linesep)
            elif i == 1:
                f.write(os.linesep + '[osds]' + os.linesep)
            #elif i == (nodeCount -1)
            #    f.write(os.linesep + '[clients]' + os.linesep)
            
            f.write(n.hostfqdn)
            f.write(' ansible_user=' + os.environ['CLOUDLAB_USER'])
            f.write(' ansible_become=true' + os.linesep)

        with open('/output/{}.xml'.format(site), 'w') as mf:
            mf.write(manifest.text)
            #mf.write(manifest.nodes[0].text)

#print(manifests)
#print(manifest.nodes[1].host['ipv4'].text)
#print(manifest.nodes[2].host['ipv4'].text)