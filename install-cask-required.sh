#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew cask required..."

# 更强大的终端应用
brew_install_cask_app "iterm2" "iTerm.app"

# 更快速的终端应用
brew_install_cask_app "alacritty" "Alacritty.app"
backup_file ~/.config/alacritty/alacritty.yml
ln -s ~/.macsetup/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# 最强浏览器没啥说的
brew_install_cask_app "google-chrome" "Google Chrome.app"

# 工作必备 团队沟通和交流
brew_install_cask_app "slack" "Slack.app"

# 国民级应用
brew_install_cask_app "wechat" "WeChat.app"

# Git 版本控制工具
brew_install_cask_app "sourcetree" "SourceTree.app"

# 最强 IDE 不用多说
brew_install_cask_app "visual-studio-code" "Visual Studio Code.app"
