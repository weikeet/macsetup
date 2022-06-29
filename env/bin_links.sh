#!/bin/sh

source ~/.macsetup/base.sh

if is_apple_cpu; then
    bin_path=/opt/homebrew/bin
else
    bin_path=/usr/local/bin
fi

if [[ ! -e $bin_path/stree ]]; then
    if [[ -e /Applications/Sourcetree.app]]
        ls -n /Applications/Sourcetree.app/Contents/Resources/stree $bin_path/stree
    else
        echo "Sourcetree.app not exists"
    fi
fi

if [[ ! -e $bin_path/code ]]; then
    if [[ -e /Applications/Visual\ Studio\ Code.app]]
        ls -n /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $bin_path/code
    else
        echo "Visual Studio Code.app not exists"
    fi
fi

# ln -s /Applications/Araxis\ Merge.app/Contents/Utilities/compare /opt/homebrew/bin/mcompare
# ln -s /Applications/Araxis\ Merge.app/Contents/Utilities/compare2 /opt/homebrew/bin/mcompare2
