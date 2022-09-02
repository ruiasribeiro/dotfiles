#!/bin/sh

# Start the compositor (fix screen tearing).
picom &

# Start the polkit authentication agent.
lxpolkit &

# Start the NetworkManager applet.
nm-applet &

# Start Redshift (night colour adjuster).
redshift -l 40:-10 &
