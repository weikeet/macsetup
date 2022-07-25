#!/bin/zsh

USER_PWD=$1

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup open jdk..."


function install_ms_open_jdk() {
    passwd=$1
    version_code=$2
    version_name=$3

    microsoft_jdk="/Library/Java/JavaVirtualMachines/microsoft-$version_code.jdk"

    if [[ ! -e $microsoft_jdk ]]; then
        if is_arm_cpu; then
            jdk_file_name="microsoft-jdk-$version_name-macOS-aarch64.tar.gz"
        else
            jdk_file_name="microsoft-jdk-$version_name-macOS-x64.tar.gz"
        fi

        if [[ ! -e $jdk_file_name ]]; then
            print_green "download https://aka.ms/download-jdk/$jdk_file_name"
            wget "https://aka.ms/download-jdk/$jdk_file_name"
        else
            print_green "$jdk_file_name exists!"
        fi

        tar -zxvf $jdk_file_name
        jdk_file_unzip=$(ls |grep jdk-$version_name+)

        print_green "Installing $microsoft_jdk"

        echo $passwd | sudo -S mv $jdk_file_unzip $microsoft_jdk
    else
        print_yellow "You have installed $microsoft_jdk"
    fi
}


if [[ ! -e ~/Development ]]; then
    mkdir ~/Development
fi

cd ~/Development

install_ms_open_jdk $USER_PWD 11 11.0.15
# install_ms_open_jdk $USER_PWD 17 17.0.3
