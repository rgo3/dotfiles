# Path to your oh-my-zsh installation.
export ZSH=/home/rgo/.oh-my-zsh

# Themes in ~/.oh-my-zsh/themes
ZSH_THEME="gianu"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# My ZSH plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(z web-search ubuntu zsh-wakatime)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# my aliases
# opening files
alias open="gnome-open"

# go up directories
alias ...="../../"
alias ....="../../../"

# Stuff
alias v="vim"
alias zshrc="vim ~/.dotfiles/.zshrc"
alias vimrc="vim ~/.dotfiles/.vimrc"
alias spo="sudo poweroff"
alias music="spotify &"

#IDE's
alias idea="idea &"
alias lion="clion &"

#git
alias gst="git status"
alias gitinit="git init && touch README && touch .gitignore"
alias gaa="git add ."
alias gcm="git commit -m"
alias gpom="git push -u origin master"


# svn
alias svu="svn up"

# Network Stuff
alias desk="ssh 10.0.0.21"
alias ras="ssh pi@10.0.0.23"
alias rras="rdesktop -g 1000x800 10.0.0.23&"
alias checkmynet="sudo nmap -sP 10.0.0.0/24"
alias checknet="sudo nmap -sP"


#function mkcd: makes and changes to dir
function mkcd(){
	local dir=$1
	mkdir ${dir} && cd ${dir};
}


