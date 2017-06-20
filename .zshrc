# Path to your oh-my-zsh installation.
export ZSH=/home/rgo/.oh-my-zsh

# Themes in ~/.oh-my-zsh/themes
ZSH_THEME="rgo-powerline"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# My ZSH plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(z web-search zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export FZF_DEFAULT_COMMAND='ag -g ""'
#export TERM=screen-256color


source $ZSH/oh-my-zsh.sh

# my aliases
source ~/.dotfiles/.aliases

# fzf commands and design
source ~/.dotfiles/.fzfrc

#tmux attach &> /dev/null

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
