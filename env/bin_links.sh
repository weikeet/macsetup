#!/bin/sh

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup bin links..."

export_bin_path

if [[ ! -e $bin_path/stree ]]; then
    if [[ -e /Applications/Sourcetree.app ]]; then
        print_green "ln -s stree"
        ln -s /Applications/Sourcetree.app/Contents/Resources/stree $bin_path/stree
    else
        print_red "Sourcetree.app not exists"
    fi
else
    print_yellow "You have installed stree bin"
fi

if [[ ! -e $bin_path/code ]]; then
    if [[ -e /Applications/Visual\ Studio\ Code.app ]]; then
        print_green "ln -s code"
        ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $bin_path/code
    else
        print_red "Visual Studio Code.app not exists"
    fi
else
    print_yellow "You have installed code bin"
fi

# ln -s /Applications/Araxis\ Merge.app/Contents/Utilities/compare $bin_path/mcompare
# ln -s /Applications/Araxis\ Merge.app/Contents/Utilities/compare2 $bin_path/mcompare2
