# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sudo rm -rf ~/.oh-my-zsh/custom/themes/powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d ~/.fonts ]; then
    mkdir -p ~/.fonts
fi

# Install MesloLGS NF font
if [ ! -f ~/.fonts/MesloLGS\ NF\ Regular.ttf ]; then
    wget -P ~/.fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    wget -P ~/.fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    wget -P ~/.fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    wget -P ~/.fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
    sudo fc-cache -f -v
fi

sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
cp $HOME/dev-config/files/.p10k.zsh $HOME/.p10k.zsh

source ~/.zshrc
source ~/.p10k.zsh
#p10k configure

# TODO : configure phpstorm terminal with zsh && change console font with MesloLGS
