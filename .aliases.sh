# Aliases

# ls ouput
alias ll="ls -la --color=auto"
alias lh="ls -d .* --color=auto"

# opening files
alias open="gnome-open"
alias view="google-chrome-stable"

# directory aliases
alias ..="cd .."
alias ...="../../"
alias .2="../../"
alias ....="../../../"
alias .3="../../../"
alias .....="../../../../"
alias .4="../../../../"
alias ......="../../../../../"
alias .5="../../../../../"
alias c="z"
alias mkdir="mkdir -pv"

# dotfiles
alias v="vim"
alias zshrc="vim ~/.dotfiles/.zshrc"
alias vimrc="vim ~/.dotfiles/.vimrc"
alias aliases="vim ~/.dotfiles/.aliases"
alias tmcf="vim ~/.dotfiles/.tmux.conf"
alias i3c="vim ~/.dotfiles/config/i3/config"
alias i3b="vim ~/.dotfiles/config/i3/i3blocks.conf"

# tmux
alias tmux="tmux -2 -f .tmux.conf"
alias tnw="tmux new-window"

# fzf
#alias fzf="fzf-tmux"

#git
alias gst="git status"
alias gi="git init && touch README.md && touch .gitignore"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gpom="git push -u origin master"

# shutdown
alias shn="shutdown -h now"

# apt
alias ai="sudo apt install"
alias afi="sudo apt --fix-broken install"
alias au="sudo apt update"
alias auu="sudo apt update && sudo apt upgrade"
alias aar="sudo apt autoremove"

# top
alias top="ytop"

# svn
alias svu="svn up"

# Network scan wit nmap
alias net="sudo nmap -sP"

# redshift
alias night="redshift -O 3700"
alias day="redshift -O 5500"

# web_search
alias duck="web_search duckduckgo"

# Functions

# creates and changes to dir
function mkcd(){
	local dir=$1
	mkdir -pv ${dir} && cd ${dir};
}
