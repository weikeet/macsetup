#!/bin/sh

echo ""
source ~/.macsetup/base.sh

print_cyan "Starting setup python virtual env..."

if [[ ! -e ~/Development ]]; then
    mkdir ~/Development
fi

if [[ ! -e ~/Development/PythonEnv/venv3 ]]; then
    print_green "init python virtual env"
    mkdir -p ~/Development/PythonEnv && cd ~/Development/PythonEnv
    python3 -m pip install virtualenv
    python3 -m virtualenv venv3
else
    print_yellow "You have init python virtual env"
fi

# source ~/Development/PythonEnv/venv3/bin/activate
