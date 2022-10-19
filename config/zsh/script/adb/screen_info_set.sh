
function print_help() {
    echo "Usage: [reset|wm_size wm_density]"
    echo "Set example: zsh screen_info_set.sh 1080x2340 480"
    echo "Reset example: zsh screen_info_set.sh reset"
}

if [ $# = 2 ]; then
    wm_size=$1
    wm_density=$2
    echo "new size: $wm_size, new density: $wm_density"
    adb shell wm size $wm_size
    adb shell wm density $wm_density
elif [ $# = 1 ]; then
    if [ $1 = "reset" ]; then
        adb shell wm size reset
        adb shell wm density reset
    else
        print_help
    fi
else
    print_help
fi