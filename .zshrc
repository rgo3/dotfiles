# Path to your oh-my-zsh installation.
export ZSH=/home/rgo/.oh-my-zsh

# Themes in ~/.oh-my-zsh/themes
ZSH_THEME="candy-rgo"

# Sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# My ZSH plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(z web-search zsh-syntax-highlighting)

## Antigen
source ~/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen theme candy 
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Apply Antigen
antigen apply 

# Autocompletion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# PATH configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#export FZF_DEFAULT_COMMAND='ag -g ""'
export PATH=/opt/apache-maven-3.5.0/bin:$PATH
export JAVA_HOME=/usr/local/java/jdk1.8.0_144
export PATH=$JAVA_HOME/bin:$PATH
#export PATH=/home/rgo/Applications/anaconda3/bin:$PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

source $ZSH/oh-my-zsh.sh

# my aliases
source ~/.dotfiles/.aliases.sh

# fzf commands and design
source ~/.dotfiles/.fzfrc.sh

# tmux 
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fortune | lolcat -s 2500 -a
