#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew cask required..."

# 更强大的终端应用
if [[ ! -e /Applications/iTerm.app ]]; then
    print_green "Installing iTerm"
    brew install --cask iterm2

    print_cyan "set iterm2 preferences"
    defaults delete com.googlecode.iterm2

    # todo replace item2 plist
    ln -s ~/.macsetup/config/com.googlecode.iterm2.plist $HOME/Library/Preferences
    # config background image locatio
    # command="set :New\ Bookmarks:0:Background\ Image\ Location /Users/""$(whoami)""/.macsetup/assets/iterm-background.jpg"
    # Disable Background for performance issue
    # /usr/libexec/PlistBuddy -c "$command" $HOME/Library/Preferences/com.googlecode.iterm2.plist
    defaults read -app iTerm >/dev/null
else
    print_yellow "You have installed iTerm2"
fi

# Chrome 浏览器没啥说的
if [[ ! -e /Applications/Google\ Chrome.app ]]; then
    print_green "Installing Google Chrome"
    brew install --cask google-chrome

    print_cyan "Set Chrome as default browser"
    git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
    (cd ./tools/defaultbrowser && make && make install)
    defaultbrowser chrome
    [[ -d ./tools/defaultbrowser ]] && rm -rf ./tools/defaultbrowser
else
    print_yellow "You have installed Chrome"
fi

# 工作必备 团队沟通和交流
brew_install_cask_app "slack" "Slack.app"

# 国民级应用
brew_install_cask_app "wechat" "WeChat.app"

# Git 版本控制工具
brew_install_cask_app "sourcetree" "SourceTree.app"

# 最强 IDE 不用多说
brew_install_cask_app "visual-studio-code" "Visual Studio Code.app"
