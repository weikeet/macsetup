#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup oh-my-zsh..."

# oh-my-zsh
if [[ ! -e ~/.oh-my-zsh ]]; then
    print_green "Install oh-my-zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
else
    print_yellow "You have installed oh-my-zsh"
    cd ~/.oh-my-zsh && git pull --rebase
fi

custom_plugins=~/.oh-my-zsh/custom/plugins
if [[ ! -e $custom_plugins/zsh-autosuggestions ]]; then
    print_green "Install zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions $custom_plugins/zsh-autosuggestions
else
    print_yellow "You have installed zsh-autosuggestions"
    cd $custom_plugins/zsh-autosuggestions && git pull --rebase
fi

if [[ ! -e $custom_plugins/zsh-syntax-highlighting ]]; then
    print_green "Install zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $custom_plugins/zsh-syntax-highlighting
else
    print_yellow "You have installed zsh-syntax-highlighting"
    cd $custom_plugins/zsh-syntax-highlighting && git pull --rebase
fi

backup_file ~/.zshrc
ln -s ~/.macsetup/zsh-config/.zshrc ~/.zshrc

rm ~/.oh-my-zsh/custom/themes/yss.zsh-theme
ln -s ~/.macsetup/zsh-config/theme/yss.zsh-theme ~/.oh-my-zsh/custom/themes/yss.zsh-theme
