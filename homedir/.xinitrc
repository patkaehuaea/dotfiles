# remap escape key to caps lock
setxkbmap -option caps:escape

# load settings properly when x starts
# verify with: xdpyinfo | grep -B 2 resolution
xrdb -merge ~/.Xresources

# launch AwesomeWM and redirect to file for easier 
# analysis and debugging
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
