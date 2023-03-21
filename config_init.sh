set -e # exit on error

# Install all the necessary packages
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common git git-flow tilix tree vim btop bat zsh -y

python3 $HOME/dev-config/scripts/add_aliases.py
source $HOME/.bash_aliases
source $HOME/.zshrc

# Add git user
git_user_name=$(git config --global user.name)
if [ -z "$git_user_name" ]; then
  read -p "Enter your git user name: " git_user_name
  git config --global user.name "$git_user_name"
fi

git_user_email=$(git config --global user.email)
if [ -z "$git_user_email" ]; then
  read -p "Enter your git user email: " git_user_email
  git config --global user.email "$git_user_email"
fi

# Install docker
if ! [ -x "$(command -v docker)" ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt update
  apt-cache policy docker-ce
  sudo apt install docker-ce
  sudo usermod -aG docker ${USER}
  su - ${USER}
fi

# Install docker-compose
if ! [ -x "$(command -v compose)" ]; then
  mkdir -p ~/.docker/cli-plugins/
  curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
  chmod +x ~/.docker/cli-plugins/docker-compose
  docker compose version
fi

# Install jetbrains toolbox
if ! [ -x "$(command -v ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox)" ]; then
  wget -O jetbrains-toolbox.tar.gz "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.3.14493.tar.gz"
  tar -xzf jetbrains-toolbox.tar.gz
  cd jetbrains-toolbox-*/
  ./jetbrains-toolbox
  rm -rf jetbrains-toolbox-*/
fi

# Install Chrome
if ! [ -x "$(command -v google-chrome)" ]; then
  wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  sudo apt install ./chrome.deb
  rm chrome.deb
fi

# Install vscode
if ! [ -x "$(command -v code)" ]; then
  wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
  sudo apt install ./vscode.deb
  rm vscode.deb
fi

# Create projects folder
if [ ! -d ~/projects ]; then
  mkdir ~/projects
fi

python3 $HOME/dev-config/scripts/generate_hosts.py
sh $HOME/dev-config/scripts/git_aliases.sh
sh $HOME/dev-config/scripts/zsh_config.sh

