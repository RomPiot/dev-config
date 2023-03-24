This project is created in order to generate my custom aliases, and generate local hosts from my projects.

## Init

1. Move all your projects in a "projects" folder on the user root
2. Move this project on the user root (next to "projects")
3. Copy/paste .bash_aliases.example to .bash_aliases
4. Execute this command to add init and updating the dev config

```
cd ~/dev-config && sh update-setup.sh
```

## Update

1. Add your custom aliases in .bash_aliases
2. Add your projects in projects folder
3. Now, just run alias "dev-config" to update the config
