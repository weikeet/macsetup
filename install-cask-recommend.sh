#!/bin/sh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew cask recommended..."


if [[ ! -e /Applications/Zeplin.app ]]; then
    print_green "Installing Zeplin"
    brew install --cask zeplin
else
    print_yellow "You have installed Zeplin"
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


if [[ ! -e "/Applications/Hidden Bar.app" ]]; then
    print_green "Installing Hidden Bar.app"
    brew install --cask hiddenbar
else
    print_yellow "You have installed Hidden Bar.app"
fi


if [[ ! -e "/Applications/IINA.app" ]]; then
    print_green "Installing IINA.app"
    brew install --cask iina
else
    print_yellow "You have installed IINA.app"
fi


if [[ ! -e "/Applications/KeyCastr.app" ]]; then
    print_green "Installing KeyCastr.app"
    brew install --cask keycastr
else
    print_yellow "You have installed KeyCastr.app"
fi


if [[ ! -e "/Applications/Motrix.app" ]]; then
    print_green "Installing Motrix.app"
    brew install --cask keycastr
else
    print_yellow "You have installed Motrix.app"
fi


if [[ ! -e "/Applications/Obsidian.app" ]]; then
    print_green "Installing Obsidian.app"
    brew install --cask obsidian
else
    print_yellow "You have installed Obsidian.app"
fi


if [[ ! -e "/Applications/Only Switch.app" ]]; then
    print_green "Installing Only Switch.app"
    brew install --cask only-switch
else
    print_yellow "You have installed Only Switch.app"
fi

# quick look plugins
# quicklook-csv quicklook-json webpquicklook
