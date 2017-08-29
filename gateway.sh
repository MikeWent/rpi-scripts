#!/bin/sh

##
# rpi-scripts
# gitlab.com/Mike_Went/rpi-scripts
##

sudo ip route delete default dev $2
sudo ip route add default $1 dev $2
