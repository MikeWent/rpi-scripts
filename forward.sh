#!/bin/sh

##
# rpi-scripts
# gitlab.com/Mike_Went/rpi-scripts
##

sudo sysctl net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING --out-interface $2 -j MASQUERADE
sudo iptables -A FORWARD --in-interface $1 -j ACCEPT

