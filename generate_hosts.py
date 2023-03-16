import os
from os import path

PROJECTS_DIR = path.expanduser('~/projects')

with open('/etc/hosts', 'r') as hosts_file:
    for project_name in os.listdir(PROJECTS_DIR):
        domain = project_name + '.local'
        if not domain in hosts_file.read():
            line = '127.0.0.1 ' + domain
            cmd = "echo '" + line + "' | sudo tee -a /etc/hosts > /dev/null"
            os.system(cmd)
