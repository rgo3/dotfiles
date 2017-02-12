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
export PATH="/home/rgo/anaconda3/bin:$PATH"
export PATH="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH"
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

# fzf: open selected file with 'open'-command
function fo() {
	local out file key
	IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
	key=$(head -1 <<< "$out")
	file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file"  ]; then
	[ "$key" = ctrl-o  ] && open "$file" || ${EDITOR:-vim} "$file"
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


