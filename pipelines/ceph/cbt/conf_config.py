import xml.etree.cElementTree as ET
import os

cwd = os.getcwd()

# Open all.yml file
with open(cwd + '/cbt/conf.yml', 'r') as file:
    # read a list of lines into data
	data = file.readlines()

# Make changes to head, cliets, mons, and osds parameters
for i in range(len(data)):

	if 'head' in data[i]:
		data[i] = '  head: [\"' +  + '\"]\n'
	if 'clients' in data[i]:
		data[i] = '  clients: [\"' +  + '\"]\n'
	if 'mons' in data[i]:
		data[i] = '  mons: [\"' +  + '\"]\n'
	if 'osds' in data[i]:
		data[i] = '  osds: [\"' +  + '\"]\n'

# Write everything back
with open(cwd + '/cbt/conf.yml', 'w') as file:
	file.writelines(data)