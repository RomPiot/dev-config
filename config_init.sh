set -e # exit on error

sudo apt-get update
# Install all the necessary packages
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common git git-flow tree vim btop bat zsh make -y

# Install php
if ! grep -q "ondrej/php" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo add-apt-repository ppa:ondrej/php
fi

sudo apt-get update
sudo apt-get install php5.6 -y
sudo apt-get install php7.0 -y
sudo apt-get install php7.1 -y
sudo apt-get install php7.2 -y
sudo apt-get install php7.3 -y
sudo apt-get install php7.4 -y
sudo apt-get install php8.0 -y
sudo apt-get install php8.1 -y
sudo apt-get install php8.2 -y

# Install node, npm, nvm, yarn
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
#source ~/.profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

nvm install node
npm install --global yarn

# Add git user
if [ -z $(git config --global user.name) ]; then
    read -p "Enter your git user name: " git_user_name
    git config --global user.name "$git_user_name"
fi

if [ -z $(git config --global user.email) ]; then
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

# Create projects folder
if [ ! -d ~/projects ]; then
    mkdir ~/projects
fi

python3 $HOME/dev-config/scripts/generate_hosts.py

if [ ! -f $HOME/.bashrc ]; then
    touch $HOME/.bashrc
fi

#if [ ! -f $HOME/.zshrc ]; then
#    touch $HOME/.zshrc
#fi

sh $HOME/dev-config/scripts/git_config.sh
#sh $HOME/dev-config/scripts/zsh_config.sh

# Install aliases
python3 $HOME/dev-config/scripts/add_aliases.py
#source $HOME/.bash_aliases
#source $HOME/.zshrc

cp $HOME/dev-config/files/.editorconfig $HOME/.editorconfig
