# Instruct internationalized programs to change the language to English
# and the console output ot UTF-8. Using LANG instead of LC_CTYPE because
# oh-my-zsh theme errors if LANG not set and setting both is not recommended.
# ref: https://bbs.archlinux.org/viewtopic.php?id=220463
# ref: https://stackoverflow.com/questions/30479607/explain-the-effects-of-export-lang-lc-ctype-lc-all
export LANG=en_US.UTF-8

# Source each time the shell is run. Needs to be here
# on Linux instead of xprofile, or xinit.
source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# python fix for netskope ca
export REQUESTS_CA_BUNDLE=$(python -c "from requests.utils import DEFAULT_CA_BUNDLE_PATH; print(DEFAULT_CA_BUNDLE_PATH)")

# autojump setup
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=robbyrussell
#export ZSH_THEME=spaceship

SPACESHIP_CHAR_SYMBOL='$'
# ORDER
SPACESHIP_PROMPT_ORDER=(
  char
  dir
  golang
  docker
)

# Set to this to use case-sensitive completion
export CASE_SENSITIVE='true'

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE='true'

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(jira colorize compleat dirpersist autojump gulp history cp)

export ZSH_DISABLE_COMPFIX='true'
source $ZSH/oh-my-zsh.sh

# Load az cli automcomplete for zsh:
autoload bashcompinit && bashcompinit
source /usr/local/etc/bash_completion.d/az

unsetopt correct
