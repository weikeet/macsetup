#!/bin/zsh

# 字符串染色程序
if [[ -t 1 ]]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_universal() { tty_escape "0;$1"; } #正常显示
tty_mkbold() { tty_escape "1;$1"; } #设置高亮
tty_underline="$(tty_escape "4;39")" #下划线
tty_red="$(tty_universal 31)" #红色
tty_blue="$(tty_universal 34)" #蓝色
tty_green="$(tty_universal 32)" #绿色
tty_yellow="$(tty_universal 33)" #黄色
tty_cyan="$(tty_universal 36)" #青色
tty_bold="$(tty_universal 39)" #加黑
tty_reset="$(tty_escape 0)" #去除颜色

function print_underline() {
    echo "${tty_underline}$1${tty_reset}"
}
function print_blue() {
    echo "${tty_blue}$1${tty_reset}"
}
function print_red() {
    echo "${tty_red}$1${tty_reset}"
}
function print_green() {
    echo "${tty_green}$1${tty_reset}"
}
function print_yellow() {
    echo "${tty_yellow}$1${tty_reset}"
}
function print_bold() {
    echo "${tty_bold}$1${tty_reset}"
}
function print_cyan() {
    echo "${tty_cyan}$1${tty_reset}"
}

# Usage: mv $1 to $1_backup
function backup_file() {
    if [ $# != 1 ]; then
        print_red "Usage: backup_file pat_to_file"
    fi

    if [[ -L $1 ]]; then
        if [[ -e $1 ]]; then
            mv $1 $1".link.bak"
        else
            print_red "File $1 is a link, but it doesn't exist, so delete this link"
            rm $1
        fi
    else
        if [[ -e $1 ]]; then
            mv $1 $1".bak"
        else
            print_red "Backup file $1 doesn't exist"
        fi
    fi
}

# copy to path and create this path if not exist
function bs_cp() {
    if [ $# != 2 ]; then
        print_red "Usage: bs_cp file destination"
    fi

    test -d "$2" || mkdir -p "$2" && cp "$1" "$2"
}

function contains_string() {
    if [ $# != 2 ]; then
        print_red "Usage: contains_string string array"
    fi

    if [[ $1 =~ $2 ]]; then
        return 0
    else
        return 1
    fi
}

function is_apple_cpu() {
    if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple" ]]; then
        return 0
    else
        return 1
    fi
}

function is_arm_cpu() {
    if [[ "$(uname -m)" == "arm64" ]]; then
        return 0
    else
        return 1
    fi
}

function export_bin_path() {
    if is_apple_cpu; then
        bin_path=/opt/homebrew/bin
        cellar_path=/opt/homebrew/Cellar
        caskroom_path=/opt/homebrew/Caskroom
    else
        bin_path=/usr/local/bin
        cellar_path=/usr/local/Cellar
        caskroom_path=/usr/local/Caskroom
    fi
}

function brew_install() {
    quiet=false

    while getopts ":q" opt
    do
        case $opt in
            q)
                quiet=true
                ;;
            ? )
                print_red "Unrecognized argument"
                print_red "Usage: brew_install -q package_name"
                return 1
                ;;
        esac
    done

    shift "$((OPTIND-1))"
    if [ -z "$1" ]; then
        print_red "Usage: brew_install [-q] package_name"
    fi

    export_bin_path
    if [[ ! -e $bin_path/$1 ]]; then
        if [ "$quiet" = false ]; then
            print_green "Installing $1"
        fi
        $bin_path/brew install $1
    else
        if [ "$quiet" = false ]; then
            print_yellow "You have installed $1"
        fi
    fi
}

function brew_install_formulae() {
    if [ $# != 1 ]; then
        print_red "Usage: brew_install_formulae formula_name"
        return 1
    fi

    export_bin_path
    if $bin_path/brew ls --versions $1 > /dev/null; then
        print_yellow "You have installed $1"
    else
        print_green "Installing formulae $1"
        if is_arm_cpu; then
            arch -arm64 $bin_path/brew install $1
        else
            $bin_path/brew install $1
        fi
    fi
}

function brew_install_cask_app() {
    if [ $# != 2 ]; then
        print_red "Usage: brew_install_cask_app cask_name app_name"
        print_red "eg: brew_install_cask_app only-switch Only Switch.app"
        return 1
    fi

    export_bin_path
    if [[ ! -e "/Applications/$2" ]]; then
        print_green "Installing $2"
        $bin_path/brew install --cask $1
    else
        print_yellow "You have installed $2"
    fi
}
