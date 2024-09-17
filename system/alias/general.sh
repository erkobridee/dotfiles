alias reload!='. ~/.zshrc && . ~/.zprofile'

alias cl='clear'
alias rt='reset'

alias ls='ls -G'
alias la='ls -la'
alias ll='ls -l'
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"               # Go to previous dir with -
alias cd.='cd $(readlink -f .)' # Go to real dir (i.e. if current dir is linked)

alias home='cd $HOME'

alias hosts="sudo -v && $EDITOR /etc/hosts"
