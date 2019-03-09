import xml.etree.cElementTree as ET
import os

cwd = os.getcwd()

# Open all.yml file
with open(cwd + '/cbt/conf.yml', 'r') as file:
    # read a list of lines into data
	data = file.readlines()

ceph_conf_file = cwd + '/cbt/ceph.conf'

# Make changes to monitor ip address
for i in range(len(data)):
	# if 'conf_file' in data[i]:
	# 	print('In here conf_file')
	# 	data[i] = '  conf_file: ' + str(ceph_conf_file) + '\n'
	if 'ceph.conf' in data[i]:
		data[i] = '  ceph.conf: ' + str(ceph_conf_file) + '\n'
		break

# Write everything back
with open(cwd + '/cbt/conf.yml', 'w') as file:
	file.writelines(data)