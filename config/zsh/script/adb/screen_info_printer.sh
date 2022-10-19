
echo "---------------------------------"

source ~/.macsetup/base.sh

size_result=$(adb shell wm size)
density_result=$(adb shell wm density)

print_green "excute command: adb shell wm size" && echo $size_result
print_green "excute command: adb shell wm density" && echo $density_result

# excute command: adb shell wm size
# Physical size: 1080x2340
# Override size: 1080x2460
# excute command: adb shell wm density
# Physical density: 480
# Override density: 460

function print_size() {
    # Physical or Override
    wm_type=$1
    size_result=$2
    density_result=$3

    real_wm_size_type=$wm_type
    size=$(echo $size_result | grep "$real_wm_size_type size" | awk -F ': ' '{print $2}')
    if [ -z $size ]; then
        real_wm_size_type="Physical"
        size=$(echo $size_result | grep "$real_wm_size_type size" | awk -F ': ' '{print $2}')
        # echo "Override size is not set, use Physical size"
    fi

    real_wm_density_type=$wm_type
    density=$(echo $density_result | grep "$real_wm_density_type density" | awk -F ': ' '{print $2}')
    if [ -z $density ]; then
        real_wm_density_type="Physical"
        density=$(echo $density_result | grep "$real_wm_density_type density" | awk -F ': ' '{print $2}')
        # echo "Override density is not set, use Physical density"
    fi

    width_px=$(echo $size | awk -F 'x' '{print $1}')
    height_px=$(echo $size | awk -F 'x' '{print $2}')

    width_dp=$((width_px * 160 / density))
    height_dp=$((height_px * 160 / density))

    if [ $real_wm_size_type = $wm_type ]; then
        echo "$real_wm_size_type resoltuon(px): ${width_px}px x ${height_px}px"
    fi

    if [ $real_wm_size_type = "Physical" ] && [ $real_wm_density_type = "Physical" ]; then
        if [ $wm_type = "Physical" ]; then
            echo "$real_wm_size_type resoltuon(dp): ${width_dp}dp x ${height_dp}dp"
        fi
    else
        echo "$wm_type resoltuon(dp): ${width_dp}dp x ${height_dp}dp"
    fi
}

echo "---------------------------------"

print_size "Physical" "$size_result" "$density_result"

echo "---------------------------------"

print_size "Override" "$size_result" "$density_result"
