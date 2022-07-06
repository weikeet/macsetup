#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew cask..."

export_bin_path
if [[ ! -e $bin_path/adb ]]; then
    print_green "Installing adb"
    brew install --cask android-platform-tools
else
    print_yellow "You have installed android-platform-tools"
fi

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


if [[ ! -e /Applications/Android\ Studio.app ]]; then
    print_green "Installing Android Studio"
    brew install --cask android-studio
else
    print_yellow "You have installed Android Studio"
fi


if [[ ! -e /Applications/DB\ Browser\ for\ SQLite.app ]]; then
    print_green "Installing DB Browser for SQLite"
    brew install --cask db-browser-for-sqlite
else
    print_yellow "You have installed DB Browser for SQLite"
fi


if [[ ! -e /Applications/Tencent\ Lemon.app ]]; then
    print_green "Installing Tencent Lemon"
    brew install --cask tencent-lemon
else
    print_yellow "You have installed Tencent Lemon"
fi


if [[ ! -e /Applications/Zeplin.app ]]; then
    print_green "Installing Zeplin"
    brew install --cask zeplin
else
    print_yellow "You have installed Zeplin"
fi


if [[ ! -e /Applications/SwitchHosts.app ]]; then
    print_green "Installing SwitchHosts"
    brew install --cask switchhosts
else
    print_yellow "You have installed SwitchHosts"
fi


if [[ ! -e /Applications/draw.io.app ]]; then
    print_green "Installing draw.io"
    brew install --cask drawio
else
    print_yellow "You have installed draw.io"
fi
