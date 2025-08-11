#!/bin/bash

USER_PWD=$1

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup open jdk..."

# ## 主流商业支持版本
# 1. Oracle OpenJDK: Oracle官方提供的免费OpenJDK发行版，从jdk.java.net获取，是最权威的版本[1]。
# 2. Azul Zulu: Azul Systems提供的高质量OpenJDK发行版，在对比分析中表现突出[1]，支持多种架构包括ARM64。
# 3. Liberica JDK (BellSoft): BellSoft提供的OpenJDK发行版，在功能对比中与Oracle Java并列分析[1]，提供全面的Java支持。
# 4. Eclipse Adoptium (原AdoptOpenJDK): 由Eclipse基金会维护的社区驱动OpenJDK发行版[1]，质量可靠且完全免费。
# ## 云服务商版本
# 5. Amazon Corretto: 亚马逊提供的免费、多平台、生产就绪的OpenJDK发行版，在AWS生态中优化。
# 6. Microsoft Build of OpenJDK: 微软为Azure和一般用途优化的OpenJDK版本，与Azure服务深度集成。
# 7. Alibaba Dragonwell: 阿里巴巴基于OpenJDK开发的发行版，针对大规模Java应用优化。
# 8. Tencent Kona: 腾讯基于OpenJDK的企业级发行版，针对云原生应用优化。
# ## 特殊用途版本
# 9. Mandrel: 基于GraalVM的原生镜像构建工具，专为Quarkus框架优化。
# 0. Homebrew OpenJDK: 通过Homebrew包管理器在macOS上安装的OpenJDK版本[5]，Mac用户的便捷选择。
# ## 选择建议
# 企业用户：推荐 Oracle OpenJDK、Red Hat OpenJDK、Azul Zulu 或 Amazon Corretto
# 个人开发者：推荐 Eclipse Adoptium、Homebrew OpenJDK 或系统包管理器版本
# 云原生应用：推荐对应云服务商的版本（Amazon Corretto、Microsoft Build）

# Open JDK 8
# https://www.azul.com/downloads/?version=java-8-lts&os=macos&package=jdk#zulu
# Open JDK 11, 17, 21
# https://learn.microsoft.com/en-us/java/openjdk/download

print_cyan "brew 安装: brew install microsoft-openjdk@17"
# brew install microsoft-openjdk@21
# brew install microsoft-openjdk@17
# brew install microsoft-openjdk@11

print_cyan "brew 安装: brew install openjdk@17"
# brew install openjdk@21
# brew install openjdk@17
# brew install openjdk@11
# --For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
# sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# --If you need to have openjdk@17 first in your PATH, run:
# echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
# --For compilers to find openjdk@17 you may need to set:
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# 卸载 openjdk 最新版本，已安装了 openjdk@21 openjdk@17 openjdk@11 移除最新安装非 LTS 版本，忽略依赖警告
# brew uninstall openjdk
# Error: Refusing to uninstall /opt/homebrew/Cellar/openjdk/24.0.2
# because it is required by apktool, jadx and kotlin, which are currently installed.
# You can override this and force removal with:
#   brew uninstall --ignore-dependencies openjdk

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

# install_ms_open_jdk $USER_PWD 21 21.0.8
# install_ms_open_jdk $USER_PWD 17 17.0.16
# install_ms_open_jdk $USER_PWD 11 11.0.28
