#!/bin/sh

source ~/.macsetup/base.sh

# link git config
backup_file ~/.gitconfig
# backup_file ~/.gitattributes
ln -s ~/.macsetup/git-config/.gitconfig ~/.gitconfig
# ln -s ~/.macsetup/git-config/.gitattributes ~/.gitattributes
