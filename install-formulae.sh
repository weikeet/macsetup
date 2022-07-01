#!/bin/sh

source ~/.macsetup/base.sh

echo ""
print_cyan "Installing Homebrew formulae..."

# brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# https://github.com/nvm-sh/nvm
# nvm is a version manager for node.js
brew_install_formulae nvm
brew_install_formulae ssh-copy-id
# brew_install_formulae imagemagick
# brew_install_formulae the_silver_searcher

brew_install_formulae autojump
brew_install_formulae cmake
brew_install_formulae gawk
brew_install_formulae wget
# brew_install_formulae exiv2
# brew_install_formulae catimg
brew_install_formulae gpg
brew_install_formulae icdiff
brew_install_formulae scmpuff
brew_install_formulae fzf
brew_install_formulae fd
brew_install_formulae nvim
brew_install_formulae exiftool
brew_install_formulae archey
brew_install_formulae ranger
brew_install_formulae cloc
brew_install_formulae gnu-sed
brew_install_formulae lrzsz

if brew ls --versions git-lfs > /dev/null; then
    print_yellow "You have installed git-lfs"
else
    brew install git-lfs
    git lfs install
fi

if brew ls --versions fzf > /dev/null; then
    print_yellow "You have installed fzf"
else
    brew install fzf
    $(brew --prefix)/opt/fzf/install --all
fi
