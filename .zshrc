# Path to your oh-my-zsh installation.
export ZSH=/home/rgo/.oh-my-zsh

# Themes in ~/.oh-my-zsh/themes
ZSH_THEME="rgo-powerline"

# Sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# My ZSH plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(z web-search zsh-syntax-highlighting)

## Antigen
source ~/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Apply Antigen
antigen apply 

# Autocompletion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# PATH configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export FZF_DEFAULT_COMMAND='ag -g ""'

source $ZSH/oh-my-zsh.sh

# my aliases
source ~/.dotfiles/.aliases

# fzf commands and design
source ~/.dotfiles/.fzfrc

# tmux 
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


