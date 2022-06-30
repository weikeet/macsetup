#!/bin/sh

USER_PWD=$1

bash install-formulae.sh

bash install-cask.sh

bash env/bin_links.sh

bash env/git_config.sh

bash env/oh_my_zsh.sh

bash env/python_venv.sh

bash env/open_jdk_install.sh $USER_PWD

# bash env/android_reverse.sh
