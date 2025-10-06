#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[32m\]⚡ \u@kryOS \[\e[34m\]\w \[\e[0m\]❯ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
