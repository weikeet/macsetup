#!/bin/sh

source ~/.macsetup/base.sh

if [[ ! -e ~/Development ]]; then
    mkdir ~/Development
fi

if [[ ! -e ~/Development/PythonEnv/venv3 ]]; then
    mkdir -p ~/Development/PythonEnv && cd ~/Development/PythonEnv
    python3 -m pip install virtualenv
    python3 -m virtualenv venv3
fi

# source ~/Development/PythonEnv/venv3/bin/activate
