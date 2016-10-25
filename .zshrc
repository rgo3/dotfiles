# Path to your oh-my-zsh installation.
export ZSH=/home/rgo/.oh-my-zsh

# Themes in ~/.oh-my-zsh/themes
ZSH_THEME="blinks"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# My ZSH plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(z web-search ubuntu)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# my aliases
source ~/.dotfiles/.aliases

# creates and changes to dir
function mkcd(){
	local dir=$1
	mkdir ${dir} && cd ${dir};
}

# cd into directory with fzf
function fd() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		        -o -type d -print 2> /dev/null | fzf +m) &&
	cd "$dir"
}

# cd into dir with fzf | +hidden files
function fda() {
	  local dir
	  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
