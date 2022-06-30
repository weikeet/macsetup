#!/bin/sh

source ~/.macsetup/base.sh


echo -n "${tty_blue}请输入用户密码: ${tty_reset}"
read -s USER_PWD
echo ""


git_name=$(git config user.name)
git_email=$(git config user.email)

if [[ -z $git_name ]] || [[ -z $git_email ]]; then
    echo -n "${tty_blue}请输入 Git 用户名 (例如: hua.li): ${tty_reset}"
    read GIT_USERNAME

    echo -n "${tty_blue}请输入 Git 邮箱 (例如: hua.li@gmail.com): ${tty_reset}"
    read GIT_EMAIL

    git config --global user.name "$GIT_USERNAME"
    git config --global user.email "$GIT_EMAIL"
else
    print_yellow "Current git user name=$git_name, email=$git_email"
fi


if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple" ]]; then
    bin_path=/opt/homebrew/bin
else
    bin_path=/usr/local/bin
fi
if [[ ! -e $bin_path/brew ]]; then
    echo -n "${tty_green}请选择 Homebrew 安装源
    1. 国外源 (有代理时的最佳选择)
    2. 国内源 (终端未连接到代理时建议使用) ${tty_reset}"

    echo -n "${tty_blue}请输入序号: ${tty_reset}"
    read SOURCE_TYPE

    if [[ $SOURCE_TYPE == "1" ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        /bin/bash -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
        # # change source && avoid prompt && quiet install
        # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | sed 's/https:\/\/github.com\/Homebrew\/brew/git:\/\/mirrors.ustc.edu.cn\/brew.git/g' | sed 's/https:\/\/github.com\/Homebrew\/homebrew-core/git:\/\/mirrors.ustc.edu.cn\/homebrew-core.git/g' | sed 's/\"fetch\"/\"fetch\", \"-q\"/g')" < /dev/null > /dev/null

        # # Change source
        # cd "$(brew --repo)"
        # git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
        # cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
        # git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
        # export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    fi
else
    print_yellow "You have installed brew"
fi


bash install-formulae.sh

bash install-cask.sh

bash env/bin_links.sh

bash env/git_config.sh

bash env/oh_my_zsh.sh

bash env/python_venv.sh

bash env/open_jdk_install.sh $USER_PWD

# bash env/android_reverse.sh
