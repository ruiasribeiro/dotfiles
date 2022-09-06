#!/bin/sh

# Start the compositor (fix screen tearing).
picom &

# Start the polkit authentication agent.
lxpolkit &

# Start tray icons.
nm-applet &
blueman-applet &
volctl &
evolution &
redshift-gtk -l 40:-10 &

# Start gestures reader.
libinput-gestures-setup start
