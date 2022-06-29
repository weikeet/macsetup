function brew_install() {
    quiet=false

    while getopts ":q" opt
    do
        case $opt in
            q)
                quiet=true
                ;;
            ? )
                echo "Unrecognized argument"
                echo "Usage: brew_install -q package_name"
                return 1
                ;;
        esac
    done

    shift "$((OPTIND-1))"
    if [ -z "$1" ]; then
        echo "Usage: brew_install [-q] package_name"
    fi

    if is_apple_cpu; then
        bin_path=/opt/homebrew/bin
    else
        bin_path=/usr/local/bin
    fi

    if [[ ! -e $bin_path/$1 ]]; then
        if [ "$quiet" = false ]; then
            echo "Installing $1"
        fi
        brew install $1
    else
        if [ "$quiet" = false ]; then
            echo "You have installed $1"
        fi
    fi
}

# Usage: mv $1 to $1_backup
function backup_file() {
    if [ $# != 1 ]; then
        echo "Usage: backup_file pat_to_file"
    fi

    if [[ -e $1 ]]; then
        mv $1 $1".bak"
    fi
}

# copy to path and create this path if not exist
function bs_cp() {
    if [ $# != 2 ]; then
        echo "Usage: bs_cp file destination"
    fi

    test -d "$2" || mkdir -p "$2" && cp "$1" "$2"
}

function contains_string() {
    if [ $# != 2 ]; then
        echo "Usage: contains_string string array"
    fi

    echo "----"
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
