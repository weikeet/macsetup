# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="yss"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ##############################################################################
# Config for user ##############################################################
# ##############################################################################

export LC_ALL=en_US.UTF-8

# env
source ~/.macsetup/config/zsh/env.zsh

# alias
source ~/.macsetup/config/zsh/alias.zsh

# android alias
source ~/.macsetup/config/zsh/alias_android.zsh

# local private config
[ -f ~/Development/zsh/zshrc.sh ] && source ~/Development/zsh/zshrc.sh

# eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [ -f /usr/local/bin/neofetch ] && echo "" && neofetch
# [ -f /opt/homebrew/bin/neofetch ] && echo "" && neofetch
