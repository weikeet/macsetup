#!bin/bash

# [curl xx.sh | sh] 方式无法引导用户输入

if [[ -e ~/.macsetup ]]; then
    if [[ -e ~/.macsetup/.git ]]; then
        echo "You have already pull macsetup"
        cd ~/.macsetup && git pull --ff-only
    else
        mv ~/.macsetup ~/.macsetup.bak
        git clone https://github.com/lecymeng/mac-setup.git ~/.macsetup
    fi
else
    # --depth=1
    git clone https://github.com/lecymeng/mac-setup.git ~/.macsetup
fi
