rm -rf /Applications/MacVim.app/
rm -rf /Applications/Snap.app/
rm -f /usr/local/bin/gvim

brew uninstall --cask --force iterm2
brew uninstall --cask --force sourcetree
brew uninstall --cask --force google-chrome
brew uninstall --cask --force coderunner
brew uninstall --cask --force the-unarchiver
brew uninstall --cask --force visual-studio-code
brew uninstall --cask --force jetbrains-toolbox
brew uninstall wget
brew uninstall gnu-sed
brew uninstall autojump
brew uninstall cmake
brew uninstall nvm
brew uninstall ctags
brew uninstall gawk
brew uninstall coreutils
brew uninstall exiv2
brew uninstall ssh-copy-id
brew uninstall imagemagick
brew uninstall catimg
brew uninstall redis
brew uninstall gpg
brew uninstall icdiff
brew uninstall scmpuff
brew uninstall fzf
brew uninstall exiftool
brew uninstall git-lfs
brew uninstall cloc

# npm clean
npm uninstall -g gnomon
npm uninstall -g vue-cli
npm uninstall -g eslint-plugin-html
npm uninstall -g sequelize-auto
npm uninstall -g bash-language-server

cp ~/.macsetup/local/.zshrc.local.sh ~/.zshrc.local.sh

rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.gitconfig
rm -f ~/.ssh/config
rm -rf ~/.vim
rm -rf ~/.oh-my-zsh

rm -rf ~/.macsetup/
