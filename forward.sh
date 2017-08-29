#!/bin/sh

##
# rpi-scripts
# gitlab.com/Mike_Went/rpi-scripts
##

sudo iptables -t nat -A POSTROUTING --out-interface $2 -j MASQUERADE
sudo iptables -A FORWARD --in-interface $1 -j ACCEPT

