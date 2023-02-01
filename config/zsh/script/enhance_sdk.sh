#!/bin/zsh

# https://github.com/noties/Enhance

enhance_path=$HOME/Development/Enhance
if [[ ! -e $enhance_path ]]; then
    mkdir -p $enhance_path
fi
cd $enhance_path


enhance_ver="1.3.0"
enhance_jar="$enhance_path/enhance-${enhance_ver}-all.jar"
enhance_url="https://github.com/noties/Enhance/releases/download/v${enhance_ver}/enhance-${enhance_ver}-all.jar"
if [[ ! -e $enhance_jar ]]; then
    rm enhance-*-all.jar
    wget $enhance_url
fi

if [[ ! -e $enhance_jar ]]; then
    "Download failre, please muanally download $enhance_url to $enhance_path"
    exit 0
fi


echo "execute enhance tool version is $enhance_ver"

java -jar $enhance_jar -h
