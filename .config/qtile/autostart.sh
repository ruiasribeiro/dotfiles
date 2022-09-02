#!/bin/sh

# Start the compositor (fix screen tearing).
picom &

# Start the polkit authentication agent.
lxpolkit &
