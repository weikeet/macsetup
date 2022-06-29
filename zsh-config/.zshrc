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
# ##############################################################################
# Config plugins ###############################################################
# ##############################################################################
# zsh-autosuggestion
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# cd ~/.oh-my-zsh && git pull --rebase && cd custom/plugins/zsh-autosuggestions && git pull --rebase && cd ../zsh-syntax-highlighting && git pull --rebase
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

# env
source ~/ZshConfig/env.zsh

# alias
source ~/ZshConfig/alias.zsh

# android alias
source ~/ZshConfig/alias_android.zsh
