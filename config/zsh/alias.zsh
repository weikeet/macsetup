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
