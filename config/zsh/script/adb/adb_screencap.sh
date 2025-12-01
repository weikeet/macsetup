# 脚本实现 提示词1
# 实现一个脚本：使用 adb 命令实现截图，文件保存到 ~/Pictures/Screenshot/ 目录下，文件命名格式为 ro.product.manufacturer-ro.product.model-ro.build.version.release-Screenshot_yyyyMMdd_hhmmss.png
# 脚本实现 提示词2
# 我在桌面测试结果如下
# ```
# $ adb shell dumpsys window | grep mCurrentFocus
#   mCurrentFocus=null
#   mCurrentFocus=Window{a9918b u0 com.huawei.android.launcher/com.huawei.android.launcher.unihome.UniHomeLauncher}
# ```
# 在负一屏测试结果如下
# ```
# $ adb shell dumpsys window | grep mCurrentFocus
#   mCurrentFocus=null
#   mCurrentFocus=Window{ed3c34b u0 com.huawei.intelligent.Workspace}
# ```
# 请实现脚本，提取出包名
# 脚本实现 提示词3
# 如果adb提示有多个设备，请弹出提示选择设备

#!/bin/bash

# 获取设备信息
MANUFACTURER=$(adb shell getprop ro.product.manufacturer | tr -d '\r')
MODEL=$(adb shell getprop ro.product.model | tr -d '\r')
VERSION=$(adb shell getprop ro.build.version.release | tr -d '\r')

# 创建保存目录
SAVE_DIR=~/Pictures/Screenshot
mkdir -p "$SAVE_DIR"

# 获取当前时间
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# 获取当前可见的 window 对应包名
PACKAGE_NAME=$(adb shell dumpsys window 2>/dev/null | \
          grep "mCurrentFocus" | \
          grep -v "null" | \
          sed -n 's/.*u0 \([^ /}]*\).*/\1/p' | \
          tail -n 1)

# 生成文件名
FILENAME="${MANUFACTURER}_${MODEL}_${VERSION}_Screenshot_${TIMESTAMP}-${PACKAGE_NAME}.png"

# 截图并保存到设备
REMOTE_PATH="/sdcard/$FILENAME"
LOCAL_PATH="$SAVE_DIR/$FILENAME"
adb shell screencap -p "$REMOTE_PATH"

# 将截图从设备拉取到本地
adb pull "$REMOTE_PATH" "$LOCAL_PATH"

# 删除设备上的截图
adb shell rm "$REMOTE_PATH"

# 输出完成信息
echo "截图已保存: $LOCAL_PATH"
