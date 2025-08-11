
function echo_getprop() {
    propName=$1
    showName=$2
    # 检查 showName 是否为空，如果为空则使用 propName 的值
    if [ -z "$showName" ]; then
        showName=$propName
    fi
    echo -n "$showName="
    adb shell getprop $propName
}

function dumpsys_app() {
    pkgName=$1
    echo ""
    echo "dumpsys package $pkgName version"
    adb shell dumpsys package $pkgName | grep "versionCode\|versionName"
}

echo_getprop ro.product.manufacturer

echo_getprop ro.product.brand

echo_getprop ro.product.model

echo_getprop ro.product.name

echo_getprop ro.build.version.release

echo_getprop ro.build.version.sdk

echo_getprop ro.build.display.id

echo_getprop ro.build.version.security_patch

manufacturer=$(adb shell getprop ro.product.manufacturer)
# 转换 manufacturer 为小写
# 使用 Bash 4.0+ 的参数扩展--不支持
# manufacturer=${manufacturer,,}
# 使用 awk 命令
manufacturer=$(echo "$manufacturer" | awk '{print tolower($0)}')

if [ "$manufacturer" == "huawei" ]; then
    echo_getprop ro.build.version.emui
    
    echo_getprop hw_sc.build.platform.version

    echo_getprop ro.huawei.build.version.security_patch

elif [ "$manufacturer" == "vivo" ]; then
    dumpsys_app com.bbk.launcher2

elif [ "$manufacturer" == "oppo" ]; then
    echo_getprop ro.build.version.oplusrom

    echo_getprop ro.build.version.oplusrom.display

    dumpsys_app com.heytap.themestore

    dumpsys_app com.nearme.instant.platform

elif [ "$manufacturer" == "oneplus" ]; then
    echo_getprop ro.build.version.oplusrom

    echo_getprop ro.build.version.oplusrom.display

    dumpsys_app com.heytap.themestore

    dumpsys_app com.nearme.instant.platform

elif [ "$manufacturer" == "realme" ]; then
    echo_getprop ro.build.version.realmeui

    dumpsys_app com.heytap.themestore

    dumpsys_app com.nearme.instant.platform
fi
