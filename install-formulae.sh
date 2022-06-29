#!/bin/sh

source base.sh

# ##############################################################################
# install formulae #############################################################
# ##############################################################################

if brew ls --versions gnu-sed > /dev/null; then
    echo "You have installed gsed"
else
    brew install gnu-sed
fi

# install sz/rz
if brew ls --versions lrzsz > /dev/null; then
    echo "You have installed lrzsz"
else
    brew install lrzsz
fi

# brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew_install autojump
brew_install cmake
brew_install gawk
brew_install wget
brew_install nvm
brew_install exiv2
brew_install ssh-copy-id
brew_install imagemagick
brew_install catimg
brew_install gpg
brew_install icdiff
brew_install scmpuff
brew_install fzf
brew_install fd
brew_install the_silver_searcher
brew_install nvim
brew_install exiftool
brew_install archey
brew_install ranger
brew_install git-lfs && git lfs install
brew_install cloc
$(brew --prefix)/opt/fzf/install --all
