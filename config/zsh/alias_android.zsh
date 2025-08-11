# Android sdk
export ANDROID_HOME=$HOME/Library/Android/sdk


# Android adb
alias adbin="adb install -r"

alias adbresume="adb shell dumpsys activity activities | grep mResumedActivity"

alias adbwindow="adb shell dumpsys window windows |grep \"Window #\""

alias adbforce="adb shell am force-stop"

alias adbpsg="adb shell ps | grep"

alias addr2line="~/Library/Android/sdk/ndk/21.4.7075529/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-addr2line"

# Android platform-tools
# alias systrace="python ~/Library/Android/sdk/platform-tools/systrace/systrace.py"

# Please download the r33.0.0 version: 
# https://dl.google.com/android/repository/platform-tools_r33.0.0-darwin.zip
alias systrace="/usr/local/bin/python ~/Library/Android/sdk/platform-tools-33/systrace/systrace.py"
alias st-start='/usr/local/bin/python ~/Library/Android/sdk/platform-tools-33/systrace/systrace.py'  
alias st-start-gfx-trace='st-start -t 8 am,binder_driver,camera,dalvik,freq,gfx,hal,idle,input,memory,memreclaim,res,sched,sync,view,webview,wm,workq,binder'
alias st-start-duer='st-start -t 8 am,binder_driver,dalvik,freq,gfx,idle,input,memreclaim,res,sched,view,wm -a com.baidu.launcher'

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
