#!/bin/sh

##
# rpi-scripts
# github.com/MikeWent/rpi-scripts
##

# New rules
sudo sysctl net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
sudo iptables -A FORWARD -i $1 -o $2 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $2 -o $1 -j ACCEPT
