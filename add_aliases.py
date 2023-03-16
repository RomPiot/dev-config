import os

bash_aliases_file = os.path.expanduser('~/dev-config/.bash_aliases')
bashrc_file = os.path.expanduser('~/.bashrc')

if os.path.isfile(bash_aliases_file):
    line_to_add = f"if [ -f {bash_aliases_file} ]; then\n    . {bash_aliases_file}\nfi\n"
    with open(bashrc_file, 'r+') as bashrc:
        if line_to_add not in bashrc.read():
            bashrc.write(line_to_add)
