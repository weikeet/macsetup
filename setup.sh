#!bin/bash

function is_apple_cpu() {
    if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple" ]]; then
        return 0
    else
        return 1
    fi
}

function install_homebrew() {
    if [ $# != 1 ]; then
        echo "Usage: install_homebrew sourceType(1:国外,2:国内)"
    fi
    if [[ $1 == "1" ]]; then
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
}

echo -n "${tty_blue}请输入 Git 用户名 (例如: hua.li): ${tty_reset}"
read GIT_USERNAME

echo -n "${tty_blue}请输入 Git 邮箱 (例如: hua.li@gmail.com): ${tty_reset}"
read GIT_EMAIL

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"


echo -n "${tty_blue}请输入用户密码: ${tty_reset}"
read -s USER_PWD


echo -n "${tty_green}请选择 Homebrew 安装源
1. 国外源 (有代理时的最佳选择)
2. 国内源 (终端未连接到代理时建议使用) ${tty_reset}"

echo -n "${tty_blue}请输入序号: ${tty_reset}"
read SOURCE_TYPE

if is_apple_cpu; then
    bin_path=/opt/homebrew/bin
else
    bin_path=/usr/local/bin
fi

if [[ ! -e $bin_path/brew ]]; then
    install_homebrew $SOURCE_TYPE
else
    echo "You have installed brew"
fi

if [[ -e ~/.macsetup ]]; then
  if [[ -e ~/.macsetup.bak ]]; then
    rm -rf ~/.macsetup.bak
  fi
  mv ~/.macsetup ~/.macsetup.bak
fi

git clone --depth=1 https://github.com/lecymeng/mac-setup.git ~/.macsetup

cd ~/.macsetup && bash install.sh $USER_PWD
