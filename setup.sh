#!bin/bash

# 字符串染色程序
if [[ -t 1 ]]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_universal() { tty_escape "0;$1"; } #正常显示
tty_mkbold() { tty_escape "1;$1"; } #设置高亮
tty_red="$(tty_universal 31)" #红色
tty_blue="$(tty_universal 34)" #蓝色
tty_green="$(tty_universal 32)" #绿色
tty_yellow="$(tty_universal 33)" #黄色
tty_reset="$(tty_escape 0)" #去除颜色

function print_green() {
    echo "${tty_green}$1${tty_reset}"
}
function print_yellow() {
    echo "${tty_yellow}$1${tty_reset}"
}


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


echo -n "${tty_blue}请输入用户密码: ${tty_reset}"
read -s USER_PWD
echo ""


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


if [[ -e ~/.macsetup ]]; then
    if [[ -e ~/.macsetup/.git ]]; then
        print_yellow "You have already pull macsetup"
        # cd ~/.macsetup && git pull --ff-only
    else
        mv ~/.macsetup ~/.macsetup.bak
        git clone https://github.com/lecymeng/mac-setup.git ~/.macsetup
    fi
else
    # --depth=1
    git clone https://github.com/lecymeng/mac-setup.git ~/.macsetup
fi

cd ~/.macsetup

bash install.sh $USER_PWD
