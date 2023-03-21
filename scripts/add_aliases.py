import os

bash_aliases_file = os.path.expanduser('~/dev-config/files/.bash_aliases')
bashrc_file = os.path.expanduser('~/.bashrc')
zshrc_file = os.path.expanduser('~/.zshrc')

if os.path.isfile(bash_aliases_file):
    line_to_add = f"if [ -f {bash_aliases_file} ]; then\n    . {bash_aliases_file}\nfi\n"
    with open(bashrc_file, 'r+') as bashrc:
        if line_to_add not in bashrc.read():
            bashrc.write(line_to_add)

    with open(zshrc_file, 'r+') as zshrc:
        if line_to_add not in zshrc.read():
            zshrc.write(line_to_add)
