alias fix-spctl="sudo spctl --master-disable"
# param /Applications/xx.app
alias fix-demage="sudo xattr -rd com.apple.quarantine"
# param /Applications/xx.app
alias fix-codesign="sudo codesign --force --deep --sign - "

alias see-cpu='sysctl -n machdep.cpu.brand_string'

# compile c++/java/kotlin code and execute
alias runcpp='bash ~/.macsetup/config/zsh/script/compile_run_cpp.sh'
alias runjava='bash ~/.macsetup/config/zsh/script/compile_run_java.sh'
alias runkotlin='bash ~/.macsetup/config/zsh/script/compile_run_kotlin.sh'

alias datec='bash ~/.macsetup/config/zsh/script/date_convert.sh'

alias bundlein='bash ~/.macsetup/config/zsh/script/install_aab.sh'
alias repoupdate='bash ~/.macsetup/config/zsh/script/fetch_repo_name.sh'

alias dockersh='bash ~/.macsetup/config/zsh/script/dockersh.sh'
alias enhance-install='bash ~/.macsetup/config/zsh/script/enhance_sdk.sh'
alias enhance-sdk='java -jar ~/Development/Enhance/enhance-*-all.jar'

alias cafully-agent='bash ~/.macsetup/config/zsh/script/cafully_agent.sh'
alias gradlew='bash ~/.macsetup/config/zsh/script/gradlew.sh'
alias brew-root-formulae='bash ~/.macsetup/config/zsh/script/brew_root_formulae.sh'

# Usage: git-find <keyword>, eg: git-find merge
alias git-find='cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh |grep'
