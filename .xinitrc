# remap escape key to caps lock
setxkbmap -option caps:escape

# load settings properly when x starts
# verify with: xdpyinfo | grep -B 2 resolution
xrdb -merge ~/.Xresources

# launch i3
#exec /usr/bin/i3
# launch AwesomeWM and redirect to file for easier 
# analysis and debugging
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

# launch xfce4
#exec startxfce4
