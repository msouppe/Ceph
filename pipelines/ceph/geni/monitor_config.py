import xml.etree.cElementTree as ET
import os

cwd = os.getcwd()
tree = ET.parse(cwd + '/geni/cl-clemson.xml')
root = tree.getroot()

# Set a flag to break out of nested loops when value is
# found. 
found_val = False
# Iterate through nodes to get to host. First one will
# usually be fine. 
for node in root:
	# Iterate through the nodes attributes 
	# to find the host.
	for attr in node:
		# Attempt to get 'ipv4' attribute. If not host, then
		# get will return None value. If it is host, then it
		# will return the ipv4 address of the host.
		mon_ip = attr.get('ipv4')
		if mon_ip is not None:
			# Found the host ipv4 address. Now you you can do
			# something with it.
			#print(mon_ip)
			# Set the flag to break out of
			# outer loop.
			found_val = True
			break
	if found_val:
		break
	else:
		print("Continuing to next node.")

# Open all.yml file
with open(cwd + '/ceph-ansible/group_vars/all.yml', 'r') as file:
    # read a list of lines into data
	#print('open file')
	data = file.readlines()

# Make changes to monitor ip address
for i in range(len(data)):
	if 'monitor_address' in data[i]:
		#print('mon_ip changed')
		data[i] = 'monitor_address: ' + str(mon_ip) + '\n'

# Write everything back
with open(cwd + '/ceph-ansible/group_vars/all.yml', 'w') as file:
	#print('write everything back')
	file.writelines(data)