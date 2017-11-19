#!/bin/sh

##
# rpi-scripts
# github.com/MikeWent/rpi-scripts
##

sudo ip route delete default dev $2
sudo ip route add default $1 dev $2
