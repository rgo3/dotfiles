# Aliases

# opening files
alias open="gnome-open"
alias view="google-chrome-stable"

# directory aliases
alias ...="../../"
alias ....="../../../"
alias .....="../../../../"
alias ......="../../../../../"
alias c="z"

# dotfiles
alias v="nvim"
alias zshrc="nvim ~/.dotfiles/.zshrc"
alias vimrc="nvim ~/.dotfiles/.vimrc"
alias aliases="nvim ~/.dotfiles/.aliases"
alias tmcf="nvim ~/.dotfiles/.tmux.conf"
alias i3c="nvim ~/.dotfiles/config/i3/config"
alias i3b="nvim ~/.dotfiles/config/i3/i3blocks.conf"

# tmux
alias tmux="tmux -2 -f .tmux.conf"
alias tnw="tmux new-window"

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
alias auu="sudo apt upgrade"
alias aar="sudo apt autoremove"

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
	mkdir ${dir} && cd ${dir};
}
