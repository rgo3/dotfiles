### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### Zinit installer end

# zsh completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# load plugins

# interactive git with fzf
zinit light wfxr/forgit

# syntax highlighting
zinit light zdharma/fast-syntax-highlighting

# jump to frequent dirs
zinit light agkozak/zsh-z

# prompt theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# prompt colors
zstyle :prompt:pure:user:root color red
zstyle :prompt:pure:user color yellow
zstyle :prompt:pure:host color yellow
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:git:dirty color default
zstyle ':prompt:pure:prompt:*' color yellow

# ls colors
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# configure env vars
source ~/.dotfiles/env

# my aliases
source ~/.dotfiles/.aliases.sh

# fzf commands and design
source ~/.dotfiles/.fzfrc.sh

if [ -z "$TMUX" ]
then
    tmux attach || tmux new
fi

# source fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rgo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rgo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rgo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rgo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
