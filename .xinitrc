# remap escape key to caps lock
setxkbmap -option caps:escape

# load settings properly when x starts
# verify with: xdpyinfo | grep -B 2 resolution
xrdb -merge ~/.Xresources

# launch i3
#exec /usr/bin/i3

# launch AwesomeWM and redirect to file for easier 
# analysis and debugging
# exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

# exec startxfce4 && xfwm4--replace /usr/bin/i3

exec startplasma-x11
