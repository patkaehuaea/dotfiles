# ~/.shellpaths
# add homebrew path for Apple silicon 
fish_add_path /opt/homebrew/bin
fish_add_path /users/pat/go/bin

# ~~/.shellvars
set -x EDITOR vim

# ~/.shellaliases

#############################
# Applications

alias g=git
alias gc='git commit'
alias gs='git status'
alias k='kubectl'
alias vi='vim'
alias vnc='/usr/bin/vncviewer'

#############################
# Utilities

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# recursive dos2unix in current directory
alias dos2lf='dos2unix `find ./ -type f`'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias iplocal="ip addr"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Directory listings
# LS_COLORS='no=01;37:fi=01;37:di=07;96:ln=01;36:pi=01;32:so=01;35:do=01;35:bd=01;33:cd=01;33:ex=01;31:mi=00;05;37:or=00;05;37:'
# -A All except implied '.' and '..'
# -G Add colors to ls
# -l Long format
# -h Short size suffixes (B, K, M, G, P)
# -p Postpend slash to folders
alias ls='ls -G -h -p '
alias ll='ls -l -A -G -h -p '

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Aliases for CLI based todo utility.'
alias td="todo.sh"
alias tda="todo.sh add"
alias tdl="todo.sh list"
alias tdd="todo.sh do"


# starship
#
starship init fish | source

# direnv shell hook
direnv hook fish | source
