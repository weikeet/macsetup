#!/bin/sh

source base.sh

# ##############################################################################
# install cask #################################################################
# ##############################################################################

brew install --cask android-platform-tools

if [[ ! -e /Applications/iTerm.app ]]; then
    brew install --cask iterm2
    echo "set iterm2 preferences"
    defaults delete com.googlecode.iterm2
    # todo replace item2 plist
    ln -s ~/.macsetup/config/com.googlecode.iterm2.plist $HOME/Library/Preferences
    # config background image location
    # command="set :New\ Bookmarks:0:Background\ Image\ Location /Users/""$(whoami)""/.macsetup/assets/iterm-background.jpg"
    # Disable Background for performance issue
    # /usr/libexec/PlistBuddy -c "$command" $HOME/Library/Preferences/com.googlecode.iterm2.plist
    defaults read -app iTerm >/dev/null
else
    echo "You have installed iTerm2"
fi


if [[ ! -e /Applications/Google\ Chrome.app ]]; then
    brew install --cask google-chrome

    echo "Set Chrome as default browser"
    git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
    (cd ./tools/defaultbrowser && make && make install)
    defaultbrowser chrome
    [[ -d ./tools/defaultbrowser ]] && rm -rf ./tools/defaultbrowser
else
    echo "You have installed Chrome"
fi


if [[ ! -e /Applications/Slack.app ]]; then
    brew install --cask slack
else
    echo "You have installed Slack"
fi


if [[ ! -e /Applications/WeChat.app ]]; then
    brew install --cask wechat
else
    echo "You have installed WeChat"
fi


if [[ ! -e /Applications/SourceTree.app ]]; then
    brew install --cask sourcetree
else
    echo "You have installed SourceTree"
fi


if [[ ! -e /Applications/Visual\ Studio\ Code.app ]]; then
    brew install --cask visual-studio-code
else
    echo "You have installed Visual Studio Code"
fi


if [[ ! -e /Applications/Android\ Studio.app ]]; then
    brew install --cask android-studio
else
    echo "You have installed Android Studio"
fi


if [[ ! -e /Applications/DB\ Browser\ for\ SQLite.app ]]; then
    brew install --cask db-browser-for-sqlite
else
    echo "You have installed DB Browser for SQLite"
fi


if [[ ! -e /Applications/Tencent\ Lemon.app ]]; then
    brew install --cask tencent-lemon
else
    echo "You have installed Tencent Lemon"
fi


if [[ ! -e /Applications/Zeplin.app ]]; then
    brew install --cask zeplin
else
    echo "You have installed Zeplin"
fi


if [[ ! -e /Applications/SwitchHosts.app ]]; then
    brew install --cask switchhosts
else
    echo "You have installed SwitchHosts"
fi


if [[ ! -e /Applications/draw.io.app ]]; then
    brew install --cask drawio
else
    echo "You have installed draw.io"
fi
