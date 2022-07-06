#!/bin/zsh

# issue: Zsh detects insecure completion-dependent directories
# links: https://stackoverflow.com/questions/61433167/zsh-detects-insecure-completion-dependent-directories

# usage: bash ~/.macsetup/env/oh_my_zsh_fixed.sh

chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions
