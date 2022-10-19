# https://mazhuang.org/awesome-adb

build_version_sdk=$(adb shell getprop ro.build.version.sdk)
build_version_release=$(adb shell getprop ro.build.version.release)
product_model=$(adb -d shell getprop ro.product.model)
product_brand=$(adb -d shell getprop ro.product.brand)

mac_address=$(adb shell cat /sys/class/net/wlan0/address)
meminfo=$(adb shell cat /proc/meminfo)
df=$(adb shell df) # 存储信息

# 低版本安卓 比较常规的办法的是：先截图放在手机的sdcard里，然后pull到电脑端
adb shell screencap -p /sdcard/Android/screenhot.png
adb pull /sdcard/Android/screenhot.png

# 高版本安卓支持直接保存：
adb exec-out screencap -p > ~/Desktop/screenhot.png
