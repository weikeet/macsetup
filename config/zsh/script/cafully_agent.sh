#!/bin/zsh

# [解决IDEA创建或打开项目时下载Gradle](https://juejin.cn/post/7195832034244182074)

param=$1

workspace=$HOME/Development/Cafully/

if [[ $param = "install" ]]; then
    echo "install cafully agent"
elif [[ $param = "uninstall" ]]; then
    echo "uninstall cafully agent"
    rm -rf $workspace
    exit 0
else
    echo "param error, please input install or uninstall"
    exit 0
fi

if [[ ! -e $workspace ]]; then
    mkdir -p $workspace
fi
if [[ ! -e $workspace/config ]]; then
    mkdir $workspace/config
fi
if [[ ! -e $workspace/plugin ]]; then
    mkdir $workspace/plugin
fi
cd $workspace

# https://github.com/Cafully/cafully
cafully_ver=1.0.0
cafully_ver_local=$(cat cafully-agent.ver |grep $cafully_ver)
cafully_url="https://github.com/Cafully/cafully/releases/download/${cafully_ver}/cafully-agent-${cafully_ver}.jar"

if [[ ! -e "cafully-agent.jar" ]]; then
    echo "cafully-agent-${cafully_ver}.jar is not exist."
    wget $cafully_url -O cafully-agent.jar
    echo $cafully_ver > cafully-agent.ver
else
    if [ $cafully_ver_local = $cafully_ver ]; then
        echo "cafully-agent-${cafully_ver}.jar is already installed."
    else
        echo "cafully-agent-${cafully_ver}.jar is not installed."
        rm cafully-agent.jar
        wget $cafully_url -O cafully-agent.jar
        echo $cafully_ver > cafully-agent.ver
    fi
fi

# https://github.com/Cafully/cafully-plugin-asm
cafully_plugin_asm_ver=9.4
cafully_plugin_asm_url="https://github.com/Cafully/cafully-plugin-asm/releases/download/${cafully_plugin_asm_ver}/cafully-plugin-asm-${cafully_plugin_asm_ver}.jar"
cafully_plugin_asm_local=$(ls plugin |grep cafully-plugin-asm)
if [ $cafully_plugin_asm_local = "cafully-plugin-asm-$cafully_plugin_asm_ver.jar" ]; then
    echo "cafully-plugin-asm-${cafully_plugin_asm_ver}.jar is already installed."
else
    echo "cafully-plugin-asm-${cafully_plugin_asm_ver}.jar is not installed."
    wget $cafully_plugin_asm_url -O plugin/cafully-plugin-asm-${cafully_plugin_asm_ver}.jar
fi


# https://github.com/Enaium/KeepGradleVersion
keep_gradle_ver=1.0.0
keep_gradle_url="https://github.com/Enaium/KeepGradleVersion/releases/download/${keep_gradle_ver}/KeepGradleVersion-${keep_gradle_ver}.jar"
keep_gradle_local=$(ls plugin |grep KeepGradleVersion)
if [ $keep_gradle_local = "KeepGradleVersion-${keep_gradle_ver}.jar" ]; then
    echo "KeepGradleVersion-${keep_gradle_ver}.jar is already installed."
else
    echo "KeepGradleVersion-${keep_gradle_ver}.jar is not installed."
    wget $keep_gradle_url -O plugin/KeepGradleVersion-${keep_gradle_ver}.jar
fi


echo "Please add JVM Options to your IDE:"
echo "
# If you usage JDK17+ also add:
--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
-javaagent:$HOME/Development/Cafully/cafully-agent.jar
"

echo "
IDE VM Options path:
Android Studio: /Applications/Android Studio.app/Contents/bin/studio.vmoptions
IntelliJ IDEA: /Applications/IntelliJ IDEA.app/Contents/bin/idea.vmoptions
"

echo "
IDE Custom VM Options path:
Android Studio: $HOME/Library/Application Support/Google/AndroidStudio2022.1
IntelliJ IDEA: $HOME/Library/Application Support/JetBrains/IntelliJIdea2021.2
"

echo "
Please use gradlew to build your project. Tips:
gradlew: aliased to bash ~/.macsetup/config/zsh/script/gradlew.sh
"


studio_custom_vmoptions="$HOME/Library/Application Support/Google/AndroidStudio2022.1/studio.vmoptions"
idea_custom_vmoptions="$HOME/Library/Application Support/JetBrains/IntelliJIdea2021.2/idea.vmoptions"
studio_vmoptions="/Applications/Android Studio.app/Contents/bin/studio.vmoptions"
idea_vmoptions="/Applications/IntelliJ IDEA.app/Contents/bin/idea.vmoptions"

compare2="/Applications/Araxis Merge.app/Contents/Utilities/compare2"
if [[ -e "$compare2" ]]; then
    "$compare2" "$studio_custom_vmoptions" "$studio_vmoptions"
    "$compare2" "$idea_custom_vmoptions" "$idea_vmoptions"
else
    echo "Please install Araxis Merge!"
    echo "compare file: $studio_custom_vmoptions, $studio_vmoptions"
    echo "compare file: $idea_custom_vmoptions, $idea_vmoptions"
fi
