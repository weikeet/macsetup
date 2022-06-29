#!/bin/sh

USER_PWD=$1

source ~/.macsetup/base.sh

if [[ ! -e ~/Development ]]; then
    mkdir ~/Development
fi

microsoft_11_jdk=/Library/Java/JavaVirtualMachines/microsoft-11.jdk
if [[ ! -e $microsoft_11_jdk ]]; then
    jdk_download_url=https://aka.ms/download-jdk/
    if is_arm_cpu; then
        jdk_file_name=microsoft-jdk-11.0.15-macOS-aarch64.tar.gz
    else
        jdk_file_name=microsoft-jdk-11.0.15-macosx-x64.tar.gz
    fi
    jdk_file_name_unzip=jdk-11.0.15+10
    wget -P ~/Development $jdk_download_url$jdk_file_name && tar -zxvf $jdk_file_name
    echo $USER_PWD | sudo -S mv ~/Development/$jdk_file_name_unzip $microsoft_11_jdk
    rm $jdk_file_name
fi
