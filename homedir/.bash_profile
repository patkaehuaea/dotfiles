# Supress warning message when default shell
# is changed from zsh to bash. Applies to any
# Max OSX release starting with Catalina.
export BASH_SILENCE_DEPRECATION_WARNING=1

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
# Use python site packages directory to build path
# to the powerline.sh file. Shell script must be run
# before prompt is visible.
source `pip3 show powerline-status | grep Location | cut -d':' -f2 | awk '{$1=$1;print}'`/powerline/bindings/bash/powerline.sh

source ~/.profile
