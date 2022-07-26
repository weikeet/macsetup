# Android sdk
export ANDROID_HOME=/Users/weicools/Library/Android/sdk


# Android adb
alias adbin="adb install -r"

alias adbresume="adb shell dumpsys activity activities | grep mResumedActivity"

alias adbwindow="adb shell dumpsys window windows |grep \"Window #\""

alias adbforce="adb shell am force-stop"

alias adbpsgrep="adb shell ps | grep"


# Android platform-tools
alias systrace="python ~/Library/Android/sdk/platform-tools/systrace/systrace.py"

# Android build-tools
alias izipalign="~/Library/Android/sdk/build-tools/30.0.3/zipalign"
alias idexdump="~/Library/Android/sdk/build-tools/30.0.3/dexdump"
alias iaapt="~/Library/Android/sdk/build-tools/30.0.3/aapt"
alias idx="~/Library/Android/sdk/build-tools/30.0.3/dx"

# Android tools
alias uiviewer="~/Library/Android/sdk/tools/bin/uiautomatorviewer"

# Android emulator
alias emulator="~/Library/Android/sdk/emulator/emulator"

# Open android project
alias openas="open -a /Applications/Android\ Studio.app"

# Decompile tools TODO
alias vdexExtractor="~/Development/vdexExtractor/bin/vdexExtractor"
alias cdexConverter="~/Development/cdexConverter/bin/compact_dex_converter"
