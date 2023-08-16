# starship
#
starship init fish | source

# direnv shell hook
direnv hook fish | source

# Setting PATH for Python 3.10
# The original version is saved in /Users/pat/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
