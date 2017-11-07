#!/bin/sh

##
# rpi-scripts
# gitlab.com/Mike_Went/rpi-scripts
##

# Old rules
#sudo sysctl net.ipv4.ip_forward=1
#sudo iptables -t nat -A POSTROUTING --out-interface $2 -j MASQUERADE
#sudo iptables -A FORWARD --in-interface $1 -j ACCEPT

# New rules
sudo sysctl net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o $2 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o $1 -j ACCEPT
