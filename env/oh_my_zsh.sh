#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup oh-my-zsh..."

# 读取 bin path 到 bin_path
export_bin_path

# oh-my-zsh
if [[ ! -e ~/.oh-my-zsh ]]; then
    print_green "Install oh-my-zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
else
    print_yellow "You have installed oh-my-zsh"
    if [[ -e $bin_path/gtimeout ]]; then
        print_green "Update oh-my-zsh with timeout 15s"
        cd ~/.oh-my-zsh && gtimeout 15s git pull --rebase
    fi
fi

custom_plugins=~/.oh-my-zsh/custom/plugins
if [[ ! -e $custom_plugins/zsh-autosuggestions ]]; then
    print_green "Install zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions $custom_plugins/zsh-autosuggestions
else
    print_yellow "You have installed zsh-autosuggestions"
    if [[ -e $bin_path/gtimeout ]]; then
        print_green "Update zsh-autosuggestions with timeout 10s"
        cd $custom_plugins/zsh-autosuggestions && gtimeout 10s git pull --rebase
    fi
fi

if [[ ! -e $custom_plugins/zsh-syntax-highlighting ]]; then
    print_green "Install zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $custom_plugins/zsh-syntax-highlighting
else
    print_yellow "You have installed zsh-syntax-highlighting"
    if [[ -e $bin_path/gtimeout ]]; then
        print_green "Update zsh-syntax-highlighting and set timeout 10s"
        cd $custom_plugins/zsh-syntax-highlighting && gtimeout 10s git pull --rebase
    fi
fi

# add eval "$(starship init zsh)" to ~/.zshrc after install starship
# curl -sS https://starship.rs/install.sh | sh

backup_file ~/.zshrc
ln -s ~/.macsetup/config/zsh/.zshrc ~/.zshrc

yss_theme=~/.oh-my-zsh/custom/themes/yss.zsh-theme
rm $yss_theme
ln -s ~/.macsetup/config/zsh/theme/yss.zsh-theme $yss_theme

personal_config=$HOME/Development/zsh/zshrc.sh
if [[ ! -e $personal_config ]]; then
    if [[ ! -e $HOME/Development/zsh ]]; then
        mkdir -p $HOME/Development/zsh
    fi
    print_green "Create personal config file: $personal_config"
    touch $personal_config
fi
