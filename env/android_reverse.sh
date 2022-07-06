#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup android reverse tools..."

if [[ ! -e ~/Development ]]; then
    mkdir ~/Development
fi

# imgtool: system.img -> Linux ext4 格式的 img, see drakeet shared
# http://newandroidbook.com/tools/imgtool.html

# SmaliEx: boot.oat -> .dex
# https://github.com/testwhat/SmaliEx

# vdexExtractor: .vdex -> .dex
# https://github.com/anestisb/vdexExtractor
# git clone https://github.com/anestisb/vdexExtractor.git ~/Development/vdexExtractor
# cd ~/Development/vdexExtractor && bash make.sh
# brew install zlib-devel

# jadx: look .dex or .jar as .java code
# https://github.com/skylot/jadx
# brew install --formulae jadx

# Bytecode Viewer: Java/Android Bytecode Viewer
# https://github.com/konloch/bytecode-viewer
# brew install --cask jclasslib-bytecode-viewer
