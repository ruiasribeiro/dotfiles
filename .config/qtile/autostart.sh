#!/bin/sh

# Start the compositor (fix screen tearing).
picom &

# Start the polkit authentication agent.
lxpolkit &

# Start Redshift (night colour adjuster).
redshift -l 40:-10 &

# Start tray icons.
nm-applet &
blueman-applet &
volumeicon &

# Start gestures reader.
libinput-gestures-setup start
