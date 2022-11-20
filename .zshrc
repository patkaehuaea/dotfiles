# Instruct internationalized programs to change the language to English
# and the console output ot UTF-8. Using LANG instead of LC_CTYPE because
# oh-my-zsh theme errors if LANG not set and setting both is not recommended.
# ref: https://bbs.archlinux.org/viewtopic.php?id=220463
# ref: https://stackoverflow.com/questions/30479607/explain-the-effects-of-export-lang-lc-ctype-lc-all
export LANG=en_US.UTF-8

# Load autojump utility for directory completion.
[[ -s /home/patk/.autojump/etc/profile.d/autojump.sh ]] && source /home/patk/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
#export ZSH_THEME=robbyrussell
export ZSH_THEME=spaceship

#SPACESHIP_CHAR_SYMBOL="$"
#SPACESHIP_PROMPT_ORDER=(dir golang docker)

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  golang        # Go section
  docker        # Docker section
  aws           # Amazon Web Services section
  pyenv         # Pyenv section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Set to this to use case-sensitive completion
export CASE_SENSITIVE='true'

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE='true'

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  zsh-autosuggestions
)

export ZSH_DISABLE_COMPFIX='true'
source $ZSH/oh-my-zsh.sh

unsetopt correct
