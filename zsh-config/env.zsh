# JDK Manager
# Microsoft jdk: https://docs.microsoft.com/en-us/java/openjdk/download
# brew install microsoft-openjdk11
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home
# brew install microsoft-openjdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home

# /usr/libexec/java_home -V
# Matching Java Virtual Machines (2):
#     17.0.3 (arm64) "Microsoft Build of OpenJDK" - "Microsoft Build of OpenJDK 17" /Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
#     11.0.15 (arm64) "Microsoft Build of OpenJDK" - "Microsoft Build of OpenJDK 11" /Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home



# Python Manager
# Install with python pkg 配置方法
# export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin"
# Install with Homebrew 配置方法
# export PATH="$PATH:/usr/local/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/bin"

# Python3 virtual env
# mkdir Pyenv && cd Pyenv
# python3 -m pip install virtualenv
# python3 -m virtualenv py3.8
# source /Volumes/Common/Projects/Pyenv/py3.8/bin/activate



# Flutter image
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
# Flutter release
# https://storage.googleapis.com/flutter_infra_release/releases/releases_macos.json
# https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_{arch}_{version}-stable.zip
export PATH=$PATH:$HOME/Development/flutter/bin
# flutter config --android-sdk ~/Library/Android/sdk
# flutter doctor --android-studio-dir /Applications/Android\ Studio.app/Contents/bin
# flutter doctor --android-licenses


# Yarn
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin

