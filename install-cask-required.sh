#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew cask required..."

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


if [[ ! -e /Applications/Slack.app ]]; then
    print_green "Installing Slack"
    brew install --cask slack
else
    print_yellow "You have installed Slack"
fi


if [[ ! -e /Applications/WeChat.app ]]; then
    print_green "Installing WeChat"
    brew install --cask wechat
else
    print_yellow "You have installed WeChat"
fi


if [[ ! -e /Applications/SourceTree.app ]]; then
    brew install --cask sourcetree
else
    print_yellow "You have installed SourceTree"
fi


if [[ ! -e /Applications/Visual\ Studio\ Code.app ]]; then
    print_green "Installing Visual Studio Code"
    brew install --cask visual-studio-code
else
    print_yellow "You have installed Visual Studio Code"
fi
