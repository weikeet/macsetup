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

brew_install_cask_app "android-studio" "Android Studio.app"
