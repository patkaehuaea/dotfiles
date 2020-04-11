# ~/.xsession is executed when login 
# occurs via display manager

# remap escape key to caps lock
setxkbmap -option caps:escape

# load settings properly when x starts
# verify with: xdpyinfo | grep -B 2 resolution
xrdb -merge ~/.Xresources
