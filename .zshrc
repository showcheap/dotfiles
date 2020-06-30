# Path to your oh-my-zsh installation.
export ZSH="/home/sucipto/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

#Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# fnm
export PATH=/home/sucipto/.fnm:$PATH
eval "`fnm env --multi`"

# Alias
alias vim=nvim
alias v=nvim
