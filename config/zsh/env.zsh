# 配置 Homebrew 可执行程序存放路径
export PATH="$PATH:/opt/homebrew/bin"

# JDK Manager
# Microsoft jdk: https://docs.microsoft.com/en-us/java/openjdk/download
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home

# $ /usr/libexec/java_home -V
# Matching Java Virtual Machines (4):
#     21.0.2 (arm64) "Microsoft" - "OpenJDK 21.0.2" /Library/Java/JavaVirtualMachines/microsoft-21.jdk/Contents/Home
#     17.0.10 (arm64) "Microsoft" - "OpenJDK 17.0.10" /Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home
#     11.0.22 (arm64) "Microsoft" - "OpenJDK 11.0.22" /Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home
#     1.8.0_402 (arm64) "Azul Systems, Inc." - "Zulu 8.76.0.17" /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home



# Python Manager
# Install with python pkg 配置方法
# export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin"
# Install with Homebrew 配置方法
# export PATH="$PATH:/usr/local/opt/python@3.8/Frameworks/Python.framework/Versions/3.8/bin"

# Python3 virtual env, see env/python_venv.sh
source ~/Development/PythonEnv/venv3/bin/activate



# Flutter image
# export PUB_HOSTED_URL=https://pub.flutter-io.cn
# export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
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

