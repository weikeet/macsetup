alias fix-spctl="sudo spctl --master-disable"
# param /Applications/xx.app
alias fix-demage="sudo xattr -rd com.apple.quarantine"
# param /Applications/xx.app
alias fix-codesign="sudo codesign --force --deep --sign - "

alias see-cpu='sysctl -n machdep.cpu.brand_string'

# compile c++/java/kotlin code and execute
alias runcpp='bash ~/.macsetup/config/zsh/script/compile_run_cpp.sh'
alias runjava='bash ~/.macsetup/config/zsh/script/compile_run_java.sh'
alias runkotlin='bash ~/.macsetup/config/zsh/script/compile_run_kotlin.sh'

alias datec='bash ~/.macsetup/config/zsh/script/date_convert.sh'

alias bundlein='bash ~/.macsetup/config/zsh/script/install_aab.sh'

alias enhance-install='bash ~/.macsetup/config/zsh/script/enhance_sdk.sh'
alias enhance-sdk='java -jar ~/Development/Enhance/enhance-*-all.jar'

alias cafully-agent='bash ~/.macsetup/config/zsh/script/cafully_agent.sh'
alias gradlew='bash ~/.macsetup/config/zsh/script/gradlew.sh'

# Usage: git-find <keyword>, eg: git-find merge
alias git-find='cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh |grep'

alias hdcx='~/Library/Huawei/Sdk/hmscore/3.1.0/toolchains/hdc'
alias hdcin='~/Library/Huawei/Sdk/hmscore/3.1.0/toolchains/hdc app install -r'
alias shizuku-ac='adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh'
alias shizuku-start='cd ~/Projects/awesome-shizuku && bash start.sh'

alias hprof-c='bash ~/.macsetup/config/zsh/script/hprof-c.sh'
alias adb-pinm='adb shell am start -n com.sankuai.hades.sample/com.sankuai.hades.sample.MainActivity'
alias adb-mtd='adb shell am start -n com.sankuai.meituan/com.meituan.android.hades.HadesDevActivity'
alias adb-ptm='adb shell am start -n com.sankuai.hades.dev/com.sankuai.hades.dev.MainActivity'

function gcbr() {
    branch_name=$1
    git checkout -b $branch_name origin/$branch_name
}

function adb-st() {
    # 
}

function md5s() {
    echo -n "$1" | md5
}

function hprof-c() {
    # todo check platform-tools/hprof-conv exists

    input_file=$1
    output_file=${input_file/.hprof/_mat.hprof}

    echo "input file: $input_file"
    echo "output file: $output_file"

    $HOME/Library/Android/sdk/platform-tools/hprof-conv $input_file $output_file
}

function repoupdate() {
    # todo switch https/ssh, input username

    remote_url=$(git remote -v | grep push)
    end_content=$(echo $remote_url | awk -F 'github.com:' '{print $2}')
    user_repo=$(echo $end_content | awk -F '/' '{print $2}')
    repo_name=$(echo $user_repo | awk -F ' ' '{print $1}')

    git remote set-url origin git@github.com:weikeet/$repo_name
}

function ff_last_frame() {
    # Usage: 使用分栏模式查看总时长, 作为参数参入, 最后一秒无法提取, 可向前一秒
    # zsh fetch_last_img.sh Sleep_Advisor_QAE.mp4 12

    # ffmpeg -i $1 -ss 00:00:$2 -frames:v 1 $1.last.png
    ffmpeg -i $1 -ss 00:00:$2 -frames: 1 -f image2 $1.last.png
}

function dockersh() {
    name=$1

    docker_id=$(docker ps | grep $name | awk -F ' ' '{print $1}')

    if [[ $docker_id ]];then
        echo "$name Docker 服务已启动, id=$docker_id"
    else
        echo "$name Docker 服务未启动."
        exit 0
    fi

    docker exec -it $docker_id /bin/bash
}

function brew-root-formulae() {
    brew deps --installed --formulae | \
    awk -F'[: ]+' \
    '{
        packages[$1]++
        for (i = 2; i <= NF; i++)
            dependencies[$i]++
    }
    END {
        for (package in packages)
            if (!(package in dependencies))
                print package
    }'
}

alias sf='runjava /Users/weikeet/Projects/Meituan/secret/mt-pin/dexbase/src/main/java/com/meituan/android/hades/dexbase/utils/StringFog.java -s'
