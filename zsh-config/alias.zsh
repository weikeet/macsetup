alias fix_spctl="sudo spctl --master-disable"
# param /Applications/xx.app
alias fix_demage="sudo xattr -rd com.apple.quarantine"
# param /Applications/xx.app
alias fix_codesign="sudo codesign --force --deep --sign - "

alias cpu='sysctl -n machdep.cpu.brand_string'

alias cbuilds='git clone git@github.com:lecymeng/buildSrc.git'

alias grun='bash ~/.macsetup/zsh-config/g_run_cpp.sh'

alias see-git='code ~/.oh-my-zsh/plugins/git'
alias see-vim='code ~/.oh-my-zsh/plugins/vi-mode'
alias see-extract='code ~/.oh-my-zsh/plugins/extract'
