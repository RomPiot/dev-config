git config --global init.defaultBranch master
git config --global core.autocrlf false
git config --global core.eol lf
git config --global safe.directory '*'
git config --global alias.co "checkout"
git config --global alias.br "co -b"
git config --global alias.com "commit -m"
git config --global alias.amend "commit --amend --no-edit"
git config --global alias.st "status"
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.ada "add -A"
