import os
from os import path

PROJECTS_DIR = path.expanduser('~/projects')

if not path.exists(PROJECTS_DIR):
    os.mkdir(PROJECTS_DIR)

hosts_file = path.expanduser('/etc/hosts')

with open(hosts_file, 'r'):
    for project_name in os.listdir(PROJECTS_DIR):
        domain = project_name + '.local'
        if domain not in open(hosts_file).read():
            print('Adding ' + domain + ' to /etc/hosts')
            line = '127.0.0.1 ' + domain
            cmd = "echo '" + line + "' | sudo tee -a /etc/hosts > /dev/null"
            os.system(cmd)
