#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing android development"

export_bin_path
if [[ ! -e $bin_path/adb ]]; then
    print_green "Installing adb"
    brew install --cask android-platform-tools
else
    print_yellow "You have installed android-platform-tools"
fi


if [[ ! -e /Applications/Android\ Studio.app ]]; then
    print_green "Installing Android Studio"
    brew install --cask android-studio
else
    print_yellow "You have installed Android Studio"
fi
