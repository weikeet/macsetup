#!/bin/zsh

# https://developer.android.com/studio/command-line/bundletool?hl=zh-cn
# https://github.com/google/bundletool

aab_file=$1
apks_file=${aab_file/.aab/.apks}
log_file=${aab_file/.aab/.log}
file_dir=$(dirname $aab_file)

cacheType=$2

echo "input aab=$aab_file"
echo "output apks=$apks_file"

aab_modify_time=$(date -r$(stat -f "%m" $static) "+%Y%m%d%H%M%S")
echo "aab modify time=$aab_modify_time"

# manifest_file="$file_dir/base/manifest/AndroidManifest.xml"
# if [[ -e $manifest_file ]]; then
#     echo "rm cache manifest file!"
#     rm $manifest_file
# fi
# unzip "$aab_file" "base/manifest/*" -d "$file_dir"

# versionName=$(cat $manifest_file | grep "versionName" | awk -F '"' '{print $2}')
# echo $versionName

bundletool_path=$HOME/Development/bundletool
if [[ ! -e $bundletool_path ]]; then
    mkdir -p $bundletool_path
fi
cd $bundletool_path

config_path=$bundletool_path/install_aab_config.ini
if [[ ! -e $config_path ]]; then
    echo "Please write keystore info to $config_path, eg:
ks_file=/User/miku/aaa.ks
ks_pass=bbb
ks_key_alias=ccc
ks_key_pass=ddd
    "
    exit 0
fi

ks_file=$(cat $config_path | grep "ks_file" | awk -F '=' '{print $2}')
ks_pass=$(cat $config_path | grep "ks_pass" | awk -F '=' '{print $2}')
ks_key_alias=$(cat $config_path | grep "ks_key_alias" | awk -F '=' '{print $2}')
ks_key_pass=$(cat $config_path | grep "ks_key_pass" | awk -F '=' '{print $2}')

echo "ks_file=$ks_file"
echo "ks_pass=$ks_pass"
echo "ks_key_alias=$ks_key_alias"
echo "ks_key_pass=$ks_key_pass"

bundletool_ver="1.13.2"
bundletool_jar="$bundletool_path/bundletool-all-${bundletool_ver}.jar"
bundletool_url="https://github.com/google/bundletool/releases/download/1.13.2/bundletool-all-${bundletool_ver}.jar"
if [[ ! -e $bundletool_jar ]]; then
    rm bundletool-all-*.jar
    wget $bundletool_url
fi

if [[ ! -e $bundletool_jar ]]; then
    "Download failre, please muanally download $bundletool_jar to $bundletool_path"
    exit 0
fi

if [[ $cache = "-noneCache" ]]; then
    echo "Disable cache"
    if [[ -e "$apks_file" ]]; then
        echo "Found cache apks file and delete it!"
        rm "$apks_file"
    fi
fi

if [[ -e "$apks_file" ]]; then
    echo "Found cache apks file!"

    if [[ -e "$log_file" ]]; then
        log_aab_modify_time=$(cat $log_file | grep "aabModifyTime" | awk -F '=' '{print $2}')

        if [[ $log_aab_modify_time = $aab_modify_time ]]; then
            echo "Install cache apks file!"
            echo "$(date +"%Y.%m.%d %H:%M:%S") install-apks"
            java -jar $bundletool_jar install-apks --apks="$apks_file"
            echo "$(date +"%Y.%m.%d %H:%M:%S") end"
            exit 0
        else
            echo "Cache apks file is not match, delete it!"
            rm "$apks_file"
        fi
    else
        echo "Cache apks file is not match, delete it!"
        rm "$apks_file"
    fi
fi

echo "execute bundletool version is $bundletool_ver"

echo "$(date +"%Y.%m.%d %H:%M:%S") build-apks"
java -jar $bundletool_jar build-apks --bundle="$aab_file" --output="$apks_file" --ks=$ks_file --ks-pass=pass:$ks_pass --ks-key-alias=$ks_key_alias --key-pass=pass:$ks_key_pass

if [[ ! -e "$apks_file" ]]; then
    echo "build-apks error!"
    exit 0
fi

echo "$(date +"%Y.%m.%d %H:%M:%S") install-apks"

java -jar $bundletool_jar install-apks --apks="$apks_file"

echo "$(date +"%Y.%m.%d %H:%M:%S") end"

# 保存安装的 aab 文件的修改时间
echo "aabModifyTime=$aab_modify_time" >$log_file
# 读取上次安装的 aab 文件的修改时间
# log_aab_modify_time=$(cat $log_file | grep "aabModifyTime" | awk -F '=' '{print $2}')
