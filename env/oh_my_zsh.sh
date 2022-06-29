#!/bin/sh

source ~/.macsetup/base.sh

# oh-my-zsh
if [[ ! -e ~/.oh-my-zsh ]]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

custom_plugins=~/.oh-my-zsh/custom/plugins
if [[ ! -e $custom_plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $custom_plugins/zsh-autosuggestions
fi
if [[ ! -e $custom_plugins/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $custom_plugins/zsh-syntax-highlighting
fi

backup_file ~/.zshrc
ln -s ~/.macsetup/zsh-config/.zshrc ~/.zshrc
ln -s ~/.macsetup/zsh-config/theme/yss.zsh-theme ~/.oh-my-zsh/custom/themes/yss.zsh-theme
