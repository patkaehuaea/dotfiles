# Instruct internationalized programs to change the language to English
# and the console output ot UTF-8. Using LANG instead of LC_CTYPE because
# oh-my-zsh theme errors if LANG not set and setting both is not recommended.
# ref: https://bbs.archlinux.org/viewtopic.php?id=220463
# ref: https://stackoverflow.com/questions/30479607/explain-the-effects-of-export-lang-lc-ctype-lc-all
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
export ZSH=/home/pat/.oh-my-zsh
export ZSH_THEME=spaceship

# Set to this to use case-sensitive completion
export CASE_SENSITIVE='true'

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE='true'

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(jira colorize compleat dirpersist autojump git gulp history cp)

source $ZSH/oh-my-zsh.sh

# Enable shell command correction via: https://github.com/nvbn/thefuck
eval $(thefuck --alias)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Customize to your needs...
unsetopt correct

# TODO: Remove as soon as I have an arch specific ~/.shellalias
# file and source appropriately.
#ref: https://superuser.com/questions/395820/how-to-properly-end-a-kde-session-from-shell-without-root-privileges
alias logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"
alias afk="loginctl lock-session `loginctl show-user pat | grep Sessions | cut -d'=' -f2`"
