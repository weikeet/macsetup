#!/bin/zsh

source ~/.macsetup/base.sh

echo ""
print_cyan "Starting setup git config..."

git_name=$(git config user.name)
git_email=$(git config user.email)

# cp git config
backup_file ~/.gitconfig
cp ~/.macsetup/config/git/.gitconfig ~/.gitconfig

if [[ -z $git_name ]] || [[ -z $git_email ]]; then
    name=$(whoami)
    git config --global user.name "$name"
    git config --global user.email "$name@gmail.com"
else
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
fi
