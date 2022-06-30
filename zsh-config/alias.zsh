alias fix_spctl="sudo spctl --master-disable"
# param /Applications/xx.app
alias fix_demage="sudo xattr -rd com.apple.quarantine"
# param /Applications/xx.app
alias fix_codesign="sudo codesign --force --deep --sign - "

alias cbuilds='git clone git@github.com:lecymeng/buildSrc.git'

alias grun='bash ~/.macsetup/zsh-config/g_run_cpp.sh'
